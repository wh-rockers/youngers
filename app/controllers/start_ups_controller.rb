class StartUpsController < ApplicationController
  before_action :set_start_up, only: [:show, :edit, :update, :destroy, :like, :up]
  skip_before_action :authenticate_user!, only: [:up, :create]

  def index
    page = params[:page].try(:to_i) || 0
    @per_page = params[:per_page].try(:to_i) || 500
    @start_ups = StartUp.order(updated_at: :desc).offset(@per_page*page).limit(@per_page)
    respond_to do |format|
      format.html { render layout: 'big-banner' }
      format.json
    end
  end

  def up
    case params[:direct]
    when 'up' then @start_up.likes_count += 1
    when 'down' then @start_up.likes_count -=1
    end
    @start_up.save
    render nothing: true, status: 200
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
    render "show.json"
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
      params.require(:start_up).permit(:logo_url, :name, :likes_count, :desc, :link)
    end
end
