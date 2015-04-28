require 'cgi'
require 'open-uri'
class Weixin::ApplicationController < ApplicationController
  include WeixinConcerns
  layout 'weixin'

  def sign_in_via_open_id
    if params[:code].present?
      open_id = get_open_id_via_code
      user = WeixinAccount.find_by(open_id: open_id).try(:user)
      sign_in(user) if user.present?
    end
  end
end