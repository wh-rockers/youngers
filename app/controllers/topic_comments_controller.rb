class TopicCommentsController < ApplicationController
  def new
    @topic_comment = TopicComment.new(parent_id: params[:parent_id],topic_id: params[:topic_id])
  end

  def create
    @topic_comment = current_user.topic_comments.build(permit_params)
    @topic = Topic.find(@topic_comment.topic_id)
    respond_to do |format|
      if @topic_comment.save
        format.js
      end
    end
  end

  private
  def permit_params
    params.require(:topic_comment).permit(:topic_id, :content, :parent_id, :level)
  end
end