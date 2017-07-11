/*
Navicat MySQL Data Transfer

Source Server         : connection
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-05-31 18:07:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `appli_id` int(11) NOT NULL AUTO_INCREMENT,
  `appli_name` varchar(100) DEFAULT NULL,
  `appli_profession` varchar(5) DEFAULT NULL,
  `appli_position` varchar(5) DEFAULT NULL,
  `wanted_salary_first` varchar(6) DEFAULT NULL,
  `wanted_salary_second` varchar(6) DEFAULT NULL,
  `period` varchar(2) DEFAULT NULL,
  `work_place` varchar(5) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`appli_id`),
  KEY `FK5CA40550FE1DAD2E` (`customer_id`),
  CONSTRAINT `FK5CA40550FE1DAD2E` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) DEFAULT NULL,
  `company_pwd` varchar(20) DEFAULT NULL,
  `company_phone` int(11) DEFAULT NULL,
  `company_address` varchar(50) DEFAULT NULL,
  `company_nature` varchar(10) DEFAULT NULL,
  `company_scale` varchar(10) DEFAULT NULL,
  `company_industry` varchar(10) DEFAULT NULL,
  `company_introduce` longtext,
  `company_welfare` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '江苏光大科技有限公司', '123', '51225322', '江苏', '外资', '500人', 'IT行业', '外资独资企业', '五险一金');
INSERT INTO `company` VALUES ('2', '北京鼎盛科技有限公司', '123', '26325754', '北京', '外资', '1000人', 'IT行业', '外资独资企业', '五险一金');
INSERT INTO `company` VALUES ('3', '江西华歆科技有限公司', '123', '87828888', '江西', '国企', '1500人', 'IT行业', '国企', '五险一金');
INSERT INTO `company` VALUES ('4', 'dddd', 'dd', null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('5', 'ddd', 'dd', null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('6', 'dddddd', 'dd', null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('7', 'ddddddddd', 'dd', null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('8', 'ss', 'ss', null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('9', 'dd', 'dd', '12323', 'dd', 'ddddd', 'ddddd', 'dd', 'dd', 'dd');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(20) DEFAULT NULL,
  `customer_pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'zs', '123');
INSERT INTO `customer` VALUES ('2', 'wo', '123');
INSERT INTO `customer` VALUES ('3', 'qu', '123');
INSERT INTO `customer` VALUES ('4', 'woshi', '123');
INSERT INTO `customer` VALUES ('5', 'lisi', '123');
INSERT INTO `customer` VALUES ('6', 'wang', '123');
INSERT INTO `customer` VALUES ('7', 'zhang', '123');
INSERT INTO `customer` VALUES ('8', 'tian', '123');
INSERT INTO `customer` VALUES ('9', 'hh', '123');
INSERT INTO `customer` VALUES ('10', null, null);
INSERT INTO `customer` VALUES ('11', 'ddddd', 'dd');
INSERT INTO `customer` VALUES ('12', 'dd', 'ddd');
INSERT INTO `customer` VALUES ('13', 'dddddd', 'dd');
INSERT INTO `customer` VALUES ('14', 'gd', 'dd');
INSERT INTO `customer` VALUES ('15', 'ww', '123');
INSERT INTO `customer` VALUES ('16', 'bat', 'cat');

-- ----------------------------
-- Table structure for jobinfo
-- ----------------------------
DROP TABLE IF EXISTS `jobinfo`;
CREATE TABLE `jobinfo` (
  `jobinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(10) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `workplace` varchar(5) DEFAULT NULL,
  `publish_date` varchar(20) DEFAULT NULL,
  `experience` varchar(10) DEFAULT NULL,
  `education` varchar(5) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobinfo_id`),
  KEY `FKD8D71CB9CF43DE6` (`company_id`),
  CONSTRAINT `FKD8D71CB9CF43DE6` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobinfo
-- ----------------------------
INSERT INTO `jobinfo` VALUES ('3', 'Java程序员', '5000', '江西', null, '不限', '本科', '公司急需人才', '2');
INSERT INTO `jobinfo` VALUES ('4', 'Web程序员', '5000', '北京', null, '不限', '本科', '公司急需人才', '2');
INSERT INTO `jobinfo` VALUES ('5', 'Web程序员', '5000', '上海', null, '不限', '本科', '公司急需人才', '1');
INSERT INTO `jobinfo` VALUES ('6', 'Java程序员', '5000', '上海', null, '不限', '本科', '公司急需人才', '2');
INSERT INTO `jobinfo` VALUES ('16', 'Web程序员', '5000', '北京', null, '1年开发经验以上', '本科', '公司急需人才', '2');
INSERT INTO `jobinfo` VALUES ('31', '嵌入式', '5000', '北京', '', '1年开发经验以上', '本科', '公司急需人才', '1');
INSERT INTO `jobinfo` VALUES ('36', 'Java程序员', '5000', '上海', null, '3年开发经验以上', '不限', '公司急需人才', '1');
INSERT INTO `jobinfo` VALUES ('40', '架构师', '8000', '北京', null, '3年开发经验以上', '不限', '公司急需人才', '3');
INSERT INTO `jobinfo` VALUES ('41', '网络通信', '6000', '上海', null, '1年开发经验以上', '本科', '公司急需人才', '3');
INSERT INTO `jobinfo` VALUES ('42', '架构师', '10000', '北京', null, '3年开发经验以上', '本科', '公司急需人才', '1');
INSERT INTO `jobinfo` VALUES ('43', 'Web程序员', '10000', '上海', null, '3年开发经验以上', '不限', '公司急需人才', '1');

-- ----------------------------
-- Table structure for middle
-- ----------------------------
DROP TABLE IF EXISTS `middle`;
CREATE TABLE `middle` (
  `middle_id` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(10) DEFAULT NULL,
  `jobinfoId` int(11) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`middle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of middle
-- ----------------------------
INSERT INTO `middle` VALUES ('17', '张三', '21', '1');
INSERT INTO `middle` VALUES ('20', '张三', '4', '2');
INSERT INTO `middle` VALUES ('22', '张三', '3', '2');
INSERT INTO `middle` VALUES ('28', '张三', '3', '2');
INSERT INTO `middle` VALUES ('29', '张三', '31', '1');
INSERT INTO `middle` VALUES ('30', '张三', '36', '1');
INSERT INTO `middle` VALUES ('31', '张三', '1', '1');
INSERT INTO `middle` VALUES ('32', '王五', '1', '1');
INSERT INTO `middle` VALUES ('33', '', '1', '1');
INSERT INTO `middle` VALUES ('34', '', '3', '2');
INSERT INTO `middle` VALUES ('35', '', '4', '2');
INSERT INTO `middle` VALUES ('36', '李四', '1', '1');
INSERT INTO `middle` VALUES ('37', '张三', '43', '1');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `resume_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(5) DEFAULT NULL,
  `person_sex` varchar(1) DEFAULT NULL,
  `person_address` varchar(30) DEFAULT NULL,
  `pro_and_hobby` varchar(20) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `person_email` varchar(20) DEFAULT NULL,
  `introduce_and_evaluate` varchar(200) DEFAULT NULL,
  `graduation` varchar(10) DEFAULT NULL,
  `experience_date1` varchar(10) DEFAULT NULL,
  `experience_content1` varchar(100) DEFAULT NULL,
  `experience_title1` varchar(30) DEFAULT NULL,
  `experience_date2` varchar(10) DEFAULT NULL,
  `experience_title2` varchar(30) DEFAULT NULL,
  `experience_content2` varchar(100) DEFAULT NULL,
  `experience_date3` varchar(10) DEFAULT NULL,
  `experience_title3` varchar(30) DEFAULT NULL,
  `experience_content3` varchar(100) DEFAULT NULL,
  `about_skill1` int(11) DEFAULT NULL,
  `about_skill2` int(11) DEFAULT NULL,
  `about_skill3` int(11) DEFAULT NULL,
  `about_skill4` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`resume_id`),
  KEY `FKC84DC82DFE1DAD2E` (`customer_id`),
  CONSTRAINT `FKC84DC82DFE1DAD2E` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES ('1', '张三', '男', '江西省南昌市', 'java程序员，喜欢唱歌', '18770810001', '55555555@qq.com', '自我感觉良好', '江西理工大学', '2014年6月', '进入公司当实习生不久后，进入公司主要项目组，负责部分功能实现，参与过几个项目', '北京兴盛科技有限公司Java实习生', '2015年3月', '深圳鼎科有限公司正式员工', '2016年在公司担任项目组副组长，负责关键功能实现和管理小组工作进度', '2016年8月', '上海福度有限公司担任项目组组长', '在公司负责研发部项目开发工作', '4', '4', '3', '1', null);
INSERT INTO `resume` VALUES ('2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null);
INSERT INTO `resume` VALUES ('3', '我是去', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, '3', null);
INSERT INTO `resume` VALUES ('4', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null);
INSERT INTO `resume` VALUES ('5', '李四', '男', '上海市', 'Web程序员，喜欢唱歌', '18770810002', '666666666@qq.com', '为人风趣', '江西理工大学', '2014年6月', '进入公司当实习生不久后，进入公司主要项目组，负责部分功能实现，参与过几个项目', '北京兴盛科技有限公司Java实习生', '2015年3月', '深圳鼎科有限公司正式员工', '2016年在公司担任项目组副组长，负责关键功能实现和管理小组工作进度', '2016年8月', '上海福度有限公司担任项目组组长', '在公司负责研发部项目开发工作', '4', '4', '4', '5', null);
INSERT INTO `resume` VALUES ('6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('8', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('9', 'lala', '女', 'ddd', 'd', '123', 'dd@qq.com', '号', '好', '', '', '', '', '', '', '', '', '', null, null, null, '9', null);
INSERT INTO `resume` VALUES ('10', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('13', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('14', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('15', '王五', '男', '北京市', '架构师', '18770810003', '888888888@qq.com', '爱打羽毛球，喜欢运动', '江西理工大学', '2014年6月', '进入公司当实习生不久后，进入公司主要项目组，负责部分功能实现，参与过几个项目', '北京兴盛科技有限公司Java实习生', '2015年3月', '深圳鼎科有限公司正式员工', '2016年在公司担任项目组副组长，负责关键功能实现和管理小组工作进度', '2016年8月', '上海福度有限公司担任项目组组长', '在公司负责研发部项目开发工作', '3', '3', '3', '15', null);
INSERT INTO `resume` VALUES ('16', 'fas', 'a', 'asdf', 'adsf', 'sadfsa', 'safd', 'sfdsafasf', 'safa', '', '', '', '', '', '', '', '', '', null, null, null, '16', null);
INSERT INTO `resume` VALUES ('17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('18', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('19', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('27', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('28', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('29', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('30', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('31', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('32', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('33', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('35', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('36', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('37', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `resume` VALUES ('38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
