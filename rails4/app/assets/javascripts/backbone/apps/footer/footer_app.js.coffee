@Demo.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  # Prevents this footerApp module from automatically starting when
  # application object starts
  @startWithParent = false

  API =
    showFooter: ->
      FooterApp.Show.Controller.showFooter()

  FooterApp.on "start", ->
    API.showFooter()

  # App.addInitializer ->
  #   API.showFooter()

  # App.commands.setHandler "footer:show", ->
  #   API.showFooter()