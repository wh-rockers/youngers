module TopicsHelper
  def popover_user_info(user)
    s = "<div style='width: 180px; text-align: center;'>"
    s.concat "<img src=#{user.pic('80')} style='border-radius: 50%;' />"
    s.concat "<p style='text-align: center;'>@#{user.name}</p>"
    s.concat "<p>#{user.corp}&nbsp;&nbsp;&nbsp;&nbsp;#{user.position}</p>"
    s.concat "</div>"
    s
  end

  def voted(topic)
    topic.supporters.include?(current_user.try(:id))? 'voted' : ''
  end
end
