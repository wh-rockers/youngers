namespace :db do
	task update_remarks_score: :environment do
		oneday = 86400
		Remark.find_each do |remark|
			day = (Time.now - remark.created_at).to_i / 86400
			next if day > 5
			remark.score -= 20 * day
			remark.save
		end
	end
end