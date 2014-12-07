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

end