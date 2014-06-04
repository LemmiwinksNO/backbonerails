@Demo.module "View", (Views, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.View::,

    templateHelpers: ->

      # This makes currentUser available to all our templates!
      currentUser:
        App.request("get:current:user").toJSON()

      # Helper method for creating links.
      # Make all links go to clientside UNLESS options.external is
      # set to true. This helper should let you go to clientside,
      # serverside and external.
      linkTo: (name, url, options = {}) ->
        _.defaults options,
          external: false

        # Make all links go to client side UNLESS options.external
        # is set to true.
        url = "#" + url unless options.external

        # @escape is an eco method that escapes html
        "<a href='#{url}'>#{@escape(name)}</a>"
