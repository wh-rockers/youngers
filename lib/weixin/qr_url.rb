require 'open-uri'
class Weixin::QrUrl
  def qr_url
    Rails.cache.fetch 'qr_url', expires_in: 1800 do 
      uri = URI.parse post_url
      post_data = {"expire_seconds" => 1800, "action_name" => "QR_SCENE", "action_info" => {"scene" => {"scene_id" => 123}}}
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new("/cgi-bin/qrcode/create?access_token=#{Weixin::AccessToken.new.token}")
      request.add_field('Content-Type', 'application/json')
      request.body = post_data.to_json
      response = http.request(request)
      json = JSON.parse(response.body)
      json.fetch('url')
    end
  end

  private
  def post_url
    "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=#{Weixin::AccessToken.new.token}"
  end
end