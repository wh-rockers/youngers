module UsersHelper
	def random_avatar
		num = rand(20) + 1
		"http://startups.qiniudn.com/#{num}.png"
	end
end
