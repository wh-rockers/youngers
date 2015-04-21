startUps.controller "StartUpsCtrl", [
  '$scope'
  '$http'
  ($scope, $http) ->
    $scope.items = []
    $scope.busy = false
    $scope.per_page = 30
    $scope.page_num = 0
    $scope.pages = 100
  
    $scope.nextPage = ->
      return if $scope.busy || ($scope.page_num == $scope.pages)
      $scope.busy = true
      url = "/start_ups.json?per_page=#{$scope.per_page}&page=#{$scope.page_num}"
      $http.get(url)
        .success (data) ->
          $scope.pages = data.pages
          $scope.items = $scope.items.concat(data.start_ups)
          $scope.busy = false
          $scope.page_num += 1
        .error (err) ->
          console.log err
      
  
    bottomToTop = ->
      $('.bottom-icon-top').on 'click', ->
        $('body').animate {scrollTop: 0}, 600
  
    bottomToTop()
  
    
]

startUps.controller "StartUpCtrl", [
  '$scope'
  '$http'
  ($scope, $http) ->
    $scope.up_state = false
  
    $scope.up = ->
      if $scope.up_state == false
        $http.put("/start_ups/#{$scope.start_up.id}/up.json", {direct: 'up'})
          .success ->
            $scope.up_state = true
            $scope.start_up.likes_count += 1
          .error (err) ->
            console.log err
      else
        $http.put("/start_ups/#{$scope.start_up.id}/up.json", {direct: 'down'})
          .success ->
            $scope.up_state = false
            $scope.start_up.likes_count -= 1
          .error (err) ->
            console.log err
]


