class Invitation < ActiveRecord::Base
	enum state: [:pending, :allow, :refuse]
  include PublicActivity::Model
  tracked
  after_save :create_friendship, :if => lambda { self.allow? }

  
  private
  
  def create_friendship
    invitating_user = User.find(from_user_id)
    return if invitating_user.friend_ids.include? to_user_id
    invitating_user.friend_ids.push to_user_id
    invitating_user.friend_ids_will_change!
    invitating_user.save!
    invitation_user = User.find(to_user_id)
    invitation_user.friend_ids.push from_user_id
    invitation_user.friend_ids_will_change!
    invitation_user.save!
  end
end
