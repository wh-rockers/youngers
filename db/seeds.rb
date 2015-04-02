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
unless StartUp.exists?
	StartUp.create([
		{
			name: '淘OFFER',
			link: "http://www.taoffer.com",
			logo_url: "taoffer.jpg",
			desc: "武汉美投教育科技有限公司，致力于用技术打造适应互联网时代的教育产品。淘Offer网是全球首家留学服务C2C电商平台，留学服务的淘宝。",
			likes_count: 12
		},
		{
			name: '恋爱笔记',
			link: "http://portal.lianaibiji.com/",
			logo_url: "lianaibiji.png",
			desc: "武汉滴滴网络科技有限公司，是一家专注于恋爱相关产品研发的创业公司，致力于让恋爱更加美好。目前的主线产品为“恋爱笔记”，一款专注于情侣的私密社交应用，注册用户过百万。",
			likes_count: 32
		},
		{
			name: '卷皮网',
			link: "http://www.juanpi.com/",
			logo_url: "juanpiwang.jpg",
			desc: "卷皮网是一家专注网购折扣省钱的国内领先的折扣精品特卖网站。每日通过汇聚各大电商平台的丰富独家优质折扣精品，以更低的折扣优惠，严格的样品质检和活动监督，为广大的用户提供最便捷省钱的方式，购买到最实惠的商品和完整的服务。",
			likes_count: 29
		},
		{
			name: '时刻',
			link: "http://www.shike.im/",
			logo_url: "shike.png",
			desc: "武汉华中时讯科技有限责任公司，是一家专注于互联网和移动互联网相关产品研发的创业公司，致力于用创新改变世界。目前的主线产品为“时刻”，一款适合90后的新型日程表社交应用。 “时刻”最初由华中科技大学的几名大学生开发，并于2014年7月在光谷成立公司，入驻腾讯武汉创业基地。",
			likes_count: 14
		},
		{
			name: '找你玩',
			link: "http://www.zhaoniwan.cn/znw/zhaoniwan/index.html",
			logo_url: "zhaoniwan.png",
			desc: "找你玩”：一款基于“动态意向”与“地理位置”，以实现“意向”为目的的弹性社交软件。我们努力将其打造成一款真正懂您的app。",
			likes_count: 7
		},
		{
			name: '克鲁',
			link: "http://www.huiian.com/",
			logo_url: "kelu.png",
			desc: "克鲁是由武汉会眼技术有限公司于2014年7月推出的一款基于LBS的社交类软件，以用户分享，兴趣，聊天为核心功能，以平行世界为理念让新生代形成一种全新的积极友善交互模式。在克鲁的世界，你可以尝试结识不同维度的有趣的人们，人们用多种方式串联在一起，并形成一个生态圈。",
			likes_count: 19
		},
		{
			name: '时光小屋',
			link: "http://shiguangxiaowu.cn/",
			logo_url: "shiguangxiaowu.png",
			desc: "“时光小屋”由武汉时光部落网络有限公司推出，是记录宝宝成长的家庭云存储工具。时光小屋是一款风靡台湾的儿童成长日记。目前在台湾每天每10个新生儿的父母就有5个使用“时光小屋”来记录孩子的成长。其于2012年12月在海外上线，2014年2月进入大陆市场。时光小屋为每个有孩子的家庭提供一个以文字，图片，视频等形式记录孩子成长经历的空间。",
			likes_count: 23
		},
		{
			name: '约你动',
			link: " http://www.yuenidong.com/",
			logo_url: "yuenidong.png",
			desc: "武汉人人运动信息技术有限公司是一家专注于体育运动相关产品研发的移动互联网创业型公司，致力于通过移动互联网联结所有爱运动的人，让人人享受运动的乐趣！约你动是一款我们在全力以赴打造的年轻人运动交友平台。",
			likes_count: 11
		},
		{
			name: '我在',
			link: "http://www.froginfo.cn/",
			logo_url: "wozai.png",
			desc: "通过“我在”，你可以及时的关注到跟你一起在旅途中的人们，并且根据旅行需求和兴趣建立新的驴友社交关系；你可以在旅途中分享发现新的美景，并且将你独特的声音永恒的留在景点；你留下的语音将会成为你旅行的专属记忆。 产品倡导一种新的出行方式，让旅途中的人们用新的思路去享受网络社交旅行的乐趣。",
			likes_count: 8
		},
		{
			name: '女生派',
			link: "http://www.nvshengpai.com/",
			logo_url: "nvshengpai.png",
			desc: "女生派，致力于成为全国最大的女生视频社区，为爱美爱生活的女生提供展现自我的平台，至今已有260多个城市的10000多位女生在这里全方位展现过她们丰富多彩的花样年华。同时，女生派也成为网络红人、明星的重要发源地之一。",
			likes_count: 4
		},
		{
			name: '猎隼科技',
			link: "http://www.sfalcontec.com/",
			logo_url: "liesun.png",
			desc: "武汉猎隼科技有限公司，是一家专注于智能化无人飞行器研究、开发、生产、销售及服务的高科技企业，从无人机机体的设计、飞行控制系统的研发到飞行服务的培训指导，均由公司自主完成。",
			likes_count: 2
		},
		{
			name: '3DMONGI记梦馆',
			link: "http://www.cn3dsky.com/index.php",
			logo_url: "jimengguan.png",
			desc: "3DMONG记梦馆自创立以来，以帮助实现高级珍藏级梦想为追求，籍私人定制为主要特色，面向高阶人士提供高质量3D人像打印写真产品及结合贵金属镶嵌工艺的3D打印产品。",
			likes_count: 6
		},
		{
			name: '乐达互动：慢先生',
			link: "http://www.manxiansheng.net/robot/",
			logo_url: "manxiansheng.jpg",
			desc: "《慢先生》是乐达互动工作室旗下的互动绘本系列，乐达互动工作室是一支具有科技文艺范的团队(LOODA GAME Lab)成立于2009年7月，专注于从事移动互联网游戏设计、互动阅读和多媒体互动艺术研发。",
			likes_count: 4
		},
		{
			name: '宅客运动',
			link: "http://www.zhaiker.cn/",
			logo_url: "zhaikeyundong.png",
			desc: "武汉宅客网络科技有限公司旗下的“宅客运动”移动智能健康设备品牌，为用户提供简单、高效，并且可反馈的移动智能健康设备。我们专注于为全球消费者提供更健康的生活，关注消费者的生活品质。为个人用户健康管理提供全方位、立体化闭环解决方案。",
			likes_count: 1
		},
		{
			name: '一瞬',
			link: "https://itunes.apple.com/app/id923680802",
			logo_url: "yishun.png",
			desc: "一瞬为大家提供一种全新的记录生活的方式， 每天用1.2秒来记录当天最美好的一瞬， 记忆需要锚点， 1.2秒视频便可以让你回忆起这一天， 每天的一瞬会连接成一段长视频",
			likes_count: 12
		},
		{
			name: '易城生活',
			link: "http://www.ecity.la/",
			logo_url: "yichengshenghuo.png",
			desc: "依托自身已有的互联网城市信息精准搜索引擎技术，汇集同一城市、同一行业内优质诚信商家,针对同城消费者的特定需求,随时随地、方便快捷提供精准的生活和消费资讯等相关服务，创造性打造出“手机上的专业市场”，构建一个独具价值的移动电子商务大平台。",
			likes_count: 3
		},
		{
			name: '景观助手',
			link: "https://itunes.apple.com/app/id923680802",
			logo_url: "jingguanzhushou.png",
			desc: "“景观助手”App是一款服务于园林景观从业人员的工具类客户端，为用户提供了查阅设计规范和植物百科的功能，景观苗木和材料市场收录了数千家苗木商、材料商的商品信息，软件重点在于整合景观行业的人、物、信息，方便用户在手机端查找利用行业资源。",
			likes_count: 1
		},
		{
			name: '软饼干',
			link: "http://www.runbingoo.com",
			logo_url: "ruanbinggan.png",
			desc: "武汉德嘉利仁网络科技有限责任公司。 饼干游戏交友社区是一个为游戏玩家服务的SNS交友社区，是国内第一家为玩家提供找队友服务的平台，分为web端和移动端app，软饼干于2014年3月26日正式上线。软饼干的发展文化就是打造一个充满游戏氛围的大家庭，每一个玩家都能找属于自己的东西。",
			likes_count: 12
		},
		{
			name: '车来了',
			link: " http://www.chelaile.net.cn/",
			logo_url: "chelaile.jpg",
			desc: "“车来了”是由武汉元光科技有限公司开发的一款查询公交车实时位置的手机软件。不仅能提供公交车的到站距离、预计到站时间，还能显示整条线路的实时通行状况，让人们不再盲目等待，有效缓解人们候车的不安全感，同时改变用户出行方式。",
			likes_count: 27
		},
		{
			name: '外卖兔',
			link: "http://m.waimaitu.cn/home/selectarea",
			logo_url: "waimaitu.png",
			desc: "专注外卖订餐， 打造客户极致体验",
			likes_count: 6
		},
		{
			name: '玩乐族',
			link: "http://www.wanlezu.net",
			logo_url: "wanlezu.png",
			desc: "通过互联网，让用户 利用碎片化空闲时间获得一定的看广告收益。同时让商家付出更少的成本获得更好的广告效果，精准广 告投放，获得良好广告效果。",
			likes_count: 3
		},
		{
			name: '神马值得玩',
			link: "http://www.smzdwan.com/",
			logo_url: "shenma.png",
			desc: "神马值得玩是一个中立的，为玩家推荐精品游戏、提供评测、攻略等服务的手游新媒体。",
			likes_count: 1
		},
		{
			name: '几个果农',
			link: "http://www.guonong.me",
			logo_url: "jigeguonong.png",
			desc: "基于微信服务号的水果外卖系统， 未来会考虑web和app的方式",
			likes_count: 1
		},
		{
			name: '图拍',
			link: "https://itunes.apple.com/cn/app/tu-pai/id901284758?l=zh&ls=1&mt=8",
			logo_url: "tupai.png",
			desc: "-图拍是一款视觉即时聊天应用。初爱储存在眼睛里，所以才有人生只若初相见，如果我们连接了全球四十亿支手机镜头，我们就连接了四十亿双眼睛，请连接视线，开始聊天。我们是视觉聊天工具，我们是图拍！",
			likes_count: 6
		},
		{
			name: '一起玩耍',
			link: "http://www.yiqiwanshua.com/",
			logo_url: "yiqiwanshua.png",
			desc: "一起玩耍是一个以线下约玩为导向针对90后的新型LBS交友应用，可以对附近的人发起约会，约会活动包括看电影、请吃饭、K歌、户外、自定义等多种类型，以一种“反社交网络”的理念倡导大学生从社交网络走到线下，触摸最真实的线下活动。",
			likes_count: 2
		},
		{
			name: '我们行',
			link: "http://www.womenxing.com/",
			logo_url: "womenxing.png",
			desc: "远程控制您的行车记录仪，将您的智能手机都用作超级便利的遥控器，控制您的摄像机。快速调整摄像机的设置、开始/停止录制、切换模式、检查电池状态等。它尤其适合将摄像机固定在其他设备上时的拍摄，因为此时您无法够到摄像机。此外，实时预览功能",
			likes_count: 1
		}
	])
end
