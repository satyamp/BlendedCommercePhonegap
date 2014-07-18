'use strict';

class mmpApp.Views.ProductView extends Backbone.View

    template: JST['app/scripts/templates/product.ejs']
    el: "#app-body"
    events:
      "click #addToCart"      : "addToCart"
      "click #fakeCheckout"   : "fakeCheckout"
      "click #backLink"       : "back"

    render: ->
      if navigator.notification
        navigator.notification.vibrate(400)
      @$el.html @template @model

    addToCart: (e) ->
      e.preventDefault()
      @model.addToCart ->
        alert "Product added to cart"

    fakeCheckout: (e) ->
      e.preventDefault()
      @model.checkout ->
        alert "Checked out, check the backend for the order!"

    back: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "/", { trigger: true }
