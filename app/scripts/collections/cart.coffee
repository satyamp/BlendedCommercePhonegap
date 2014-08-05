'use strict';

class mmpApp.Collections.CartCollection extends Backbone.Collection
  model: mmpApp.Models.CartitemModel

  initialize: ->
    @setIdentity()

  url: ->
    "#{mmpApp.Settings.defaultUrl}/cart.json?identity=#{@identity}"

  setIdentity: (identity) ->
    if identity?
      @identity = identity
    else
      @identity = mmpApp.identity.getIdentity()

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

  triggerCashier: ->
    $.get "#{mmpApp.Settings.defaultUrl}/checkout/#{@identity}.json", (data) =>
      console.log data

  checkout: (cb) ->
    $.get "#{mmpApp.Settings.defaultUrl}/order.json", { identity: @identity }, (data) =>
      cb data
