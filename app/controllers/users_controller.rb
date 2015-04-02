class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :update_avatar]

  def index
    @users = User.registration_finished
    render layout: 'big-banner'
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
    @type = params[:type]
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    @type = params[:type]
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  def uptoken
    put_policy = Qiniu::Auth::PutPolicy.new("#{ENV['QINIU_BUCKET']}")
    token = Qiniu::Auth.generate_uptoken(put_policy)
    render json: { uptoken: token }
  end

  def me
    @info = PersonalInfo.new(current_user)
  end

  def update_avatar
    @user.update_attributes(avatar: user_params[:avatar])
  end

  def profile
    @user = User.find(params[:user_id])
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:skill, :desc, :corp, :position, :name, :industry_id, :avatar, :weixin_number, :phone_number, :qq_number)
    end

    def resend_email_params
      params.permit(:resend_email)
    end
end
