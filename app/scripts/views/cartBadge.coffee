'use strict';

class mmpApp.Views.CartbadgeView extends Backbone.View

    template: JST['app/scripts/templates/cartBadge.ejs']
    el: "#cartLink"
    events:
      "click"      : "showCart"

    initialize: (@collection) ->
      @collection.on "add remove change sync", @render, @
      @detailView = new mmpApp.Views.CartView @collection

    render: ->
      @$el.html @template @collection

    showCart: (e) ->
      e.preventDefault()
      @detailView.render()

class mmpApp.Views.CartView extends Backbone.View

    template: JST['app/scripts/templates/cart.ejs']
    name: "cart"

    initialize: (@collection) ->
      @collection.on "sync", @checkCart, @

    checkCart: ->
      if @collection.length is 0
        mmpApp.appModal.unrender()
      else
        if mmpApp.appModal.childView.name is "cart"
          mmpApp.appModal.update @template collection: @collection

    render: ->
      mmpApp.appModal.render @template(collection: @collection), this

    itemRemoved: (sku) ->
      @collection.removeProduct sku, =>
        @collection.fetch()

