class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email, :avatar
  validates_presence_of :corp, :position, :skill, :industry_id, :if => lambda { self.registration_state != 'registration_ongoing' }
  belongs_to :industry
  has_many :invitation_codes
  enum registration_state: [:registration_ongoing, :registration_finished]

  def friends
  	invitation_to_me_ids = Invitation.allow.where(to_user_id: id).map(&:from_user_id)
  	inviting_ids = Invitation.allow.where(from_user_id: id).map(&:to_user_id)
  	User.where(id: (invitation_to_me_ids | inviting_ids))
  end

  def is_friend_of?(user)
    friends.include? user
  end

  def pending_invitations
  	invitations.where(state: 'pending')
  end

  def pending_invitings
  	invitatings.where(state: 'pending')
  end

  def invitations
  	Invitation.where(to_user_id: id)
  end

  def invitatings
  	Invitation.where(from_user_id: id)
  end

  DEV = ['zilongji@gmail.com']

  def pic(version='normal')
    case version
    when 'small'
      "#{avatar}?imageView2/1/w/60/h/60"
    else
      "#{avatar}?imageView2/1/w/70/h/70"
    end
  end

end
