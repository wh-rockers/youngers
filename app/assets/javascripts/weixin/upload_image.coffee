uploadRegistrationAvatar = ->
  if $("#avatar_upload_button").length > 0
    bucket = $(".avatar_section").data('bucket')
    uploader = Qiniu.uploader(
      runtimes: "html5,flash,html4"
      browse_button: "avatar_upload_button" #上传选择的点选按钮，**必需**
      uptoken_url: "/users/uptoken"
      domain: "http://#{bucket}.qiniudn.com"
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
          url = "http://#{bucket}.qiniudn.com/" + name
          $(".avatar_section").html "<img src='" + url + "?imageView2/1/w/80/h/80' class='avatar-pic'>"
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