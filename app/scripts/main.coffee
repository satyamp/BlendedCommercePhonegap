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

    @eventDispatcher = new @Helpers.EventHelper

    @identity = new @Helpers.IdentityHelper()
    document.addEventListener "deviceready", =>
      # NFC Event Listener
      @eventDispatcher.addAdapter @Helpers.NFCEventHelper

      # Override existing identiy
      @identity.refresh()

      # App Cart needs refresher
      @appCart.fetch()

    @appCart = new @Collections.CartCollection()

    @appModal = new @Views.ModalView()
    @appRouter = new @Routers.ApplicationRouter()
    usePushState = Modernizr.history
    Backbone.history.start { pushState: false}

    rootView = new @Views.RootView
    rootView.render()

    @eventDispatcher.addAdapter @Helpers.PusherEventHelper

$ ->
  'use strict'
  mmpApp.init();
