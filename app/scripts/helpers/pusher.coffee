class mmpApp.Helpers.PusherEventHelper

  constructor: ->
    @pusher = new Pusher '53fcdc31927d1aaf9cdd'
    @channel = @pusher.subscribe('test_channel')

  listen: (eventHandler) ->
    @channel.bind "showProduct", (data) =>
      eventHandler.showProduct data.id
