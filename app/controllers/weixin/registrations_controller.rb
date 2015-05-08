class Weixin::RegistrationsController < Devise::RegistrationsController
  include WeixinConcerns
  layout 'weixin'
  def new
    #@weixin_account = WeixinAccount.find_by_open_id(get_open_id_via_code) if params[:code].present?
    @weixin_account = WeixinAccount.first
    @registration = User.new(name: @weixin_account.try(:nickname))
  end

  def create
    weixin_account = WeixinAccount.find_by_open_id(params[:open_id])
    @registration = User.new(permit_params)
    if @registration.save
      sign_in @registration
      weixin_account.update_attributes(user_id: @registration.id) if weixin_account.present?
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @registration = User.find(params[:id])
    respond_to do |format|
      if @registration.update_attributes(permit_params)
        if @registration.registration_ongoing?
          @registration.registration_finished!
          UserMail.confirm_email(@registration).deliver
          format.js
        else
          sign_in @registration
          format.html { redirect_to users_path }
        end
      else
        return false
      end
    end
  end

  private

  def permit_params
    params.require(:user).permit(:open_id, :name, :email, :password, :password_confirmation, :skill, :desc, :corp, :position, :avatar, :industry_id)
  end
end
