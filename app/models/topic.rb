class Topic < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :content, :user_id, :start_time, :end_time, :location, :attendee_number
  has_many :topic_comments
end
