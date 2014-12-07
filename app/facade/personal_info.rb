class PersonalInfo
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def invitations
    Invitation.where(to_user_id: user.id).pending
  end

  def invitatings
    Invitation.where(from_user_id: user.id, read: false).where(state: [1, 2])
  end

end