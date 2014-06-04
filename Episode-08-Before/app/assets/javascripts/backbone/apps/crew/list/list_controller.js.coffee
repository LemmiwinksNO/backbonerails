@PE.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      crew = App.request "crew:entities"

      App.execute "when:fetched", crew, =>

        @layout = @getLayoutView crew

        # @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @bannerRegion()
          @panelRegion()
          @crewRegion crew

        @show @layout

    bannerRegion: ->
      bannerView = @getTitleView()
      @layout.bannerRegion.show bannerView

    panelRegion: ->
      panelView = @getPanelView()

      @listenTo panelView, "new:crew:button:clicked", =>
        @newRegion()

      @layout.panelRegion.show panelView

    newRegion: ->
      App.execute "new:crew:member", @layout.newRegion

    crewRegion: (crew) ->
      crewView = @getCrewView crew

      @listenTo crewView, "childview:crew:member:clicked", (child, args) ->
        App.vent.trigger "crew:member:clicked", args.model

      @listenTo crewView, "childview:crew:delete:clicked", (child, args) ->
        model = args.model
        if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

      @layout.crewRegion.show crewView

    getCrewView: (crew) ->
      new List.Crew
        collection: crew

    getPanelView: ->
      new List.Panel

    getTitleView: ->
      new List.Banner

    getLayoutView: (crew) ->
      new List.Layout
        collection: crew