@startUps = angular.module('StartUps', ['infinite-scroll'])
@startUps.directive "ngUpdateHidden", ->
  (scope, el, attr) ->
    model = attr['ngModel']
    scope.$watch model, (nv) ->
      el.val(nv)
      return
    return
