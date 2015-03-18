/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : 127.0.0.1:3306
Source Database       : sechand_db

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2015-03-18 22:42:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  `complete_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `nick_name` varchar(45) DEFAULT NULL,
  `money` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `balance` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account
-- ----------------------------
INSERT INTO `tb_account` VALUES ('1', '2', '2015-01-16 20:28:17', '2015-01-16 20:28:34', '已确认', '1234', '你好', '1000', '充值', '后台充值', '后台操作', null);
INSERT INTO `tb_account` VALUES ('2', '3', '2015-01-16 20:28:25', '2015-01-16 20:28:32', '已确认', '4321', '违和维修公司', '100', '充值', '后台充值', '后台操作', null);
INSERT INTO `tb_account` VALUES ('3', '2', '2015-01-16 22:05:52', '2015-01-16 22:05:52', '已确认', '1234', '你好', '-50', '消费', '维修扣款', '用户操作', null);
INSERT INTO `tb_account` VALUES ('4', '3', '2015-01-16 22:05:52', '2015-01-16 22:05:52', '已确认', '4321', '违和维修公司', '50', '到账', '维修收款', '用户操作', null);
INSERT INTO `tb_account` VALUES ('5', '3', null, '2015-02-25 21:01:15', '已确认', '4321', '违和维修公司', '-50', '提现', '提现成功', '用户操作', '100');
INSERT INTO `tb_account` VALUES ('6', '2', null, '2015-02-25 21:02:13', '已确认', '1234', '你好', '-80', '提现', '提现成功', '用户操作', '870');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  `complete_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `repair_content` longtext,
  `customer_user` varchar(45) DEFAULT NULL,
  `customer_company` longtext,
  `quote_time` varchar(45) DEFAULT NULL,
  `contact_tel_user` varchar(45) DEFAULT NULL,
  `contact_tel_company` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `receivables` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('3', '2', '3', '2015-01-16 20:30:12', '2015-01-16 22:11:54', '已确认', '发送的发的身份地方上地方的司法的身份宋德福宋德福宋德福宋', '你好', '违和维修公司', '2015-01-16 21:37:46', '1234567890', '0987654321', '50', null);
INSERT INTO `tb_order` VALUES ('4', '2', '3', '2015-01-18 15:35:55', null, '已取消', '', '你好', '违和维修公司', null, '1234567890', '0987654321', null, null);
INSERT INTO `tb_order` VALUES ('5', '2', '3', '2015-01-18 15:37:51', null, '新订单', 'xxx', '你好', '违和维修公司', '2015-01-18 15:55:29', '123456789', '0987654321', '', null);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '管理员', '1');
INSERT INTO `tb_role` VALUES ('2', '维修公司', '2');
INSERT INTO `tb_role` VALUES ('3', '普通用户', '3');

-- ----------------------------
-- Table structure for tb_trade
-- ----------------------------
DROP TABLE IF EXISTS `tb_trade`;
CREATE TABLE `tb_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `from_user_name` varchar(45) DEFAULT NULL,
  `to_user_name` varchar(45) DEFAULT NULL,
  `from_user_nick_name` varchar(45) DEFAULT NULL,
  `to_user_nick_name` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `money` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_trade
-- ----------------------------
INSERT INTO `tb_trade` VALUES ('1', '2', '3', '1234', '4321', '你好', '违和维修公司', '交易成功', '2015-01-16 22:05:52', '50');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(45) NOT NULL,
  `role_name` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `real_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `nick_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `last_login_time` varchar(45) DEFAULT NULL,
  `register_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `introduction` longtext,
  `balance` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '1', '管理员', 'admin', '管理员', 'dpLc3BnkHmbGri3lSmlrJQ==', '管理员', '', '', '手动录入', '2015-02-25 21:00:26', '2015-01-16 20:16:20', '正常', '', '0');
INSERT INTO `tb_user` VALUES ('2', '3', '普通用户', '1234', '你好', 'dpLc3BnkHmbGri3lSmlrJQ==', '你好', 'xxx@qq.com', '1234567890', '手动录入', '2015-01-18 15:22:50', '2015-01-16 20:26:39', '正常', '', '870');
INSERT INTO `tb_user` VALUES ('3', '2', '维修公司', '4321', '违和维修公司', 'dpLc3BnkHmbGri3lSmlrJQ==', '违和维修公司', 'qq@qq.com', '0987654321', '手动录入', '2015-01-18 15:47:08', '2015-01-16 20:27:34', '正常', '', '100');
INSERT INTO `tb_user` VALUES ('4', '3', '普通用户', 'admin1', '呼呼', 'Eeoc9PntH9npT0UZY8kDZQ==', '呼呼', 'admin@asdtv.net', '14324324342', '平台注册', null, '2015-01-18 13:52:22', '正常', '', '0');
