class Invitation < ActiveRecord::Base
	enum state: %w(pending allow refuse)
end
