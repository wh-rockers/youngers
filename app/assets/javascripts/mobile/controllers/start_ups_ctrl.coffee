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
      
  
    $scope.submitStartUp = ->
      unless !!$scope.newStartUp && !!$scope.newStartUp.name && !!$scope.newStartUp.desc && !!$scope.newStartUp.logo_url
        $(".error").css('visibility', 'visible')
        return
      params = { start_up: _.pick($scope.newStartUp, 'name', 'desc', 'logo_url', 'link') }
      $http.post("/start_ups.json", params)
        .success (data) ->
          $scope.items.push data
          $scope.newStartUp = null
          $(".mdi-file-cloud-queue").show()
          $("#logo").css("background-image", 'none')
          $(".start-ups-list-panel").hide()
          $('.new_start_up').toggleClass 'closed'
        .error (err) ->
          console.log err
  
    bottomToTop = ->
      $('.bottom-icon-top').on 'click', ->
        $('body').animate {scrollTop: 0}, 600
  
    bottomToTop()
  
    extendDetailPage = ->
      $(".extend-button").on 'click', ->
        $('.new_start_up').toggleClass 'closed'
        setTimeout (->
          $(".start-ups-list-panel").hide()
          return
        ), 1200
  
    extendDetailPage()
  
    backToHome = ->
      $(".back-button").on 'click', ->
        $(".start-ups-list-panel").show()
        $('.new_start_up').toggleClass 'closed'
  
    backToHome()
    
  
    uploadProjectLogo = ->
      if $("#upload-project-button").length > 0
        uploader = Qiniu.uploader(
          runtimes: "html5,flash,html4"
          browse_button: "upload-project-button" #上传选择的点选按钮，**必需**
          uptoken_url: "/users/uptoken"
          domain: "http://startups-dev.qiniudn.com"
          container: "create_new_start_up"
          max_file_size: "2mb"
          flash_swf_url: "js/plupload/Moxie.swf"
          max_retries: 3
          dragdrop: true
          drop_element: "create_new_start_up"
          chunk_size: "2mb"
          auto_start: true
          init:
            FilesAdded: (up, files) ->
              plupload.each files, (file) ->
              return  
            # 文件添加进队列后,处理相关的事情
      
            BeforeUpload: (up, file) ->                      
            # 每个文件上传前,处理相关的事情
      
            UploadProgress: (up, file) ->
              $("#upload-project-button").hide()
              $(".loading-section").css('display', 'inline-block')          
            # 每个文件上传时,处理相关的事情
      
            FileUploaded: (up, file, info) ->
              name = $.parseJSON(info).key
              
              url = "http://startups-dev.qiniudn.com/" + name
              remote_image = "#{url}?imageView2/1/w/80/h/80"
              $(".mdi-file-cloud-queue").hide()
              $("#logo").css('background-image', "url(#{remote_image})")
              $(".loading-section").hide()
              $("#upload-project-button").text('重新上传').css('display', 'inline-block')
              $scope.newStartUp.logo_url = name
              return
              
            Error: (up, err, errTip) ->      
            #上传出错时,处理相关的事情
      
            UploadComplete: ->                
            #队列文件处理完毕后,处理相关的事情        
      
            Key: (up, file) ->
          )
    uploadProjectLogo()
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


