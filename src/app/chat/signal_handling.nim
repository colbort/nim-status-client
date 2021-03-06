proc handleSignals(self: ChatController) =
  self.status.events.on(SignalType.Message.event) do(e:Args):
    var data = MessageSignal(e)
    self.status.chat.update(data.chats, data.messages, data.emojiReactions)

  self.status.events.on(SignalType.DiscoverySummary.event) do(e:Args):
    ## Handle mailserver peers being added and removed
    var data = DiscoverySummarySignal(e)
    self.status.mailservers.peerSummaryChange(data.enodes)

  self.status.events.on(SignalType.EnvelopeSent.event) do(e:Args):
    var data = EnvelopeSentSignal(e)
    self.status.messages.updateStatus(data.messageIds)

  self.status.events.on(SignalType.EnvelopeExpired.event) do(e:Args):
    var data = EnvelopeExpiredSignal(e)
    for messageId in data.messageIds:
      if self.status.messages.messages.hasKey(messageId):
        let chatId = self.status.messages.messages[messageId].chatId
        self.view.messageList[chatId].checkTimeout(messageId)
