weixinSharePopover = ->
  shareContent = "<p>使用微信扫一扫， 分享到朋友圈</p><div class='share-tdcode'></div>"
  $('.weixin-share').popover(placement: 'bottom', content: shareContent, html: true)

weixinSharePopover()