'use strict';

class mmpApp.Models.ProductModel extends Backbone.Model
  url: ->
    id = this.id
    "#{mmpApp.Settings.defaultUrl}/product/#{id}.json"
