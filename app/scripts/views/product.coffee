'use strict';

class mmpApp.Views.ProductView extends Backbone.View

    template: JST['app/scripts/templates/product.ejs']
    el: "#app-body"
    events:
      "click #addToCart"                  : "addToCart"
      "click #backLink"                   : "back"
      "click #showOnScreen"               : "showOnScreen"
      "click .related-products--item"     : "viewRelated"
      "click .article--size-picker-size"  : "changeSize"

    initialize: ->
      @collection = new mmpApp.Collections.ProductsCollection()
      @collection.on "add change", @render, @

      $.subscribe "showOnScreen", =>
        if @showModal?
          @showModal.unrender()
        @model.showOnScreen () ->
          console.log "Showing on Screen now!"

    addModel: (@model) ->
      @collection.fetch()

    render: ->
      @$el.html @template model: @model, collection: @collection
      @$el.find('.article--image').on 'load', () ->
        $(this).addClass 'loaded'

      @$el.find('article--carousel-item-wrapper').hammer().bind "swiperight", ->
        $(this).addClass 'toggled'

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

      # Hide any modals
      mmpApp.appModal.unrender()

    addToCart: (e) ->
      e.preventDefault()
      @model.addToCart =>
        mmpApp.appCart.fetch()
        thanksModal = new mmpApp.Views.addToCartView @collection
        thanksModal.render()

    showOnScreen: (e) ->
      e.preventDefault()
      @showModal = new mmpApp.Views.showOnScreenView
      @showModal.render()

    back: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "/", { trigger: true }

    toggleCarousel: (e) ->
      @$el.find('.article--carousel-item-wrapper').toggleClass "toggled"

    viewRelated: (e) ->
      e.preventDefault()
      sku = $(e.currentTarget).data "sku"
      mmpApp.appRouter.navigate "/product/#{sku}", { trigger: true }
      window.scrollTo 0,0

    changeSize: (e) ->
      @$el.find('.article--size-picker-size').removeClass "active"
      $(e.currentTarget).addClass "active"

# Added to Cart Modal
class mmpApp.Views.addToCartView extends Backbone.View

    template: JST['app/scripts/templates/addedToCart.ejs']

    events:
      "click .related-products--item"   : "viewRelated"

    initialize: (@collection) ->

    render: ->
      mmpApp.appModal.render @template collection: @collection

    viewRelated: (e) ->
      e.stopPropagation()
      sku = $(e.currentTarget).data "sku"
      mmpApp.appRouter.navigate "/product/#{sku}", { trigger: true }

# Show on Screen Modal
class mmpApp.Views.showOnScreenView extends Backbone.View

  template: JST['app/scripts/templates/showOnScreen.ejs']

  render: ->
    mmpApp.appModal.render @template

  unrender: ->
    mmpApp.appModal.unrender()
