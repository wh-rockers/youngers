require 'open-uri'

class Weixin::AccessToken
  attr_reader :app_id, :app_secret

  def initialize
    @app_id = ENV['WEIXIN_ID']
    @app_secret = ENV['WEIXIN_SECRET']
  end

  def token
    token = Rails.cache.fetch('weixin_assess_token', exipres_in: 110.minutes) do 
      JSON.load(token_url.open)['access_token']
    end
  end

  private

  def token_url
    uri = URI.parse('https://api.weixin.qq.com/cgi-bin/token')
    params = { grant_type: "client_credential", appid: @app_id, secret: @app_secret }
    uri.query = URI.encode_www_form(params)
    uri
  end

end
