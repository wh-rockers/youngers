showNewTopicEditor = ->
  if $('#topic_content').length > 0
    $("#topic_content").qeditor()

showNewTopicEditor()

avatarPopoverContact = ->
  if $(".topic-show").length > 0
    $(".avatar-show-info").popover
      trigger: "hover"
      html: true
      placement: "bottom"

avatarPopoverContact()