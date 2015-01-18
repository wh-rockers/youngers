class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
    @qr = RQRCode::QRCode.new("http://startups.coffee/topics/#{params[:id]}").to_img.resize(120, 120).to_data_url
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @topic = current_user.topics.build(permit_params)
    if @topic.save
      redirect_to @topic and return
    else
      render action: 'new'
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(permit_params)
      redirect_to topics_path and return
    else
      render action: 'edit'
    end
  end
  
  def index
    @topics = Topic.order('updated_at desc')
  end

  def up
    @topic = Topic.find(params[:id])
    @from = params[:from]
    unless !current_user || @topic.supporters.include?(current_user.id)
      @can_up = true
      @topic.supporters.push current_user.id
      @topic.supporters_will_change!
      @topic.up_count += 1
      @topic.save
    end
  end

  def wanna_join
    @topic = Topic.find(params[:id])
    return @change = false unless user_signed_in?
    if params[:remove]
      @topic.wanna_join_users.delete(current_user.id)
      @topic.wanna_join_users_will_change!
      @topic.save
    else
      @topic.wanna_join_users.push(current_user.id)
      @topic.wanna_join_users_will_change!
      @topic.save
    end
  end

  private
  def permit_params
    params[:topic][:start_time] = "#{params[:start_date_submit]} #{params[:start_time_submit]}:00"
    params[:topic][:end_time] = "#{params[:end_date_submit]} #{params[:end_time_submit]}:00"
    params.require(:topic).permit(:personal, :organizer, :title, :attendee_number,:content, :start_time, :end_time, :location)
  end
end
