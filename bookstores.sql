/*
Navicat MySQL Data Transfer

Source Server         : 119.29.98.175_3306
Source Server Version : 50626
Source Host           : 119.29.98.175:3306
Source Database       : bookstores

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-03-13 22:07:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bookclassinfo`
-- ----------------------------
DROP TABLE IF EXISTS `bookclassinfo`;
CREATE TABLE `bookclassinfo` (
  `classid` varchar(1) NOT NULL COMMENT '图书类别（主键）',
  `classname` varchar(35) NOT NULL COMMENT '类名',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookclassinfo
-- ----------------------------
INSERT INTO `bookclassinfo` VALUES ('A', '马列主义、毛泽东思想、邓小平理论');
INSERT INTO `bookclassinfo` VALUES ('B', '哲学、宗教');
INSERT INTO `bookclassinfo` VALUES ('C', '社会科学总论');
INSERT INTO `bookclassinfo` VALUES ('D', '政治、法律');
INSERT INTO `bookclassinfo` VALUES ('E', '军事');
INSERT INTO `bookclassinfo` VALUES ('F', '经济');
INSERT INTO `bookclassinfo` VALUES ('G', '文化、科学、教育、体育');
INSERT INTO `bookclassinfo` VALUES ('H', '语言文字');
INSERT INTO `bookclassinfo` VALUES ('I', '文学');
INSERT INTO `bookclassinfo` VALUES ('J', '艺术');
INSERT INTO `bookclassinfo` VALUES ('K', '历史、地理');
INSERT INTO `bookclassinfo` VALUES ('N', '自然科学总论');
INSERT INTO `bookclassinfo` VALUES ('O', '数理科学、化学');
INSERT INTO `bookclassinfo` VALUES ('P', '天文学、地球科学');
INSERT INTO `bookclassinfo` VALUES ('Q', '生物科学');
INSERT INTO `bookclassinfo` VALUES ('R', '医药、卫生');
INSERT INTO `bookclassinfo` VALUES ('S', '农业科学');
INSERT INTO `bookclassinfo` VALUES ('T', '工业技术');
INSERT INTO `bookclassinfo` VALUES ('U', '交通运输');
INSERT INTO `bookclassinfo` VALUES ('V', '航空/航天');
INSERT INTO `bookclassinfo` VALUES ('X', '环境科学、安全科学');
INSERT INTO `bookclassinfo` VALUES ('Z', '综合性图书');

-- ----------------------------
-- Table structure for `bookdetailinfo`
-- ----------------------------
DROP TABLE IF EXISTS `bookdetailinfo`;
CREATE TABLE `bookdetailinfo` (
  `bookid` varchar(15) NOT NULL COMMENT '图书编号（外键）',
  `edition` int(10) NOT NULL COMMENT '版次',
  `packaging` varchar(20) NOT NULL COMMENT '包装',
  `format` int(10) NOT NULL COMMENT '开本',
  `publdata` varchar(50) NOT NULL COMMENT '出版时间',
  `numpages` int(10) NOT NULL COMMENT '页数',
  `language` varchar(20) NOT NULL COMMENT '语言',
  `authorsIntroduce` text COMMENT '作者介绍',
  `contentIntroduce` text COMMENT '图书介绍',
  `directory` text COMMENT '目录',
  `preface` text COMMENT '前言',
  `bigImage` varchar(500) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`bookid`),
  CONSTRAINT `FK_DETAIL_BOOK` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookdetailinfo
-- ----------------------------
INSERT INTO `bookdetailinfo` VALUES ('9787010060064', '1', '平装', '16', '2007-01-01', '421', '中文简体', '  ', ' ', ' ', ' ', 'daguojueqi.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787020095193', '1', '精装', '32', '2014-01-01', '7209', '中文简体', ' ', ' ', ' ', ' ', 't015b06966b6604d764.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787100112758', '1', '平装', '32', '2015-10-01', '338', '中文简体', ' ', ' ', ' ', ' ', 'chixudelunxian.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787108041531', '1', '平装', '16', '2013-01-01', '754', '中文简体', ' ', ' ', ' ', ' ', 'dengxiaopingshidai.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787111499503', '1', '精装', '16', '2015-04-01', '285', '中文简体', ' ', ' ', ' ', ' ', 'hulianwangjia.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787121259586', '1', '平装', '16', '2015-06-01', '780', '中文简体', ' ', ' ', ' ', ' ', 'androidjiangyi.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787121273087', '1', '平装', '16', '2015-10-01', '284', '中文简体', ' ', ' ', ' ', ' ', '5625f8b1N5f5b7446.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787122239211', '1', '平装', '16', '2015-08-01', '162', '中文简体', ' ', ' ', ' ', ' ', '55c02b33N1d33d522.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787213066856', '1', '平装', '16', '2015-06-01', '404', '中文简体', ' ', ' ', ' ', ' ', '560609sdd69831a098.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787214067821', '1', '平装', '16', '2011-03-01', '296', '中文简体', ' ', ' ', ' ', ' ', '56800asrf6dsfwe611.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787220096600', '1', '平装', '16', '2016-01-01', '648', '中文简体', ' ', ' ', ' ', ' ', '5664eeb2N1fb4f0d3.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787229063962', '1', '平装', '16', '2013-06-01', '216', '中文简体', ' ', ' ', ' ', ' ', '56d3f8dbNcb9815dc.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787300215143', '1', '平装', '16', '2015-08-01', '928', '中文简体', ' ', ' ', ' ', ' ', '563ff1dfN3132d5d8.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787505135062', '1', '精装', '16', '2015-09-01', '256', '中文简体', ' ', ' ', ' ', '  ', '569de896Nde7951a3.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787505736139', '1', '平装', '16', '2016-01-01', '304', '中文简体', ' ', ' ', ' ', ' ', '56e918feN41d55751.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787506341271', '1', '平装', '16', '2007-10-01', '528', '中文简体', ' ', ' ', ' ', '  ', '5681df0bNc03f96be.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787508643298', '1', '平装', '16', '2014-03-01', '536', '中文简体', ' ', ' ', ' ', ' ', '569sdatew32sdtftwes.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787508647074', '1', '平装', '16', '2014-10-01', '688', '中文简体', ' ', ' ', ' ', ' ', '5423f489N6ec65c16.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787508651903', '1', '精装', '32', '2015-07-01', '618', '中文简体', ' ', ' ', ' ', ' ', '562ASCEeAADIiK4561.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787508653594', '1', '精装', '32', '2015-09-01', '307', '中文简体', ' ', ' ', ' ', ' ', '55d3d674N4efb3b8a.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787508656441', '1', '平装', '16', '2016-01-01', '288', '中文简体', ' ', ' ', ' ', ' ', '565d0e9eN1876bbd7.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787508657493', '1', '平装', '16', '2016-01-01', '320', '中文简体', ' ', ' ', ' ', ' ', '5678dbceN467ebacd.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787510446627', '1', '精装', '16', '2014-03-01', '1556', '中文简体', ' ', ' ', ' ', ' ', '5603rBEhU1NVwAM7.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787512370524', '1', '平装', '16', '2015-02-01', '385', '中文简体', ' ', ' ', ' ', ' ', '560b34d6Na862a09c.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787513318020', '1', '精装', '16', '2015-07-01', '532', '中文简体', ' ', ' ', ' ', ' ', '569c738aN5cb3c711.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787514611946', '1', '平装', '16', '2015-10-01', '200', '中文简体', ' ', ' ', ' ', ' ', '563b4c4eNe10970d6.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787535481108', '1', '平装', '16', '2015-09-01', '280', '中文简体', ' ', ' ', ' ', ' ', '55efa840Na5b5a5f0.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787535483133', '1', '平装', '16', '2015-11-01', '260', '中文简体', ' ', ' ', ' ', ' ', '565fae7dN0ffa34a5.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787535732309', '1', '平装', '16', '2012-01-01', '243', '中文简体', ' ', ' ', ' ', ' ', '5673c32dNe3c9c23c.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787543095984', '1', '平装', '16', '2015-11-01', '256', '中文简体', ' ', ' ', ' ', ' ', '5636fc80N869ba869.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787543096158', '1', '平装', '32', '2016-01-01', '272', '中文简体', ' ', ' ', ' ', ' ', '565d0786Nd0bcfb5e.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787547711101', '1', '平装', '16', '2014-01-01', '7400', '中文简体', ' ', ' ', ' ', ' ', '1385370967887fkzpi.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787549107124', '1', '平装', '16', '2012-01-01', '216', '中文简体', ' ', ' ', ' ', ' ', '534debb664c7f.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787550015371', '1', '精装', '16', '2016-01-01', '531', '中文简体', ' ', ' ', ' ', ' ', '5684df41Nf4bca89a.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787550015432', '1', '平装', '16', '2015-11-01', '364', '中文简体', ' ', ' ', ' ', ' ', '56553658N9c654dcc.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787550015500', '1', '平装', '32', '2016-01-01', '568', '中文简体', ' ', ' ', ' ', ' ', '566131e9N0526fb1e.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787550226029', '1', '盒装', '16', '2014-04-01', '96', '中文简体', ' ', ' ', ' ', ' ', '5540a92bNa22d6b8b.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787550248083', '1', '平装', '16', '2015-05-01', '304', '中文简体', ' ', ' ', ' ', ' ', '555e96e0Nbae014db.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787550263802', '1', '平装', '32', '2015-12-01', '416', '中文简体', ' ', ' ', ' ', ' ', '5670d5c7Nfee121a2.jpg');
INSERT INTO `bookdetailinfo` VALUES ('9787564075859', '1', '精装', '16', '2013-09-01', '230', '中文简体', ' ', ' ', ' ', ' ', '56668956N968c59cc.jpg');

-- ----------------------------
-- Table structure for `bookinfo`
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `bookid` varchar(15) NOT NULL COMMENT '图书编号',
  `bookname` varchar(100) NOT NULL COMMENT '书名',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `publisher` varchar(100) NOT NULL COMMENT '出版社',
  `unitprice` decimal(8,2) NOT NULL COMMENT '售价',
  `summary` text COMMENT '简介',
  `bookimage` varchar(500) NOT NULL COMMENT '图片',
  `buynum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售量',
  `classid` varchar(10) NOT NULL DEFAULT 'A' COMMENT '图书类别（外键）',
  PRIMARY KEY (`bookid`),
  KEY `classid_book` (`classid`),
  CONSTRAINT `classid_book` FOREIGN KEY (`classid`) REFERENCES `bookclassinfo` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('9787010060064', '大国崛起', '唐晋', '人民出版社', '25.00', '	本书对15世纪以来9个世界性大国的崛起历程作了介绍，史论结合，以史为主，力图客观准确地反映大国成功的经验和失败的教训。', '20160110121248.png', '6', 'K');
INSERT INTO `bookinfo` VALUES ('9787020095193', '杜甫全集校注', '萧涤非', '人民文学出版社', '850.00', '(全十二册，精装珍藏版)', '20160110121349.png', '0', 'I');
INSERT INTO `bookinfo` VALUES ('9787100112758', '秩序的沦陷', '[加] 卜正民 著；潘敏 译', '商务印书馆', '29.00', '著名汉学家卜正民教授剖析复杂的中国战时社会的深度好书', '20160110121515.png', '0', 'K');
INSERT INTO `bookinfo` VALUES ('9787108041531', '邓小平时代', '[美] 傅高义', '生活·读书·新知三联书店', '88.00', '今天，从某种意义上讲，我们仍然生活在邓小平时代', '20160110122021.png', '0', 'D');
INSERT INTO `bookinfo` VALUES ('9787111499503', '互联网+', '阿里研究院 ', ' 机械工业出版社', '59.00', '“互联网+”成为国家经济社会发展的重要战略', '20160110122106.png', '0', 'G');
INSERT INTO `bookinfo` VALUES ('9787121259586', '疯狂Android讲义', '李刚', '电子工业出版社', '108.00', '本书基于新的Android5', '20160110122149.png', '0', 'G');
INSERT INTO `bookinfo` VALUES ('9787121273087', '大数据的互联网思维', '段云峰，秦晓飞', '电子工业出版社', '58.00', '100多亿元买来的15年大数据产品及运营实战经验', '20160110151532.png', '0', 'G');
INSERT INTO `bookinfo` VALUES ('9787122239211', '大自然的色彩探秘', '涂华民', '化学工业出版社', '49.80', '观自然风光，探宇宙奥秘，析色彩之理，长知识阅历', '20160110145659.png', '0', 'N');
INSERT INTO `bookinfo` VALUES ('9787213066856', '星际穿越', '[美] 基普·索恩', '浙江人民出版社', '84.90', '解开黑洞、虫洞、星际旅行等一切奇景的奥妙', '20160110121830.png', '0', 'V');
INSERT INTO `bookinfo` VALUES ('9787214067821', '相对论', '[美] 阿尔伯特·爱因斯坦', ' 江苏人民出版社', '48.00', '人类首次发现的引力波轰动世界！引力波早被爱因斯坦在1915年的相对论中预言！什么是引力波？引力波有人类有什么意义？答案都在相对论中！', '20160110122319.png', '0', 'N');
INSERT INTO `bookinfo` VALUES ('9787220096600', '历史的绝笔', '叶永烈 ', '四川人民出版社', '68.00', '这是一个大宝藏，你不知道的，以及想不到的名人故事，都在这里', '20160110122418.png', '0', 'K');
INSERT INTO `bookinfo` VALUES ('9787229063962', '量子宇宙', '布莱恩', '重庆出版社', '32.80', '', '20160110121912.png', '0', 'P');
INSERT INTO `bookinfo` VALUES ('9787300215143', '毛泽东传', '[俄] 亚历山大·潘佐夫', '中国人民大学出版社', '139.00', '为我们揭示了毛泽东作为一个革命者真实的激情与权谋', '20160110122454.png', '0', 'E');
INSERT INTO `bookinfo` VALUES ('9787505135062', '普京传', '[美] 菲欧娜·希尔', '红旗出版社', '59.00', '六次当选俄罗斯年度人物，两度登顶《福布斯》杂志全球具影响力人物排行榜', '20160110122543.png', '0', 'D');
INSERT INTO `bookinfo` VALUES ('9787505736139', '我想要两颗西柚', '胡辛束 ', '中国友谊出版公司', '36.00', 'I want to see you.这是一本用来交换情绪和情感的书', '20160110122623.png', '0', 'I');
INSERT INTO `bookinfo` VALUES ('9787506341271', '苏菲的世界', '[挪威] 乔斯坦·贾德', '作家出版社', '26.00', '通过一名哲学导师向一个叫苏菲的女孩传授哲学知识的经过，揭示了西方哲学发展的历程', '20160110122701.png', '0', 'I');
INSERT INTO `bookinfo` VALUES ('9787508643298', '乔布斯传', '[美] 沃尔特·艾萨克森 ', '中信出版社', '68.00', '史蒂夫·乔布斯有如过山车般精彩的人生和炽热激越的性格成就了一个传奇，一个极具创造力的企业领袖', '20160110123714.png', '0', 'F');
INSERT INTO `bookinfo` VALUES ('9787508647074', '中国通史', '傅乐成', '中信出版社', '78.00', '比肩钱穆《国史大纲》，台湾、香港地区以及东南亚畅销的中国通史普及类著作，重印近四十次，所有版本累计400万册，傅斯年之侄傅乐成传世史学著作。', '20160110123758.png', '0', 'K');
INSERT INTO `bookinfo` VALUES ('9787508651903', '论中国', '[美] 亨利·基辛格', '中信出版社', '68.00', '亨利·基辛格用国际视角、世界眼光，重新解读中国的过去、现在与未来，每一个曾经或正在阅读中国历史的人，每一个曾经或正在思考中国命运的人，不可错过的书！', '20160110123920.png', '0', 'D');
INSERT INTO `bookinfo` VALUES ('9787508653594', '重新定义公司：谷歌是如何运营的', '[美] 埃里克·施密特', '中信出版集团', '49.00', '谷歌掌门埃里克·施密特第一本国内引进作品，第一本官方公开认可的谷歌高层著作', '20160110125230.png', '0', 'G');
INSERT INTO `bookinfo` VALUES ('9787508656441', '只属于我的视界', '一万兄', '中信出版社', '58.00', '大量超乎想象的手机摄影美图，带你冲破手机摄影的可能性', '20160110124000.png', '0', 'J');
INSERT INTO `bookinfo` VALUES ('9787508657493', '地道风物·舌尖上的新年', '陈晓卿', '中信出版社', '49.80', '《舌尖上的中国》系列纪录片原班主创，中国国家地理原创团队制作，《舌尖上的新年》大电影同名书，陈晓卿撰文，黄磊、沈宏非、小宽联袂分享 首批赠送蔚县猴年剪纸', '20160110124029.png', '0', 'G');
INSERT INTO `bookinfo` VALUES ('9787510446627', '史记', '[西汉] 司马迁 ', '新世界出版社', '360.00', '文白对照、名家集评、全注全译、可靠的史记全本、历史学家毛佩琦题词，学者任德山作序推荐', '20160110124112.png', '0', 'K');
INSERT INTO `bookinfo` VALUES ('9787512370524', '全球能源互联网', '刘振亚', '中国电力出版社', '96.00', '人类能源领域划时代的巨著', '20160110124154.png', '0', 'T');
INSERT INTO `bookinfo` VALUES ('9787513318020', '鸦片战争', '[英] 蓝诗玲', '新星出版社', '78.00', '深圳读书月2015年度十大好书，新锐汉学家蓝诗玲女士的扛鼎之作，一位当代英国学者眼中的中西误解与冲突，谨以此书纪念鸦片战争175周年', '20160110124222.png', '0', 'K');
INSERT INTO `bookinfo` VALUES ('9787514611946', '西洋镜：1907，北京—巴黎汽车拉力赛', '[意] 吕吉·巴津尼 ', '中国画报出版社', '58.00', '一个西方记者眼中的中国首届汽车拉力赛', '20160110124250.png', '0', 'K');
INSERT INTO `bookinfo` VALUES ('9787535481108', '白说', '白岩松', '长江文艺出版社', '39.80', '新闻人白岩松：言语中的心灵之路，与我和我们的未来有关', '20160110151737.png', '0', 'I');
INSERT INTO `bookinfo` VALUES ('9787535483133', '人生不怕从头再来', '刘晓庆', '长江文艺出版社', '39.80', '刘晓庆随机亲笔签名本！刘晓庆从“亿万富姐儿”到锒铛入狱变身“千万负婆”，直至东山再起的奋斗史', '20160110144854.png', '0', 'I');
INSERT INTO `bookinfo` VALUES ('9787535732309', '时间简史', '[英] 史蒂芬·霍金', '湖南科学技术出版社', '45.00', '全球科学著作的里程碑', '20160110140754.png', '0', 'P');
INSERT INTO `bookinfo` VALUES ('9787543095984', '人性的弱点', '戴尔·卡耐基', '武汉出版社', '32.00', '卡耐基的经典著作', '20160110145821.png', '0', 'G');
INSERT INTO `bookinfo` VALUES ('9787543096158', '当你的才华还撑不起你的梦想时', '特立独行的猫 ', '武汉出版社', '36.80', '当红作家特立独行的猫重磅新作，写给迷茫、彷徨而又年轻、充满希望、拥有无限未来的你!', '20160110124632.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787547711101', '鲁迅全集', '鲁迅', '同心出版社', '598.00', '蔡元培亲自作序，许广平、茅盾、郑振铎等众多名家倾情编校！1938年鲁迅先生纪念委员编印版简体本。', '20160110124710.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787549107124', '美国史', '[美] 乔治·布朗·廷德尔', '南方日报出版社', '188.00', '从发现新大陆、建国到崛起、繁荣的过程，揭示美国强大的发展历程', '20160110124809.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787550015371', '神探夏洛克', '史蒂夫·特赖布，马克·加蒂斯', '百花洲文艺出版社', '88.00', 'BBC正版授权，完美原版复刻', '20160110151628.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787550015432', '萤火虫小巷', '[美] 克莉丝汀·汉娜', '百花洲文艺出版社', '36.00', '一部描写友谊及人生的史诗巨作，人生是一段孤独旅程，但我遇见了你。你不是我，却又像世界上的另一个我。', '20160110145558.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787550015500', '我们', '辛夷坞', '百花洲文艺出版社', '49.80', '辛夷坞出道十年全新力作！爱情里美好的事，莫过于你和我成为我们。附赠“两小无猜”爱情纪念册。', '20160110124845.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787550226029', '大人的科学', '[日] 学研教育出版社', '北京联合出版公司', '199.00', '《大人的科学》系列中具治愈力的温柔美物，传统纸艺与现代光学令人惊叹的结合！附带日本原装模型！', '20160110150331.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787550248083', '那些古怪又让人忧心的问题what if', '[美] 兰道尔·门罗', '北京联合出版公司', '49.80', '前NASA成员、美国科普博客xkcd幽默问答集，再荒诞的问题都可能有一个科学答案。', '20160110124936.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787550263802', '梵高手稿', '[荷] 文森特·梵高', '北京联合出版公司', '88.00', '聆听梵高想要传达给世人却从未能亲口说出的话，走进伟大艺术家从未被尘世击垮的美好心灵，重塑后印象主义先驱的人生奥德赛，还原一个你熟悉却不一定了解的梵高', '20160110125009.png', '0', 'A');
INSERT INTO `bookinfo` VALUES ('9787564075859', 'BBC科普三部曲·海洋：深水探秘', '保尔·罗斯，安妮·莱金 ', '北京理工大学出版社', '60.60', '科普节目制作', '20160110121126.png', '0', 'A');

-- ----------------------------
-- Table structure for `ebookinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ebookinfo`;
CREATE TABLE `ebookinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ebookname` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL COMMENT '作者',
  `unitprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `summary` text COMMENT '简介',
  `ebooktxt` varchar(110) DEFAULT NULL COMMENT '电子书文本',
  `ebookimage` varchar(110) NOT NULL COMMENT '电子书图片',
  `eclassid` varchar(10) NOT NULL COMMENT '电子书类型',
  `downloads` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载量',
  `link` varchar(110) DEFAULT NULL,
  `reading` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_EBOOK_BOOKCLASS` (`eclassid`),
  CONSTRAINT `FK_EBOOK_BOOKCLASS` FOREIGN KEY (`eclassid`) REFERENCES `bookclassinfo` (`classid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebookinfo
-- ----------------------------
INSERT INTO `ebookinfo` VALUES ('3', '重新定义公司：谷歌是如何运营的', '埃里克·施密特', '17.15', '科技正在改变商业的方方面面，这种改变速度空前，而且仍在加速，公司若想在互联网时代站稳脚跟，就要制定新的商业规则。', '', '730e0cf3d7ca7bcb3d85f776b8096b63f724a8e8.jpg', 'F', '0', 'http://yuedu.baidu.com/ebook/bd4814b6bcd126fff6050b5e', '0');
INSERT INTO `ebookinfo` VALUES ('4', '白鹿原上', '陈忠实', '3.99', '《白鹿原上》是陈忠实散文精选集，收入《原下的日子》、《告别白鸽》、《拥有一方绿荫》等作品三十三篇，讲述了白鹿原乃至关中地区的独特风貌，洋溢着浓厚的乡土气息和人文情怀，令读者身临其境，心领神会。', '', '63d9f2d3572c11df02ccf047602762d0f703c2b1.jpg', 'I', '0', 'http://yuedu.baidu.com/ebook/d7a975a08bd63186bcebbcd7', '0');
INSERT INTO `ebookinfo` VALUES ('5', '语文一生：《我为什么这样活》', '李国文', '12.00', '全书讲述了人在一生中不同阶段的心境变化：从荣耀到孤独，从狂妄自满到日趋成熟，从针锋相对到宽容豁达，人生就是一场修行。其间，穿插着大量历史人物的评点，也夹有作者真实的生活经历及处世之道。', '', 'f11f3a292df5e0fe3fdc57b45b6034a85fdf72bb.jpg', 'I', '0', 'http://yuedu.baidu.com/ebook/a1fac716f705cc1754270911', '0');
INSERT INTO `ebookinfo` VALUES ('6', '后来我们都哭了II·废墟', '夏七夕', '8.40', '三年后，林洛施又回到了这座让她爱恨交织的城市。她回到概念上班，每天和蒋言斗嘴，偶尔写写稿子，看似又变成了以前那个林洛施。但只有自己知道，生命中最美好宝贵的那部分早已碎裂。', '', 'a044ad345982b2b79c34118e37adcbef77099bd4.jpg', 'I', '0', 'http://yuedu.baidu.com/ebook/1ffdd3b4aaea998fcc220eb2', '0');
INSERT INTO `ebookinfo` VALUES ('7', '智齿', '郑渊洁', '9.90', '智齿》是郑渊洁特别得意的长篇小说作品，这一次他不是大家所熟知的“童话大王”，而是郑渊洁。《智齿》讲述了荒诞畅销书作家梁功辰，一直以来深受读者欢迎。', '', 'dbb44aed2e738bd4f3094da4a68b87d6277ff97f.jpg', 'I', '0', 'http://yuedu.baidu.com/ebook/07438d28b8f67c1cfbd6b86c', '0');
INSERT INTO `ebookinfo` VALUES ('8', '商业的本质', '[美]杰克·韦尔奇;苏茜·韦尔奇', '29.40', '本书是杰克·韦尔奇对过去十几年商业变革的反思和总结。他指出，科技革命给市场带来了巨大变化和诸多杂音，但作为管理者，不能迷失商业中最核心的东西。在当今的新商业环境下，要想“赢”，就必须遵从商业的规则，回归商业的本质。', '', '3bf33a87e950352a7246b4bd5443fbf2b2118b64.jpg', 'F', '0', 'http://yuedu.baidu.com/ebook/3f26cbca2f60ddccdb38a064', '0');
INSERT INTO `ebookinfo` VALUES ('9', '领导力21法则', '[美]约翰C.麦克斯维尔', '26.99', '《领导力21法则》是全球第一领导力大师——麦克斯维尔博士40年研究的集大成之作。他以21条清晰的法则，彻底讲透了提升领导力的方方面面，将抽象的领导力概念以具象的方式呈现', '', '9e3df8dcd100baa1ef00e9e54010b912c8fc2ebb.jpg', 'F', '0', 'http://yuedu.baidu.com/ebook/19de5bfd59eef8c75ebfb39a', '0');
INSERT INTO `ebookinfo` VALUES ('10', '不必知道我爱你', '阮小凉', '5.00', '苏航是她用整个青春去攻占的城池，他同样以冷漠的态度告诉她，不改变就灭亡。十年暗恋，八年单恋，所有反复叠加说不出口的爱恋，最终成了一句不太好笑的笑言。她不想死在苏航手里，所以她开始改变。', '', 'dcc451da81cb39db1ec779ccd7160924ab183020.jpg', 'I', '0', 'http://yuedu.baidu.com/ebook/1796b2d5866fb84ae55c8da0', '0');
INSERT INTO `ebookinfo` VALUES ('11', '中国人应知的文化常识', '辛伟伟', '0.00', '《中国人应知的文化常识》内容广泛，涵盖文学艺术、科举教育、官政典制、科技发明、风俗礼仪、衣食起居、节日节气、天文历法、宗教哲学、体育娱乐、医疗保健、建筑园林、考古文物、自然生物、地理景观、历史军事、政治经济等文化的各个层面，既是一本知识储备辞典，又是一本生活之余的休闲书。', '', 'fc1f4134970a304ee7d567f0d3c8a786c8175cc1.jpg', 'G', '0', 'http://yuedu.baidu.com/ebook/540ef20410661ed9ad51f356', '0');
INSERT INTO `ebookinfo` VALUES ('12', '在难搞的日子笑出声来', '大鹏', '2.00', '大鹏全面讲述奋斗与成长，命运转折的关键时刻，无一不记录在此。', '', 'e61190ef76c6a7ef6a397ba1fffaaf51f3de661e.jpg', 'I', '0', 'http://yuedu.baidu.com/ebook/c95e10c06529647d272852a5', '0');
INSERT INTO `ebookinfo` VALUES ('13', '微表情心理学', '金圣荣', '17.39', '其实在日常生活中这种能力也能帮助我们。如果我们错误的理解“微表情”的含义我们会对交流对象形成错误的判断。这增加了人们之间的隔阂而不是互信。', '', 'b58f8c5494eef01f08bc4c42e2fe9925bd317d88.jpg', 'G', '0', 'http://yuedu.baidu.com/ebook/f73a7e9b26fff705cc170a67', '0');
INSERT INTO `ebookinfo` VALUES ('14', '机器学习实战', 'Peter', '40.00', '机器学习是人工智能研究领域中的一个极其重要的方向。', '', 'd058ccbf6c81800a0f223301b73533fa838b47fd.jpg', 'G', '0', 'http://yuedu.baidu.com/ebook/53bb514ceff9aef8941e06d3', '0');
INSERT INTO `ebookinfo` VALUES ('15', '向死而生：我修的死亡学分', '李开复', '25.20', '李开复2014年罹患淋巴癌，治疗期间，他对生命有了新的理解和体悟。这本新书就是患病后感悟的结集，情真意切，字字珠玑，是送给亿万青年的更高境界的人生箴言，更是给已经成功人士的劝世贤言', '', '5654339cN3fc3e09f.jpg', 'F', '0', 'http://e.jd.com/30207410.html', '0');
INSERT INTO `ebookinfo` VALUES ('16', '黑客攻防从入门到精通', '恒盛杰资讯', '12.00', '黑客攻防前的准备工作、扫描与嗅探攻防、Windows系统漏洞攻防、密码攻防、病毒攻防...', '', '55a61719N96602633.jpg', 'G', '0', 'http://e.jd.com/30189367.html', '0');
INSERT INTO `ebookinfo` VALUES ('17', 'JavaWeb编程宝典', '王国辉', '2.00', '', '', 'rBEhWVH3kDUIAAAAAADeaS1zYg0AABi0wFjZ54AAN6B594.jpg', 'G', '0', 'http://e.jd.com/30143007.html', '0');
INSERT INTO `ebookinfo` VALUES ('18', '十万个为什么', '（苏）米·伊林', '2.99', '', '', 'rBEGC1DYJbUIAAAAAAD6G9R2Cu0AABGMgAWMacAAPoz951.jpg', 'Z', '0', 'http://e.jd.com/30100606.html', '0');
INSERT INTO `ebookinfo` VALUES ('19', '中华上下五千年', '谭树辉', '3.00', '', '', 'rBEHZlCBImUIAAAAAAEkwLiL71YAAB4kAIb4LwAASTY843.jpg', 'K', '0', 'http://e.jd.com/30057927.html', '0');
INSERT INTO `ebookinfo` VALUES ('20', '孙子兵法', '孙武', '0.99', '', '', 'rBEGE1AkfgcIAAAAAACZ0dm4xugAABWrQOB0ZIAAJnp346.jpg', 'E', '0', 'http://e.jd.com/30108739.html', '0');
INSERT INTO `ebookinfo` VALUES ('21', '比尔·盖茨：从电脑神通到世界首富', '张学文', '3.99', '', '', '54e187afN378ec07f.jpg', 'F', '0', 'http://e.jd.com/30175455.html', '0');
INSERT INTO `ebookinfo` VALUES ('22', '洛克菲勒自传', '（美）洛克菲勒', '3.99', '', '', 'rBEDik_i4WcIAAAAAAA1ol2YyCUAAB8ZQEWBeMAADW6611.jpg', 'H', '0', 'http://e.jd.com/30099382.html', '0');
INSERT INTO `ebookinfo` VALUES ('23', '朴槿惠全传：生来注定不平凡', '宋嘉军', '7.99', '', '', '557ff644N1be857a3.jpg', 'D', '0', 'http://e.jd.com/30188101.html', '0');
INSERT INTO `ebookinfo` VALUES ('24', '老子：道德经', '老子', '0.50', '', '', '4231666c-d90a-42a0-99f4-c237c5eab9b4.jpg', 'K', '0', 'http://e.jd.com/30049573.html', '0');
INSERT INTO `ebookinfo` VALUES ('25', '黄帝内经大全集', '黄帝、岐伯', '4.99', '', '', '56b31b01Nb60d5314.jpg', 'R', '0', 'http://e.jd.com/30150395.html', '0');
INSERT INTO `ebookinfo` VALUES ('26', '走遍中国', '《图说天下·国家地理系列》编委会', '1.89', '', '', '9ad60a72-df1a-487f-b140-801cda05690c.jpg', 'N', '0', 'http://e.jd.com/30009960.html', '0');
INSERT INTO `ebookinfo` VALUES ('34', '人性的弱点', '卡耐基', '0.00', '', '人性的弱点.rar', 'rBEhVVMRDT4IAAAAAABuoua4L9wAAJXpAKn9FQAAG66007.jpg', 'G', '0', '', '0');
INSERT INTO `ebookinfo` VALUES ('35', '摩根财团', '未知', '0.00', '', '摩根财团.rar', '14120Q44330N3.jpg', 'G', '0', '', '0');
INSERT INTO `ebookinfo` VALUES ('36', '李鸿章传', '梁启超', '0.00', '', '李鸿章传.rar', '8b13632762d0f703ed590d380cfa513d2797c56f.jpg', 'G', '0', '', '0');
INSERT INTO `ebookinfo` VALUES ('37', '盗墓笔记', '南派三叔', '0.00', '', '盗墓笔记.rar', '20120906183735.jpg', 'I', '0', '', '0');
INSERT INTO `ebookinfo` VALUES ('38', '张爱玲作品集', '张爱玲', '0.00', '', '张爱玲作品集.rar', '2933773640452059369&fm.jpg', 'I', '0', '', '0');

-- ----------------------------
-- Table structure for `favoriteinfo`
-- ----------------------------
DROP TABLE IF EXISTS `favoriteinfo`;
CREATE TABLE `favoriteinfo` (
  `favoriteid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `userid` int(10) NOT NULL COMMENT '用户编号（外键）',
  `bookid` varchar(15) NOT NULL COMMENT '图书编号（外键）',
  PRIMARY KEY (`favoriteid`),
  KEY `favorite_bookid` (`bookid`),
  KEY `favorite_userid` (`userid`),
  CONSTRAINT `favorite_bookid` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_userid` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favoriteinfo
-- ----------------------------
INSERT INTO `favoriteinfo` VALUES ('10', '8', '9787020095193');
INSERT INTO `favoriteinfo` VALUES ('11', '8', '9787100112758');
INSERT INTO `favoriteinfo` VALUES ('12', '8', '9787111499503');
INSERT INTO `favoriteinfo` VALUES ('13', '6', '9787100112758');

-- ----------------------------
-- Table structure for `feedbackinfo`
-- ----------------------------
DROP TABLE IF EXISTS `feedbackinfo`;
CREATE TABLE `feedbackinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '意见编号（主键）',
  `type` varchar(5) NOT NULL COMMENT '类型',
  `link` varchar(200) NOT NULL COMMENT '连接',
  `content` text NOT NULL COMMENT '内容',
  `phone` varchar(50) NOT NULL COMMENT '联系电话',
  `img` varchar(100) NOT NULL COMMENT '图片',
  `time` varchar(20) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedbackinfo
-- ----------------------------
INSERT INTO `feedbackinfo` VALUES ('1', '数据', 'http://zhxiaoming.cn/feedback.jsp', '网站还需改进，加油', '13971597910', 'welcome03.jpg', '2016-06-05 23:13:35');

-- ----------------------------
-- Table structure for `messageinfo`
-- ----------------------------
DROP TABLE IF EXISTS `messageinfo`;
CREATE TABLE `messageinfo` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mdate` varchar(64) COLLATE utf8_bin NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `bookid` varchar(15) CHARACTER SET utf8 NOT NULL,
  `userid` int(10) NOT NULL DEFAULT '0',
  `ismessage` tinyint(4) NOT NULL,
  `thumbnum` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `FK_MESSGAE` (`bookid`),
  KEY `FK_MESSAGE_USER` (`userid`) USING BTREE,
  CONSTRAINT `FK_MESSAGE_USER` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MESSGAE` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of messageinfo
-- ----------------------------
INSERT INTO `messageinfo` VALUES ('5', '2016/05/05 18:19:27', '		不错不错！！！！！！', '9787121273087', '6', '1', '1');
INSERT INTO `messageinfo` VALUES ('6', '2016/05/05 19:35:50', '		这本书确实挺不错的！！！！！！！！！！！1', '9787010060064', '6', '1', '1');

-- ----------------------------
-- Table structure for `orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(20) NOT NULL COMMENT '订单号（主键）',
  `userid` int(10) NOT NULL COMMENT '用户编号（外键）',
  `bookid` varchar(15) NOT NULL COMMENT '图书编号（外键）',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '购买图书数量',
  `ordertime` varchar(100) NOT NULL COMMENT '下单时间',
  `receiver` varchar(100) NOT NULL COMMENT '收货人',
  `address` varchar(500) NOT NULL COMMENT '送货地址',
  `courier` varchar(100) NOT NULL DEFAULT '熊猫一号配送员' COMMENT '送货人',
  `contact` varchar(11) NOT NULL COMMENT '联系电话',
  `orderremark` text COMMENT '订单备注',
  `pay` varchar(10) NOT NULL DEFAULT '银行卡支付' COMMENT '支付方式',
  PRIMARY KEY (`id`),
  KEY `order_bookid` (`bookid`),
  KEY `order_userid` (`userid`),
  CONSTRAINT `order_bookid` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_userid` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('28', '45805193510', '6', '9787121259586', '2', '2016-05-05 19:35:10', '张三', '湖北省武汉市', '熊猫一号配送员', '13971597910', '', '支付宝支付');
INSERT INTO `orderinfo` VALUES ('29', '45805193510', '6', '9787512370524', '2', '2016-05-05 19:35:10', '张三', '湖北省武汉市', '熊猫一号配送员', '13971597910', '', '支付宝支付');
INSERT INTO `orderinfo` VALUES ('30', '95720111619', '6', '9787111499503', '1', '2016-05-20 11:16:19', '月亮', '月亮', '熊猫一号配送员', '13107311234', '', '支付宝支付');
INSERT INTO `orderinfo` VALUES ('31', '34923103600', '6', '9787010060064', '8', '2016-08-23 10:36:00', '张杭', '武汉', '熊猫一号配送员', '13900000000', '', '支付宝支付');
INSERT INTO `orderinfo` VALUES ('32', '34923103600', '6', '9787550015432', '2', '2016-08-23 10:36:00', '张杭', '武汉', '熊猫一号配送员', '13900000000', '', '支付宝支付');
INSERT INTO `orderinfo` VALUES ('33', '34923103600', '6', '9787111499503', '1', '2016-08-23 10:36:00', '张杭', '武汉', '熊猫一号配送员', '13900000000', '', '支付宝支付');

-- ----------------------------
-- Table structure for `shopcarinfo`
-- ----------------------------
DROP TABLE IF EXISTS `shopcarinfo`;
CREATE TABLE `shopcarinfo` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车id（主键）',
  `userid` int(10) NOT NULL COMMENT '用户id（外键）',
  `bookid` varchar(15) NOT NULL COMMENT '图书编号（外键）',
  `quantity` int(10) NOT NULL DEFAULT '1' COMMENT '对应图书在购物车内的数量',
  PRIMARY KEY (`cart_id`),
  KEY `FK_SHOPCAR_USER` (`userid`),
  KEY `FK_SHOPCAR_BOOK` (`bookid`),
  CONSTRAINT `FK_SHOPCAR_BOOK` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SHOPCAR_USER` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcarinfo
-- ----------------------------
INSERT INTO `shopcarinfo` VALUES ('63', '8', '9787535732309', '2');
INSERT INTO `shopcarinfo` VALUES ('64', '8', '9787122239211', '1');
INSERT INTO `shopcarinfo` VALUES ('65', '8', '9787505135062', '1');
INSERT INTO `shopcarinfo` VALUES ('68', '12', '9787550015432', '1');
INSERT INTO `shopcarinfo` VALUES ('69', '11', '9787100112758', '3');
INSERT INTO `shopcarinfo` VALUES ('70', '13', '9787100112758', '1');
INSERT INTO `shopcarinfo` VALUES ('71', '14', '9787010060064', '1');
INSERT INTO `shopcarinfo` VALUES ('72', '15', '9787100112758', '1');
INSERT INTO `shopcarinfo` VALUES ('73', '18', '9787300215143', '1');

-- ----------------------------
-- Table structure for `stockinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stockinfo`;
CREATE TABLE `stockinfo` (
  `stockid` varchar(20) NOT NULL COMMENT '进货单号',
  `userid` int(10) NOT NULL COMMENT '用户id（外键）',
  `bookid` varchar(15) NOT NULL COMMENT '图书编号（外键）',
  `stockprice` decimal(8,2) NOT NULL COMMENT '图书进价',
  `stockquantity` int(10) NOT NULL COMMENT '进货数量',
  `stockdate` varchar(100) NOT NULL COMMENT '进货时间',
  `stockremark` text COMMENT '备注',
  PRIMARY KEY (`stockid`),
  KEY `userid_stock` (`userid`),
  KEY `bookid_stock` (`bookid`),
  CONSTRAINT `bookid_stock` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid_stock` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `thumb`
-- ----------------------------
DROP TABLE IF EXISTS `thumb`;
CREATE TABLE `thumb` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bookid` varchar(15) NOT NULL,
  `userid` int(10) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_THUMB_MESSAGE` (`mid`),
  KEY `FK_THUMB_BOOK` (`bookid`),
  KEY `FK_THUMB_UESR` (`userid`),
  CONSTRAINT `FK_THUMB_BOOK` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_THUMB_MESSAGE` FOREIGN KEY (`mid`) REFERENCES `messageinfo` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_THUMB_UESR` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thumb
-- ----------------------------
INSERT INTO `thumb` VALUES ('30', '9787121273087', '6', '5');
INSERT INTO `thumb` VALUES ('32', '9787010060064', '6', '6');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户编号（主键）',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(70) NOT NULL COMMENT '密码',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `birthday` varchar(10) DEFAULT NULL COMMENT '生日',
  `tel` varchar(11) NOT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ号码',
  `addr` varchar(100) DEFAULT NULL COMMENT '地址',
  `permission` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '权限区分（默认为0）',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('2', '1126752442', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1554949220', null, null, null, '1');
INSERT INTO `userinfo` VALUES ('6', 'admin', '0192023a7bbd73250516f069df18b500', '男', '1994-07-18', '13900000000', '', '', '', '1');
INSERT INTO `userinfo` VALUES ('8', 'welcome', '25f9e794323b453885f5181f1b624d0b', '男', '2016-05-13', '13900000000', '', '', '', '1');
INSERT INTO `userinfo` VALUES ('10', 'chenhu', '312175e5dc8566e835f59fc3a116c92e', null, null, '15572216689', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('11', 'ai1san', '9db786dd3a53b09987d7d8a3dbae1ead', null, null, '13260628023', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('12', '201310137117', '09291e96e85ec5e54b1609466ccddbca', null, null, '13545371833', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('13', '1064945472', '25f9e794323b453885f5181f1b624d0b', null, null, '13429843057', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('14', '123456789', '25f9e794323b453885f5181f1b624d0b', null, null, '15629145059', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('15', 'qq457236615', '92c813807c8859dae8ba3a577cd3766a', null, null, '15172443327', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('16', '版青', '25f9e794323b453885f5181f1b624d0b', null, null, '18721129369', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('17', '418624008', 'fbf1b52f34422f80bd50b7f8d8600ef2', null, null, '13174441609', null, null, null, '0');
INSERT INTO `userinfo` VALUES ('18', '张航', 'd2c79e53e1e50c0c42bc5575e98cc233', null, null, '13971010410', null, null, null, '0');
