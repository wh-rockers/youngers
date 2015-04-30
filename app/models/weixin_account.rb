require 'open-uri'
class WeixinAccount < ActiveRecord::Base
  validates_presence_of :open_id
  belongs_to :user

  def fill_basic_info
    token = Weixin::AccessToken.new.token
    url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=#{token}&openid=#{open_id}&lang=zh_CN"
    info = JSON.load(open url)
    info.keys.each do |attr|
      send("#{attr}=", info.fetch(attr)) if WeixinAccount.column_names.include?(attr)
    end
    self.save
  end
end
