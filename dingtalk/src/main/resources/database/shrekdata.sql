/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : shrekdata

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-10-12 14:26:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dingtalk_cache
-- ----------------------------
DROP TABLE IF EXISTS `dingtalk_cache`;
CREATE TABLE `dingtalk_cache` (
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT 'key名',
  `value` varchar(255) NOT NULL COMMENT '值',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `corpid` varchar(255) NOT NULL COMMENT 'corpid',
  PRIMARY KEY (`key`,`corpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingtalk_cache
-- ----------------------------

-- ----------------------------
-- Table structure for report_test
-- ----------------------------
DROP TABLE IF EXISTS `report_test`;
CREATE TABLE `report_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` varchar(20) DEFAULT NULL,
  `report_user` int(11) DEFAULT NULL,
  `report_orderuser` int(11) DEFAULT NULL,
  `report_rate` decimal(10,3) DEFAULT NULL,
  `delete_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report_test
-- ----------------------------
INSERT INTO `report_test` VALUES ('1', '1/1', '1393', '1093', '0.320', '1');
INSERT INTO `report_test` VALUES ('2', '1/2', '3530', '3230', '0.260', '1');
INSERT INTO `report_test` VALUES ('3', '1/3', '2923', '2623', '0.760', '1');
INSERT INTO `report_test` VALUES ('4', '1/4', '1723', '1423', '0.490', '1');
INSERT INTO `report_test` VALUES ('5', '1/5', '3792', '3492', '0.323', '1');
INSERT INTO `report_test` VALUES ('6', '1/6', '4593', '4293', '0.780', '1');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  `delete_status` varchar(4) DEFAULT NULL COMMENT '删除字段',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段',
  `usable` tinyint(4) DEFAULT NULL COMMENT '是否禁用',
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `pk_org` varchar(50) DEFAULT NULL COMMENT '分公司ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', '集团总公司', '1', '0', '1', '0', null);
INSERT INTO `sys_org` VALUES ('28', '分公司1', '1', '0', '1', '1', null);
INSERT INTO `sys_org` VALUES ('29', '分公司2', '1', '0', '1', '1', null);
INSERT INTO `sys_org` VALUES ('30', '分公司1', '2', '0', '1', '1', null);

-- ----------------------------
-- Table structure for sys_org_pk
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_pk`;
CREATE TABLE `sys_org_pk` (
  `pk_org` varchar(255) DEFAULT NULL,
  `pk_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org_pk
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '自定id,主要供前端展示权限列表分类排序使用.',
  `menu_code` varchar(255) DEFAULT '' COMMENT '归属菜单,前端判断并展示菜单使用,',
  `menu_name` varchar(255) DEFAULT '' COMMENT '菜单的中文释义',
  `permission_code` varchar(255) DEFAULT '' COMMENT '权限的代码/通配符,对应代码中@RequiresPermissions 的value',
  `permission_name` varchar(255) DEFAULT '' COMMENT '本权限的中文释义',
  `required_permission` tinyint(1) DEFAULT '2' COMMENT '是否本菜单必选权限, 1.必选 2非必选 通常是"列表"权限是必选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('101', 'user', '用户', 'user:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('102', 'user', '用户', 'user:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('103', 'user', '用户', 'user:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('104', 'user', '用户', 'user:delete', '删除', '2');
INSERT INTO `sys_permission` VALUES ('201', 'webchattxll', '微信通讯录', 'webchattxll:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('301', 'role', '角色权限', 'role:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('302', 'role', '角色权限', 'role:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('303', 'role', '角色权限', 'role:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('304', 'role', '角色权限', 'role:delete', '删除', '2');
INSERT INTO `sys_permission` VALUES ('501', 'org', '组织管理', 'org:list', '列表', '1');
INSERT INTO `sys_permission` VALUES ('502', 'org', '组织管理', 'org:add', '新增', '2');
INSERT INTO `sys_permission` VALUES ('503', 'org', '组织管理', 'org:update', '修改', '2');
INSERT INTO `sys_permission` VALUES ('504', 'org', '组织管理', 'org:delete', '删除', '2');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1有效  2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '2017-11-22 16:24:34', '2017-11-22 16:24:52', '1');
INSERT INTO `sys_role` VALUES ('4', '普通管理员', '2018-11-02 13:46:12', null, '1');
INSERT INTO `sys_role` VALUES ('5', '测试角色', '2018-11-05 09:12:20', null, '1');
INSERT INTO `sys_role` VALUES ('6', 'test测试', '2019-01-25 09:08:04', null, '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` varbinary(30) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效 1有效     2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('87', '4', '101', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('88', '4', '102', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('89', '4', '103', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('90', '4', '104', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('91', '4', '201', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('92', '4', '301', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('93', '4', '302', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('94', '4', '303', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('95', '4', '304', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('96', '4', '504', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('97', '4', '501', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('98', '4', '503', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('99', '4', '502', '2019-01-24 16:01:17', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('100', '5', '501', '2019-01-24 16:01:36', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('101', '5', '502', '2019-01-24 16:01:36', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('102', '5', '503', '2019-01-24 16:01:36', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('103', '5', '504', '2019-01-24 16:01:36', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('104', '6', '101', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('105', '6', '201', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('106', '6', '102', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('107', '6', '103', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('108', '6', '104', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('109', '6', '301', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('110', '6', '302', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('111', '6', '303', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');
INSERT INTO `sys_role_permission` VALUES ('112', '6', '304', '2019-01-25 09:08:04', 0x303030302D30302D30302030303A30303A3030, '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '姓名',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1有效  2无效',
  `web_username` varchar(255) DEFAULT NULL COMMENT '微信用户ID',
  `org_id` int(11) DEFAULT NULL COMMENT '分公司ID',
  `ic_number` varchar(255) DEFAULT NULL COMMENT 'IC卡号',
  `acatar` varchar(255) DEFAULT NULL COMMENT '图片',
  `bsncode` varchar(255) DEFAULT NULL COMMENT '工号',
  `oldbsncode` varchar(255) DEFAULT NULL COMMENT '旧工号',
  `certificateno` varchar(255) DEFAULT NULL COMMENT '资格证号',
  `org_pk` varchar(50) DEFAULT NULL COMMENT '分公司ID',
  `org_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('10003', 'admin', '1111111', '18973393178', '超级用户', '1', '2017-10-30 11:52:38', '2017-11-17 23:51:40', '1', '', '28', '', null, null, null, null, 'fengongsi1', null);
INSERT INTO `sys_user` VALUES ('10040', '000005', '111111', null, 'shrek', '1', '2018-09-28 14:57:33', null, '1', '000005', '27', '', 'http://p.qlogo.cn/bizmail/YMQ6bdGdByaKPkYUr8Ee2iavejNvK6ygdqGpBs4KEn8HJOWXo45ib0FQ/0', null, null, null, 'fengongsi1', null);
INSERT INTO `sys_user` VALUES ('10106', 'test1', '111234', '18973393178', 'test1', '6', '2019-01-25 09:09:22', null, '1', 'test1', '28', '', null, null, null, null, 'fengongsi1', null);


