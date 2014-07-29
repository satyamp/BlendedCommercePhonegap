'use strict';

class mmpApp.Views.CartbadgeView extends Backbone.View

    template: JST['app/scripts/templates/cartBadge.ejs']
    el: "#cartLink"
    events:
      "click"           : "showCart"

    initialize: (@collection) ->
      @collection.on "add change", @render, @

    render: ->
      @$el.html @template @collection

    showCart: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "cart", { trigger: true }

class mmpApp.Views.CartView extends Backbone.View

    template: JST['app/scripts/templates/cart.ejs']
    el: "#app-modal"

    initialize: (@collection) ->

    render: ->
      @$el.html @template collection: @collection
      @$el.fadeIn()
