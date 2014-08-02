'use strict';

class mmpApp.Views.ProductView extends Backbone.View

    template: JST['app/scripts/templates/product.ejs']
    el: "#app-body"
    events:
      "click #addToCart"      : "addToCart"
      "click #fakeCheckout"   : "fakeCheckout"
      "click #backLink"       : "back"

    addModel: (model) ->
      @model = model

    render: ->
      @$el.html @template @model
      @$el.find('.article--image').on 'load', () ->
        $(this).addClass 'loaded'

      lastScrollTop = 0
      delta = 100

      $(window).on 'scroll', (e) ->
        st = $(this).scrollTop()

        if Math.abs(lastScrollTop - st) <= delta
          return

        if st > lastScrollTop
          $('.header--button').addClass('toggled')
        else
          $('.header--button').removeClass('toggled')

        lastScrollTop = st

    addToCart: (e) ->
      e.preventDefault()
      @model.addToCart ->
        mmpApp.appCart.fetch()

    fakeCheckout: (e) ->
      e.preventDefault()
      @model.checkout ->
        console.log "do something"

    back: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "/", { trigger: true }
