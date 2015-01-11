class StartUpsController < ApplicationController
  before_action :set_start_up, only: [:show, :edit, :update, :destroy, :like]

  def index
    @start_ups = StartUp.all
    render layout: 'big-banner'
  end

  def show
    respond_with(@start_up)
  end

  def new
    @start_up = StartUp.new
    respond_with(@start_up)
  end

  def like
    unless @start_up.like_ids.include?(current_user.id) 
      @start_up.likes_count += 1
      @start_up.like_ids.push current_user.id
      @start_up.like_ids_will_change!
      @start_up.save
    end
  end

  def edit
  end

  def create
    @start_up = StartUp.new(start_up_params)
    @start_up.save
    respond_with(@start_up)
  end

  def update
    @start_up.update(start_up_params)
    respond_with(@start_up)
  end

  def destroy
    @start_up.destroy
    respond_with(@start_up)
  end

  private
    def set_start_up
      @start_up = StartUp.find(params[:id])
    end

    def start_up_params
      params.require(:start_up).permit(:logo_url, :name, :likes_count, :desc)
    end
end
