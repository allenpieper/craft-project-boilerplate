#global require
"use strict"

require.config

  shim:
    handlebars:
      exports: "Handlebars"
      # https://github.com/gruntjs/grunt-contrib-handlebars/issues/48
      init: ->
        this.Handlebars = Handlebars
        this.Handlebars

  paths:
    jquery: '../../bower_components/jquery/jquery'
    handlebars: '../../bower_components/handlebars.js/dist/handlebars'
    svg4everybody: '../../bower_components/svg4everybody/dist/svg4everybody'
    picturefill: '../../bower_components/picturefill/dist/picturefill'

require ['App'], (App) ->

  new App