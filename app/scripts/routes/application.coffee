'use strict';

class mmpApp.Routers.ApplicationRouter extends Backbone.Router
  initialize: ->
    @productView = new mmpApp.Views.ProductView()
    @cartBadge = new mmpApp.Views.CartbadgeView mmpApp.appCart
    @cartBadge.render()

    mmpApp.appCart.fetch()

    $.subscribe "checkout", =>
      @navigate "/checkout", { trigger: true }

    @currentView = null

  routes:
    ''            : 'rootRoute'
    'product/:id' : 'showProduct'
    'checkout'    : 'checkout'
    'cashier'     : 'cashier'

  changeView: (view) ->
    @currentView = view
    @currentView.render()

  rootRoute: ->
    rootView = new mmpApp.Views.RootView
    @changeView(rootView)

  showProduct: (id) ->
    product = new mmpApp.Models.ProductModel { id: id }
    deferred = product.fetch()
    deferred.done =>
      @productView.addModel product
      @changeView(@productView)

  checkout: ->
    checkoutView = new mmpApp.Views.CheckoutView mmpApp.appCart
    @changeView(checkoutView)

  cashier: ->
    cashierView = new mmpApp.Views.CashierView
    @changeView(cashierView)
