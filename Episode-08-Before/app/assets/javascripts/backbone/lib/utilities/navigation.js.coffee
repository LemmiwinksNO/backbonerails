# Navigation helpers for our application object
@PE.module "Utilities", (Utilities, App, Backbone, Marionette, $, _) ->

  _.extend App,

    navigate: (route, options = {}) ->
      # route = "+" + route if route.charAt(0) is "/"
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      frag = Backbone.history.fragment
      if _.isEmpty(frag) then null else frag

    startHistory: ->
      if Backbone.history
        Backbone.history.start()