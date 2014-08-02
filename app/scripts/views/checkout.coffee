'use strict';

class mmpApp.Views.CheckoutView extends Backbone.View

    template: JST['app/scripts/templates/checkout.ejs']
    el: '#app-body'
    events:
      "click #checkoutButton"       : "checkout"

    initialize: (@collection) ->

    checkout: (e) ->
      e.preventDefault()
      mmpApp.appCart.checkout =>
        thanksModal = new mmpApp.Views.CheckedOutView()
        thanksModal.render()

    render: ->
      @collection.on "add change", @render, @
      @$el.html @template collection: @collection

class mmpApp.Views.CheckedOutView extends Backbone.View

    template: JST['app/scripts/templates/checkedout.ejs']

    render: ->
      mmpApp.appModal.render @template
