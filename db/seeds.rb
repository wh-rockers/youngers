if Industry.count == 0
	Industry.create([
		{ name: '计算机／互联网', abbr: 'IT' },
		{ name: '公务员／事业单位', abbr: '公' },
		{ name: '投资', abbr: '投' },
		{ name: '文化／广告／传媒', abbr: '文' },
		{ name: '商业／服务业', abbr: '商' },
		{ name: '银行／证券／保险', abbr: '金' },
		{ name: '房地产／建筑', abbr: '房' },
		{ name: '咨询', abbr: '咨' },
		{ name: '教育／培训', abbr: '教' },
		{ name: '生产／制造／汽车', abbr: '工' },
		{ name: '学生', abbr: '学' },
		{ name: '其他', abbr: '－' },
		])
end

if StartUp.count.zero?
	StartUp.create(
		name: '光谷 Talk',
	  link: 'startups.coffee',
	  logo_url: 'http://startups.qiniudn.com/startups-coffee-logo.png',
	  desc: '光谷线下交友，活动发布平台，致力于帮助光谷人找到志同道合的朋友交流分享',
	  user_id: User.find_by_email('zilongji@gmail.com').id
	  )
end

unless StartUp.exists?(name: '程序员客栈')
	StartUp.create(
		name: '程序员客栈',
		link: 'www.programmerinn.com',
		logo_url: 'http://startups.qiniudn.com/programmerinn-logo.jpg',
		desc: '极客自由工作者社区，用互联网思维做外包，程序员私活。 为程序员服务！', 
		user_id: User.find_by_name('cho')
		)
end


if Rails.env.development?
	if StartUp.count == 1
		StartUp.create(
			name: '光谷说',
	  	link: 'startups.coffee',
	  	logo_url: 'http://startups.qiniudn.com/startups-coffee-logo.png',
	  	desc: '光谷线下交友，活动发布平台,光谷线下交友，活动发布平台,光谷线下交友，活动发布平台,光谷线下交友，活动发布平台',
	  	user_id: User.find_by_email('zilongji@gmail.com').id
			)
	end
end
#if Rails.env.development?
	#if Place.count.zero?
		#Place.create([
			#{ name: '关谷书店咖啡吧', address: '光谷西班牙步行街美特斯邦威3楼', projector: true}
			#])
	#end
#end