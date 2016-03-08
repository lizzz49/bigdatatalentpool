SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `bigdatatalentpool` DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
USE bigdatatalentpool;

-- ----------------------------
--  `city` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '城市名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `city` 数据
-- ----------------------------
BEGIN;
INSERT INTO `city` VALUES ('1', '北京'), ('2', '上海'), ('3', '广州'), ('4', '深圳'), ('5', '杭州'), ('6', '成都'), ('7', '南京'), ('8', '武汉'), ('9', '西安'), ('10', '长沙'), ('11', '苏州'), ('12', '天津');
COMMIT;

-- ----------------------------
--  `education` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `school` varchar(50) NOT NULL COMMENT '学校名称',
  `qualification` varchar(50) NOT NULL COMMENT '资质',
  `date` varchar(20) NOT NULL COMMENT '开始截止时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `resume_id` int(11) unsigned NOT NULL COMMENT 'resume_id',
  PRIMARY KEY (`id`),
  KEY `resume_id` (`resume_id`),
  CONSTRAINT `resume_id` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `education` 数据
-- ----------------------------
BEGIN;
INSERT INTO `education` VALUES ('2', '测试下学校11', '教授', '2013年~2017年', '', '11'), ('4', '北理工啊', '教授', '2013年~2017年', '啊啊啊北理工', '13'), ('14', '北理工软件学院', '教授', '2013年~2017年', '大家好啊', '20'), ('15', '北理工', '教授', '2013年~2017年', '北理工北理工', '21'), ('16', '北理工', '本科生', '2013年~2017年', '在北理工读本科', '25');
COMMIT;

-- ----------------------------
--  `employee` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(12) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `job` varchar(50) NOT NULL DEFAULT '未填写' COMMENT '当前工作',
  `birthday` date NOT NULL DEFAULT '1970-01-01' COMMENT '生日',
  `address` varchar(50) NOT NULL DEFAULT '未填写',
  `phone` varchar(11) NOT NULL DEFAULT '未填写',
  `description` text COMMENT '自我介绍',
  `avatar` varchar(25) DEFAULT NULL COMMENT '保存的头像文件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `employee` 数据
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES ('14', 'noprom', 'e75ac7650bd8e4f435e0fb20b3f83f07', 'tyee.noprom@qq.com', '学生', '1995-01-03', '北京市', '18810965227', '大家好啊', null), ('15', 'noprom2', 'ff519128353e3afc1fdd00d197b5e5ad', 'tyee.noprom@qq.com', '数据分析师', '1990-01-27', '上海', '', '大家好啊', null), ('16', 'noprom3', '25d7e6f0e7db73f32ac62694c2f7d3c8', 'tyee.noprom@qq.com', '大数据平台架构师', '1990-01-27', '广州', '', '大家好啊', null), ('17', 'noprom4', '20fb37ff51e9d62fb0d439ddca25b609', 'tyee.noprom@qq.com', 'Spark专家', '1990-01-27', '深圳', '', '大家好啊', null), ('18', 'noprom5', 'ef6606b75e04d972715278be7ff9bbf7', 'tyee.noprom@qq.com', '可视化工程师', '1990-01-27', '美国', '', '大家好啊', null), ('19', 'noprom6', '226e6e2777b1c63b2efa6e7255234e80', 'tyee.noprom@qq.com', '数据科学家', '1990-01-27', '硅谷', '', '大家好啊', null), ('20', 'noprom7', '7b7b94ad5fd03f0aef2719013ee286c2', 'tyee.noprom@qq.com', 'ETL工程师', '1990-01-27', '中关村南大街', '', '大家好啊', null), ('21', 'noprom8', 'ede89ae65d9c41416e8e15a1c1f0a1ec', 'tyee.noprom@qq.com', 'Spark工程师', '1990-01-27', '中国北京', '', '大家好啊', null), ('22', 'noprom9', '641b859e35372cdcfb8dccb2f845f68a', 'tyee.noprom@qq.com', 'Hadoop工程师', '1990-01-27', '中国广州', '', '大家好啊', null), ('23', 'noprom10', '424c7e79f6e05e1752945a799b44fff7', 'tyee.noprom@qq.com', '数据分析师', '1990-01-27', '美国加州', '', '大家好啊', null), ('24', '小王', '7f0bc917f684c35367be9ea9c8c2ee67', 'tyee.noprom@qq.com', '未填写', '1970-01-01', '未填写', '未填写', null, null), ('25', 'wangtaoyi', '7f0bc917f684c35367be9ea9c8c2ee67', 'tyee.noprom@qq.com', '学生', '1995-07-01', '北京市', '18810965227', '大家好，我叫王韬懿，来自北京理工大学软件学院。', null);
COMMIT;

