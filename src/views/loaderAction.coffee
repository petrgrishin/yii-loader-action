App.register "{{id}}", (params, scope, widgets) ->
  $container = null
  response = scope.createResponse()
  loader = scope.createLoader response

  load = (url) ->
    loader.pull url or params["url"]

  response.bindLoad ->
    $container.remove() if $container
    $content = $(@getContent())
    $content.appendTo 'body:first'

  response.bindContext ->
    context = @getContext()
    if context and context.onApply
      context.onApply ->
        response.apply()
    else
      response.apply()

  onApply: (callback) ->
    response.bindApply callback

  load: (url) ->
    load(url)
