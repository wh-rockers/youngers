class Weixin::UsersController < Weixin::ApplicationController
  before_action :sign_in_via_open_id, only: [:index]
  def index
    @users = User.registration_finished
    if params[:code].present?
      open_id = get_open_id_via_code
      user = WeixinAccount.find_by(open_id: open_id).try(:user)
      sign_in(user) if user.present?
    end
  end
end