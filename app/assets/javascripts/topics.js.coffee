showNewTopicEditor = ->
  if $('#topic_content').length > 0
    $("#topic_content").qeditor()

showNewTopicEditor()

avatarPopoverContact = ->
  if $(".avatar-show-info").length > 0
    $(".avatar-show-info").popover
      trigger: "hover"
      html: true
      container: '.avatar-show-info'
      placement: "bottom"
      animation: false
    .on(
      show: (e) ->
        $this = $(this)
        $this.data "hoveringPopover", true
        e.stopImmediatePropagation()  if $this.data("waitingForPopoverTO")
        return
    
      hide: (e) ->
        $this = $(this)
        if $this.data("forceHidePopover")
          $this.data "forceHidePopover", false
          return true
        e.stopImmediatePropagation()
        clearTimeout $this.data("popoverTO")
        $this.data "hoveringPopover", false
        $this.data "waitingForPopoverTO", true
        $this.data "popoverTO", setTimeout(->
          unless $this.data("hoveringPopover")
            $this.data "forceHidePopover", true
            $this.data "waitingForPopoverTO", false
            $this.popover "hide"
          return
        , 500)
        false
    )

avatarPopoverContact()