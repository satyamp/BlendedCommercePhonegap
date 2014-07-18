window.mmpApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Helpers: {}
  Settings: {
    defaultUrl: "http://178.254.25.56"
  }
  init: ->
    'use strict'

    @appRouter = new @Routers.ApplicationRouter()
    usePushState = Modernizr.history
    Backbone.history.start { pushState: false}

    rootView = new @Views.RootView
    rootView.render()

    events = new @Helpers.EventHelper(@Helpers.PusherEventHelper)

$ ->
  'use strict'
  mmpApp.init();
