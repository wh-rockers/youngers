class InvitationCode < ActiveRecord::Base
  belongs_to :user
  before_create :set_code

  private 

  def set_code
    self.code ||= ('a'..'z').to_a.shuffle[0,8].join
  end
end
