class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email, :corp, :position, :skill, :industry_id, :avatar
  belongs_to :industry

  def friends
  	invitation_to_me_ids = Invitation.where(to_user_id: id, state: 'allow').map(&:from_user_id)
  	inviting_ids = Invitation.where(from_user_id: id, state: 'allow').map(&:to_user_id)
  	User.where(id: (invitation_to_me_ids | inviting_ids))
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
