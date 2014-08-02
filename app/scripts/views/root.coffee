'use strict';

class mmpApp.Views.RootView extends Backbone.View

    template: JST['app/scripts/templates/root.ejs']
    el: "#app-body"

    render: ->
      @$el.html @template()

      $.subscribe 'showProduct', (e, data) =>
        console.log data
        @$el.find('.interaction-indicator').addClass 'active'
        setTimeout =>
          mmpApp.appRouter.navigate "product/#{data}", { trigger: true }
        , 500

    showProduct: (e) ->
      e.preventDefault()
      mmpApp.appRouter.navigate "product/chpmnd1", { trigger: true }
