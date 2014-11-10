if StartUp.count == 0
	StartUp.create([
		{ 
			logo_url: 'http://www.encore-cav.com/home-theater/images/images2/logo_icon_large.png',
			name: '恋爱笔记',
			likes_count: 0,
			desc: '致力于解决青年人就业问题， 通过大数据帮助高中生，大学毕业生了解社会上各个职业的情况'
		},
		{ 
			logo_url: 'http://thetechnologygeek.org/wp-content/uploads/2014/02/StumbleUpon-logo-icon.png',
			name: '人人运动',
			likes_count: 0,
			desc: '致力于解决青年人就业问题， 通过大数据帮助高中生，大学毕业生了解社会上各个职业的情况'
		},
		{ 
			logo_url: 'http://fc09.deviantart.net/fs71/i/2012/066/a/c/google_play_icon___logo_by_chrisbanks2-d4s1i75.png',
			name: '优视网',
			likes_count: 0,
			desc: '致力于解决青年人就业问题， 通过大数据帮助高中生，大学毕业生了解社会上各个职业的情况'
		},
		])
end

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