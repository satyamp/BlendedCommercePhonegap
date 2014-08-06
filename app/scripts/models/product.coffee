'use strict';

class mmpApp.Models.ProductModel extends Backbone.Model
  url: ->
    id = this.id
    "#{mmpApp.Settings.defaultUrl}/product/#{id}.json"

  addToCart: (cb) ->
    productId = this.attributes.product_data.id
    $.get "#{mmpApp.Settings.defaultUrl}/product/#{productId}/buy.json", { identity: mmpApp.identity.getIdentity() }, (data) =>
      cb data

  showOnScreen: (cb) ->
    sku = this.attributes.product_data.sku
    $.get "#{mmpApp.Settings.defaultUrl}/product/#{sku}/screen.json", (data) =>
      cb data
