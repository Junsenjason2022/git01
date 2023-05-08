/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : community

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2022-03-01 09:00:27
*/
use community;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(50) DEFAULT NULL,
  `uints` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('1', '16栋', '1单元', '无1');
INSERT INTO `building` VALUES ('7', '17栋', '2单元', '无1');
INSERT INTO `building` VALUES ('11', '18栋', '2单元', '无');
INSERT INTO `building` VALUES ('12', '19栋', '1单元', '无');
INSERT INTO `building` VALUES ('13', '20栋', '2单元', '无');

-- ----------------------------
-- Table structure for carcharge
-- ----------------------------
DROP TABLE IF EXISTS `carcharge`;
CREATE TABLE `carcharge` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_date` datetime DEFAULT NULL,
  `end_date` varchar(25) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `owner_id` int(10) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '收费类型',
  `park_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carcharge
-- ----------------------------
INSERT INTO `carcharge` VALUES ('2', '2020-09-30 16:00:00', '2020-12-31', '1200.00', '1', '1', '221', '停车费', '1');
INSERT INTO `carcharge` VALUES ('3', '2020-09-30 16:00:00', '2020-12-31', '1200.00', '1', '2', '221', '停车费', '2');
INSERT INTO `carcharge` VALUES ('8', '2020-10-31 16:00:00', '2020-11-30', '300.00', '0', '1', '112', '停车费', '1');
INSERT INTO `carcharge` VALUES ('9', '2022-02-24 16:00:00', '2022-06-26', '50.00', '0', '1', '11', '停车费', '1');
INSERT INTO `carcharge` VALUES ('10', '2022-02-24 16:00:00', '2022-06-26', '50.00', '0', '2', '11', '停车费', '2');

-- ----------------------------
-- Table structure for clockin
-- ----------------------------
DROP TABLE IF EXISTS `clockin`;
CREATE TABLE `clockin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clock_in_time` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clockin
-- ----------------------------
INSERT INTO `clockin` VALUES ('1', '2021-04-01 02:42:55', '1', '1', '1');
INSERT INTO `clockin` VALUES ('4', '2021-04-20 14:59:13', '2', '2', '7');
INSERT INTO `clockin` VALUES ('11', '2021-04-25 07:22:02', '1', '1', '1');
INSERT INTO `clockin` VALUES ('12', '2021-04-26 07:22:29', '2', '2', '7');
INSERT INTO `clockin` VALUES ('14', '2021-04-27 07:34:24', '1', '1', '1');
INSERT INTO `clockin` VALUES ('15', '2021-04-27 07:35:23', '2', '2', '7');

-- ----------------------------
-- Table structure for clockinnew
-- ----------------------------
DROP TABLE IF EXISTS `clockinnew`;
CREATE TABLE `clockinnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `type1` int(11) DEFAULT NULL COMMENT '是否为疑似病例如咳嗽，发热（0或1）',
  `type2` int(11) DEFAULT NULL COMMENT '是否确诊为肺炎病例',
  `today_address` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clockinnew
-- ----------------------------
INSERT INTO `clockinnew` VALUES ('1', '2021-04-26 13:20:00', '2', '0', '0', '江西省南昌市御景花园小区16栋1单元601', '无');
INSERT INTO `clockinnew` VALUES ('6', '2021-04-26 16:00:00', '2', '0', '0', '测试', '');
INSERT INTO `clockinnew` VALUES ('17', '2021-04-27 16:00:00', '1', '1', '0', '测试', 'v二十');
INSERT INTO `clockinnew` VALUES ('18', '2021-10-29 16:00:00', '2', '0', '0', '江苏盐城', '无');
INSERT INTO `clockinnew` VALUES ('19', '2021-10-29 16:00:00', '9', '0', '0', '深圳宝安', '无');

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  `handle_date` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `clr` int(11) DEFAULT NULL COMMENT '处理人',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of complaint
-- ----------------------------
INSERT INTO `complaint` VALUES ('1', '1', '2020-11-22 11:47:46', null, '1', '1', null, '垃圾经常乱放');
INSERT INTO `complaint` VALUES ('2', '2', '2020-11-17 11:48:15', '2020-11-21 11:48:21', '1', '1', '111', '绿植被拔了');
INSERT INTO `complaint` VALUES ('4', '1', '2020-11-24 14:21:01', null, '2', '0', null, '垃圾乱放没解决');

-- ----------------------------
-- Table structure for complaint_type
-- ----------------------------
DROP TABLE IF EXISTS `complaint_type`;
CREATE TABLE `complaint_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of complaint_type
-- ----------------------------
INSERT INTO `complaint_type` VALUES ('1', '垃圾乱放', null, null);
INSERT INTO `complaint_type` VALUES ('2', '绿植太差', null, null);

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `storey` int(5) DEFAULT NULL,
  `numbers` varchar(50) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `into_date` datetime DEFAULT NULL,
  `building_id` int(5) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `area` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', null, '401', '1', '2020-10-01 09:27:52', '1', null, '80.00');
