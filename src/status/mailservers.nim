import algorithm, json, random, math, os, tables, sets, chronicles, eventemitter, sequtils, locks, sugar
import libstatus/core as status_core
import libstatus/chat as status_chat
import libstatus/mailservers as status_mailservers


# How do mailserver should work ?
#
# - We send a request to the mailserver, we are only interested in the
#   messages since `last-request` up to the last seven days
#   and the last 24 hours for topics that were just joined  TODO:
# - The mailserver doesn't directly respond to the request and
#   instead we start receiving messages in the filters for the requested
#   topics.
# - If the mailserver was not ready when we tried for instance to request
#   the history of a topic after joining a chat, the request will be done
#   as soon as the mailserver becomes available TODO:

logScope:
  topics = "mailserver-model"

type
  MailserverArg* = ref object of Args
    peer*: string

  MailserverStatus* = enum
    Unknown = -1,
    Disconnected = 0,
    Connecting = 1
    Connected = 2, 
    Trusted = 3,

  MailserverModel* = ref object
    events*: EventEmitter
    nodes*: Table[string, MailserverStatus]
    selectedMailserver*: string
    topics*: HashSet[string]
    connThread*: Thread[ptr MailserverModel]
    lock*: Lock

proc cmpMailserverReply(x, y: (string, int)): int =
  if x[1] > y[1]: 1
  elif x[1] == y[1]: 0
  else: -1

proc poolSize(fleetSize: int): int = ceil(fleetSize / 4).int

proc newMailserverModel*(events: EventEmitter): MailserverModel =
  result = MailserverModel()
  result.events = events
  result.nodes = initTable[string, MailserverStatus]()
  result.selectedMailserver = ""
  result.lock.initLock()

proc trustPeer*(self: MailserverModel, enode:string) = 
  markTrustedPeer(enode)
  self.nodes[enode] = MailserverStatus.Trusted
  if self.selectedMailserver == enode:
    debug "Mailserver available", enode
    self.events.emit("mailserverAvailable", Args())

proc selectedServerStatus*(self: MailserverModel): MailserverStatus =
  if self.selectedMailserver == "": MailserverStatus.Unknown
  else: self.nodes[self.selectedMailserver]

proc isSelectedMailserverAvailable*(self:MailserverModel): bool =
  if not self.nodes.hasKey(self.selectedMailserver): return false
  self.nodes[self.selectedMailserver] == MailserverStatus.Trusted

proc addPeer(self:MailserverModel, enode: string) =
  addPeer(enode)
  update(enode)

proc removePeer(self:MailserverModel, enode: string) =
  removePeer(enode)
  delete(enode)

proc connect*(self: MailserverModel, enode: string) =
  debug "Connecting to mailserver", enode

  # TODO: this should come from settings
  var knownMailservers = initHashSet[string]()
  for m in getMailservers():
    knownMailservers.incl m[1]
  if not knownMailservers.contains(enode): 
    warn "Mailserver not known", enode
    return

  self.selectedMailserver = enode

  # Adding a peer and marking it as trusted can't be executed sync, because
  # There's a delay between requesting a peer being added, and a signal being 
  # received after the peer was added. So we first set the peer status as 
  # Connecting and once a peerConnected signal is received, we mark it as 
  # Connected and then as Trusted

  if self.nodes.hasKey(enode) and self.nodes[enode] == MailserverStatus.Connecting:
    if self.nodes[enode] == MailserverStatus.Connected:
      self.trustPeer(enode)
  else:
    # Attempt to connect to mailserver by adding it as a peer
    self.nodes[enode] = MailserverStatus.Connecting
    self.addPeer(enode)
    
  # TODO: check if connection is made after a connection timeout?
  status_mailservers.update(enode)

