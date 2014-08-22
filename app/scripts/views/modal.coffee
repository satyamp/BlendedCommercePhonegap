'use strict';

class mmpApp.Views.ModalView extends Backbone.View

  template: JST['app/scripts/templates/modal.ejs']
  el: "#app-body"
  childView: null

  events:
    "click .close"              : "unrender"
    "click .cart--entry-delete" : "removeEntry"

  unrender: (e) ->
    if e?
      e.preventDefault()
    @$el.find('.modal--container').fadeOut(500, () ->
      $(this).remove()
    )

  render: (contents, childView) ->
    @childView = childView
    @$el.find('.modal--container').remove()
    @modal = $ @template()
    @modal.find('.modal--window').html contents
    @$el.append @modal
    @$el.find('.modal--container').fadeIn()

  update: (contents) ->
    @modal.find('.modal--window').html contents

  removeEntry: (e) =>
    $(e.target).parents('.cart--entry').fadeOut()
    @childView.itemRemoved($(e.target).data('sku'))
