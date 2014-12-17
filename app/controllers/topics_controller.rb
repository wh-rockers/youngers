class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def index
    @topics = Topic.order('updated_at desc')
  end
end
