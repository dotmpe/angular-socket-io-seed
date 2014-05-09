'use strict'

angular.module('ng-trojan-cs.directives', []).
  directive('appVersion', (version)->
    (scope, elm, attrs) ->
      elm.text(version)
  )

