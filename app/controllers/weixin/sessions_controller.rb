class Weixin::SessionsController < Devise::SessionsController
  include WeixinConcerns
  layout 'weixin'
  
  def new
    @open_id = params[:open_id] || get_open_id_via_code
    # weixin_account = WeixinAccount.find_by(open_id: @open_id)
    # user = weixin_account.try(:user)
    super
    # if user.present?
      # sign_in user
      # redirect_to weixin_users_path and return
    # else
      # super
    # end
  end

  def create
    user = User.find_by(email: permit_params[:email])
    weixin_account = WeixinAccount.find_by(open_id: params[:open_id])
    weixin_account.update_attributes(user_id: user.id) if user.present?
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    # respond_with resource, location: after_sign_in_path_for(resource)
    if current_user
      redirect_to weixin_users_path(success_message: '登录成功') and return
    else
      redirect_to new_weixin_session_path(open_id: params[:open_id]) and return
    end
  end

  private
  def permit_params
    params.require(:user).permit(:email, :password)
  end
end