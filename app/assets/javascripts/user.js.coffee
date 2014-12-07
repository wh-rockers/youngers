avatarPopoverContact = ->
  if $(".me").length > 0
    $(".avatar-show-contact").popover
      trigger: "hover"
      html: true
      placement: "bottom"

avatarPopoverContact()