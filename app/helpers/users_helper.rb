module UsersHelper
	def random_avatar
		num = rand(20) + 1
		"http://startups.qiniudn.com/#{num}.png"
	end

  def invitation_link(one_user, ao_user)
    if one_user && one_user != ao_user
      if Invitation.exists?(state: 'pending', to_user_id: one_user.id, from_user_id: ao_user.id)
        link_to '给你发了邀请', '#', class: 'btn btn-primary disabled'
      elsif one_user.is_friend_of?(ao_user)
        link_to '已是你的好友', '#', class: 'btn btn-primary disabled'
      elsif Invitation.exists?(state: 'pending', to_user_id: ao_user.id, from_user_id: one_user.id)
        link_to '等待回复中', '#', class: 'btn btn-primary disabled'
      else
        link_to '约他喝咖啡', new_invitation_path(to_user_id: ao_user.id), remote: true, class: "btn btn-primary invitation-button"
      end
    else
      link_to '约他喝咖啡', '#', class: 'btn btn-primary disabled'
    end
  end

  def popover_contact(user)
    s = "<p>邮箱: #{user.email}</p>"
    s.concat "<p>手机号:  #{user.phone_number}</p>" if user.phone_number
    s.concat "<p>微信号: #{user.weixin_number}</p>" if user.weixin_number
    s.concat "<p>QQ号: #{user.qq_number}</p>" if user.qq_number
    s
  end
end
