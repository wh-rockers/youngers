ENV["SECRET_KEY_BASE"] = '69d42a49105bb5984cdd8232af86a44f14c29b23c9724a9a350dde614929f373bdffcff94112b2374e736d036590f5005fd9ccaacbe205d0fac40b41016c498c'
ENV['QINIU_ACCESS_KEY'] = '32dSXkGyNecoyZTwRQKnNVeINR9wp0_pQAft0obD'
ENV['QINIU_SECRET_KEY'] = 'm46ZDTtXAvyvotpAlC9EDJ90b7yYqJpplmE-lIbS'
ENV['WEIXIN_ID'] = 'wx003231764af46e05'
ENV['WEIXIN_SECRET'] = '4abf8ce55e27eff7f5b08789258aabc9'
if Rails.env.development?
  ENV['QINIU_URL'] = 'http://startups-dev.qiniudn.com/'
  ENV['QINIU_BUCKET'] = "startups-dev"
else
  ENV['QINIU_URL'] = "http://startups.qiniudn.com/"
  ENV['QINIU_BUCKET'] = "startups"
end