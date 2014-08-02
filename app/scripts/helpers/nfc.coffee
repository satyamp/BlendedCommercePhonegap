class mmpApp.Helpers.NFCEventHelper

  constructor: ->
    @nfc = nfc

    @events =
      "showProduct": (data, handler) =>
        handler.showProduct data

  listen: (eventHandler) ->
    @nfc.addNdefListener (nfcEvent) =>
      tag = nfcEvent.tag
      ndefMessage = tag.ndefMessage

      message = nfc.bytesToString(ndefMessage[0].payload).substring(3).split(":")
      event = message[0]
      data = message[1]

      eventHandler.broadcast event, data

    , () ->
      console.log "Waiting for tag"
    , (error) ->
      alert "Bad NFC error"
