'use strict';

class mmpApp.Views.ModalView extends Backbone.View

  template: JST['app/scripts/templates/modal.ejs']
  el: "#app-body"

  events:
    "click .close"          : "unrender"

  unrender: (e) ->
    e.preventDefault()
    @$el.find('.modal--container').fadeOut(500, () ->
      $(this).remove()
    )

  render: (contents) ->
    @$el.find('.modal--container').remove()
    @modal = $ @template()
    console.log @modal.find('.modal--window').html contents
    @$el.append @modal
    @$el.find('.modal--container').fadeIn()
