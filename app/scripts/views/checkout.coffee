'use strict';

class mmpApp.Views.CheckoutView extends Backbone.View

    template: JST['app/scripts/templates/checkout.ejs']
    el: '#app-body'
    events:
      "click #checkoutButton"       : "checkout"
      "focus .checkout--form-input" : "entryMode"
      "blur .checkout--form-input"  : "checkoutMode"

    initialize: (@collection) ->
      $.subscribe "paid", (e, data) =>
        thanksModal = new mmpApp.Views.CheckedOutView()
        thanksModal.render()

    checkout: (e) ->
      e.preventDefault()

      mmpApp.appCart.checkout =>

    entryMode: (e) ->
      @$el.find("#checkout").addClass 'entry'

    checkoutMode: (e) ->
      @$el.find("#checkout").removeClass 'entry'

    render: ->
      @collection.on "add change", @render, @
      if @collection.length > 0
        @collection.triggerCashier()
      @$el.html @template collection: @collection

class mmpApp.Views.CheckedOutView extends Backbone.View

    template: JST['app/scripts/templates/checkedout.ejs']
    events:
      "click .checkout--shipping-list-item"      : "toggleShipping"

    toggleShipping: (e) ->
      alert "allo allo!"
      $('.checkout--shipping-list-item').removeClass "active"
      $(e.currentTarget).addClass "active"

    render: ->
      mmpApp.appModal.render @template
