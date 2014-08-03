'use strict';

class mmpApp.Collections.ProductsCollection extends Backbone.Collection
  model: mmpApp.Models.ProductModel

  url: ->
    "#{mmpApp.Settings.defaultUrl}/products.json"
