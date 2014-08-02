'use strict';

class mmpApp.Views.CartbadgeView extends Backbone.View

    template: JST['app/scripts/templates/cartBadge.ejs']
    el: "#cartLink"
    events:
      "click"      : "showCart"

    initialize: (@collection) ->
      @collection.on "add change", @render, @
      @detailView = new mmpApp.Views.CartView @collection

    render: ->
      @$el.html @template @collection

    showCart: (e) ->
      e.preventDefault()
      @detailView.render()

class mmpApp.Views.CartView extends Backbone.View

    template: JST['app/scripts/templates/cart.ejs']

    initialize: (@collection) ->

    render: ->
      mmpApp.appModal.render @template collection: @collection
