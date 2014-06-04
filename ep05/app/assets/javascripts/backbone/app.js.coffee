@Demo = do (Backbone, Marionette) ->

  App = new Marionette.Application

  # App.rootRoute = "users"
  App.rootRoute = Routes.users_path()  # helper made available by js-routes

  # Set currentUser on the App as a backbone model
  App.on "initialize:before", (options) ->
    @currentUser = App.request "set:current:user", options.currentUser

  # Modules can request current user
  App.reqres.addHandler "get:current:user", ->
    App.currentUser

  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      # If client navigates to our app without a clientside route in place,
      # redirect them to #users. trigger: true makes manual route changes
      # trigger the route. Like if you typed the route in your browser.
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""
      # @navigate "users" if @getCurrentRoute() is ""
      # Backbone.history.navigate "users" if Backbone.history.fragment is ""

  # Moved these methods to /config/marionette/application.js
  # App.navigate = (route, options = {}) ->
  #   Backbone.history.navigate route, options

  # App.getCurrentRoute = ->
  #   Backbone.history.fragment

  App