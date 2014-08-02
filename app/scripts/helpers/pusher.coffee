class mmpApp.Helpers.PusherEventHelper

  constructor: ->
    @pusher = new Pusher '53fcdc31927d1aaf9cdd'
    @channel = @pusher.subscribe('test_channel')

  listen: (eventHandler) ->
    @channel.bind_all (data) =>
      # Deconstruct the Event
      message = data.split ":"
      event = message[0]
      data = message[1]

      eventHandler.broadcast event, data
