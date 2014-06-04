@PE.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

  class Controllers.Application extends Marionette.Controller

    constructor: (options = {}) ->
      @region = options.region or App.request "default:region"
      super options
      @_instance_id = _.uniqueId("controller")
      App.execute "register:instance", @, @_instance_id

    close: () ->
      console.log "closing", @
      App.execute "unregister:instance", @, @_instance_id
      super # When nothing is passed to it, it uses arguments

    show: (view) ->
      @listenTo view, "close", @close
      @region.show view