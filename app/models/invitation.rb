class Invitation < ActiveRecord::Base
	enum state: [:pending, :allow, :refuse]
  include PublicActivity::Model
  tracked
end
