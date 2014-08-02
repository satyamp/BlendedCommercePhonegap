class mmpApp.Helpers.EventHelper

  addAdapter: (adapter) ->
    instance = new adapter
    instance.listen this

  broadcast: (event, data) ->
    $.publish(event, data)
