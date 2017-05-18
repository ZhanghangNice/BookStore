package com.zh.process;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.util.Dbcp;

public class AddBookInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] sqlString = new String[40];
		
		sqlString[0] = "INSERT INTO `bookinfo` VALUES ('9787010060064', '大国崛起', '唐晋', '人民出版社', '56.00', '	本书对15世纪以来9个世界性大国的崛起历程作了介绍，史论结合，以史为主，力图客观准确地反映大国成功的经验和失败的教训。', '20160110121248.png', '0', 'K')";
		sqlString[1] = "INSERT INTO `bookinfo` VALUES ('9787020095193', '杜甫全集校注', '萧涤非 ', '人民文学出版社', '850.00', '(全十二册，精装珍藏版)', '20160110121349.png', '0', 'I')";
		sqlString[2] = "INSERT INTO `bookinfo` VALUES ('9787100112758', '秩序的沦陷', '[加] 卜正民 著；潘敏 译', '商务印书馆', '29.00', '著名汉学家卜正民教授剖析复杂的中国战时社会的深度好书', '20160110121515.png', '0', 'K') ";
		sqlString[3] = "INSERT INTO `bookinfo` VALUES ('9787108041531', '邓小平时代', '[美] 傅高义', '生活·读书·新知三联书店', '88.00', '今天，从某种意义上讲，我们仍然生活在邓小平时代', '20160110122021.png', '0', 'D') ";
		sqlString[4] = "INSERT INTO `bookinfo` VALUES ('9787111499503', '互联网+', '阿里研究院 ', ' 机械工业出版社', '59.00', '“互联网+”成为国家经济社会发展的重要战略', '20160110122106.png', '0', 'G') ";
		sqlString[5] = "INSERT INTO `bookinfo` VALUES ('9787121259586', '疯狂Android讲义', '李刚', '电子工业出版社', '108.00', '本书基于新的Android5', '20160110122149.png', '0', 'G') ";
		sqlString[6] = "INSERT INTO `bookinfo` VALUES ('9787121273087', '大数据的互联网思维', '段云峰，秦晓飞', '电子工业出版社', '58.00', '100多亿元买来的15年大数据产品及运营实战经验', '20160110151532.png', '0', 'G') ";
		sqlString[7] = "INSERT INTO `bookinfo` VALUES ('9787122239211', '大自然的色彩探秘', '涂华民', '化学工业出版社', '49.80', '观自然风光，探宇宙奥秘，析色彩之理，长知识阅历', '20160110145659.png', '0', 'N') ";
		sqlString[8] = "INSERT INTO `bookinfo` VALUES ('9787213066856', '星际穿越', '[美] 基普·索恩', '浙江人民出版社', '84.90', '解开黑洞、虫洞、星际旅行等一切奇景的奥妙', '20160110121830.png', '0', 'V') ";
		sqlString[9] = "INSERT INTO `bookinfo` VALUES ('9787214067821', '相对论', '[美] 阿尔伯特·爱因斯坦', ' 江苏人民出版社', '48.00', '人类首次发现的引力波轰动世界！引力波早被爱因斯坦在1915年的相对论中预言！什么是引力波？引力波有人类有什么意义？答案都在相对论中！', '20160110122319.png', '0', 'N') ";
		sqlString[10] = "INSERT INTO `bookinfo` VALUES ('9787220096600', '历史的绝笔', '叶永烈 ', '四川人民出版社', '68.00', '这是一个大宝藏，你不知道的，以及想不到的名人故事，都在这里', '20160110122418.png', '0', 'K') ";
		sqlString[11] = "INSERT INTO `bookinfo` VALUES ('9787229063962', '量子宇宙', '[英] 布莱恩·考克思', '重庆出版集团', '32.80', '只为了向读者展示人人都能够理解艰深的量子力学', '20160110121912.png', '0', 'P') ";
		sqlString[12] = "INSERT INTO `bookinfo` VALUES ('9787300215143', '毛泽东传', '[俄] 亚历山大·潘佐夫', '中国人民大学出版社', '139.00', '为我们揭示了毛泽东作为一个革命者真实的激情与权谋', '20160110122454.png', '0', 'E') ";
		sqlString[13] = "INSERT INTO `bookinfo` VALUES ('9787505135062', '普京传', '[美] 菲欧娜·希尔', '红旗出版社', '59.00', '六次当选俄罗斯年度人物，两度登顶《福布斯》杂志全球具影响力人物排行榜', '20160110122543.png', '0', 'D') ";
		sqlString[14] = "INSERT INTO `bookinfo` VALUES ('9787505736139', '我想要两颗西柚', '胡辛束 ', '中国友谊出版公司', '36.00', 'I want to see you.这是一本用来交换情绪和情感的书', '20160110122623.png', '0', 'I') ";
		sqlString[15] = "INSERT INTO `bookinfo` VALUES ('9787506341271', '苏菲的世界', '[挪威] 乔斯坦·贾德', '作家出版社', '26.00', '通过一名哲学导师向一个叫苏菲的女孩传授哲学知识的经过，揭示了西方哲学发展的历程', '20160110122701.png', '0', 'I') ";
		sqlString[16] = "INSERT INTO `bookinfo` VALUES ('9787508643298', '乔布斯传', '[美] 沃尔特·艾萨克森 ', '中信出版社', '68.00', '史蒂夫·乔布斯有如过山车般精彩的人生和炽热激越的性格成就了一个传奇，一个极具创造力的企业领袖', '20160110123714.png', '0', 'F'); ";
		sqlString[17] = "INSERT INTO `bookinfo` VALUES ('9787508647074', '中国通史', '傅乐成', '中信出版社', '78.00', '比肩钱穆《国史大纲》，台湾、香港地区以及东南亚畅销的中国通史普及类著作，重印近四十次，所有版本累计400万册，傅斯年之侄傅乐成传世史学著作。', '20160110123758.png', '0', 'K') ";
		sqlString[18] = "INSERT INTO `bookinfo` VALUES ('9787508651903', '论中国', '[美] 亨利·基辛格', '中信出版社', '68.00', '亨利·基辛格用国际视角、世界眼光，重新解读中国的过去、现在与未来，每一个曾经或正在阅读中国历史的人，每一个曾经或正在思考中国命运的人，不可错过的书！', '20160110123920.png', '0', 'D') ";
		sqlString[19] = "INSERT INTO `bookinfo` VALUES ('9787508653594', '重新定义公司：谷歌是如何运营的', '[美] 埃里克·施密特', '中信出版集团', '49.00', '谷歌掌门埃里克·施密特第一本国内引进作品，第一本官方公开认可的谷歌高层著作', '20160110125230.png', '0', 'G') ";
		sqlString[20] = "INSERT INTO `bookinfo` VALUES ('9787508656441', '只属于我的视界', '一万兄', '中信出版社', '58.00', '大量超乎想象的手机摄影美图，带你冲破手机摄影的可能性', '20160110124000.png', '0', 'J') ";
		sqlString[21] = "INSERT INTO `bookinfo` VALUES ('9787508657493', '地道风物·舌尖上的新年', '陈晓卿', '中信出版社', '49.80', '《舌尖上的中国》系列纪录片原班主创，中国国家地理原创团队制作，《舌尖上的新年》大电影同名书，陈晓卿撰文，黄磊、沈宏非、小宽联袂分享 首批赠送蔚县猴年剪纸', '20160110124029.png', '0', 'G') ";
		sqlString[22] = "INSERT INTO `bookinfo` VALUES ('9787510446627', '史记', '[西汉] 司马迁 ', '新世界出版社', '360.00', '文白对照、名家集评、全注全译、可靠的史记全本、历史学家毛佩琦题词，学者任德山作序推荐', '20160110124112.png', '0', 'K'); ";
		sqlString[23] = "INSERT INTO `bookinfo` VALUES ('9787512370524', '全球能源互联网', '刘振亚', '中国电力出版社', '96.00', '人类能源领域划时代的巨著', '20160110124154.png', '0', 'T') ";
		sqlString[24] = "INSERT INTO `bookinfo` VALUES ('9787513318020', '鸦片战争', '[英] 蓝诗玲', '新星出版社', '78.00', '深圳读书月2015年度十大好书，新锐汉学家蓝诗玲女士的扛鼎之作，一位当代英国学者眼中的中西误解与冲突，谨以此书纪念鸦片战争175周年', '20160110124222.png', '0', 'K') ";
		sqlString[25] = "INSERT INTO `bookinfo` VALUES ('9787514611946', '西洋镜：1907，北京—巴黎汽车拉力赛', '[意] 吕吉·巴津尼 ', '中国画报出版社', '58.00', '一个西方记者眼中的中国首届汽车拉力赛', '20160110124250.png', '0', 'K') ";
		sqlString[26] = "INSERT INTO `bookinfo` VALUES ('9787535481108', '白说', '白岩松', '长江文艺出版社', '39.80', '新闻人白岩松：言语中的心灵之路，与我和我们的未来有关', '20160110151737.png', '0', 'I') ";
		sqlString[27] = "INSERT INTO `bookinfo` VALUES ('9787535483133', '人生不怕从头再来', '刘晓庆', '长江文艺出版社', '39.80', '刘晓庆随机亲笔签名本！刘晓庆从“亿万富姐儿”到锒铛入狱变身“千万负婆”，直至东山再起的奋斗史', '20160110144854.png', '0', 'I') ";
		sqlString[28] = "INSERT INTO `bookinfo` VALUES ('9787535732309', '时间简史', '[英] 史蒂芬·霍金', '湖南科学技术出版社', '45.00', '全球科学著作的里程碑', '20160110140754.png', '0', 'P') ";
		sqlString[29] = "INSERT INTO `bookinfo` VALUES ('9787543095984', '人性的弱点', '戴尔·卡耐基', '武汉出版社', '32.00', '卡耐基的经典著作', '20160110145821.png', '0', 'G') ";
		sqlString[30] = "INSERT INTO `bookinfo` VALUES ('9787543096158', '当你的才华还撑不起你的梦想时', '特立独行的猫 ', '武汉出版社', '36.80', '当红作家特立独行的猫重磅新作，写给迷茫、彷徨而又年轻、充满希望、拥有无限未来的你!', '20160110124632.png', '0', 'A') ";
		sqlString[31] = "INSERT INTO `bookinfo` VALUES ('9787547711101', '鲁迅全集', '鲁迅', '同心出版社', '598.00', '蔡元培亲自作序，许广平、茅盾、郑振铎等众多名家倾情编校！1938年鲁迅先生纪念委员编印版简体本。', '20160110124710.png', '0', 'A') ";
		sqlString[32] = "INSERT INTO `bookinfo` VALUES ('9787549107124', '美国史', '[美] 乔治·布朗·廷德尔', '南方日报出版社', '188.00', '从发现新大陆、建国到崛起、繁荣的过程，揭示美国强大的发展历程', '20160110124809.png', '0', 'A') ";
		sqlString[33] = "INSERT INTO `bookinfo` VALUES ('9787550015371', '神探夏洛克', '史蒂夫·特赖布，马克·加蒂斯', '百花洲文艺出版社', '88.00', 'BBC正版授权，完美原版复刻', '20160110151628.png', '0', 'A') ";
		sqlString[34] = "INSERT INTO `bookinfo` VALUES ('9787550015432', '萤火虫小巷', '[美] 克莉丝汀·汉娜', '百花洲文艺出版社', '36.00', '一部描写友谊及人生的史诗巨作，人生是一段孤独旅程，但我遇见了你。你不是我，却又像世界上的另一个我。', '20160110145558.png', '0', 'A') ";
		sqlString[35] = "INSERT INTO `bookinfo` VALUES ('9787550015500', '我们', '辛夷坞', '百花洲文艺出版社', '49.80', '辛夷坞出道十年全新力作！爱情里美好的事，莫过于你和我成为我们。附赠“两小无猜”爱情纪念册。', '20160110124845.png', '0', 'A') ";
		sqlString[36] = "INSERT INTO `bookinfo` VALUES ('9787550226029', '大人的科学', '[日] 学研教育出版社', '北京联合出版公司', '199.00', '《大人的科学》系列中具治愈力的温柔美物，传统纸艺与现代光学令人惊叹的结合！附带日本原装模型！', '20160110150331.png', '0', 'A') ";
		sqlString[37] = "INSERT INTO `bookinfo` VALUES ('9787550248083', '那些古怪又让人忧心的问题what if', '[美] 兰道尔·门罗', '北京联合出版公司', '49.80', '前NASA成员、美国科普博客xkcd幽默问答集，再荒诞的问题都可能有一个科学答案。', '20160110124936.png', '0', 'A') ";
		sqlString[38] = "INSERT INTO `bookinfo` VALUES ('9787550263802', '梵高手稿', '[荷] 文森特·梵高', '北京联合出版公司', '88.00', '聆听梵高想要传达给世人却从未能亲口说出的话，走进伟大艺术家从未被尘世击垮的美好心灵，重塑后印象主义先驱的人生奥德赛，还原一个你熟悉却不一定了解的梵高', '20160110125009.png', '0', 'A') ";
		sqlString[39] = "INSERT INTO `bookinfo` VALUES ('9787564075859', 'BBC科普三部曲·海洋：深水探秘', '保尔·罗斯，安妮·莱金 ', '北京理工大学出版社', '60.60', '科普节目制作', '20160110121126.png', '0', 'A'); ";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			for(int i=0; i<40; i++)
			{
				pstmt = con.prepareStatement(sqlString[i], Statement.RETURN_GENERATED_KEYS);
				pstmt.executeUpdate();
			}
			response.sendRedirect("contact.jsp?return=yes");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
	}
}
