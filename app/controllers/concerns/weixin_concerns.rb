module WeixinConcerns
  extend ActiveSupport::Concern

  def get_open_id_via_code
    url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#{ENV['WEIXIN_ID']}&secret=#{ENV['WEIXIN_SECRET']}&code=#{params[:code]}&grant_type=authorization_code"
    json = JSON.load(open url)
    json.fetch('openid')
  end
end