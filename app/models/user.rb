class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email, :corp, :position, :skill, :industry_id, :avatar
  belongs_to :industry

  def pic
  	"#{avatar}?imageView2/1/w/100/h/100"
  end
end
