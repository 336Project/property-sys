/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : 127.0.0.1:3306
Source Database       : property_db

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2015-04-06 19:44:46
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
  `money` varchar(45) DEFAULT NULL,
  `balance` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account
-- ----------------------------

-- ----------------------------
-- Table structure for tb_application
-- ----------------------------
DROP TABLE IF EXISTS `tb_application`;
CREATE TABLE `tb_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `real_name` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `apply_time` varchar(45) DEFAULT NULL,
  `complete_time` varchar(45) DEFAULT NULL,
  `content` longtext,
  `status` varchar(45) DEFAULT NULL,
  `reply` longtext,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_application
-- ----------------------------

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
  `publish_date` varchar(45) DEFAULT NULL,
  `visitors` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_article
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_option
-- ----------------------------

-- ----------------------------
-- Table structure for tb_payment
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment`;
CREATE TABLE `tb_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `pay_time` varchar(45) DEFAULT NULL,
  `money` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_payment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_pay_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_pay_item`;
CREATE TABLE `tb_pay_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `money` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pay_item
-- ----------------------------

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
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  `last_login_time` varchar(45) DEFAULT NULL,
  `register_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `balance` varchar(45) DEFAULT '0',
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '1', '物业管理员', 'admin', '6CO+d3rD2LEFLmLJbJZQSQ==', null, null, '手动录入', '2015-04-06 19:42:03', '2015-04-06', '正常', '0', null);
