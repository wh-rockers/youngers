module TopicsHelper
  def popover_user_info(user)
    s = "<p style='text-align: center;'>@#{user.name}</p>"
    s.concat "<p>#{user.corp}&nbsp;&nbsp;&nbsp;&nbsp;#{user.position}</p>"
    s
  end

  def voted(topic)
    topic.supporters.include?(current_user.try(:id))? 'voted' : ''
  end
end
