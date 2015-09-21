define (require) ->

  $ = require 'jquery'
  SvgForEverybody = require 'modules/SvgForEverybody'
  PictureFill = require 'modules/Picturefill'

  class App

    constructor: ->

      svg4everybody()
      myModule = new MyModule()

  App