class mmpApp.Helpers.EventHelper

  constructor: (adapter) ->
    @adapter = new adapter
    @adapter.listen this

  showProduct: (id) ->
    mmpApp.appRouter.navigate "product/#{id}", { trigger: true }
