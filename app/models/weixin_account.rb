class WeixinAccount < ActiveRecord::Base
  validates_presence_of :open_id
  belongs_to :user
end
