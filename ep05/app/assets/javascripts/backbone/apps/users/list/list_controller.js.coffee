@Demo.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listUsers: ->
      # turned this into a callback function so that nothing is
      # rendered on the screen until we finish fetching.
      users = App.request "user:entities", (users) =>

        @layout = @getLayoutView()

        @layout.on "show", =>  # => preserves context(@)
          @showPanel users
          @showUsers users

        App.mainRegion.show @layout

    showPanel: (users) ->
      panelView = @getPanelView users
      @layout.panelRegion.show panelView

    showUsers: (users) ->
      usersView = @getUsersView users
      @layout.usersRegion.show usersView

    getPanelView: (users) ->
      new List.Panel
        collection: users

    getUsersView: (users) ->
      new List.Users
        collection: users

    getLayoutView: ->
      new List.Layout