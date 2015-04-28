class Mobile::ApplicationController < ApplicationController
  layout 'mobile'

  def get_open_id_via_code
    url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#{ENV['WEIXIN_ID']}&secret=#{ENV['WEIXIN_SECRET']}&code=#{params[:code]}&grant_type=authorization_code"
    json = JSON.load(open url)
    json.fetch('openid')
  end

  def sign_in_via_open_id
    if params[:code].present?
      open_id = get_open_id_via_code
      user = WeixinAccount.find_by(open_id: open_id).try(:user)
      sign_in(user) if user.present?
    end
  end
end