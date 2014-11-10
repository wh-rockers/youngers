class Remark < ActiveRecord::Base
	# 初始100， 每天减20， 一个赞5
	before_validation :init_score

	private

	def init_score
		self.score = 100
	end
end
