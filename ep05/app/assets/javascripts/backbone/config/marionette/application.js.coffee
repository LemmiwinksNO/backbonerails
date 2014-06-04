do (Backbone) ->

  _.extend Backbone.Marionette.Application::,

    navigate: (route, options = {}) ->
      # We do the below so routes look consistent. localhost/#/users
      route = "#" + route if route.charAt(0) is "/"
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      Backbone.history.fragment

# do (Backbone) ->

  # _.extend Backbone.Marionette.Application::,

  #   navigate: (route, options = {}) ->
  #     route = "#" + route if route.charAt(0) is "/"
  #     Backbone.history.navigate route, options

  #   getCurrentRoute: ->
  #     Backbone.history.fragment