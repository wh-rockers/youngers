class TopicComment < ActiveRecord::Base
  scope :top_level, -> { where(level: 0) }
  scope :tiny_level, -> { where(level: 1) }
  belongs_to :topic, :counter_cache => true
  belongs_to :user
  validates_presence_of :content, :user_id, :topic_id
end
