import strformat

type ContentType* {.pure.} = enum
  FetchMoreMessagesButton = -2
  ChatIdentifier = -1,
  Unknown = 0,
  Message = 1,
  Sticker = 2,
  Status = 3,
  Emoji = 4,
  Transaction = 5,
  Group = 6,
  Image = 7,
  Audio = 8

type TextItem* = object
  textType*: string
  children*: seq[TextItem]
  literal*: string
  destination*: string

type CommandParameters* = object
  id*: string
  fromAddress*: string
  address*: string
  contract*: string
  value*: string
  transactionHash*: string
  commandState*: int
  signature*: string

type Message* = object
  alias*: string
  chatId*: string
  clock*: int
  commandParameters*: CommandParameters
  contentType*: ContentType
  ensName*: string
  fromAuthor*: string
  id*: string
  identicon*: string
  lineCount*: int
  localChatId*: string
  messageType*: string    # ???
  parsedText*: seq[TextItem]
  # quotedMessage:       # ???
  replace*: string
  responseTo*: string
  rtl*: bool              # ???
  seen*: bool             # ???
  sticker*: string
  text*: string
  timestamp*: string
  whisperTimestamp*: string
  isCurrentUser*: bool
  stickerHash*: string
  outgoingStatus*: string
  imageUrls*: string
  image*: string
  audio*: string
  audioDurationMs*: int

type Reaction* = object
  id*: string
  chatId*: string
  fromAccount*: string
  messageId*: string
  emojiId*: int
  retracted*: bool


proc `$`*(self: Message): string =
  result = fmt"Message(id:{self.id}, chatId:{self.chatId}, clock:{self.clock}, from:{self.fromAuthor}, contentType:{self.contentType})"
