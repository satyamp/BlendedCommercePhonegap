'use strict';

class mmpApp.Views.ProductView extends Backbone.View

    template: JST['app/scripts/templates/product.ejs']
    el: "#app-body"
    events:
      "click #addToCart"      : "addToCart"
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
        thanksModal = new mmpApp.Views.addToCartView()
        thanksModal.render()

    back: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "/", { trigger: true }

# Added to Cart Modal
class mmpApp.Views.addToCartView extends Backbone.View

    template: JST['app/scripts/templates/addedToCart.ejs']

    render: ->
      mmpApp.appModal.render @template
