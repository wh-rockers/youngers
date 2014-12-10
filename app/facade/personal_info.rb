class PersonalInfo
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def pending_invitations
    user.pending_invitations
  end

  def unread_invitating_results
    user.invitatings.where(read: false, state: [1, 2])
  end

  def friend_activities
    PublicActivity::Activity.where("recipient_id = ? or owner_id = ?", user.friend_ids, user.friend_ids).where.not("recipient_id = ? or owner_id = ?", user.id, user.id)
  end
end