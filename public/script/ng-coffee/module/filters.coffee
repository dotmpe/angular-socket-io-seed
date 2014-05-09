'use strict'

# Filters 

angular.module('ng-trojan-cs.filters', []).
  filter('interpolate', (version)->
    (text)->
      String(text).replace(/\%VERSION\%/mg, version)
  )

