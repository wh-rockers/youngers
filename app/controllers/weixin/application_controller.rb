require 'CGI'
require 'open-uri'
class Weixin::ApplicationController < ApplicationController
  include WeixinConcerns
  TOKEN = 'startupscoffee2015'
  layout 'weixin'

  private

  def authentication
    token = TOKEN
    str = [params[:timestamp].to_s, token, params[:nonce].to_s].sort.join
    sha = Digest::SHA1.hexdigest(str)
    sha == params[:signature]
  end
end