class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include User::Role
  scope :members, -> { where("'member' = ANY (roles)") }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email, :avatar
  validates_presence_of :corp, :position, :skill, :industry_id, :if => lambda { self.registration_state != 'registration_ongoing' }
  belongs_to :industry
  has_many :invitation_codes
  has_many :topics
  has_many :topic_comments
  has_many :start_ups
  belongs_to :invitation_code
  has_one :weixin_account
  enum registration_state: [:registration_ongoing, :registration_finished]

  def invitation_code_limit
    friend_ids.count / 2 + 1
  end

  def can_generate_invitation_code?
    admin? || invitation_codes.count < invitation_code_limit
  end

  def friends
  	User.where(id: friend_ids)
  end

  def is_friend_of?(user)
    friend_ids.include? user.id
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
    if version =~ /\d/
      "#{avatar}?imageView2/1/w/#{version}/h/#{version}"
    elsif version == 'small'
      "#{avatar}?imageView2/1/w/60/h/60"
    else
      "#{avatar}?imageView2/1/w/70/h/70"
    end
  end

  protected
  def confirmation_required?
    false
  end

end
