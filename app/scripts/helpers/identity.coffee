class mmpApp.Helpers.IdentityHelper

  constructor: ->

  refresh: ->
    if device?.uuid?
      @identity = device.uuid
    else
      @identity = "test"

  getIdentity: ->
    unless @identity
      @refresh()
    @identity
