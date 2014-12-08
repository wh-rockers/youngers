class InvitationCode < ActiveRecord::Base
  belongs_to :user
  before_create :set_code
  after_save :check_friendship, :if => lambda { self.used_by }

  private 

  def set_code
    self.code ||= ('A'..'Z').to_a.shuffle[0,8].join
  end

  def check_friendship
    return if user.admin?
    user.update_attributes friend_ids: user.friend_ids + [used_by]
    new_user = User.find(used_by)
    new_user.update_attributes friend_ids: new_user.friend_ids + [user_id]
  end
end