proc peerSummaryChange*(self: MailserverModel, peers: seq[string]) =
  # When a node is added as a peer, or disconnected
  # a DiscoverySummary signal is emitted. In here we
  # change the status of the nodes the app is connected to
  # Connected / Disconnected and emit peerConnected / peerDisconnected
  # events.

  for peer in self.nodes.keys: 
    if not peers.contains(peer): 
      self.nodes[peer] = MailserverStatus.Disconnected
      self.events.emit("peerDisconnected", MailserverArg(peer: peer))
    # TODO: reconnect peer up to N times on 'peerDisconnected'
  
  var knownMailservers = initHashSet[string]()
  for m in getMailservers():
    knownMailservers.incl m[1]

  for peer in peers:
    if not knownMailservers.contains(peer): continue
    if self.nodes.hasKey(peer) and self.nodes[peer] == MailserverStatus.Trusted: continue
    self.nodes[peer] = MailserverStatus.Connected
    self.events.emit("peerConnected", MailserverArg(peer: peer))

proc requestMessages*(self: MailserverModel, topics: seq[string], fromValue: int64 = 0, toValue: int64 = 0, force: bool = false) =
  debug "Requesting messages from", mailserver=self.selectedMailserver
  let generatedSymKey = status_chat.generateSymKeyFromPassword()
  status_mailservers.requestMessages(topics, generatedSymKey, self.selectedMailserver, 1000, fromValue, toValue, force)

proc getMailserverTopics*(self: MailserverModel): seq[MailserverTopic] =
  let response = status_mailservers.getMailserverTopics()
  let topics = parseJson(response)["result"]
  result = @[]
  if topics.kind != JNull:
    for topic in topics:
      result.add(MailserverTopic(
        topic: topic["topic"].getStr,
        discovery: topic["discovery?"].getBool,
        negotiated: topic["negotiated?"].getBool,
        chatIds: topic["chat-ids"].to(seq[string]),
        lastRequest: topic["last-request"].getInt
      ))

proc getMailserverTopicsByChatId*(self: MailserverModel, chatId: string): seq[MailServerTopic] =
  result = self.getMailserverTopics()
      .filter(topic => topic.chatIds.contains(chatId))

proc addMailserverTopic*(self: MailserverModel, topic: MailserverTopic) =
  discard status_mailservers.addMailserverTopic(topic)

proc autoConnect*(self: MailserverModel) =
  let mailserversReply = parseJson(status_mailservers.ping(500))["result"]
  
  var availableMailservers:seq[(string, int)] = @[]
  for reply in mailserversReply: 
    if(reply["error"].kind != JNull): continue # The results with error are ignored
    availableMailservers.add((reply["address"].getStr, reply["rttMs"].getInt))
  availableMailservers.sort(cmpMailserverReply)

  # No mailservers where returned... do nothing.
  if availableMailservers.len == 0: return

  # Picks a random mailserver amongs the ones with the lowest latency
  # The pool size is 1/4 of the mailservers were pinged successfully
  randomize()
  let mailServer = availableMailservers[rand(poolSize(availableMailservers.len - 1))][0]
  self.connect(mailserver) 

proc changeMailserver*(self: MailserverModel) =
  warn "Automatically switching mailserver"
  if self.selectedMailserver != "":
    self.nodes[self.selectedMailserver] = MailserverStatus.Disconnected
    self.removePeer(self.selectedMailserver)
    self.selectedMailserver = ""
  self.autoConnect()

proc checkConnection*(mailserverPtr: ptr MailserverModel) {.thread.} =
  {.gcsafe.}:
    #TODO: connect to current mailserver from the settings

    # or setup a random mailserver:
    let sleepDuration = 10000
    while true:
      withLock mailserverPtr[].lock:
        # TODO: have a timeout for reconnection before changing to a different server
        if not mailserverPtr[].isSelectedMailserverAvailable:
          mailserverPtr[].changeMailserver()
        sleep(sleepDuration)

proc init*(self: MailserverModel) =
  # Reconnect to peer
  # Might be a good idea to have a timeout / limit of max number of reconnect attempts?
  self.events.on("peerDisconnected") do(e: Args): self.connect(MailserverArg(e).peer) 

  # Peer was added. Mark it as trusted.  
  self.events.on("peerConnected") do(e: Args): self.trustPeer(MailserverArg(e).peer)

  self.connThread.createThread(checkConnection, self.unsafeAddr)
  