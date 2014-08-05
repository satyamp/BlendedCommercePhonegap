'use strict';

class mmpApp.Views.CashierView extends Backbone.View

    template: JST['app/scripts/templates/cashier.ejs']
    el: "#app-body"

    initialize: ->
      @cart = new mmpApp.Collections.CartCollection

      $.unsubscribe 'checkout'

      $.subscribe 'cashier', (e, data) =>
        @cart.setIdentity data
        @cart.fetch()
        @modal = new mmpApp.Views.CashierCartView @cart
        @modal.render()

    render: ->
      @$el.html @template


class mmpApp.Views.CashierCartView extends Backbone.View

    template: JST['app/scripts/templates/cashiercart.ejs']
    events:
      "click #markAsPaid":        "markAsPaid"

    initialize: (@collection) ->
      @collection.on "add change", @render, @
      $.subscribe "paid", () =>
        $('#cashier--modal').addClass 'paid'
        setTimeout =>
          mmpApp.appModal.unrender()
        , 2000

    render: ->
      mmpApp.appModal.render @template collection: @collection

    markAsPaid: (e) ->
      alert "Paying!"
      e.preventDefault()
