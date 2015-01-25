require 'open-uri'

module Weixin
  CREATE_BUTTON_URL = "https://api.weixin.qq.com/cgi-bin/menu/create"
  def self.buttons
    {
      button: [
        { type: "view", name: "光谷客", url: "http://baidu.com" },
        { type: "view", name: "近期活动", url: "http://bing.com" },
        { type: "view", name: "约吗", url: "http://startups.coffee" }
      ]
    }
  end

  class AccessToken
    attr_reader :app_id, :app_secret

    def initialize
      @app_id = ENV['WEIXIN_ID']
      @app_secret = ENV['WEIXIN_SECRET']
    end

    #def token
      #token = Rails.cache.fetch('weixin_assess_token', exipres_in: 110.minutes) do 
        #JSON.load(token_url.open)['access_token']
      #end
    #end

    private

    def token_url
      uri = URI.parse('https://api.weixin.qq.com/cgi-bin/token')
      params = { grant_type: "client_credential", appid: @app_id, secret: @app_secret }
      uri.query = URI.encode_www_form(params)
      uri
    end
  end
end