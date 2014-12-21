class Topic < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :content, :user_id
  has_many :topic_comments
end
