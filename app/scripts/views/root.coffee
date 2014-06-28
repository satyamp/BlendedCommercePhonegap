'use strict';

class mmpApp.Views.RootView extends Backbone.View

    template: JST['app/scripts/templates/root.ejs']
    el: "#app-body"
    events:
      "click #fakeInteraction"   : "showProduct"

    render: ->
      @$el.html @template()

    showProduct: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "product/chpmnd1", { trigger: true }
