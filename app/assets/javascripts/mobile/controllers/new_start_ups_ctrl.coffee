startUps.controller "NewStartUpsCtrl", [
  '$scope'
  '$http'
  ($scope, $http) ->
    $scope.newStartUp = {}
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
              console.log err
      
            UploadComplete: ->                
            #队列文件处理完毕后,处理相关的事情        
      
            Key: (up, file) ->
          )
    uploadProjectLogo()

    $scope.submitStartUp = ->
      $(".error").css("visibility", "hide")
      if !!$scope.newStartUp.name && !!$scope.newStartUp.desc && !!$scope.newStartUp.logo_url
        params = { start_up: _.pick($scope.newStartUp, "name", "desc", "link", "logo_url") }
        $http.post("/start_ups.json", params)
          .success (data)->
            window.location.href= "/mobile/start_ups"
          .error (err) ->
            console.log err
      else
        $(".error").css("visibility", "visible")
        return
]