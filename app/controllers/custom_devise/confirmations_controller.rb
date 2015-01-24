class CustomDevise::ConfirmationsController < Devise::ConfirmationsController
  def new
  end

  def create
    @user = User.find_by(confirmation_token: params[:confirmation_token])
    if @user.present?
      @user.update_attributes(confirmation_at: Time.now)
      sign_in @user
      redirect_to users_path(msg: "邮箱验证成功！辛苦了！") and return
    else 
      render action: new
    end
  end

  def resend_confirmation_email
    @user = User.find_by(email: resend_email_params[:email])
    if @user.present?
      UserMail.confirm_email(@user).deliver
    else
      render action: new
    end
  end
end