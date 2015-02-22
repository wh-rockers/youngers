require 'CGI'
require 'open-uri'
class Weixin::ApplicationController < ApplicationController
  TOKEN = 'startupscoffee2015'
  layout 'weixin'

  private

  def get_open_id_via_code(code)
    url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#{ENV['WEIXIN_ID']}&secret=#{ENV['WEIXIN_SECRET']}&code=#{code}&grant_type=authorization_code"
    puts = '================='
    p url
    json = JSON.load(open url)
    json.fetch('openid')
  end

  def authentication
    token = TOKEN
    str = [params[:timestamp].to_s, token, params[:nonce].to_s].sort.join
    sha = Digest::SHA1.hexdigest(str)
    sha == params[:signature]
  end
end