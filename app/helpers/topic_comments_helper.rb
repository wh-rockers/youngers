module TopicCommentsHelper
  def voted_comment(comment)
    comment.supporters.include?(current_user.try(:id)) ? 'voted' : ''
  end
end