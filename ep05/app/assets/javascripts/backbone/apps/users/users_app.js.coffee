@Demo.module "UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  # We want this routable - can go to /UsersApp
  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      "users" : "listUsers"

  API =
    listUsers: ->
      UsersApp.List.Controller.listUsers()

  App.addInitializer ->
    new UsersApp.Router
      controller: API