App.register "{{id}}", (params, scope, widgets) ->
  $container = null
  response = scope.createResponse()
  loader = scope.createLoader response

  load = (url) ->
    loader.pull url or params["url"]

  response.bindLoad ->
    $container.remove() if $container
    $container = $ "<div />"
    $container.html @getContent()
    $container.appendTo 'body:first'

  response.bindContext ->
    context = @getContext()
    if context and context.bindApply
      context.bindApply ->
        response.triggerApply()
    else
      response.triggerApply()

  bindApply: (callback) ->
    response.bindApply callback

  load: (url) ->
    load(url)
