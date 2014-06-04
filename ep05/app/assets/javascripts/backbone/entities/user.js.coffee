@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model

  class Entities.UsersCollection extends Entities.Collection
    model: Entities.User
    # url: "users"  # Brian doesn't like just using a string
    url: -> Routes.users_path()  # helper made available by js-routes

  API =
    setCurrentUser: (currentUser) ->
      new Entities.User currentUser

    getUserEntities: (cb) ->
      users = new Entities.UsersCollection
      users.fetch
        success: ->
          cb users  # We return users after we finish fetching

  App.reqres.addHandler "set:current:user", (currentUser) ->
    API.setCurrentUser currentUser

  App.reqres.addHandler "user:entities", (cb) ->
    API.getUserEntities cb
