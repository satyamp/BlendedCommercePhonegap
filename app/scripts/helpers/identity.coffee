class mmpApp.Helpers.IdentityHelper

  constructor: ->
    if device?.uuid?
      @identity = device.uuid
    else
      @identity = "test"

  getIdentity: ->
    @identity
