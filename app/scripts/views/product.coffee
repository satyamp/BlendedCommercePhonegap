'use strict';

class mmpApp.Views.ProductView extends Backbone.View

    template: JST['app/scripts/templates/product.ejs']
    el: "#app-body"

    render: ->
      navigator.notification.vibrate(400)
      @$el.html @template @model
