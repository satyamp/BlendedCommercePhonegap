'use strict';

class mmpApp.Views.CheckoutView extends Backbone.View

    template: JST['app/scripts/templates/checkout.ejs']
    el: '#app-body'
    events:
      "click #checkoutButton"       : "checkout"
      "focus .checkout--form-input" : "entryMode"
      "blur .checkout--form-input"  : "checkoutMode"

    initialize: (@collection) ->

    checkout: (e) ->
      e.preventDefault()
      $.subscribe "paid", (e, data) =>
        thanksModal = new mmpApp.Views.CheckedOutView()
        thanksModal.render()

      mmpApp.appCart.checkout =>

    entryMode: (e) ->
      @$el.find("#checkout").addClass 'entry'

    checkoutMode: (e) ->
      @$el.find("#checkout").removeClass 'entry'

    render: ->
      @collection.on "change", @render, @
      if @collection.length > 0
        @collection.triggerCashier()
      @$el.html @template collection: @collection

class mmpApp.Views.CheckedOutView extends Backbone.View

    template: JST['app/scripts/templates/checkedout.ejs']

    render: ->
      mmpApp.appModal.render @template
