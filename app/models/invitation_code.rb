class InvitationCode < ActiveRecord::Base
  belongs_to :user
  before_create :set_code
  after_save :check_friendship, :if => lambda { !self.group_code && self.used_by_ids.any? }

  private 

  def set_code
    self.code ||= ('A'..'Z').to_a.shuffle[0,8].join
  end

  def check_friendship
    return if user.admin?
    user.update_attributes friend_ids: user.friend_ids + self.used_by_ids
    new_user = User.find(used_by_ids.first)
    new_user.update_attributes friend_ids: new_user.friend_ids + [user_id]
  end
end
