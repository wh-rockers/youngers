startUps.controller "StartUpsCtrl", ($scope, $http) ->
  $scope.page = "list"
  $http.get ("/start_ups.json")
    .success (data) ->
      $scope.start_ups = data
    .error (err) ->
      console.log err

  $("html, body, .mobile-start-ups, .et-wrapper").addClass 'full-height'