INSERT INTO `house` VALUES ('2', null, '402', '1', '2020-11-04 16:00:00', '7', '', '90.00');
INSERT INTO `house` VALUES ('3', null, '201', '1', '2020-11-17 15:52:58', '1', null, '100.00');
INSERT INTO `house` VALUES ('4', null, '602', '1', '2021-05-05 16:00:00', '11', '', '98.00');
INSERT INTO `house` VALUES ('5', null, '405', '1', '2022-02-27 16:00:00', '1', '', '100.00');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(100) DEFAULT NULL COMMENT '主题',
  `content` varchar(250) DEFAULT NULL,
  `fbr` varchar(50) DEFAULT NULL,
  `fbdate` datetime DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '测试主题1', '测试内容太1', 'admin', '2022-02-27 16:00:00', '');

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `tel` varchar(25) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `identity` varchar(25) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `password` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of owner
-- ----------------------------
INSERT INTO `owner` VALUES ('1', 'mary', '15270892323', '女', '433123456787', '1', null, '12345');
INSERT INTO `owner` VALUES ('2', 'yx5411', '13767134678', '男', '433123456788', '2', null, '12345');
INSERT INTO `owner` VALUES ('9', 'yx7845', '15270839876', '男', '587968932', '4', '', '123456');

-- ----------------------------
-- Table structure for parking
-- ----------------------------
DROP TABLE IF EXISTS `parking`;
CREATE TABLE `parking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(25) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parking
-- ----------------------------
INSERT INTO `parking` VALUES ('1', 'A10001', '1', '1', '');
INSERT INTO `parking` VALUES ('2', 'A10002', '1', '2', '');

-- ----------------------------
-- Table structure for property_info
-- ----------------------------
DROP TABLE IF EXISTS `property_info`;
CREATE TABLE `property_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `money` double(10,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property_info
-- ----------------------------
INSERT INTO `property_info` VALUES ('1', '2', '900.00', '2020-10-01 09:28:11', '2020-12-29 16:00:00', '1', '1', '啊水水');
INSERT INTO `property_info` VALUES ('4', '1', '208.00', '2020-09-30 16:00:00', '2020-12-30 16:00:00', '1', '1', '物业费');
INSERT INTO `property_info` VALUES ('5', '3', '100.00', '2020-11-13 16:00:00', '2020-11-13 16:00:00', '1', '1', 'wu ');
INSERT INTO `property_info` VALUES ('23', '1', '208.00', '2020-09-30 16:00:00', '2020-12-30 16:00:00', '0', '1', 'ceshi');
INSERT INTO `property_info` VALUES ('24', '1', '234.00', '2020-09-30 16:00:00', '2020-12-30 16:00:00', '0', '2', 'ceshi');
INSERT INTO `property_info` VALUES ('32', '1', '208.00', '2022-02-24 16:00:00', '2022-05-26 16:00:00', '0', '1', '555');
INSERT INTO `property_info` VALUES ('36', '1', '208.00', '2022-02-24 16:00:00', '2022-05-26 16:00:00', '0', '1', '111');
INSERT INTO `property_info` VALUES ('37', '1', '234.00', '2022-02-24 16:00:00', '2022-05-26 16:00:00', '0', '2', '111');
INSERT INTO `property_info` VALUES ('39', '1', '254.80', '2022-02-24 16:00:00', '2022-05-26 16:00:00', '0', '4', '111');
INSERT INTO `property_info` VALUES ('40', '3', '20.00', '2022-02-24 16:00:00', '2022-02-24 16:00:00', '0', '1', 'ww');

-- ----------------------------
-- Table structure for property_type
-- ----------------------------
DROP TABLE IF EXISTS `property_type`;
CREATE TABLE `property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `unit` varchar(25) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property_type
-- ----------------------------
INSERT INTO `property_type` VALUES ('1', '物业费', '2.60', '一平方', null);
INSERT INTO `property_type` VALUES ('2', '水费', '4.50', '一吨', null);
INSERT INTO `property_type` VALUES ('3', '电费', '0.50', '一度', null);
INSERT INTO `property_type` VALUES ('4', '车位费', '260.00', '一个', null);

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `num` double(5,2) DEFAULT NULL,
  `num2` double(5,2) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `up_time` datetime DEFAULT NULL,
  `on_time` datetime DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `meter` varchar(25) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES ('1', '2', '200.00', '300.00', '1', '2020-10-01 09:28:11', '2020-11-06 09:28:16', '2020-11-12 09:28:23', '张三', '无');
INSERT INTO `records` VALUES ('2', '2', '100.00', '200.00', '1', '2020-09-23 10:34:48', '2020-10-31 10:34:57', '2020-10-30 10:35:05', 'yx', '');
INSERT INTO `records` VALUES ('9', '3', '0.00', '123.00', '4', '2021-05-05 16:00:00', '2021-05-05 16:00:00', '2021-05-06 13:48:56', 'zhangsan', '');
INSERT INTO `records` VALUES ('10', '3', '0.00', '40.00', '1', '2022-02-24 16:00:00', '2022-02-24 16:00:00', '2022-02-25 13:56:22', 'yx5411', 'ww');

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) DEFAULT NULL,
  `com_date` datetime DEFAULT NULL,
  `handle_date` datetime DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `clr` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES ('1', '1', '2020-11-19 11:47:37', '2020-11-21 11:47:41', '1', '1', '1', '11');
INSERT INTO `repair` VALUES ('2', '1', '2020-11-18 11:48:02', '2020-11-27 11:48:06', '1', '0', '1', '11');
INSERT INTO `repair` VALUES ('3', '2', '2020-11-10 11:48:45', '2020-11-27 11:48:48', '1', '1', '1', '11');
INSERT INTO `repair` VALUES ('4', '3', '2020-11-11 14:56:31', '2020-11-27 14:56:35', '1', '0', '1', '22');
INSERT INTO `repair` VALUES ('6', '3', '2020-11-11 14:56:31', '2020-11-22 06:14:52', '1', '0', '1', '22');
INSERT INTO `repair` VALUES ('7', '3', '2020-11-11 14:56:31', '2020-11-27 14:56:35', '1', '1', '1', '22');
INSERT INTO `repair` VALUES ('8', '4', '2020-11-23 10:00:07', '2020-11-25 10:00:13', '1', '1', '1', '33');
INSERT INTO `repair` VALUES ('9', '4', '2020-11-23 10:00:07', '2020-11-25 10:00:13', '2', '1', '1', '33');
INSERT INTO `repair` VALUES ('10', '4', '2020-11-23 10:00:07', '2020-11-25 10:00:13', '1', '1', '1', '33');
INSERT INTO `repair` VALUES ('13', '7', '2020-11-05 10:00:59', '2020-11-28 10:01:03', '1', '1', '1', '22');
INSERT INTO `repair` VALUES ('14', '3', '2021-04-29 10:54:02', null, '2', '0', null, '电梯坏了');

-- ----------------------------
-- Table structure for repairtype
-- ----------------------------
DROP TABLE IF EXISTS `repairtype`;
CREATE TABLE `repairtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repairtype
-- ----------------------------
INSERT INTO `repairtype` VALUES ('1', '公共部位维修', null, '1');
INSERT INTO `repairtype` VALUES ('2', '共用设施设备 ', null, '1');
INSERT INTO `repairtype` VALUES ('3', '电梯', null, '1');
INSERT INTO `repairtype` VALUES ('4', '自用部位维修', null, '1');
INSERT INTO `repairtype` VALUES ('5', '门窗维修', null, '1');
INSERT INTO `repairtype` VALUES ('6', '电话维修', null, '1');
INSERT INTO `repairtype` VALUES ('7', '电路维修', null, '1');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admin', '12345', '1', null);
INSERT INTO `userinfo` VALUES ('2', 'yx5411', '12345', '0', null);
INSERT INTO `userinfo` VALUES ('3', 'mary', '12345', '0', null);
INSERT INTO `userinfo` VALUES ('12', 'yx7845', '12345', '0', '');
SET FOREIGN_KEY_CHECKS=1;