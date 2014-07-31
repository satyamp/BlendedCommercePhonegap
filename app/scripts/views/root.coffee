'use strict';

class mmpApp.Views.RootView extends Backbone.View

    template: JST['app/scripts/templates/root.ejs']
    el: "#app-body"

    render: ->
      @$el.html @template()

    showProduct: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "product/chpmnd1", { trigger: true }
