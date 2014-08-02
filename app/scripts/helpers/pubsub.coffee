(($) ->
  o = $({})
  $.subscribe = ->
    o.on.apply o, arguments
    return

  $.unsubscribe = ->
    o.off.apply o, arguments
    return

  $.publish = ->
    o.trigger.apply o, arguments
    return

  return
) jQuery
