
define (require) ->

  Picturefill = require 'picturefill'

  class PictureFill

    constructor: ->

      Picturefill.attach(document.body)

  PictureFill