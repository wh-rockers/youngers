module UsersHelper
	def random_avatar
		num = rand(20) + 1
		"http://startups.qiniudn.com/#{num}.png"
	end

  def invitation_link(one_user, ao_user)
    if one_user && one_user != ao_user
      if Invitation.exists?(state: 'pending', to_user_id: one_user.id, from_user_id: ao_user.id)
        link_to '给你发了邀请', '#', class: 'btn btn-info disabled'
      elsif Invitation.exists?(state: 'pending', to_user_id: ao_user.id, from_user_id: one_user.id)
        link_to '等待回复中', '#', class: 'btn btn-info disabled'
      else
        link_to '约他喝咖啡', new_invitation_path(to_user_id: ao_user.id), remote: true, class: "btn btn-info invitation-button"
      end
    else
      link_to '约他喝咖啡', '#', class: 'btn btn-info disabled'
    end
  end
end
