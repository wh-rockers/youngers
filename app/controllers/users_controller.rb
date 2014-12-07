class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :update_avatar]

  def index
    @users = User.all
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
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  def uptoken
    put_policy = Qiniu::Auth::PutPolicy.new('startups')
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
    @user = current_user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:skill, :desc, :corp, :position, :name, :industry_id, :avatar)
    end
end
