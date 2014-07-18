'use strict';

class mmpApp.Routers.ApplicationRouter extends Backbone.Router
  routes:
    ''            : 'rootRoute'
    'product/:id' : 'showProduct'

  rootRoute: ->
    rootView = new mmpApp.Views.RootView
    rootView.render()

  showProduct: (id) ->
    product = new mmpApp.Models.ProductModel { id: id }
    deferred = product.fetch()
    deferred.done =>
      productView = new mmpApp.Views.ProductView model: product
      productView.render()
