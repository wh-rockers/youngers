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