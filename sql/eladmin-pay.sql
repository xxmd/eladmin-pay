/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 9.6.0 : Database - eladmin-pay
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eladmin-pay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `eladmin-pay`;

/*Table structure for table `code_column` */

DROP TABLE IF EXISTS `code_column`;

CREATE TABLE `code_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(180) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名',
  `column_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库字段名称',
  `column_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库字段类型',
  `dict_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `extra` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字段额外的参数',
  `form_show` bit(1) DEFAULT NULL COMMENT '是否表单显示',
  `form_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表单类型',
  `key_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库字段键类型',
  `list_show` bit(1) DEFAULT NULL COMMENT '是否在列表显示',
  `not_null` bit(1) DEFAULT NULL COMMENT '是否为空',
  `query_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '查询类型',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `date_annotation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日期注解',
  PRIMARY KEY (`column_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';

/*Data for the table `code_column` */

/*Table structure for table `code_config` */

DROP TABLE IF EXISTS `code_config`;

CREATE TABLE `code_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名',
  `author` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`config_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='代码生成器配置';

/*Data for the table `code_config` */

/*Table structure for table `mnt_app` */

DROP TABLE IF EXISTS `mnt_app`;

CREATE TABLE `mnt_app` (
  `app_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用名称',
  `upload_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上传目录',
  `deploy_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部署路径',
  `backup_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备份路径',
  `port` int DEFAULT NULL COMMENT '应用端口',
  `start_script` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '启动脚本',
  `deploy_script` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部署脚本',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='应用管理';

/*Data for the table `mnt_app` */

/*Table structure for table `mnt_database` */

DROP TABLE IF EXISTS `mnt_database`;

CREATE TABLE `mnt_database` (
  `db_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `jdbc_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'jdbc连接',
  `user_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `pwd` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`db_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='数据库管理';

/*Data for the table `mnt_database` */

/*Table structure for table `mnt_deploy` */

DROP TABLE IF EXISTS `mnt_deploy`;

CREATE TABLE `mnt_deploy` (
  `deploy_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` bigint DEFAULT NULL COMMENT '应用编号',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`deploy_id`) USING BTREE,
  KEY `idx_app_id` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部署管理';

/*Data for the table `mnt_deploy` */

/*Table structure for table `mnt_deploy_history` */

DROP TABLE IF EXISTS `mnt_deploy_history`;

CREATE TABLE `mnt_deploy_history` (
  `history_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `app_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用名称',
  `deploy_date` datetime NOT NULL COMMENT '部署日期',
  `deploy_user` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '部署用户',
  `ip` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务器IP',
  `deploy_id` bigint DEFAULT NULL COMMENT '部署编号',
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部署历史管理';

/*Data for the table `mnt_deploy_history` */

/*Table structure for table `mnt_deploy_server` */

DROP TABLE IF EXISTS `mnt_deploy_server`;

CREATE TABLE `mnt_deploy_server` (
  `deploy_id` bigint NOT NULL COMMENT '部署ID',
  `server_id` bigint NOT NULL COMMENT '服务ID',
  PRIMARY KEY (`deploy_id`,`server_id`) USING BTREE,
  KEY `idx_deploy_id` (`deploy_id`),
  KEY `idx_server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='应用与服务器关联';

/*Data for the table `mnt_deploy_server` */

/*Table structure for table `mnt_server` */

DROP TABLE IF EXISTS `mnt_server`;

CREATE TABLE `mnt_server` (
  `server_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `ip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `port` int DEFAULT NULL COMMENT '端口',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`server_id`) USING BTREE,
  KEY `idx_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='服务器管理';

/*Data for the table `mnt_server` */

/*Table structure for table `pay_merchant` */

DROP TABLE IF EXISTS `pay_merchant`;

CREATE TABLE `pay_merchant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `platform_id` bigint DEFAULT NULL,
  `merchant_id` bigint DEFAULT NULL,
  `md5_secret_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统用户';

/*Data for the table `pay_merchant` */

insert  into `pay_merchant`(`id`,`platform_id`,`merchant_id`,`md5_secret_key`,`remark`,`create_time`,`create_by`,`update_time`,`update_by`) values 
(3,2,1031,'6OuEX7E7diz6R4070IUWOO0d06r001e1',NULL,'2026-07-05 00:20:13','admin','2026-07-05 00:20:13','admin');

/*Table structure for table `pay_platform` */

DROP TABLE IF EXISTS `pay_platform`;

CREATE TABLE `pay_platform` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `endpoint` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统用户';

/*Data for the table `pay_platform` */

insert  into `pay_platform`(`id`,`name`,`endpoint`,`website`,`contact`,`remark`,`create_time`,`create_by`,`update_time`,`update_by`) values 
(2,'飞飞支付','https://66.hm659.org/','https://66.hm659.org/','Telegram_@aoaozf1bot',NULL,'2026-07-05 00:13:26','admin','2026-07-05 00:13:26','admin');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint DEFAULT NULL COMMENT '上级部门',
  `sub_count` int DEFAULT '0' COMMENT '子部门数目',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `dept_sort` int DEFAULT '999' COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `idx_pid` (`pid`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部门';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`pid`,`sub_count`,`name`,`dept_sort`,`enabled`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(2,7,1,'研发部',3,'','admin','admin','2019-03-25 09:15:32','2020-08-02 14:48:47'),
(5,7,0,'运维部',4,'','admin','admin','2019-03-25 09:20:44','2020-05-17 14:27:27'),
(6,8,0,'测试部',6,'','admin','admin','2019-03-25 09:52:18','2020-06-08 11:59:21'),
(7,NULL,2,'华南分部',0,'','admin','admin','2019-03-25 11:04:50','2020-06-08 12:08:56'),
(8,NULL,2,'华北分部',1,'','admin','admin','2019-03-25 11:04:53','2020-05-14 12:54:00'),
(15,8,0,'UI部门',7,'','admin','admin','2020-05-13 22:56:53','2020-05-14 12:54:13'),
(17,2,0,'研发一组',999,'','admin','admin','2020-08-02 14:49:07','2020-08-02 14:49:07');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='数据字典';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`dict_id`,`name`,`description`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(1,'user_status','用户状态',NULL,NULL,'2019-10-27 20:31:36',NULL),
(4,'dept_status','部门状态',NULL,NULL,'2019-10-27 20:31:36',NULL),
(5,'job_status','岗位状态',NULL,'admin','2019-10-27 20:31:36','2025-01-14 15:48:29');

/*Table structure for table `sys_dict_detail` */

DROP TABLE IF EXISTS `sys_dict_detail`;

CREATE TABLE `sys_dict_detail` (
  `detail_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典值',
  `dict_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `idx_dict_id` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='数据字典详情';

/*Data for the table `sys_dict_detail` */

insert  into `sys_dict_detail`(`detail_id`,`dict_id`,`label`,`value`,`dict_sort`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(1,1,'激活','true',1,NULL,NULL,'2019-10-27 20:31:36',NULL),
(2,1,'禁用','false',2,NULL,NULL,NULL,NULL),
(3,4,'启用','true',1,NULL,NULL,NULL,NULL),
(4,4,'停用','false',2,NULL,NULL,'2019-10-27 20:31:36',NULL),
(5,5,'启用','true',1,NULL,NULL,NULL,NULL),
(6,5,'停用','false',2,NULL,NULL,'2019-10-27 20:31:36',NULL);

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(180) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='岗位';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`name`,`enabled`,`job_sort`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(8,'人事专员','',3,NULL,NULL,'2019-03-29 14:52:28',NULL),
(10,'产品经理','',4,NULL,NULL,'2019-03-29 14:55:51',NULL),
(11,'全栈开发','',2,NULL,'admin','2019-03-31 13:39:30','2020-05-05 11:33:43'),
(12,'软件测试','',5,NULL,'admin','2019-03-31 13:39:43','2020-05-10 19:56:26');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `log_type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志类型：INFI/ERROR',
  `method` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名',
  `params` text COLLATE utf8mb4_general_ci COMMENT '参数',
  `request_ip` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求IP',
  `time` bigint DEFAULT NULL COMMENT '执行时间',
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `browser` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器',
  `exception_detail` text COLLATE utf8mb4_general_ci COMMENT '异常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `idx_create_time_index` (`create_time`),
  KEY `idx_log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3652 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`log_id`,`description`,`log_type`,`method`,`params`,`request_ip`,`time`,`username`,`address`,`browser`,`exception_detail`,`create_time`) values 
(3636,'用户登录','INFO','me.zhengjie.modules.security.rest.AuthController.login()','{\"code\":\"-4\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:3ae588ba66ae464baa1c58f7c6c55440\"}','172.31.80.1',372,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 21:05:17'),
(3637,'新增菜单','INFO','me.zhengjie.modules.system.rest.MenuController.createMenu()','{\"IFrame\":false,\"cache\":false,\"createBy\":\"admin\",\"createTime\":\"2026-07-04 21:05:39.531\",\"hidden\":false,\"id\":117,\"menuSort\":999,\"path\":\"/pay\",\"subCount\":0,\"title\":\"易支付\",\"type\":0,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 21:05:39.531\"}','172.31.80.1',62,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 21:05:40'),
(3638,'修改角色菜单','INFO','me.zhengjie.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":1,\"level\":3,\"menus\":[{\"id\":97,\"menuSort\":999,\"subCount\":0},{\"id\":98,\"menuSort\":999,\"subCount\":0},{\"id\":102,\"menuSort\":999,\"subCount\":0},{\"id\":103,\"menuSort\":999,\"subCount\":0},{\"id\":104,\"menuSort\":999,\"subCount\":0},{\"id\":105,\"menuSort\":999,\"subCount\":0},{\"id\":106,\"menuSort\":999,\"subCount\":0},{\"id\":107,\"menuSort\":999,\"subCount\":0},{\"id\":108,\"menuSort\":999,\"subCount\":0},{\"id\":109,\"menuSort\":999,\"subCount\":0},{\"id\":110,\"menuSort\":999,\"subCount\":0},{\"id\":111,\"menuSort\":999,\"subCount\":0},{\"id\":116,\"menuSort\":999,\"subCount\":0},{\"id\":117,\"menuSort\":999,\"subCount\":0},{\"id\":1,\"menuSort\":999,\"subCount\":0},{\"id\":2,\"menuSort\":999,\"subCount\":0},{\"id\":3,\"menuSort\":999,\"subCount\":0},{\"id\":5,\"menuSort\":999,\"subCount\":0},{\"id\":6,\"menuSort\":999,\"subCount\":0},{\"id\":7,\"menuSort\":999,\"subCount\":0},{\"id\":9,\"menuSort\":999,\"subCount\":0},{\"id\":10,\"menuSort\":999,\"subCount\":0},{\"id\":11,\"menuSort\":999,\"subCount\":0},{\"id\":14,\"menuSort\":999,\"subCount\":0},{\"id\":15,\"menuSort\":999,\"subCount\":0},{\"id\":18,\"menuSort\":999,\"subCount\":0},{\"id\":19,\"menuSort\":999,\"subCount\":0},{\"id\":21,\"menuSort\":999,\"subCount\":0},{\"id\":22,\"menuSort\":999,\"subCount\":0},{\"id\":23,\"menuSort\":999,\"subCount\":0},{\"id\":24,\"menuSort\":999,\"subCount\":0},{\"id\":27,\"menuSort\":999,\"subCount\":0},{\"id\":28,\"menuSort\":999,\"subCount\":0},{\"id\":30,\"menuSort\":999,\"subCount\":0},{\"id\":32,\"menuSort\":999,\"subCount\":0},{\"id\":33,\"menuSort\":999,\"subCount\":0},{\"id\":34,\"menuSort\":999,\"subCount\":0},{\"id\":35,\"menuSort\":999,\"subCount\":0},{\"id\":36,\"menuSort\":999,\"subCount\":0},{\"id\":37,\"menuSort\":999,\"subCount\":0},{\"id\":39,\"menuSort\":999,\"subCount\":0},{\"id\":41,\"menuSort\":999,\"subCount\":0},{\"id\":44,\"menuSort\":999,\"subCount\":0},{\"id\":45,\"menuSort\":999,\"subCount\":0},{\"id\":46,\"menuSort\":999,\"subCount\":0},{\"id\":48,\"menuSort\":999,\"subCount\":0},{\"id\":49,\"menuSort\":999,\"subCount\":0},{\"id\":50,\"menuSort\":999,\"subCount\":0},{\"id\":52,\"menuSort\":999,\"subCount\":0},{\"id\":53,\"menuSort\":999,\"subCount\":0},{\"id\":54,\"menuSort\":999,\"subCount\":0},{\"id\":56,\"menuSort\":999,\"subCount\":0},{\"id\":57,\"menuSort\":999,\"subCount\":0},{\"id\":58,\"menuSort\":999,\"subCount\":0},{\"id\":60,\"menuSort\":999,\"subCount\":0},{\"id\":61,\"menuSort\":999,\"subCount\":0},{\"id\":62,\"menuSort\":999,\"subCount\":0},{\"id\":64,\"menuSort\":999,\"subCount\":0},{\"id\":65,\"menuSort\":999,\"subCount\":0},{\"id\":66,\"menuSort\":999,\"subCount\":0},{\"id\":73,\"menuSort\":999,\"subCount\":0},{\"id\":74,\"menuSort\":999,\"subCount\":0},{\"id\":75,\"menuSort\":999,\"subCount\":0},{\"id\":77,\"menuSort\":999,\"subCount\":0},{\"id\":78,\"menuSort\":999,\"subCount\":0},{\"id\":79,\"menuSort\":999,\"subCount\":0},{\"id\":80,\"menuSort\":999,\"subCount\":0},{\"id\":82,\"menuSort\":999,\"subCount\":0},{\"id\":83,\"menuSort\":999,\"subCount\":0},{\"id\":90,\"menuSort\":999,\"subCount\":0},{\"id\":92,\"menuSort\":999,\"subCount\":0},{\"id\":93,\"menuSort\":999,\"subCount\":0},{\"id\":94,\"menuSort\":999,\"subCount\":0}]}','172.31.80.1',93,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 21:05:46'),
(3639,'新增菜单','INFO','me.zhengjie.modules.system.rest.MenuController.createMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"/pay/platform/index\",\"createBy\":\"admin\",\"createTime\":\"2026-07-04 22:00:26.456\",\"hidden\":false,\"id\":118,\"menuSort\":999,\"path\":\"/pay/platform/index\",\"permission\":\"pay:platform:read\",\"pid\":117,\"subCount\":0,\"title\":\"支付平台\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 22:00:26.456\"}','172.31.80.1',123,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:00:27'),
(3640,'修改角色菜单','INFO','me.zhengjie.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":1,\"level\":3,\"menus\":[{\"id\":97,\"menuSort\":999,\"subCount\":0},{\"id\":98,\"menuSort\":999,\"subCount\":0},{\"id\":102,\"menuSort\":999,\"subCount\":0},{\"id\":103,\"menuSort\":999,\"subCount\":0},{\"id\":104,\"menuSort\":999,\"subCount\":0},{\"id\":105,\"menuSort\":999,\"subCount\":0},{\"id\":106,\"menuSort\":999,\"subCount\":0},{\"id\":107,\"menuSort\":999,\"subCount\":0},{\"id\":108,\"menuSort\":999,\"subCount\":0},{\"id\":109,\"menuSort\":999,\"subCount\":0},{\"id\":110,\"menuSort\":999,\"subCount\":0},{\"id\":111,\"menuSort\":999,\"subCount\":0},{\"id\":116,\"menuSort\":999,\"subCount\":0},{\"id\":117,\"menuSort\":999,\"subCount\":0},{\"id\":118,\"menuSort\":999,\"subCount\":0},{\"id\":1,\"menuSort\":999,\"subCount\":0},{\"id\":2,\"menuSort\":999,\"subCount\":0},{\"id\":3,\"menuSort\":999,\"subCount\":0},{\"id\":5,\"menuSort\":999,\"subCount\":0},{\"id\":6,\"menuSort\":999,\"subCount\":0},{\"id\":7,\"menuSort\":999,\"subCount\":0},{\"id\":9,\"menuSort\":999,\"subCount\":0},{\"id\":10,\"menuSort\":999,\"subCount\":0},{\"id\":11,\"menuSort\":999,\"subCount\":0},{\"id\":14,\"menuSort\":999,\"subCount\":0},{\"id\":15,\"menuSort\":999,\"subCount\":0},{\"id\":18,\"menuSort\":999,\"subCount\":0},{\"id\":19,\"menuSort\":999,\"subCount\":0},{\"id\":21,\"menuSort\":999,\"subCount\":0},{\"id\":22,\"menuSort\":999,\"subCount\":0},{\"id\":23,\"menuSort\":999,\"subCount\":0},{\"id\":24,\"menuSort\":999,\"subCount\":0},{\"id\":27,\"menuSort\":999,\"subCount\":0},{\"id\":28,\"menuSort\":999,\"subCount\":0},{\"id\":30,\"menuSort\":999,\"subCount\":0},{\"id\":32,\"menuSort\":999,\"subCount\":0},{\"id\":33,\"menuSort\":999,\"subCount\":0},{\"id\":34,\"menuSort\":999,\"subCount\":0},{\"id\":35,\"menuSort\":999,\"subCount\":0},{\"id\":36,\"menuSort\":999,\"subCount\":0},{\"id\":37,\"menuSort\":999,\"subCount\":0},{\"id\":39,\"menuSort\":999,\"subCount\":0},{\"id\":41,\"menuSort\":999,\"subCount\":0},{\"id\":44,\"menuSort\":999,\"subCount\":0},{\"id\":45,\"menuSort\":999,\"subCount\":0},{\"id\":46,\"menuSort\":999,\"subCount\":0},{\"id\":48,\"menuSort\":999,\"subCount\":0},{\"id\":49,\"menuSort\":999,\"subCount\":0},{\"id\":50,\"menuSort\":999,\"subCount\":0},{\"id\":52,\"menuSort\":999,\"subCount\":0},{\"id\":53,\"menuSort\":999,\"subCount\":0},{\"id\":54,\"menuSort\":999,\"subCount\":0},{\"id\":56,\"menuSort\":999,\"subCount\":0},{\"id\":57,\"menuSort\":999,\"subCount\":0},{\"id\":58,\"menuSort\":999,\"subCount\":0},{\"id\":60,\"menuSort\":999,\"subCount\":0},{\"id\":61,\"menuSort\":999,\"subCount\":0},{\"id\":62,\"menuSort\":999,\"subCount\":0},{\"id\":64,\"menuSort\":999,\"subCount\":0},{\"id\":65,\"menuSort\":999,\"subCount\":0},{\"id\":66,\"menuSort\":999,\"subCount\":0},{\"id\":73,\"menuSort\":999,\"subCount\":0},{\"id\":74,\"menuSort\":999,\"subCount\":0},{\"id\":75,\"menuSort\":999,\"subCount\":0},{\"id\":77,\"menuSort\":999,\"subCount\":0},{\"id\":78,\"menuSort\":999,\"subCount\":0},{\"id\":79,\"menuSort\":999,\"subCount\":0},{\"id\":80,\"menuSort\":999,\"subCount\":0},{\"id\":82,\"menuSort\":999,\"subCount\":0},{\"id\":83,\"menuSort\":999,\"subCount\":0},{\"id\":90,\"menuSort\":999,\"subCount\":0},{\"id\":92,\"menuSort\":999,\"subCount\":0},{\"id\":93,\"menuSort\":999,\"subCount\":0},{\"id\":94,\"menuSort\":999,\"subCount\":0}]}','172.31.80.1',99,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:00:34'),
(3641,'修改菜单','INFO','me.zhengjie.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"/pay/platform/index\",\"createBy\":\"admin\",\"createTime\":\"2026-07-04 22:00:26\",\"hidden\":false,\"id\":118,\"menuSort\":999,\"path\":\"platform\",\"permission\":\"pay:platform:read\",\"pid\":117,\"subCount\":0,\"title\":\"支付平台\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 22:00:26\"}','172.31.80.1',61,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:02:09'),
(3642,'修改菜单','INFO','me.zhengjie.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"createBy\":\"admin\",\"createTime\":\"2026-07-04 21:05:40\",\"hidden\":false,\"id\":117,\"menuSort\":999,\"path\":\"pay\",\"subCount\":1,\"title\":\"易支付\",\"type\":0,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 21:05:40\"}','172.31.80.1',39,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:02:35'),
(3643,'修改菜单','INFO','me.zhengjie.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"/pay/platform/index\",\"createBy\":\"admin\",\"createTime\":\"2026-07-04 22:00:26\",\"hidden\":false,\"id\":118,\"menuSort\":999,\"path\":\"platform\",\"permission\":\"pay:platform:read\",\"pid\":117,\"subCount\":0,\"title\":\"支付平台\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 22:02:09\"}','172.31.80.1',33,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:02:42'),
(3644,'修改菜单','INFO','me.zhengjie.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"pay/platform/index\",\"createBy\":\"admin\",\"createTime\":\"2026-07-04 22:00:26\",\"hidden\":false,\"id\":118,\"menuSort\":999,\"path\":\"platform\",\"permission\":\"pay:platform:read\",\"pid\":117,\"subCount\":0,\"title\":\"支付平台\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 22:02:09\"}','172.31.80.1',44,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:03:01'),
(3645,'用户登录','INFO','me.zhengjie.modules.security.rest.AuthController.login()','{\"code\":\"8\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:a18e0ca228214f9f8b24262f38e4b2d7\"}','172.31.80.1',227,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:16:46'),
(3646,'修改菜单','INFO','me.zhengjie.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"pay/platform/index\",\"createBy\":\"admin\",\"createTime\":\"2026-07-04 22:00:26\",\"hidden\":false,\"id\":118,\"menuSort\":999,\"path\":\"platform\",\"permission\":\"pay:platform:query\",\"pid\":117,\"subCount\":0,\"title\":\"支付平台\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 22:03:01\"}','172.31.80.1',160,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 22:16:58'),
(3647,'新增菜单','INFO','me.zhengjie.modules.system.rest.MenuController.createMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"pay/merchant/index\",\"createBy\":\"admin\",\"createTime\":\"2026-07-04 23:51:00.118\",\"hidden\":false,\"id\":119,\"menuSort\":999,\"path\":\"merchant\",\"permission\":\"pay:merchant:read\",\"pid\":117,\"subCount\":0,\"title\":\"商户管理\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 23:51:00.118\"}','172.31.80.1',130,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 23:51:00'),
(3648,'修改角色菜单','INFO','me.zhengjie.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":1,\"level\":3,\"menus\":[{\"id\":97,\"menuSort\":999,\"subCount\":0},{\"id\":98,\"menuSort\":999,\"subCount\":0},{\"id\":102,\"menuSort\":999,\"subCount\":0},{\"id\":103,\"menuSort\":999,\"subCount\":0},{\"id\":104,\"menuSort\":999,\"subCount\":0},{\"id\":105,\"menuSort\":999,\"subCount\":0},{\"id\":106,\"menuSort\":999,\"subCount\":0},{\"id\":107,\"menuSort\":999,\"subCount\":0},{\"id\":108,\"menuSort\":999,\"subCount\":0},{\"id\":109,\"menuSort\":999,\"subCount\":0},{\"id\":110,\"menuSort\":999,\"subCount\":0},{\"id\":111,\"menuSort\":999,\"subCount\":0},{\"id\":116,\"menuSort\":999,\"subCount\":0},{\"id\":117,\"menuSort\":999,\"subCount\":0},{\"id\":118,\"menuSort\":999,\"subCount\":0},{\"id\":119,\"menuSort\":999,\"subCount\":0},{\"id\":1,\"menuSort\":999,\"subCount\":0},{\"id\":2,\"menuSort\":999,\"subCount\":0},{\"id\":3,\"menuSort\":999,\"subCount\":0},{\"id\":5,\"menuSort\":999,\"subCount\":0},{\"id\":6,\"menuSort\":999,\"subCount\":0},{\"id\":7,\"menuSort\":999,\"subCount\":0},{\"id\":9,\"menuSort\":999,\"subCount\":0},{\"id\":10,\"menuSort\":999,\"subCount\":0},{\"id\":11,\"menuSort\":999,\"subCount\":0},{\"id\":14,\"menuSort\":999,\"subCount\":0},{\"id\":15,\"menuSort\":999,\"subCount\":0},{\"id\":18,\"menuSort\":999,\"subCount\":0},{\"id\":19,\"menuSort\":999,\"subCount\":0},{\"id\":21,\"menuSort\":999,\"subCount\":0},{\"id\":22,\"menuSort\":999,\"subCount\":0},{\"id\":23,\"menuSort\":999,\"subCount\":0},{\"id\":24,\"menuSort\":999,\"subCount\":0},{\"id\":27,\"menuSort\":999,\"subCount\":0},{\"id\":28,\"menuSort\":999,\"subCount\":0},{\"id\":30,\"menuSort\":999,\"subCount\":0},{\"id\":32,\"menuSort\":999,\"subCount\":0},{\"id\":33,\"menuSort\":999,\"subCount\":0},{\"id\":34,\"menuSort\":999,\"subCount\":0},{\"id\":35,\"menuSort\":999,\"subCount\":0},{\"id\":36,\"menuSort\":999,\"subCount\":0},{\"id\":37,\"menuSort\":999,\"subCount\":0},{\"id\":39,\"menuSort\":999,\"subCount\":0},{\"id\":41,\"menuSort\":999,\"subCount\":0},{\"id\":44,\"menuSort\":999,\"subCount\":0},{\"id\":45,\"menuSort\":999,\"subCount\":0},{\"id\":46,\"menuSort\":999,\"subCount\":0},{\"id\":48,\"menuSort\":999,\"subCount\":0},{\"id\":49,\"menuSort\":999,\"subCount\":0},{\"id\":50,\"menuSort\":999,\"subCount\":0},{\"id\":52,\"menuSort\":999,\"subCount\":0},{\"id\":53,\"menuSort\":999,\"subCount\":0},{\"id\":54,\"menuSort\":999,\"subCount\":0},{\"id\":56,\"menuSort\":999,\"subCount\":0},{\"id\":57,\"menuSort\":999,\"subCount\":0},{\"id\":58,\"menuSort\":999,\"subCount\":0},{\"id\":60,\"menuSort\":999,\"subCount\":0},{\"id\":61,\"menuSort\":999,\"subCount\":0},{\"id\":62,\"menuSort\":999,\"subCount\":0},{\"id\":64,\"menuSort\":999,\"subCount\":0},{\"id\":65,\"menuSort\":999,\"subCount\":0},{\"id\":66,\"menuSort\":999,\"subCount\":0},{\"id\":73,\"menuSort\":999,\"subCount\":0},{\"id\":74,\"menuSort\":999,\"subCount\":0},{\"id\":75,\"menuSort\":999,\"subCount\":0},{\"id\":77,\"menuSort\":999,\"subCount\":0},{\"id\":78,\"menuSort\":999,\"subCount\":0},{\"id\":79,\"menuSort\":999,\"subCount\":0},{\"id\":80,\"menuSort\":999,\"subCount\":0},{\"id\":82,\"menuSort\":999,\"subCount\":0},{\"id\":83,\"menuSort\":999,\"subCount\":0},{\"id\":90,\"menuSort\":999,\"subCount\":0},{\"id\":92,\"menuSort\":999,\"subCount\":0},{\"id\":93,\"menuSort\":999,\"subCount\":0},{\"id\":94,\"menuSort\":999,\"subCount\":0}]}','172.31.80.1',102,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 23:51:08'),
(3649,'修改菜单','INFO','me.zhengjie.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"pay/platform/index\",\"createBy\":\"admin\",\"createTime\":\"2026-07-04 22:00:26\",\"hidden\":false,\"id\":118,\"menuSort\":999,\"path\":\"platform\",\"permission\":\"pay:platform:query\",\"pid\":117,\"subCount\":0,\"title\":\"平台管理\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2026-07-04 22:16:58\"}','172.31.80.1',66,'admin','内网IP','MSEdge 150',NULL,'2026-07-04 23:51:23'),
(3650,'用户登录','INFO','me.zhengjie.modules.security.rest.AuthController.login()','{\"code\":\"49\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:d3476c2e8d5f4dffb884d4759cd55cfb\"}','172.31.80.1',360,'admin','内网IP','MSEdge 150',NULL,'2026-07-05 21:50:46'),
(3651,'用户登录','INFO','me.zhengjie.modules.security.rest.AuthController.login()','{\"code\":\"48\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:cfd08aa4c06746d0b978c00e52609c44\"}','172.31.80.1',210,'admin','内网IP','MSEdge 150',NULL,'2026-07-05 22:37:33');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int DEFAULT '0' COMMENT '子菜单数目',
  `type` int DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件',
  `menu_sort` int DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  UNIQUE KEY `uniq_title` (`title`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统菜单';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`pid`,`sub_count`,`type`,`title`,`name`,`component`,`menu_sort`,`icon`,`path`,`i_frame`,`cache`,`hidden`,`permission`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(1,NULL,7,0,'系统管理',NULL,NULL,1,'system','system','\0','\0','\0',NULL,NULL,'admin','2018-12-18 15:11:29','2025-01-14 15:48:18'),
(2,1,3,1,'用户管理','User','system/user/index',2,'peoples','user','\0','\0','\0','user:list',NULL,NULL,'2018-12-18 15:14:44',NULL),
(3,1,3,1,'角色管理','Role','system/role/index',3,'role','role','\0','\0','\0','roles:list',NULL,NULL,'2018-12-18 15:16:07',NULL),
(5,1,3,1,'菜单管理','Menu','system/menu/index',5,'menu','menu','\0','\0','\0','menu:list',NULL,NULL,'2018-12-18 15:17:28',NULL),
(6,NULL,5,0,'系统监控',NULL,NULL,10,'monitor','monitor','\0','\0','\0',NULL,NULL,NULL,'2018-12-18 15:17:48',NULL),
(7,6,0,1,'操作日志','Log','monitor/log/index',11,'log','logs','\0','','\0',NULL,NULL,'admin','2018-12-18 15:18:26','2020-06-06 13:11:57'),
(9,6,0,1,'SQL监控','Sql','monitor/sql/index',18,'sqlMonitor','druid','\0','\0','\0',NULL,NULL,NULL,'2018-12-18 15:19:34',NULL),
(10,NULL,5,0,'组件管理',NULL,NULL,50,'zujian','components','\0','\0','\0',NULL,NULL,NULL,'2018-12-19 13:38:16',NULL),
(11,10,0,1,'图标库','Icons','components/icons/index',51,'icon','icon','\0','\0','\0',NULL,NULL,NULL,'2018-12-19 13:38:49',NULL),
(14,36,0,1,'邮件工具','Email','tools/email/index',35,'email','email','\0','\0','\0',NULL,NULL,NULL,'2018-12-27 10:13:09',NULL),
(15,10,0,1,'富文本','Editor','components/Editor',52,'fwb','tinymce','\0','\0','\0',NULL,NULL,NULL,'2018-12-27 11:58:25',NULL),
(18,36,3,1,'存储管理','Storage','tools/storage/index',34,'qiniu','storage','\0','\0','\0','storage:list',NULL,NULL,'2018-12-31 11:12:15',NULL),
(19,36,0,1,'支付宝工具','AliPay','tools/aliPay/index',37,'alipay','aliPay','\0','\0','\0',NULL,NULL,NULL,'2018-12-31 14:52:38',NULL),
(21,NULL,2,0,'多级菜单',NULL,'',900,'menu','nested','\0','\0','\0',NULL,NULL,'admin','2019-01-04 16:22:03','2020-06-21 17:27:35'),
(22,21,2,0,'二级菜单1',NULL,'',999,'menu','menu1','\0','\0','\0',NULL,NULL,'admin','2019-01-04 16:23:29','2020-06-21 17:27:20'),
(23,21,0,1,'二级菜单2',NULL,'nested/menu2/index',999,'menu','menu2','\0','\0','\0',NULL,NULL,NULL,'2019-01-04 16:23:57',NULL),
(24,22,0,1,'三级菜单1','Test','nested/menu1/menu1-1',999,'menu','menu1-1','\0','\0','\0',NULL,NULL,NULL,'2019-01-04 16:24:48',NULL),
(27,22,0,1,'三级菜单2',NULL,'nested/menu1/menu1-2',999,'menu','menu1-2','\0','\0','\0',NULL,NULL,NULL,'2019-01-07 17:27:32',NULL),
(28,1,3,1,'任务调度','Timing','system/timing/index',999,'timing','timing','\0','\0','\0','timing:list',NULL,NULL,'2019-01-07 20:34:40',NULL),
(30,36,0,1,'代码生成','GeneratorIndex','generator/index',32,'dev','generator','\0','','\0',NULL,NULL,NULL,'2019-01-11 15:45:55',NULL),
(32,6,0,1,'异常日志','ErrorLog','monitor/log/errorLog',12,'error','errorLog','\0','\0','\0',NULL,NULL,NULL,'2019-01-13 13:49:03',NULL),
(33,10,0,1,'Markdown','Markdown','components/MarkDown',53,'markdown','markdown','\0','\0','\0',NULL,NULL,NULL,'2019-03-08 13:46:44',NULL),
(34,10,0,1,'Yaml编辑器','YamlEdit','components/YamlEdit',54,'dev','yaml','\0','\0','\0',NULL,NULL,NULL,'2019-03-08 15:49:40',NULL),
(35,1,3,1,'部门管理','Dept','system/dept/index',6,'dept','dept','\0','\0','\0','dept:list',NULL,NULL,'2019-03-25 09:46:00',NULL),
(36,NULL,6,0,'系统工具',NULL,'',30,'sys-tools','sys-tools','\0','\0','\0',NULL,NULL,NULL,'2019-03-29 10:57:35',NULL),
(37,1,3,1,'岗位管理','Job','system/job/index',7,'Steve-Jobs','job','\0','\0','\0','job:list',NULL,NULL,'2019-03-29 13:51:18',NULL),
(39,1,3,1,'字典管理','Dict','system/dict/index',8,'dictionary','dict','\0','\0','\0','dict:list',NULL,NULL,'2019-04-10 11:49:04',NULL),
(41,6,0,1,'在线用户','OnlineUser','monitor/online/index',10,'Steve-Jobs','online','\0','\0','\0',NULL,NULL,NULL,'2019-10-26 22:08:43',NULL),
(44,2,0,2,'用户新增',NULL,'',2,'','','\0','\0','\0','user:add',NULL,NULL,'2019-10-29 10:59:46',NULL),
(45,2,0,2,'用户编辑',NULL,'',3,'','','\0','\0','\0','user:edit',NULL,NULL,'2019-10-29 11:00:08',NULL),
(46,2,0,2,'用户删除',NULL,'',4,'','','\0','\0','\0','user:del',NULL,NULL,'2019-10-29 11:00:23',NULL),
(48,3,0,2,'角色创建',NULL,'',2,'','','\0','\0','\0','roles:add',NULL,NULL,'2019-10-29 12:45:34',NULL),
(49,3,0,2,'角色修改',NULL,'',3,'','','\0','\0','\0','roles:edit',NULL,NULL,'2019-10-29 12:46:16',NULL),
(50,3,0,2,'角色删除',NULL,'',4,'','','\0','\0','\0','roles:del',NULL,NULL,'2019-10-29 12:46:51',NULL),
(52,5,0,2,'菜单新增',NULL,'',2,'','','\0','\0','\0','menu:add',NULL,NULL,'2019-10-29 12:55:07',NULL),
(53,5,0,2,'菜单编辑',NULL,'',3,'','','\0','\0','\0','menu:edit',NULL,NULL,'2019-10-29 12:55:40',NULL),
(54,5,0,2,'菜单删除',NULL,'',4,'','','\0','\0','\0','menu:del',NULL,NULL,'2019-10-29 12:56:00',NULL),
(56,35,0,2,'部门新增',NULL,'',2,'','','\0','\0','\0','dept:add',NULL,NULL,'2019-10-29 12:57:09',NULL),
(57,35,0,2,'部门编辑',NULL,'',3,'','','\0','\0','\0','dept:edit',NULL,NULL,'2019-10-29 12:57:27',NULL),
(58,35,0,2,'部门删除',NULL,'',4,'','','\0','\0','\0','dept:del',NULL,NULL,'2019-10-29 12:57:41',NULL),
(60,37,0,2,'岗位新增',NULL,'',2,'','','\0','\0','\0','job:add',NULL,NULL,'2019-10-29 12:58:27',NULL),
(61,37,0,2,'岗位编辑',NULL,'',3,'','','\0','\0','\0','job:edit',NULL,NULL,'2019-10-29 12:58:45',NULL),
(62,37,0,2,'岗位删除',NULL,'',4,'','','\0','\0','\0','job:del',NULL,NULL,'2019-10-29 12:59:04',NULL),
(64,39,0,2,'字典新增',NULL,'',2,'','','\0','\0','\0','dict:add',NULL,NULL,'2019-10-29 13:00:17',NULL),
(65,39,0,2,'字典编辑',NULL,'',3,'','','\0','\0','\0','dict:edit',NULL,NULL,'2019-10-29 13:00:42',NULL),
(66,39,0,2,'字典删除',NULL,'',4,'','','\0','\0','\0','dict:del',NULL,NULL,'2019-10-29 13:00:59',NULL),
(73,28,0,2,'任务新增',NULL,'',2,'','','\0','\0','\0','timing:add',NULL,NULL,'2019-10-29 13:07:28',NULL),
(74,28,0,2,'任务编辑',NULL,'',3,'','','\0','\0','\0','timing:edit',NULL,NULL,'2019-10-29 13:07:41',NULL),
(75,28,0,2,'任务删除',NULL,'',4,'','','\0','\0','\0','timing:del',NULL,NULL,'2019-10-29 13:07:54',NULL),
(77,18,0,2,'上传文件',NULL,'',2,'','','\0','\0','\0','storage:add',NULL,NULL,'2019-10-29 13:09:09',NULL),
(78,18,0,2,'文件编辑',NULL,'',3,'','','\0','\0','\0','storage:edit',NULL,NULL,'2019-10-29 13:09:22',NULL),
(79,18,0,2,'文件删除',NULL,'',4,'','','\0','\0','\0','storage:del',NULL,NULL,'2019-10-29 13:09:34',NULL),
(80,6,0,1,'服务监控','ServerMonitor','monitor/server/index',14,'codeConsole','server','\0','\0','\0','monitor:list',NULL,'admin','2019-11-07 13:06:39','2020-05-04 18:20:50'),
(82,36,0,1,'生成配置','GeneratorConfig','generator/config',33,'dev','generator/config/:tableName','\0','','','',NULL,NULL,'2019-11-17 20:08:56',NULL),
(83,10,0,1,'图表库','Echarts','components/Echarts',50,'chart','echarts','\0','','\0','',NULL,NULL,'2019-11-21 09:04:32',NULL),
(90,NULL,5,1,'运维管理','Mnt','',20,'mnt','mnt','\0','\0','\0',NULL,NULL,NULL,'2019-11-09 10:31:08',NULL),
(92,90,3,1,'服务器','ServerDeploy','maint/server/index',22,'server','maint/serverDeploy','\0','\0','\0','serverDeploy:list',NULL,NULL,'2019-11-10 10:29:25',NULL),
(93,90,3,1,'应用管理','App','maint/app/index',23,'app','maint/app','\0','\0','\0','app:list',NULL,NULL,'2019-11-10 11:05:16',NULL),
(94,90,3,1,'部署管理','Deploy','maint/deploy/index',24,'deploy','maint/deploy','\0','\0','\0','deploy:list',NULL,NULL,'2019-11-10 15:56:55',NULL),
(97,90,1,1,'部署备份','DeployHistory','maint/deployHistory/index',25,'backup','maint/deployHistory','\0','\0','\0','deployHistory:list',NULL,NULL,'2019-11-10 16:49:44',NULL),
(98,90,3,1,'数据库管理','Database','maint/database/index',26,'database','maint/database','\0','\0','\0','database:list',NULL,NULL,'2019-11-10 20:40:04',NULL),
(102,97,0,2,'删除',NULL,'',999,'','','\0','\0','\0','deployHistory:del',NULL,NULL,'2019-11-17 09:32:48',NULL),
(103,92,0,2,'服务器新增',NULL,'',999,'','','\0','\0','\0','serverDeploy:add',NULL,NULL,'2019-11-17 11:08:33',NULL),
(104,92,0,2,'服务器编辑',NULL,'',999,'','','\0','\0','\0','serverDeploy:edit',NULL,NULL,'2019-11-17 11:08:57',NULL),
(105,92,0,2,'服务器删除',NULL,'',999,'','','\0','\0','\0','serverDeploy:del',NULL,NULL,'2019-11-17 11:09:15',NULL),
(106,93,0,2,'应用新增',NULL,'',999,'','','\0','\0','\0','app:add',NULL,NULL,'2019-11-17 11:10:03',NULL),
(107,93,0,2,'应用编辑',NULL,'',999,'','','\0','\0','\0','app:edit',NULL,NULL,'2019-11-17 11:10:28',NULL),
(108,93,0,2,'应用删除',NULL,'',999,'','','\0','\0','\0','app:del',NULL,NULL,'2019-11-17 11:10:55',NULL),
(109,94,0,2,'部署新增',NULL,'',999,'','','\0','\0','\0','deploy:add',NULL,NULL,'2019-11-17 11:11:22',NULL),
(110,94,0,2,'部署编辑',NULL,'',999,'','','\0','\0','\0','deploy:edit',NULL,NULL,'2019-11-17 11:11:41',NULL),
(111,94,0,2,'部署删除',NULL,'',999,'','','\0','\0','\0','deploy:del',NULL,NULL,'2019-11-17 11:12:01',NULL),
(116,36,0,1,'生成预览','Preview','generator/preview',999,'java','generator/preview/:tableName','\0','','',NULL,NULL,NULL,'2019-11-26 14:54:36',NULL),
(117,NULL,2,0,'易支付',NULL,NULL,999,NULL,'pay','\0','\0','\0',NULL,'admin','admin','2026-07-04 21:05:40','2026-07-04 22:02:35'),
(118,117,0,1,'平台管理',NULL,'pay/platform/index',999,NULL,'platform','\0','\0','\0','pay:platform:query','admin','admin','2026-07-04 22:00:26','2026-07-04 23:51:23'),
(119,117,0,1,'商户管理',NULL,'pay/merchant/index',999,NULL,'merchant','\0','\0','\0','pay:merchant:read','admin','admin','2026-07-04 23:51:00','2026-07-04 23:51:00');

/*Table structure for table `sys_quartz_job` */

DROP TABLE IF EXISTS `sys_quartz_job`;

CREATE TABLE `sys_quartz_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `person_in_charge` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报警邮箱',
  `sub_task` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子任务ID',
  `pause_after_failure` bit(1) DEFAULT NULL COMMENT '任务失败后是否暂停',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  KEY `idx_is_pause` (`is_pause`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='定时任务';

/*Data for the table `sys_quartz_job` */

insert  into `sys_quartz_job`(`job_id`,`bean_name`,`cron_expression`,`is_pause`,`job_name`,`method_name`,`params`,`description`,`person_in_charge`,`email`,`sub_task`,`pause_after_failure`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(2,'testTask','0/5 * * * * ?','','测试1','run1','test','带参测试，多参使用json','测试',NULL,NULL,NULL,NULL,'admin','2019-08-22 14:08:29','2020-05-24 13:58:33'),
(3,'testTask','0/5 * * * * ?','','测试','run','','不带参测试','Zheng Jie','','6','',NULL,'admin','2019-09-26 16:44:39','2020-05-24 14:48:12'),
(5,'Test','0/5 * * * * ?','','任务告警测试','run',NULL,'测试','test','',NULL,'','admin','admin','2020-05-05 20:32:41','2020-05-05 20:36:13'),
(6,'testTask','0/5 * * * * ?','','测试3','run2',NULL,'测试3','Zheng Jie','',NULL,'','admin','admin','2020-05-05 20:35:41','2020-05-05 20:36:07');

/*Table structure for table `sys_quartz_log` */

DROP TABLE IF EXISTS `sys_quartz_log`;

CREATE TABLE `sys_quartz_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Bean名称',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron 表达式',
  `is_success` bit(1) DEFAULT NULL COMMENT '是否执行成功',
  `job_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `time` bigint DEFAULT NULL COMMENT '执行耗时',
  `exception_detail` text COLLATE utf8mb4_general_ci COMMENT '异常详情',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='定时任务日志';

/*Data for the table `sys_quartz_log` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `level` int DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `idx_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`name`,`level`,`description`,`data_scope`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(1,'管理员',1,'-','全部',NULL,'admin','2018-11-23 11:04:37','2026-07-04 23:51:08'),
(2,'普通用户',2,'-','本级',NULL,'admin','2018-11-23 13:09:06','2020-09-05 10:45:12');

/*Table structure for table `sys_roles_depts` */

DROP TABLE IF EXISTS `sys_roles_depts`;

CREATE TABLE `sys_roles_depts` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`),
  KEY `idx_dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色部门关联';

/*Data for the table `sys_roles_depts` */

/*Table structure for table `sys_roles_menus` */

DROP TABLE IF EXISTS `sys_roles_menus`;

CREATE TABLE `sys_roles_menus` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `idx_menu_id` (`menu_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色菜单关联';

/*Data for the table `sys_roles_menus` */

insert  into `sys_roles_menus`(`menu_id`,`role_id`) values 
(1,1),
(1,2),
(2,1),
(2,2),
(3,1),
(5,1),
(6,1),
(6,2),
(7,1),
(7,2),
(9,1),
(9,2),
(10,1),
(10,2),
(11,1),
(11,2),
(14,1),
(14,2),
(15,1),
(15,2),
(18,1),
(19,1),
(19,2),
(21,1),
(21,2),
(22,1),
(22,2),
(23,1),
(23,2),
(24,1),
(24,2),
(27,1),
(27,2),
(28,1),
(30,1),
(30,2),
(32,1),
(32,2),
(33,1),
(33,2),
(34,1),
(34,2),
(35,1),
(36,1),
(36,2),
(37,1),
(39,1),
(41,1),
(44,1),
(45,1),
(46,1),
(48,1),
(49,1),
(50,1),
(52,1),
(53,1),
(54,1),
(56,1),
(57,1),
(58,1),
(60,1),
(61,1),
(62,1),
(64,1),
(65,1),
(66,1),
(73,1),
(74,1),
(75,1),
(77,1),
(78,1),
(79,1),
(80,1),
(80,2),
(82,1),
(82,2),
(83,1),
(83,2),
(90,1),
(92,1),
(93,1),
(94,1),
(97,1),
(98,1),
(102,1),
(103,1),
(104,1),
(105,1),
(106,1),
(107,1),
(108,1),
(109,1),
(110,1),
(111,1),
(116,1),
(116,2),
(117,1),
(118,1),
(119,1);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门名称',
  `username` varchar(180) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(180) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `uniq_email` (`email`) USING BTREE,
  UNIQUE KEY `uniq_username` (`username`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE,
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`username`,`nick_name`,`gender`,`phone`,`email`,`avatar_name`,`avatar_path`,`password`,`is_admin`,`enabled`,`create_by`,`update_by`,`pwd_reset_time`,`create_time`,`update_time`) values 
(1,2,'admin','管理员','男','18888888888','201507802@qq.com','avatar-20250122102642222.png','/Users/jie/Documents/work/private/eladmin/~/avatar/avatar-20250122102642222.png','$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa','','',NULL,'admin','2020-05-03 16:38:31','2018-08-23 09:11:56','2025-01-22 10:26:42'),
(2,7,'test','测试','男','19999999999','231@qq.com',NULL,NULL,'$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK','\0','','admin','admin',NULL,'2020-05-05 11:15:49','2025-01-21 14:53:04');

/*Table structure for table `sys_users_jobs` */

DROP TABLE IF EXISTS `sys_users_jobs`;

CREATE TABLE `sys_users_jobs` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `job_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';

/*Data for the table `sys_users_jobs` */

insert  into `sys_users_jobs`(`user_id`,`job_id`) values 
(1,11),
(2,12);

/*Table structure for table `sys_users_roles` */

DROP TABLE IF EXISTS `sys_users_roles`;

CREATE TABLE `sys_users_roles` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户角色关联';

/*Data for the table `sys_users_roles` */

insert  into `sys_users_roles`(`user_id`,`role_id`) values 
(1,1),
(2,2);

/*Table structure for table `tool_alipay_config` */

DROP TABLE IF EXISTS `tool_alipay_config`;

CREATE TABLE `tool_alipay_config` (
  `config_id` bigint NOT NULL COMMENT 'ID',
  `app_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `format` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异步回调',
  `private_key` text COLLATE utf8mb4_general_ci COMMENT '私钥',
  `public_key` text COLLATE utf8mb4_general_ci COMMENT '公钥',
  `return_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='支付宝配置类';

/*Data for the table `tool_alipay_config` */

/*Table structure for table `tool_email_config` */

DROP TABLE IF EXISTS `tool_email_config`;

CREATE TABLE `tool_email_config` (
  `config_id` bigint NOT NULL COMMENT 'ID',
  `from_user` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `port` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '端口',
  `user` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='邮箱配置';

/*Data for the table `tool_email_config` */

/*Table structure for table `tool_local_storage` */

DROP TABLE IF EXISTS `tool_local_storage`;

CREATE TABLE `tool_local_storage` (
  `storage_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `size` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '大小',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='本地存储';

/*Data for the table `tool_local_storage` */

/*Table structure for table `tool_s3_storage` */

DROP TABLE IF EXISTS `tool_s3_storage`;

CREATE TABLE `tool_s3_storage` (
  `storage_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `file_real_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实存储的名称',
  `file_size` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件大小',
  `file_mime_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件MIME 类型',
  `file_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `file_path` tinytext COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='s3 协议对象存储';

/*Data for the table `tool_s3_storage` */

insert  into `tool_s3_storage`(`storage_id`,`file_name`,`file_real_name`,`file_size`,`file_mime_type`,`file_type`,`file_path`,`create_by`,`update_by`,`create_time`,`update_time`) values 
(4,'tx.jpg','2ca1de24d8fa422eae4ede30e97c46d8.jpg','29.67KB','image/jpeg','jpg','2025-06/2ca1de24d8fa422eae4ede30e97c46d8.jpg','admin','admin','2025-06-25 15:48:22','2025-06-25 15:48:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
