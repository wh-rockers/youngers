weixinSharePopover = ->
  shareContent = "<p>微信扫一扫， 分享到朋友圈</p><div class='share-tdcode'></div>"
  $('#banner_weixin_share_site').popover(placement: 'bottom', content: shareContent, html: true)

weixinSharePopover()