class Remark < ActiveRecord::Base
	before_validation :init_score

	private
	
	def init_score
		self.score = 100
	end
end
