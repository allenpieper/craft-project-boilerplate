
define (require) ->

  Svg4Everybody = require 'svg4everybody'

  class SvgForEverybody

    constructor: ->

      Svg4Everybody.attach(document.body)

  SvgForEverybody