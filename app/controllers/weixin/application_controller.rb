class Weixin::ApplicationController < ApplicationController
  TOKEN = 'startupscoffee2015'
  before_action :authentication
  skip_before_filter :verify_authenticity_token

  private

  def authentication
    token = TOKEN
    str = [params[:timestamp].to_s, token, params[:nonce].to_s].sort.join
    sha = Digest::SHA1.hexdigest(str)
    sha = params[:signature]
  end
end