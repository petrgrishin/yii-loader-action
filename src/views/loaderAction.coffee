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
    if context and context.onApply
      context.onApply ->
        response.apply()
    else
      response.apply()

  onApply: (callback) ->
    response.bindApply callback

  load: (url) ->
    load(url)
