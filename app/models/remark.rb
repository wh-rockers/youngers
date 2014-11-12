class Remark < ActiveRecord::Base
	# 初始100， 每天减20， 一个赞5
	before_create :init_score
	validates_presence_of :user_id, :content

	private

	def init_score
		self.score = 100
	end
end
