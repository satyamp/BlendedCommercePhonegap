'use strict';

class mmpApp.Collections.CartCollection extends Backbone.Collection
  model: mmpApp.Models.CartitemModel

  url: ->
    "#{mmpApp.Settings.defaultUrl}/cart.json?identity=#{mmpApp.identity.getIdentity()}"

  parse: (resp) ->
    resp.order_items

  getTotal: ->
    (this.models.map (model) -> parseFloat(model.attributes.total)).reduce (t, s) -> t + s

  getCount: ->
    return 0 if this.length is 0
    (this.models.map (model) -> model.attributes.quantity).reduce (t, s) -> t + s
