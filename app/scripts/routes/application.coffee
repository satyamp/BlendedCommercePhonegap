'use strict';

class mmpApp.Routers.ApplicationRouter extends Backbone.Router
  initialize: ->
    @productView = new mmpApp.Views.ProductView()
    @cartBadge = new mmpApp.Views.CartbadgeView mmpApp.appCart
    @cartBadge.render()

    mmpApp.appCart.fetch()

    $.subscribe "checkout", =>
      @navigate "/checkout", { trigger: true }


  routes:
    ''            : 'rootRoute'
    'product/:id' : 'showProduct'
    'checkout'    : 'checkout'
    'cashier'     : 'cashier'

  rootRoute: ->
    rootView = new mmpApp.Views.RootView
    rootView.render()

  showProduct: (id) ->
    product = new mmpApp.Models.ProductModel { id: id }
    deferred = product.fetch()
    deferred.done =>
      @productView.addModel product
      @productView.render()

  checkout: ->
    checkoutView = new mmpApp.Views.CheckoutView mmpApp.appCart
    checkoutView.render()

  cashier: ->
    cashierView = new mmpApp.Views.CashierView
    cashierView.render()
