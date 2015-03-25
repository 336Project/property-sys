/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : 127.0.0.1:3306
Source Database       : property_db

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2015-03-23 20:33:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_application
-- ----------------------------
DROP TABLE IF EXISTS `tb_application`;
CREATE TABLE `tb_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `apply_time` varchar(45) DEFAULT NULL,
  `complete_time` varchar(45) DEFAULT NULL,
  `content` longtext,
  `status` varchar(45) DEFAULT NULL,
  `reply` longtext,
  `user_id` int(11) DEFAULT NULL,
  `real_name` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_application
-- ----------------------------
INSERT INTO `tb_application` VALUES ('1', '报修申请', '2015-03-15 15:37:17', null, '', '申请中', null, '1', '12', '213', '321');
INSERT INTO `tb_application` VALUES ('2', '报修申请', '2015-03-15 15:37:29', null, '', '申请中', null, '2', '12', '213', '321');
INSERT INTO `tb_application` VALUES ('3', '报修申请', '2015-03-15 15:37:34', null, '', '申请中', null, '3', '12', '213', '321');
INSERT INTO `tb_application` VALUES ('4', '报修申请', '2015-03-15 15:40:04', null, '', '申请中', null, '4', '', '', '');
INSERT INTO `tb_application` VALUES ('5', '入住申请', '2015-03-15 15:54:54', null, '', '申请中', null, '5', '', '', '');
INSERT INTO `tb_application` VALUES ('6', '入住申请', '2015-03-15 15:55:07', null, '', '申请中', null, '6', '', '', '');
INSERT INTO `tb_application` VALUES ('7', '装修申请', '2015-03-15 15:55:39', null, '', '申请中', null, '7', '', '', '');
INSERT INTO `tb_application` VALUES ('8', '装修申请', '2015-03-18 20:33:20', null, '', '申请中', null, '8', '', '', '');

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` longtext,
  `user_id` int(11) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `visitors` bigint(20) DEFAULT '0',
  `supporters` bigint(20) DEFAULT '0',
  `opponents` bigint(20) DEFAULT '0',
  `publish_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES ('1', '活动', '社区活动1', '社区活动1', '1', '张三', '0', '0', '0', '2015-03-10');
INSERT INTO `tb_article` VALUES ('2', '活动', '社区活动1', '社区活动1', '1', '张三', '0', '0', '0', '2015-03-09');
INSERT INTO `tb_article` VALUES ('3', '活动', '社区活动1', '社区活动1', '1', '张三', '0', '0', '0', '2015-03-10');
INSERT INTO `tb_article` VALUES ('4', '活动', '社区活动1', '社区活动1', '1', '张三', '0', '0', '0', '2015-03-11');
INSERT INTO `tb_article` VALUES ('5', '活动', '社区活动1', '社区活动1', '1', '张三', '0', '0', '0', '2015-03-10');
INSERT INTO `tb_article` VALUES ('6', '咨询', '咨询1', '咨询1', '1', '张三', '0', '0', '0', '2015-03-10');
INSERT INTO `tb_article` VALUES ('7', '投诉', '投诉1', '投诉1', '1', '张三', '0', '0', '0', '2015-03-10');
INSERT INTO `tb_article` VALUES ('8', '投票', '投票1', '投票1', '1', '张三', '0', '0', '0', '2015-03-10');
INSERT INTO `tb_article` VALUES ('9', '议题', '社会议题1', '社会议题1', '1', '张三', '0', '0', '0', '2015-03-13');
INSERT INTO `tb_article` VALUES ('10', '公告', '社区公告', '社区公告1', '1', '张三', '0', '0', '0', '2015-03-10');
INSERT INTO `tb_article` VALUES ('11', '投票', '投票方式', ' ', '1', '12345', '0', '0', '0', '2015-03-18 22:06:31');
INSERT INTO `tb_article` VALUES ('12', '投票', '我要投票', '对于投票的方式，大家是否赞成呢？', '1', '12345', '0', '0', '0', '2015-03-18 22:08:43');
INSERT INTO `tb_article` VALUES ('13', '咨询', '我要咨询', '怎么申请入驻', '1', '12345', '0', '0', '0', '2015-03-18 22:31:34');
INSERT INTO `tb_article` VALUES ('14', '投诉', '我要投诉', '水管老旧', '1', '12345', '0', '0', '0', '2015-03-18 22:32:11');
INSERT INTO `tb_article` VALUES ('15', '议题', '乔丹厉害吗', '非常厉害', '1', '12345', '0', '0', '0', '2015-03-18 22:38:50');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `user_id` int(11) DEFAULT NULL,
  `reviewer` varchar(45) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `publish_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_option
-- ----------------------------
DROP TABLE IF EXISTS `tb_option`;
CREATE TABLE `tb_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `supporters` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_option
-- ----------------------------
INSERT INTO `tb_option` VALUES ('1', '赞成', '11', '0');
INSERT INTO `tb_option` VALUES ('2', '反对', '11', '0');
INSERT INTO `tb_option` VALUES ('3', '赞成', '12', '0');
INSERT INTO `tb_option` VALUES ('4', '反对', '12', '0');
INSERT INTO `tb_option` VALUES ('5', '赞', '13', '0');
INSERT INTO `tb_option` VALUES ('6', '踩', '13', '0');
INSERT INTO `tb_option` VALUES ('7', '赞', '14', '0');
INSERT INTO `tb_option` VALUES ('8', '踩', '14', '0');
INSERT INTO `tb_option` VALUES ('9', '赞', '15', '0');
INSERT INTO `tb_option` VALUES ('10', '踩', '15', '0');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '物业管理员', '1');
INSERT INTO `tb_role` VALUES ('2', '普通用户', '2');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(45) NOT NULL,
  `role_name` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '2', '普通用户', '12345', 'dpLc3BnkHmbGri3lSmlrJQ==', null, null, null, null, '2015-03-18 22:45:51', null, '正常', null, '0');
INSERT INTO `tb_user` VALUES ('2', '1', '物业管理员', '123456', 'dpLc3BnkHmbGri3lSmlrJQ==', null, null, null, null, '2015-03-03 21:37:22', null, '正常', null, '0');
