'use strict';

class mmpApp.Routers.ApplicationRouter extends Backbone.Router
  routes:
    ''            : 'rootRoute'
    'product/:id' : 'showProduct'

  rootRoute: ->
    console.log "Allo, from the root route"

  showProduct: (id) ->
    product = new mmpApp.Models.ProductModel { id: id }
    deferred = product.fetch()
    deferred.done =>
      productView = new mmpApp.Views.ProductView model: product
      productView.render()
