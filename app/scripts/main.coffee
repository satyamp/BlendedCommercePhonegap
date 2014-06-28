window.mmpApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
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

$ ->
  'use strict'
  mmpApp.init();