-- ----------------------------
--  `employer` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `employer`;
CREATE TABLE `employer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(12) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `employer` 数据
-- ----------------------------
BEGIN;
INSERT INTO `employer` VALUES ('1', 'employer1', '41daea986299574634a078f883b7db4c', 'tyee.noprom@qq.com'), ('2', 'employer2', '227d929ab80b06e7266fb4978c6cc65a', 'tyee.noprom@qq.com'), ('3', 'employer3', 'f84c2fdee0afefacb557958ec13d661a', 'tyee.noprom@qq.com');
COMMIT;

-- ----------------------------
--  `experience` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '称呼',
  `date` varchar(20) NOT NULL COMMENT '开始截止时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `resume_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resume_id` (`resume_id`),
  CONSTRAINT `resumeid` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `experience` 数据
-- ----------------------------
BEGIN;
INSERT INTO `experience` VALUES ('2', '架构师', '2013年~2017年', '新年好', '11'), ('4', '架构师啊', '2013年~2017年', '啊啊啊', '13'), ('14', '大数据分析师', '2013年~2017年', '啊啊', '20'), ('15', '数据分析师啊', '2013年~2017年', '大家好', '21'), ('16', '数据架构师', '2013年~2017年', '数据架构师4年', '25');
COMMIT;

-- ----------------------------
--  `job_category` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `job_category`;
CREATE TABLE `job_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '类别名称',
  `title` varchar(20) NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `job_category` 数据
-- ----------------------------
BEGIN;
INSERT INTO `job_category` VALUES ('1', 'etl', 'ETL工程师'), ('2', 'hadoop', 'Hadoop工程师'), ('3', 'spark', 'Spark工程师'), ('4', 'visualize', '可视化工程师'), ('5', 'analyze', '数据分析师'), ('6', 'scientist', '数据科学家'), ('7', 'architect', '大数据平台架构师');
COMMIT;

-- ----------------------------
--  `resume` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `employee_id` int(11) unsigned NOT NULL COMMENT 'employee_id',
  `highest_degree` varchar(20) NOT NULL COMMENT 'highest_academic',
  `experience` varchar(20) NOT NULL,
  `introduction` text NOT NULL,
  `job_category_ids` varchar(20) NOT NULL,
  `city_ids` varchar(20) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '是否可见，1=>可见,0=>不可见',
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `resume` 数据
-- ----------------------------
BEGIN;
INSERT INTO `resume` VALUES ('10', '测试一下啊啊', '14', '研究生', '3年', '大家新年好啊', '1,3', '2,4', '0'), ('11', '啊啊啊', '15', '研究生', '4年', '大家新年好啊大家新年好啊', '2,4', '2,4', '0'), ('12', '哈哈过年了', '16', '哦耶', '2年', '大家新年好啊', '2,3', '2,7', '1'), ('13', '第一份简历', '17', '研究生', '3年', '大家新年好啊', '1,3', '2,3', '1'), ('14', '嘿嘿啊', '18', '研究生', '3年', '大家好，过年了', '2,4', '1,3', '1'), ('16', '我就是测测', '19', '研究生啊', '3年', '大家新年好啊', '1,4', '2,4', '1'), ('17', '过年好啊', '20', '研究生', '3年', '大家新年好啊', '1,4,7', '1,3,4', '1'), ('18', '删删删', '21', '研究生', '3年', '大家新年好啊大家新年好啊', '1,3,4', '1,3,5', '1'), ('19', '我就测下哈哈', '22', '研究生', '3年', '大家新年好啊大家新年好啊', '1,3', '3,4', '1'), ('20', '测试一下简历啊', '23', '研究生', '3年', '大家好啊', '2,4,5', '1,3,4', '1'), ('21', '再来测试一下', '24', '研究生', '3年', '大家好啊', '1,3,4', '1,2', '1'), ('22', '在测试', '14', '研究生', '3年', '大家好呀', '3,5', '2,5', '0'), ('23', '大家好简历', '14', '研究生', '3年', '大家好啊', '2,4', '3,4', '0'), ('24', '再试一试', '14', '研究生', '3年', '大家好', '1,3', '2,3', '0'), ('25', '再试两次', '14', '研究生', '3年', '大家好啊', '2,4', '2,3', '0');
COMMIT;

-- ----------------------------
--  `skill` 表结构
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '技能名称',
  `percent` int(5) NOT NULL COMMENT '百分比',
  `resume_id` int(11) unsigned NOT NULL COMMENT 'resume_id',
  PRIMARY KEY (`id`),
  KEY `resume_id` (`resume_id`),
  CONSTRAINT `resume` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  `skill` 数据
-- ----------------------------
BEGIN;
INSERT INTO `skill` VALUES ('1', 'Spark', '200', '10'), ('2', 'spark11', '80', '11'), ('3', 'Spark11', '100', '11'), ('4', 'Hadoop', '100', '12'), ('5', 'spark', '100', '13'), ('6', 'Hadoop', '100', '13'), ('11', 'Hadoop', '100', '20'), ('12', 'Spark', '100', '21'), ('13', 'Spark', '100', '25');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
