'use strict';

class mmpApp.Collections.CartCollection extends Backbone.Collection
  model: mmpApp.Models.CartitemModel

  url: ->
    "#{mmpApp.Settings.defaultUrl}/cart.json?identity=#{mmpApp.identity.getIdentity()}"

  parse: (resp) ->
    resp.order_items

  getTotal: ->
    (this.models.map (model) -> parseFloat(model.attributes.total)).reduce (t, s) -> t + s

  getFormatedTotal: ->
    return 0 if this.length is 0
    Math.round(@getTotal()) * 100 / 100

  getCount: ->
    return 0 if this.length is 0
    (this.models.map (model) -> model.attributes.quantity).reduce (t, s) -> t + s

  checkout: (cb) ->
    $.get "#{mmpApp.Settings.defaultUrl}/order.json", { identity: mmpApp.identity.getIdentity() }, (data) =>
      cb data
