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
    el: "#app-body"

    events:
      "click .close"            : "unrender"

    initialize: (@collection) ->

    unrender: (e) ->
      e.preventDefault()
      @$el.find('.modal--container').fadeOut(500, () ->
        $(this).remove()
      )

    render: ->
      # Remove other modals
      @$el.find('.modal--container').remove()
      @modal = @template collection: @collection
      @$el.append @modal
      @$el.find('.modal--container').fadeIn()
