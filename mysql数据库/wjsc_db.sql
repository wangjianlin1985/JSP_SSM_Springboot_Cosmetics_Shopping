/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : wjsc_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-04-13 23:49:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '评论id',
  `productObj` int(11) NOT NULL COMMENT '被评商品',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `userObj` varchar(30) NOT NULL COMMENT '评论用户',
  `commentTime` varchar(20) default NULL COMMENT '评论时间',
  PRIMARY KEY  (`commentId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '很好，非常不错', 'user1', '2019-04-10 14:15:13');
INSERT INTO `t_comment` VALUES ('2', '1', '大力推荐', 'user1', '2019-04-10 22:31:11');
INSERT INTO `t_comment` VALUES ('3', '2', '卖家棒棒哒', 'user2', '2019-04-10 13:58:26');
INSERT INTO `t_comment` VALUES ('4', '2', '超级好的', 'user2', '2019-04-10 13:59:14');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '111', '222', 'user1', '2019-04-12 15:31:00', '333', '2019-04-12 15:31:02');
INSERT INTO `t_leaveword` VALUES ('2', 'aa', 'bb', 'user1', '2019-04-12 15:31:10', '很好', '2019-04-12 15:31:14');
INSERT INTO `t_leaveword` VALUES ('3', '太好了，我可以买宝贝了', '这个网站我有很多喜欢的宝贝，太高兴了！', 'user2', '2019-04-12 15:31:21', '你喜欢就好！', '2019-04-12 15:31:23');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', 'aaaa', '<p>bbbb</p>', '2019-04-12 15:27:08');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderNo` varchar(30) NOT NULL COMMENT 'orderNo',
  `userObj` varchar(30) NOT NULL COMMENT '下单用户',
  `totalMoney` float NOT NULL COMMENT '订单总金额',
  `payWay` varchar(20) NOT NULL COMMENT '支付方式',
  `orderStateObj` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '下单时间',
  `receiveName` varchar(20) NOT NULL COMMENT '收货人',
  `telephone` varchar(20) NOT NULL COMMENT '收货人电话',
  `address` varchar(80) NOT NULL COMMENT '收货人地址',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  PRIMARY KEY  (`orderNo`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('user120190412144139', 'user1', '10', '支付宝', '交易完成', '2019-04-12 14:41:39', '双鱼林', '13598308394', '四川成都红星路13号', '申通单号：149800834010344');
INSERT INTO `t_orderinfo` VALUES ('user120190413234144', 'user1', '2697', '微信', '已付款', '2019-04-13 23:41:44', '双鱼林', '13598308394', '四川成都红星路13号', '');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `itemId` int(11) NOT NULL auto_increment COMMENT '条目id',
  `orderObj` varchar(30) NOT NULL COMMENT '所属订单',
  `productObj` int(11) NOT NULL COMMENT '订单商品',
  `price` float NOT NULL COMMENT '商品单价',
  `orderNumer` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`itemId`),
  KEY `orderObj` (`orderObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_orderitem_ibfk_1` FOREIGN KEY (`orderObj`) REFERENCES `t_orderinfo` (`orderNo`),
  CONSTRAINT `t_orderitem_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('13', 'user120190412144139', '1', '10', '1');
INSERT INTO `t_orderitem` VALUES ('14', 'user120190413234144', '5', '49', '2');
INSERT INTO `t_orderitem` VALUES ('15', 'user120190413234144', '3', '2599', '1');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品图片',
  `productNum` int(11) NOT NULL COMMENT '商品库存',
  `price` float NOT NULL COMMENT '商品价格',
  `recommandFlag` varchar(20) NOT NULL COMMENT '是否推荐',
  `recipeFlag` varchar(20) NOT NULL COMMENT '是否处方药',
  `productDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '【官方正品】YSL圣罗兰纯口红方管持久哑光滋润正红色斩男色52', 'upload/f8542449-abd8-49f3-8221-ef255a73e40e.png', '100', '30', '是', '否', '<p>品牌名称：<span class=\"J_EbrandLogo\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">YSL/圣罗兰</span></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：YSL/圣罗兰 纯口红 7</p></li><li><p>产品类别:&nbsp;普通类</p></li><li><p>净含量:&nbsp;3.8g</p></li><li><p>批准文号:&nbsp;国妆备进字J20131871</p></li><li><p>是否为特殊用途化妆品:&nbsp;否</p></li><li><p>限期使用日期范围:&nbsp;2019-08-01至2020-07-01</p></li><li><p>颜色分类:&nbsp;1&nbsp;7&nbsp;9&nbsp;11&nbsp;13&nbsp;16&nbsp;17&nbsp;19&nbsp;22&nbsp;23&nbsp;26&nbsp;27&nbsp;36&nbsp;49&nbsp;50&nbsp;51&nbsp;52&nbsp;56&nbsp;57&nbsp;58&nbsp;59&nbsp;72&nbsp;73&nbsp;74&nbsp;201&nbsp;202&nbsp;203&nbsp;205&nbsp;207&nbsp;208&nbsp;211&nbsp;212&nbsp;213&nbsp;215&nbsp;216&nbsp;217</p></li><li><p>规格类型:&nbsp;正常规格</p></li><li><p>品牌:&nbsp;YSL/圣罗兰</p></li><li><p>YSL/圣罗兰单品:&nbsp;纯口红 7</p></li><li><p>功效:&nbsp;保湿</p></li><li><p>产地:&nbsp;法国</p></li></ul><p><br/></p>', '2019-04-13 14:05:10');
INSERT INTO `t_product` VALUES ('2', '1', '【官方正品】纪梵希小羊皮口红高定香榭天鹅绒唇膏持久滋润', 'upload/7280474d-4078-41b0-9768-6f6fe74b97ed.png', '100', '300', '是', '否', '<p>品牌名称：<span class=\"J_EbrandLogo\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">Givenchy/纪梵希</span></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：Givenchy/纪梵希 高定香榭...</p></li><li><p>净含量:&nbsp;3.4g</p></li><li><p>是否为特殊用途化妆品:&nbsp;否</p></li><li><p>限期使用日期范围:&nbsp;2019-03-01至2020-02-29</p></li><li><p>颜色分类:&nbsp;102&nbsp;103&nbsp;105&nbsp;201&nbsp;202&nbsp;204&nbsp;205&nbsp;209&nbsp;210&nbsp;214&nbsp;301&nbsp;302&nbsp;303&nbsp;304&nbsp;305&nbsp;306&nbsp;307&nbsp;315&nbsp;317&nbsp;323&nbsp;324&nbsp;325&nbsp;326&nbsp;327</p></li><li><p>规格类型:&nbsp;正常规格</p></li><li><p>品牌:&nbsp;Givenchy/纪梵希</p></li><li><p>Givenchy/纪梵希:&nbsp;高定香榭天鹅绒唇膏</p></li><li><p>功效:&nbsp;持久&nbsp;易上色&nbsp;滋润</p></li><li><p>产地:&nbsp;法国</p></li></ul><p><br/></p>', '2019-04-12 15:20:31');
INSERT INTO `t_product` VALUES ('3', '2', '雅诗兰黛 dw持妆粉底液30ml 补水防晒 保湿遮瑕 持久控油不脱妆', 'upload/c118099c-aeb0-4ec5-ad61-5ab8a52c8327.png', '200', '2599', '是', '否', '<p>品牌名称：<span class=\"J_EbrandLogo\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">Estee Lauder/雅诗兰黛</span></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：Estee Lauder/雅诗兰黛 持...</p></li><li><p>产品类别:&nbsp;防晒类</p></li><li><p>净含量:&nbsp;30ml</p></li><li><p>化妆品保质期:&nbsp;36个月</p></li><li><p>批准文号:&nbsp;国妆特进字J20170583</p></li><li><p>是否为特殊用途化妆品:&nbsp;是</p></li><li><p>限期使用日期范围:&nbsp;2019-01-01至2019-12-31</p></li><li><p>粉底分类:&nbsp;粉底液</p></li><li><p>颜色分类:&nbsp;17&nbsp;36&nbsp;62&nbsp;66&nbsp;82&nbsp;37&nbsp;53&nbsp;65&nbsp;84&nbsp;85</p></li><li><p>是否防晒:&nbsp;是</p></li><li><p>规格类型:&nbsp;正常规格</p></li><li><p>品牌:&nbsp;Estee Lauder/雅诗兰黛</p></li><li><p>EsteeLauder/雅诗兰黛单品:&nbsp;持妆粉底液</p></li><li><p>功效:&nbsp;修饰肤色&nbsp;隐形毛孔&nbsp;遮瑕&nbsp;控油</p></li><li><p>适合肤质:&nbsp;任何肤质</p></li><li><p>产地:&nbsp;比利时</p></li></ul><p><br/></p>', '2019-04-12 15:21:44');
INSERT INTO `t_product` VALUES ('4', '3', '倩盼染眉膏气垫眉膏眉粉眉笔防水防汗不脱色自然持久正品非韩国', 'upload/e530488a-2c9b-4b98-b90d-3d50bf0383a3.png', '240', '1773', '是', '否', '<p>品牌名称：<span class=\"J_EbrandLogo\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">倩盼</span></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>产品名称：倩盼 气垫眉膏</p></li><li><p>上市时间:&nbsp;2016年</p></li><li><p>月份:&nbsp;2017年，月份 4月</p></li><li><p>净含量:&nbsp;7g</p></li><li><p>化妆品保质期:&nbsp;36个月</p></li><li><p>是否为特殊用途化妆品:&nbsp;否</p></li><li><p>限期使用日期范围:&nbsp;2019-07-27至2020-07-26</p></li><li><p>彩妆分类:&nbsp;眉膏</p></li><li><p>颜色分类:&nbsp;01#【浅棕+深棕】&nbsp;02#【浅灰+深灰】&nbsp;03#【米黄+金棕】</p></li><li><p>规格类型:&nbsp;正常规格</p></li><li><p>品牌:&nbsp;倩盼</p></li><li><p>品名:&nbsp;气垫眉膏</p></li><li><p>功效:&nbsp;不晕染&nbsp;持久&nbsp;易上色&nbsp;自然立体&nbsp;防水&nbsp;锁色</p></li><li><p>适合肤质:&nbsp;任何肤质</p></li><li><p>产地:&nbsp;中国</p></li><li><p>保质期:&nbsp;3年</p></li></ul><p><br/></p>', '2019-04-12 15:23:34');
INSERT INTO `t_product` VALUES ('5', '4', '平价替代纸醉金迷NK heat红棕色眼影盘秋冬暖调大地色眼影偏光', 'upload/5dc2fe24-25a1-4d7b-adb9-b6405262aca1.png', '260', '49', '是', '是', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>是否为特殊用途化妆品:&nbsp;否</p></li><li><p>颜色数:&nbsp;8色及以上</p></li><li><p>规格类型:&nbsp;正常规格</p></li><li><p>品牌:&nbsp;ucanbe</p></li><li><p>功效:&nbsp;修饰轮廓 眼部修饰 防水防汗</p></li><li><p>产地:&nbsp;中国</p></li></ul><p><br/></p>', '2019-04-12 15:24:45');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '口红', '卖所有的口红');
INSERT INTO `t_productclass` VALUES ('2', '粉底液', '粉底液');
INSERT INTO `t_productclass` VALUES ('3', '眉笔', '眉笔');
INSERT INTO `t_productclass` VALUES ('4', '眼影', '眼影');

-- ----------------------------
-- Table structure for `t_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `rechargeId` int(11) NOT NULL auto_increment COMMENT '充值id',
  `userObj` varchar(30) NOT NULL COMMENT '充值用户',
  `rechargeMoney` float NOT NULL COMMENT '充值金额',
  `rechargeMemo` varchar(500) default NULL COMMENT '充值备注',
  `rechargeTime` varchar(20) default NULL COMMENT '充值时间',
  PRIMARY KEY  (`rechargeId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recharge_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('1', 'user1', '100', 'test', '2019-04-12 15:26:56');
INSERT INTO `t_recharge` VALUES ('2', 'user1', '50', 'test22', '2019-04-12 15:26:49');
INSERT INTO `t_recharge` VALUES ('3', 'user1', '50', '333', '2019-04-12 15:26:42');
INSERT INTO `t_recharge` VALUES ('4', 'user2', '3000', '给用户充值', '2019-04-12 15:26:35');

-- ----------------------------
-- Table structure for `t_recipel`
-- ----------------------------
DROP TABLE IF EXISTS `t_recipel`;
CREATE TABLE `t_recipel` (
  `recipelId` int(11) NOT NULL auto_increment COMMENT '处方id',
  `recipelPhoto` varchar(60) NOT NULL COMMENT '处方照片',
  `userObj` varchar(30) NOT NULL COMMENT '上传用户',
  `recipelMemo` varchar(500) default NULL COMMENT '处方备注',
  `handState` varchar(20) NOT NULL COMMENT '处理状态',
  `addTime` varchar(20) default NULL COMMENT '上传时间',
  PRIMARY KEY  (`recipelId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recipel_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recipel
-- ----------------------------
INSERT INTO `t_recipel` VALUES ('1', 'upload/NoImage.jpg', 'user1', 'iijkkk', '待处理', '2019-04-14 23:46:00');
INSERT INTO `t_recipel` VALUES ('2', 'upload/NoImage.jpg', 'user1', 'guhihiyih', '已处理', '2019-04-23 22:51:44');

-- ----------------------------
-- Table structure for `t_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `cartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `userObj` varchar(30) NOT NULL COMMENT '用户',
  `price` float NOT NULL COMMENT '单价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`cartId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_shopcart_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_shopcart_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------
INSERT INTO `t_shopcart` VALUES ('13', '4', 'user1', '1773', '1');
INSERT INTO `t_shopcart` VALUES ('14', '2', 'user1', '300', '2');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `userMoney` float NOT NULL COMMENT '账户余额',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2019-03-24', 'upload/2a4f0e05-2407-44d0-b510-0b04a8cfa620.jpg', '13598308394', 'dashen@163.com', '四川成都红星路13号', '3103', '2019-03-25 23:41:53');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '王小琴', '女', '2019-03-30', 'upload/5623884d-dacc-455d-8ec7-2ff9148dc228.jpg', '13598039934', 'xiaoqin@163.com', '四川南充海阳路12号', '52', '2019-03-31 13:58:00');
