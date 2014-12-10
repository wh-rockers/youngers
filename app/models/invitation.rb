class Invitation < ActiveRecord::Base
	enum state: [:pending, :allow, :refuse]
  include PublicActivity::Common
  after_save :create_friendship, :if => lambda { self.allow? }

  
  private
  
  def create_friendship
    invitating_user = User.find(from_user_id)
    return if invitating_user.friend_ids.include?(to_user_id)
    invitating_user.update_attributes(friend_ids: (invitating_user.friend_ids + [to_user_id]))
    invitation_user = User.find(to_user_id)
    invitation_user.update_attributes(friend_ids: (invitation_user.friend_ids + [from_user_id]))
  end
end
