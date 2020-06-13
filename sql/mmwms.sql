/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50643
Source Host           : 127.0.0.1:3306
Source Database       : mmwms

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2020-06-13 22:03:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.meimos.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E6D65696D6F732E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E6D65696D6F732E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400134C6A6176612F74696D652F496E7374616E743B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770D02000000005AAB3AEC0000000078707074000070707371007E000F770D02000000005EE4D7A626906FC0787400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.meimos.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E6D65696D6F732E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E6D65696D6F732E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400134C6A6176612F74696D652F496E7374616E743B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770D02000000005AAB3AEC0000000078707074000070707371007E000F770D02000000005EE4D7A626906FC0787400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.meimos.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E6D65696D6F732E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E6D65696D6F732E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400134C6A6176612F74696D652F496E7374616E743B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770D02000000005AAB3AEC0000000078707074000070707371007E000F770D02000000005EE4D7A626906FC0787400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LAPTOP-JC5UL8JP1592055718444', '1592056982502', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1592055720000', '-1', '5', 'PAUSED', 'CRON', '1592055718000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1592055720000', '-1', '5', 'PAUSED', 'CRON', '1592055718000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1592055720000', '-1', '5', 'PAUSED', 'CRON', '1592055718000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'aaaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:22:05');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:22:18');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:22:25');
INSERT INTO `sys_logininfor` VALUES ('103', 'dasdas', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:23:22');
INSERT INTO `sys_logininfor` VALUES ('104', 'sadsdsad', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:24:41');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:24:48');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:24:52');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:24:54');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 19:24:55');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 19:26:11');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 19:40:08');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 20:46:09');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-27 22:46:02');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 22:46:10');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 22:46:18');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 22:46:24');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 23:04:53');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-27 23:05:09');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 08:08:09');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 08:08:33');
INSERT INTO `sys_logininfor` VALUES ('120', 'mmwmss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-28 11:41:11');
INSERT INTO `sys_logininfor` VALUES ('121', 'mmwmss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 11:41:15');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 11:41:28');
INSERT INTO `sys_logininfor` VALUES ('123', 'mmwmss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 11:41:54');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 12:48:19');
INSERT INTO `sys_logininfor` VALUES ('125', 'mmwmss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 12:48:54');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 12:49:52');
INSERT INTO `sys_logininfor` VALUES ('127', 'mmwmss', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 12:56:05');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 13:06:14');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 14:40:18');
INSERT INTO `sys_logininfor` VALUES ('130', 'aaaaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-28 15:13:53');
INSERT INTO `sys_logininfor` VALUES ('131', 'aaaaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-28 15:14:14');
INSERT INTO `sys_logininfor` VALUES ('132', 'aaaaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 15:14:16');
INSERT INTO `sys_logininfor` VALUES ('133', 'aaaaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-05-28 15:52:46');
INSERT INTO `sys_logininfor` VALUES ('134', 'aaaaaa', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 15:52:48');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 16:00:31');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 19:29:13');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 19:39:12');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 19:42:03');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 19:44:46');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 19:51:47');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 20:22:29');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 21:34:13');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 21:59:30');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 22:13:45');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-28 22:51:51');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-29 09:25:33');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-13 21:54:54');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `sort_no` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `langKey` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统', '0', '1', 'system', null, 'M', '0', '', 'anticon-dashboard', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('20', '系统管理', '1', '2', 'tool', null, 'M', '0', '', 'anticon-rocket', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('30', '系统工具', '1', '3', 'monitor', null, 'M', '0', '', 'anticon-rocket', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('40', '开发工具', '1', '3', 'monitor', '', 'M', '0', '', 'anticon-rocket', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '20', '1', '/sys/user', 'sys.manage.user', 'C', '0', 'system:user:list', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '20', '2', '/sys/role', 'sys.manage.role', 'C', '0', 'system:role:list', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '20', '3', '/sys/menu', 'sys.manage.menu', 'C', '0', 'system:menu:list', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '20', '6', '/sys/dict', 'sys.manage.dict', 'C', '0', 'system:dict:list', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '20', '7', '/sys/config', 'sys.manage.config', 'C', '0', 'system:config:list', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '20', '8', '/sys/notice', 'sys.manage.notice', 'C', '0', 'system:notice:list', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '20', '9', '/sys/log', 'sys.manage.log', 'M', '0', '', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '30', '1', '/monitor/online', 'monitor.manage.online', 'C', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '30', '2', '/monitor/job', 'monitor.manage.job', 'C', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '30', '3', 'druid', 'monitor.manage.druid', 'C', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '30', '4', '/monitor/server', 'monitor.manage.server', 'C', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '40', '1', 'build', 'tool/build/index', 'C', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '40', '2', 'gen', 'tool/gen/index', 'C', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '40', '3', 'swagger', 'tool/swagger/index', 'C', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('116', '流水号配置', '20', '1', '/sys/sno', 'sys.manage.sno', 'C', '0', 'system:user:list', 'anticon-appstore', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'sys.manage.log.oper', 'C', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'sys.manage.log.login', 'C', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', 'F', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', 'F', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', 'F', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', 'F', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', 'F', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', 'F', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', 'F', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', 'F', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', 'F', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', 'F', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', 'F', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', 'F', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '114', '1', '#', '', 'F', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '114', '2', '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '114', '3', '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '114', '2', '#', '', 'F', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '114', '4', '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '114', '5', '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '2', 'com.meimos.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"meimoTest\",\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"updateTime\":\"2020-05-27T14:11:38.995Z\",\"params\":{},\"sortNo\":\"2\",\"createTime\":\"2020-05-27T14:11:38.995Z\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"sex\":\"1\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"updateTime\":\"2020-05-27T14:11:38.994Z\",\"avatar\":\"\",\"params\":{},\"userName\":\"meimos\",\"userId\":2,\"createBy\":\"admin\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"roleIds\":[2,3],\"createTime\":\"2018-03-16T03:33:00Z\",\"phone\":\"15666666666\",\"updateBy\":\"admin\",\"loginIp\":\"127.0.0.1\",\"email\":\"meimoTest@126.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-27 22:12:08');
INSERT INTO `sys_oper_log` VALUES ('101', '用户管理', '2', 'com.meimos.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"meimoTes\",\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"updateTime\":\"2020-05-27T14:13:15.414Z\",\"params\":{},\"sortNo\":\"2\",\"createTime\":\"2020-05-27T14:13:15.414Z\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"},{\"flag\":false,\"roleId\":3,\"admin\":false,\"updateTime\":\"2020-05-27T14:13:15.414Z\",\"params\":{},\"sortNo\":\"3\",\"createTime\":\"2020-05-27T14:13:15.414Z\",\"roleKey\":\"user\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"sex\":\"1\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"updateTime\":\"2020-05-27T14:13:15.414Z\",\"avatar\":\"\",\"params\":{},\"userName\":\"meimos\",\"userId\":2,\"createBy\":\"admin\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"roleIds\":[2,3],\"createTime\":\"2018-03-16T03:33:00Z\",\"phone\":\"15666666666\",\"updateBy\":\"admin\",\"loginIp\":\"127.0.0.1\",\"email\":\"meimoTest@126.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-27 22:13:21');
INSERT INTO `sys_oper_log` VALUES ('102', '用户管理', '2', 'com.meimos.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"meimoTes\",\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"updateTime\":\"2020-05-27T14:15:18.681Z\",\"params\":{},\"sortNo\":\"2\",\"createTime\":\"2020-05-27T14:15:18.681Z\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"},{\"flag\":false,\"roleId\":3,\"admin\":false,\"updateTime\":\"2020-05-27T14:15:18.682Z\",\"params\":{},\"sortNo\":\"3\",\"createTime\":\"2020-05-27T14:15:18.682Z\",\"roleKey\":\"user\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"sex\":\"1\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"测试员\",\"updateTime\":\"2020-05-27T14:15:18.680Z\",\"avatar\":\"\",\"params\":{},\"userName\":\"meimos\",\"userId\":2,\"createBy\":\"admin\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"roleIds\":[2,3,1],\"createTime\":\"2018-03-16T03:33:00Z\",\"phone\":\"15666666666\",\"updateBy\":\"admin\",\"loginIp\":\"127.0.0.1\",\"email\":\"meimoTest@126.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-27 22:15:25');
INSERT INTO `sys_oper_log` VALUES ('103', '用户管理', '1', 'com.meimos.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"sssssss\",\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-27T14:16:17.097Z\",\"params\":{},\"userName\":\"ssssss\",\"createBy\":\"admin\",\"roleIds\":[1,2],\"createTime\":\"2020-05-27T14:16:17.096Z\",\"phone\":\"111\",\"email\":\"sss@qq.com\",\"status\":\"true\"}', 'null', '1', '', '2020-05-27 22:16:17');
INSERT INTO `sys_oper_log` VALUES ('104', '用户管理', '1', 'com.meimos.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"sssssss\",\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-27T14:27:53.641Z\",\"params\":{},\"userName\":\"ssssss\",\"createBy\":\"admin\",\"password\":\"$2a$10$foEmOP3CGUXipizp7E4DCuSyxBC9TvPGxd/btdRcJFOWajdfJ8ZWC\",\"roleIds\":[1],\"createTime\":\"2020-05-27T14:27:53.641Z\",\"phone\":\"111\",\"email\":\"ss@163.com\",\"status\":\"true\"}', 'null', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may involve com.meimos.project.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            user_name,       nick_name,       email,             phone,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2020-05-27 22:27:53');
INSERT INTO `sys_oper_log` VALUES ('105', '用户管理', '1', 'com.meimos.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"sssssss\",\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-27T14:28:02.890Z\",\"params\":{},\"userName\":\"ssssss\",\"createBy\":\"admin\",\"password\":\"$2a$10$oyG/XD1cQeFU2MHS9ZfjiOcXl3mV/IQmhQCHVI4fAPKsgx3RD64I6\",\"roleIds\":[1],\"createTime\":\"2020-05-27T14:28:02.890Z\",\"phone\":\"111\",\"email\":\"ss@163.com\",\"status\":\"true\"}', 'null', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may involve com.meimos.project.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            user_name,       nick_name,       email,             phone,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2020-05-27 22:28:03');
INSERT INTO `sys_oper_log` VALUES ('106', '用户管理', '1', 'com.meimos.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"sssssss\",\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-27T14:28:07.038Z\",\"params\":{},\"userName\":\"ssssss\",\"createBy\":\"admin\",\"password\":\"$2a$10$SRE.ucOr9xPLPX6rLtgDTOf4lpYbdRAD/ELiXuhEadI5pHzJZBP6O\",\"roleIds\":[1],\"createTime\":\"2020-05-27T14:28:07.038Z\",\"phone\":\"111\",\"email\":\"ss@163.com\",\"status\":\"true\"}', 'null', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may involve com.meimos.project.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(            user_name,       nick_name,       email,             phone,       sex,       password,       status,       create_by,            create_time    )values(            ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2020-05-27 22:28:07');
INSERT INTO `sys_oper_log` VALUES ('107', '用户管理', '1', 'com.meimos.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"ssssss\",\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-27T14:33:20.289Z\",\"params\":{},\"userName\":\"sssssss\",\"userId\":100,\"createBy\":\"admin\",\"password\":\"$2a$10$.Kno.F0n09TtqEHUNKJLretYYxZorrKle3S5br2hQsKOhhY7Lrt96\",\"roleIds\":[1,2],\"createTime\":\"2020-05-27T14:33:20.289Z\",\"phone\":\"sss\",\"email\":\"ss@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-27 22:33:20');
INSERT INTO `sys_oper_log` VALUES ('108', '用户管理', '2', 'com.meimos.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"ssssss\",\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"updateTime\":\"2020-05-27T14:33:55.345Z\",\"params\":{},\"sortNo\":\"1\",\"createTime\":\"2020-05-27T14:33:55.345Z\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"},{\"flag\":false,\"roleId\":2,\"admin\":false,\"updateTime\":\"2020-05-27T14:33:55.345Z\",\"params\":{},\"sortNo\":\"2\",\"createTime\":\"2020-05-27T14:33:55.345Z\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-27T14:33:55.345Z\",\"avatar\":\"\",\"params\":{},\"userName\":\"sssssss\",\"userId\":100,\"createBy\":\"admin\",\"password\":\"$2a$10$.Kno.F0n09TtqEHUNKJLretYYxZorrKle3S5br2hQsKOhhY7Lrt96\",\"roleIds\":[1],\"createTime\":\"2020-05-27T14:33:20Z\",\"phone\":\"sss\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"ss@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-27 22:33:58');
INSERT INTO `sys_oper_log` VALUES ('109', '用户管理', '5', 'com.meimos.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"451ff1aa-8958-4b79-862c-81bdcfe7bef9_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-28 08:25:05');
INSERT INTO `sys_oper_log` VALUES ('110', '用户管理', '5', 'com.meimos.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"53fcbcb2-ae06-40bc-8c06-3d226b97ccb6_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-28 08:32:19');
INSERT INTO `sys_oper_log` VALUES ('111', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"remark\":\"普通角色\",\"updateTime\":\"2020-05-28T02:09:38.271Z\",\"params\":{},\"sortNo\":\"3\",\"createTime\":\"2018-03-16T03:33:00Z\",\"roleKey\":\"user\",\"roleName\":\"普通角色\",\"menuIds\":[],\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2020-05-28 10:09:40');
INSERT INTO `sys_oper_log` VALUES ('112', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"remark\":\"普通角色\",\"updateTime\":\"2020-05-28T02:09:38.271Z\",\"params\":{},\"sortNo\":\"3\",\"createTime\":\"2018-03-16T03:33:00Z\",\"roleKey\":\"user\",\"roleName\":\"普通角色\",\"menuIds\":[],\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2020-05-28 10:09:47');
INSERT INTO `sys_oper_log` VALUES ('113', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"remark\":\"普通角色\",\"updateTime\":\"2020-05-28T02:09:38.271Z\",\"params\":{},\"sortNo\":\"3\",\"createTime\":\"2018-03-16T03:33:00Z\",\"updateBy\":\"admin\",\"roleKey\":\"user\",\"roleName\":\"普通角色s\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 10:10:37');
INSERT INTO `sys_oper_log` VALUES ('114', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"remark\":\"普通角色\",\"updateTime\":\"2020-05-28T02:10:46.402Z\",\"params\":{},\"sortNo\":\"3\",\"createTime\":\"2018-03-16T03:33:00Z\",\"updateBy\":\"admin\",\"roleKey\":\"user\",\"roleName\":\"普通角色s\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 10:10:47');
INSERT INTO `sys_oper_log` VALUES ('115', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"remark\":\"普通角色\",\"updateTime\":\"2020-05-28T02:10:52.656Z\",\"params\":{},\"sortNo\":\"3\",\"createTime\":\"2018-03-16T03:33:00Z\",\"updateBy\":\"admin\",\"roleKey\":\"user\",\"roleName\":\"普通角色s\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 10:10:55');
INSERT INTO `sys_oper_log` VALUES ('116', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:41:26.933Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T02:41:26.933Z\",\"roleKey\":\"common\",\"roleName\":\"ss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'ss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:41:26');
INSERT INTO `sys_oper_log` VALUES ('117', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:42:33.017Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:42:33.017Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:42:33');
INSERT INTO `sys_oper_log` VALUES ('118', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:42:38.558Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:42:38.558Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:42:38');
INSERT INTO `sys_oper_log` VALUES ('119', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:43:23.311Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:43:23.311Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:43:23');
INSERT INTO `sys_oper_log` VALUES ('120', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:44:48.581Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:44:48.581Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:44:48');
INSERT INTO `sys_oper_log` VALUES ('121', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:44:56.005Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:44:56.005Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:44:56');
INSERT INTO `sys_oper_log` VALUES ('122', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:45:39.582Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:45:39.582Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:45:39');
INSERT INTO `sys_oper_log` VALUES ('123', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:45:45.001Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:45:45.001Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:45:45');
INSERT INTO `sys_oper_log` VALUES ('124', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:47:21.761Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:47:21.761Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:47:21');
INSERT INTO `sys_oper_log` VALUES ('125', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:47:25.181Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:47:25.181Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:47:25');
INSERT INTO `sys_oper_log` VALUES ('126', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:47:26.862Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:47:26.862Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:47:26');
INSERT INTO `sys_oper_log` VALUES ('127', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:48:15.158Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:48:15.158Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:48:15');
INSERT INTO `sys_oper_log` VALUES ('128', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:48:43.589Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:48:43.589Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:48:43');
INSERT INTO `sys_oper_log` VALUES ('129', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:50:09.423Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:50:09.423Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:50:09');
INSERT INTO `sys_oper_log` VALUES ('130', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:51:21.054Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:51:21.054Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:51:21');
INSERT INTO `sys_oper_log` VALUES ('131', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:52:04.681Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T02:52:04.681Z\",\"roleKey\":\"common\",\"roleName\":\"ss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'ss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:52:04');
INSERT INTO `sys_oper_log` VALUES ('132', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:52:57.814Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:52:57.814Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:52:57');
INSERT INTO `sys_oper_log` VALUES ('133', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:53:36.712Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:53:36.712Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:53:36');
INSERT INTO `sys_oper_log` VALUES ('134', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:54:40.049Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:54:40.049Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:54:40');
INSERT INTO `sys_oper_log` VALUES ('135', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:55:24.291Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:55:24.291Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:55:24');
INSERT INTO `sys_oper_log` VALUES ('136', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:55:32.630Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:55:32.630Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:55:32');
INSERT INTO `sys_oper_log` VALUES ('137', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:56:51.408Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:56:51.408Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:56:51');
INSERT INTO `sys_oper_log` VALUES ('138', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:56:54.332Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:56:54.332Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:56:54');
INSERT INTO `sys_oper_log` VALUES ('139', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:57:02.014Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:57:02.014Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:57:02');
INSERT INTO `sys_oper_log` VALUES ('140', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T02:57:07.925Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T02:57:07.925Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 10:57:07');
INSERT INTO `sys_oper_log` VALUES ('141', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T03:00:11.288Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T03:00:11.288Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 11:00:11');
INSERT INTO `sys_oper_log` VALUES ('142', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T03:06:09.723Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T03:06:09.723Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 11:06:09');
INSERT INTO `sys_oper_log` VALUES ('143', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T03:06:15.604Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T03:06:15.604Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 11:06:15');
INSERT INTO `sys_oper_log` VALUES ('144', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T03:30:30.339Z\",\"params\":{},\"sortNo\":\"22\",\"createTime\":\"2020-05-28T03:30:30.339Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 11:30:30');
INSERT INTO `sys_oper_log` VALUES ('145', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T03:35:30.217Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T03:35:30.217Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 11:35:30');
INSERT INTO `sys_oper_log` VALUES ('146', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"updateTime\":\"2020-05-28T03:35:33.278Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T03:35:33.278Z\",\"roleKey\":\"admin\",\"roleName\":\"sss\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'sss\'失败，角色权限已存在\",\"code\":500}', '0', null, '2020-05-28 11:35:33');
INSERT INTO `sys_oper_log` VALUES ('147', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T03:36:18.441Z\",\"params\":{},\"sortNo\":\"10\",\"createBy\":\"admin\",\"createTime\":\"2020-05-28T03:36:18.441Z\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[100,101,102],\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'dataScope\' in \'class com.meimos.project.system.domain.SysRole\'', '2020-05-28 11:36:18');
INSERT INTO `sys_oper_log` VALUES ('148', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T03:36:27.824Z\",\"params\":{},\"sortNo\":\"10\",\"createBy\":\"admin\",\"createTime\":\"2020-05-28T03:36:27.824Z\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[100,101,102],\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'dataScope\' in \'class com.meimos.project.system.domain.SysRole\'', '2020-05-28 11:36:27');
INSERT INTO `sys_oper_log` VALUES ('149', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T03:36:53.282Z\",\"params\":{},\"sortNo\":\"10\",\"createBy\":\"admin\",\"createTime\":\"2020-05-28T03:36:53.282Z\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[100,101,102],\"status\":\"0\"}', 'null', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'dataScope\' in \'class com.meimos.project.system.domain.SysRole\'', '2020-05-28 11:36:53');
INSERT INTO `sys_oper_log` VALUES ('150', '角色管理', '1', 'com.meimos.project.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T03:38:46.457Z\",\"params\":{},\"sortNo\":\"10\",\"createBy\":\"admin\",\"createTime\":\"2020-05-28T03:38:46.457Z\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[100,101,102],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 11:38:46');
INSERT INTO `sys_oper_log` VALUES ('151', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T03:39:07.348Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T03:38:46Z\",\"updateBy\":\"admin\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[100,101,102,113],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 11:39:20');
INSERT INTO `sys_oper_log` VALUES ('152', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T03:39:29.427Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T03:38:46Z\",\"updateBy\":\"admin\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[100,101,102],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 11:39:32');
INSERT INTO `sys_oper_log` VALUES ('153', '用户管理', '1', 'com.meimos.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"mmwmss\",\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-28T03:40:34.523Z\",\"params\":{},\"userName\":\"meimos\",\"password\":\"111\",\"createTime\":\"2020-05-28T03:40:34.523Z\",\"email\":\"meimos@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"新增用户\'meimos\'失败，登录账号已存在\",\"code\":500}', '0', null, '2020-05-28 11:40:34');
INSERT INTO `sys_oper_log` VALUES ('154', '用户管理', '1', 'com.meimos.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"mmwmss\",\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-28T03:40:56.401Z\",\"params\":{},\"userName\":\"mmwmss\",\"userId\":101,\"createBy\":\"admin\",\"password\":\"$2a$10$l6fs7cHEgDeStvRmirpE5e/PEKXRu6OF9rt/XXwB0gh.1JBXWoPo.\",\"createTime\":\"2020-05-28T03:40:56.401Z\",\"email\":\"meimos@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 11:40:56');
INSERT INTO `sys_oper_log` VALUES ('155', '用户管理', '2', 'com.meimos.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"mmwmss\",\"roles\":[],\"sex\":\"0\",\"admin\":false,\"updateTime\":\"2020-05-28T03:41:35.218Z\",\"avatar\":\"\",\"params\":{},\"userName\":\"mmwmss\",\"userId\":101,\"createBy\":\"admin\",\"password\":\"$2a$10$l6fs7cHEgDeStvRmirpE5e/PEKXRu6OF9rt/XXwB0gh.1JBXWoPo.\",\"roleIds\":[100],\"createTime\":\"2020-05-28T03:40:56Z\",\"phone\":\"\",\"updateBy\":\"admin\",\"loginIp\":\"\",\"email\":\"meimos@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 11:41:46');
INSERT INTO `sys_oper_log` VALUES ('156', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T04:48:25.761Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T03:38:46Z\",\"updateBy\":\"admin\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 12:48:40');
INSERT INTO `sys_oper_log` VALUES ('157', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T04:49:59.962Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T03:38:46Z\",\"updateBy\":\"admin\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 12:50:15');
INSERT INTO `sys_oper_log` VALUES ('158', '角色管理', '2', 'com.meimos.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"remark\":\"测试角色\",\"updateTime\":\"2020-05-28T04:54:03.909Z\",\"params\":{},\"sortNo\":\"10\",\"createTime\":\"2020-05-28T03:38:46Z\",\"updateBy\":\"admin\",\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"menuIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-28 12:54:17');
INSERT INTO `sys_oper_log` VALUES ('159', '用户管理', '2', 'com.meimos.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"nickName\":\"adminstrator\",\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"updateTime\":\"2020-05-29T02:04:38.220Z\",\"params\":{},\"sortNo\":\"1\",\"createTime\":\"2020-05-29T02:04:38.220Z\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"sex\":\"1\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"updateTime\":\"2020-05-29T02:04:38.220Z\",\"avatar\":\"\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"roleIds\":[1],\"createTime\":\"2018-03-16T03:33:00Z\",\"phone\":\"15888888888\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"status\":\"0\"}', 'null', '1', '不允许操作超级管理员用户', '2020-05-29 10:04:57');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `sort_no` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
INSERT INTO `sys_role` VALUES ('3', '普通角色s', 'user', '3', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-05-28 10:10:55', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '测试角色', 'test', '10', '0', 'admin', '2020-05-28 11:38:46', 'admin', '2020-05-28 12:54:17', '测试角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('100', '1');

-- ----------------------------
-- Table structure for sys_sno
-- ----------------------------
DROP TABLE IF EXISTS `sys_sno`;
CREATE TABLE `sys_sno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `regulation` varchar(128) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `alias` varchar(32) DEFAULT NULL,
  `gen_type` smallint(6) DEFAULT NULL,
  `no_length` int(11) DEFAULT NULL,
  `cur_date` varchar(32) DEFAULT NULL,
  `init_value` int(11) DEFAULT NULL,
  `cur_value` int(11) DEFAULT NULL,
  `step` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sno
-- ----------------------------
INSERT INTO `sys_sno` VALUES ('1', 'INB-{yyyy}{MM}{DD}{NO}', '入库单测试', 'inbound_bill_no', '0', '5', null, '0', '1', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` timestamp NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'adminstrator', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES ('2', 'meimos', 'meimoTes', '00', 'meimoTest@126.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2020-05-27 22:15:25', '测试员');
INSERT INTO `sys_user` VALUES ('100', 'sssssss', 'ssssss', '00', 'ss@qq.com', 'sss', '0', '', '$2a$10$.Kno.F0n09TtqEHUNKJLretYYxZorrKle3S5br2hQsKOhhY7Lrt96', '0', '', null, 'admin', '2020-05-27 22:33:20', 'admin', '2020-05-27 22:33:58', null);
INSERT INTO `sys_user` VALUES ('101', 'aaaaaa', 'mmwmss', '00', 'meimos@gmail.com', '', '0', '', '$2a$10$l6fs7cHEgDeStvRmirpE5e/PEKXRu6OF9rt/XXwB0gh.1JBXWoPo.', '0', '', null, 'admin', '2020-05-28 11:40:56', 'admin', '2020-05-28 11:41:46', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('2', '3');
INSERT INTO `sys_user_role` VALUES ('100', '1');
INSERT INTO `sys_user_role` VALUES ('101', '100');
