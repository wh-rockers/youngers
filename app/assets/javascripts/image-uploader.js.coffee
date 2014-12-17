uploadRegistrationAvatar = ->
  if $("#avatar_upload_button").length > 0
    uploader = Qiniu.uploader(
      runtimes: "html5,flash,html4"
      browse_button: "avatar_upload_button" #上传选择的点选按钮，**必需**
      uptoken_url: "/users/uptoken"
      domain: "http://startups.qiniudn.com"
      container: "registration-user-avatar"
      max_file_size: "5mb"
      flash_swf_url: "js/plupload/Moxie.swf"
      max_retries: 3
      dragdrop: true
      drop_element: "registration-user-avatar"
      chunk_size: "4mb"
      auto_start: true
      init:
        FilesAdded: (up, files) ->
          plupload.each files, (file) ->
          return

        # 文件添加进队列后,处理相关的事情
        BeforeUpload: (up, file) ->
          
        
        # 每个文件上传前,处理相关的事情
        UploadProgress: (up, file) ->
          $("#avatar_upload_button").hide()
          $(".loading-avatar").css('display', 'inline-block')
        
        # 每个文件上传时,处理相关的事情
        FileUploaded: (up, file, info) ->
          name = $.parseJSON(info).key
          url = "http://startups.qiniudn.com/" + name
          $(".avatar_section").html "<img src='" + url + "?imageView2/1/w/100/h/100' class='avatar-pic'>"
          $("#user_avatar").attr('value', url)
          $(".loading-avatar").hide()
          $("#avatar_upload_button").text('修改头像')
          $("#avatar_upload_button").css('display', 'inline-block')
          return
        Error: (up, err, errTip) ->
    
        #上传出错时,处理相关的事情
        UploadComplete: ->
    
        
        #队列文件处理完毕后,处理相关的事情
        Key: (up, file) ->
    )

uploadRegistrationAvatar() 

modifyAvatarInProfile = ->
  if $(".profile").length > 0
    uploader = Qiniu.uploader(
      runtimes: "html5,flash,html4"
      browse_button: "avatar_upload_button" #上传选择的点选按钮，**必需**
      uptoken_url: "/users/uptoken"
      domain: "http://startups.qiniudn.com"
      container: "me-avatar"
      max_file_size: "5mb"
      flash_swf_url: "js/plupload/Moxie.swf"
      max_retries: 3
      dragdrop: true
      drop_element: "me-avatar"
      chunk_size: "4mb"
      auto_start: true
      init:
        FilesAdded: (up, files) ->
          plupload.each files, (file) ->
          return

        # 文件添加进队列后,处理相关的事情
        BeforeUpload: (up, file) ->
          
        
        # 每个文件上传前,处理相关的事情
        UploadProgress: (up, file) ->
          $("#avatar_upload_button").hide()
          $(".loading-avatar").css('display', 'inline-block')
        
        # 每个文件上传时,处理相关的事情
        FileUploaded: (up, file, info) ->
          name = $.parseJSON(info).key
          url = "http://startups.qiniudn.com/" + name
          $(".avatar_section").html "<img src='" + url + "?imageView2/1/w/100/h/100' class='avatar-pic'>"
          $("#user_avatar").attr('value', url)
          $(".edit_user").css('display', 'inline-block')
          $(".loading-avatar").hide()
          $("#avatar_upload_button").css('display', 'inline-block')
          return
        Error: (up, err, errTip) ->
    
        #上传出错时,处理相关的事情
        UploadComplete: ->
    
        
        #队列文件处理完毕后,处理相关的事情
        Key: (up, file) ->
    )

modifyAvatarInProfile()

editorUploadImage = ->
  if $("#editor-upload-image-modal").length > 0
    uploader = Qiniu.uploader(
      runtimes: "html5,flash,html4"
      browse_button: "upload-from-pc" #上传选择的点选按钮，**必需**
      uptoken_url: "/users/uptoken"
      domain: "http://startups.qiniudn.com"
      container: "editor-upload-image-modal"
      max_file_size: "5mb"
      flash_swf_url: "js/plupload/Moxie.swf"
      max_retries: 3
      dragdrop: true
      drop_element: "me-avatar"
      chunk_size: "4mb"
      auto_start: true
      init:
        FilesAdded: (up, files) ->
          plupload.each files, (file) ->
          return

        # 文件添加进队列后,处理相关的事情
        BeforeUpload: (up, file) ->
          
        
        # 每个文件上传前,处理相关的事情
        UploadProgress: (up, file) ->
          $('.upload-section').css('display', 'none');
          $(".loading-upload-image").css('display', 'block')
        
        # 每个文件上传时,处理相关的事情
        FileUploaded: (up, file, info) ->
          name = $.parseJSON(info).key
          url = "http://startups.qiniudn.com/" + name
          $('#upload-image-url').text(url)
          $("#editor-upload-image-confirm").show()
          $(".img-show").html "<img src='" + url + "?imageView2/1/w/300'>"
          $(".loading-upload-image").hide()
          return
        Error: (up, err, errTip) ->
    
        #上传出错时,处理相关的事情
        UploadComplete: ->
    
        
        #队列文件处理完毕后,处理相关的事情
        Key: (up, file) ->
    )
editorUploadImage()