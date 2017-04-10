/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : tepoc

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-10 11:27:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bd_corp
-- ----------------------------
DROP TABLE IF EXISTS `bd_corp`;
CREATE TABLE `bd_corp` (
  `fathercorp` varchar(50) default NULL,
  `unitcode` varchar(50) default NULL,
  `unitname` varchar(100) default NULL,
  `pk_user` varchar(50) default NULL,
  `isseal` int(11) default '0',
  `creationtime` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `modifiedtime` varchar(50) default NULL,
  `modifier` varchar(50) default NULL,
  `memo` varchar(200) default NULL,
  `dr` int(11) default NULL,
  `ts` timestamp NULL default NULL,
  `pk_corp` varchar(50) NOT NULL,
  `def1` varchar(100) default NULL,
  `def2` varchar(100) default NULL,
  `def3` varchar(100) default NULL,
  `def4` varchar(100) default NULL,
  `def5` varchar(100) default NULL,
  `def6` varchar(100) default NULL,
  `def7` varchar(100) default NULL,
  `def8` varchar(100) default NULL,
  `def9` varchar(100) default NULL,
  `def10` varchar(100) default NULL,
  `corptype` int(11) default NULL,
  `corplevel` int(11) default '1',
  PRIMARY KEY  (`pk_corp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd_corp
-- ----------------------------
INSERT INTO `bd_corp` VALUES ('', 'BYD', 'xxx股份有限公司', null, '1', '2017-01-11 00:00:00', '00000000000000000001', null, null, null, '0', '2017-01-11 09:11:42', 'CORP0000000000000001', null, null, null, null, null, null, null, null, null, null, '10101001', '1');
INSERT INTO `bd_corp` VALUES ('CORP0000000000000001', 'SYC', '商用车销售事业部', null, '1', '2017-01-11 00:00:00', '00000000000000000001', null, null, null, '0', '2017-01-11 09:11:42', 'CORP0000000000000002', null, null, null, null, null, null, null, null, null, null, '10101002', '1');
INSERT INTO `bd_corp` VALUES ('CORP0000000000000001', 'KJC', '会计处', 'U1000002', '1', 'Fri Feb 17 16:22:16 CST 2017', '00000000000000000001', null, null, null, '0', '2017-02-17 16:22:32', 'CORP0000000000000003', 'null', '1001Z01000000000SFX5', '1001Z01000000000SFX6', null, null, null, null, null, null, null, '10101002', '2');

-- ----------------------------
-- Table structure for bd_countryzone
-- ----------------------------
DROP TABLE IF EXISTS `bd_countryzone`;
CREATE TABLE `bd_countryzone` (
  `code` varchar(40) default NULL,
  `modifier` varchar(50) default NULL,
  `pk_timezone` varchar(20) default NULL,
  `creator` varchar(50) default NULL,
  `phonecode` varchar(20) default NULL,
  `wholename` varchar(200) default NULL,
  `name` varchar(200) default NULL,
  `description` varchar(100) default NULL,
  `pk_lang` varchar(50) default NULL,
  `creationtime` datetime default NULL,
  `modifiedtime` datetime default NULL,
  `pk_country` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`pk_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd_countryzone
-- ----------------------------

-- ----------------------------
-- Table structure for bd_dept
-- ----------------------------
DROP TABLE IF EXISTS `bd_dept`;
CREATE TABLE `bd_dept` (
  `deptcode` varchar(50) NOT NULL,
  `deptname` varchar(100) NOT NULL,
  `pk_dept` varchar(64) NOT NULL,
  `pk_fathedept` varchar(64) default NULL,
  `pk_user` varchar(50) default NULL,
  `pk_leader` varchar(50) default NULL,
  `pk_corp` varchar(64) default NULL,
  `canceled` int(11) default NULL,
  `creator` varchar(50) NOT NULL,
  `creationtime` datetime NOT NULL,
  `modifier` varchar(50) default NULL,
  `modifiedtime` datetime default NULL,
  `dr` int(11) default NULL,
  `ts` datetime default NULL,
  `def1` varchar(100) default NULL,
  `def2` varchar(100) default NULL,
  `def3` varchar(100) default NULL,
  `def4` varchar(100) default NULL,
  `def5` varchar(100) default NULL,
  `def6` varchar(100) default NULL,
  `def7` varchar(100) default NULL,
  `def8` varchar(100) default NULL,
  `def9` varchar(100) default NULL,
  `def10` varchar(100) default NULL,
  `deptlevel` int(11) default '1' COMMENT '??10?',
  `iscbzx` varchar(10) default NULL,
  `isbudept` varchar(10) default NULL,
  `cbzx` varchar(64) default NULL,
  PRIMARY KEY  (`pk_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd_dept
-- ----------------------------
INSERT INTO `bd_dept` VALUES ('iuap_zjb', '总经办', 'DEPT0000000000000001', '', 'U1000021', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_scb', '市场部', 'DEPT0000000000000002', '', 'U1000018', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb', '销售部', 'DEPT0000000000000003', '', 'U1000001', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xmb', '项目部', 'DEPT0000000000000004', '', 'U1000019', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_swb', '商务部', 'DEPT0000000000000005', '', 'U1000020', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_cyb', '储运部', 'DEPT0000000000000006', '', 'U1000022', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_ggb', '公关部', 'DEPT0000000000000007', '', 'U1000023', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_cwb222', '汽车财务部', 'DEPT0000000000000008', '', 'U1000024', 'U1000025', 'CORP0000000000000003', '1', '00000000000000000001', '2017-03-17 20:56:35', null, null, '0', '2017-03-17 20:56:35', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_01', '销售一部', 'DEPT0000000000000009', 'DEPT0000000000000003', 'U1000002', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_02', '销售二部', 'DEPT0000000000000010', 'DEPT0000000000000003', 'U1000003', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_03', '销售三部', 'DEPT0000000000000011', 'DEPT0000000000000003', 'U1000004', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_04', '销售四部', 'DEPT0000000000000012', 'DEPT0000000000000003', 'U1000005', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_05', '销售五部', 'DEPT0000000000000013', 'DEPT0000000000000003', 'U1000006', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_06', '销售六部', 'DEPT0000000000000014', 'DEPT0000000000000003', 'U1000007', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_07', '销售七部', 'DEPT0000000000000015', 'DEPT0000000000000003', 'U1000008', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_08', '销售八部', 'DEPT0000000000000016', 'DEPT0000000000000003', 'U1000009', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_09', '销售九部', 'DEPT0000000000000017', 'DEPT0000000000000003', 'U1000010', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_10', '销售十部', 'DEPT0000000000000018', 'DEPT0000000000000003', 'U1000011', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_11', '销售十一部', 'DEPT0000000000000019', 'DEPT0000000000000003', 'U1000012', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_12', '销售十二部', 'DEPT0000000000000020', 'DEPT0000000000000003', 'U1000013', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_13', '销售十三部', 'DEPT0000000000000021', 'DEPT0000000000000003', 'U1000014', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_14', '销售十四部', 'DEPT0000000000000022', 'DEPT0000000000000003', 'U1000015', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `bd_dept` VALUES ('iuap_xsb_15', '销售十五部', 'DEPT0000000000000023', 'DEPT0000000000000003', 'U1000016', 'U1000001', 'CORP0000000000000002', '1', '00000000000000000001', '2017-01-11 00:00:00', null, null, '0', '2017-01-11 00:00:00', null, null, null, null, null, null, null, null, null, null, '1', null, null, null);

-- ----------------------------
-- Table structure for bd_psndoc
-- ----------------------------
DROP TABLE IF EXISTS `bd_psndoc`;
CREATE TABLE `bd_psndoc` (
  `pk_psndoc` varchar(50) NOT NULL,
  `pk_corp` varchar(50) default NULL,
  `pk_dept` varchar(50) default NULL,
  `psncode` varchar(30) default NULL,
  `psnid` varchar(30) default NULL,
  `psnname` varchar(50) default NULL,
  `psnseal` int(11) default NULL,
  `email` varchar(30) default NULL,
  `psntel` varchar(30) default NULL,
  `number` varchar(30) default NULL,
  `creationtime` datetime default NULL,
  `creator` varchar(50) default NULL,
  `modifiedtime` datetime default NULL,
  `modifier` varchar(50) default NULL,
  `ts` timestamp NULL default NULL,
  `dr` int(1) default NULL,
  `def1` varchar(50) default NULL,
  `def2` varchar(50) default NULL,
  `def3` varchar(50) default NULL,
  `def4` varchar(50) default NULL,
  `def5` varchar(50) default NULL,
  `def6` varchar(50) default NULL,
  `def7` varchar(50) default NULL,
  `def8` varchar(50) default NULL,
  `def9` varchar(50) default NULL,
  `def10` varchar(50) default NULL,
  `def11` varchar(50) default NULL,
  `def12` varchar(50) default NULL,
  `def13` varchar(50) default NULL,
  `def14` varchar(50) default NULL,
  `def15` varchar(50) default NULL,
  PRIMARY KEY  (`pk_psndoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd_psndoc
-- ----------------------------
INSERT INTO `bd_psndoc` VALUES ('1000001', 'CORP0000000000000002', 'DEPT0000000000000003', 'PSN001', '11', '王杰', '0', '1231123@qq.com', '', '11', null, null, '2017-02-17 16:18:53', '00000000000000000001', '2017-02-17 16:18:53', '0', null, null, null, null, null, null, null, null, '正常', null, null, null, null, null, null);
INSERT INTO `bd_psndoc` VALUES ('1000002', 'CORP0000000000000002', 'DEPT0000000000000009', 'PSN002', '', '佟杰', null, '4213413@qq.com', '', null, null, null, null, null, '2017-01-11 00:00:00', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bd_psndoc` VALUES ('1000003', 'CORP0000000000000002', 'DEPT0000000000000010', 'PSN003', '', '郭录军', null, '1231131@qq.com', '', null, null, null, null, null, '2017-01-11 00:00:00', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bd_psndoc` VALUES ('1000004', 'CORP0000000000000002', 'DEPT0000000000000011', 'PSN004', '', '刘关生', null, '1231131@qq.com', '', null, null, null, null, null, '2017-01-11 00:00:00', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bd_psndoc` VALUES ('iuaptcrm1000000129bd', 'CORP0000000000000003', 'DEPT0000000000000008', '我2', '32', '23', '0', '23', '23', '2', '2017-03-17 22:50:39', '00000000000000000001', null, null, '2017-03-17 22:53:03', '1', null, null, null, null, null, null, null, null, '正常', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for bd_psnduty
-- ----------------------------
DROP TABLE IF EXISTS `bd_psnduty`;
CREATE TABLE `bd_psnduty` (
  `pk_psnduty` varchar(50) NOT NULL,
  `pk_psndoc` varchar(50) NOT NULL,
  `dutystate` int(11) default NULL,
  `pk_dept` varchar(50) NOT NULL,
  `pk_corp` varchar(50) NOT NULL,
  `dr` int(11) default NULL,
  `ts` varchar(23) default NULL,
  `def1` varchar(100) default NULL,
  `def2` varchar(100) default NULL,
  `def3` varchar(100) default NULL,
  `def4` varchar(100) default NULL,
  `def5` varchar(100) default NULL,
  `def7` varchar(100) default NULL,
  `def8` varchar(100) default NULL,
  `def9` varchar(100) default NULL,
  `def10` varchar(100) default NULL,
  `def11` varchar(100) default NULL,
  `def12` varchar(100) default NULL,
  `def13` varchar(100) default NULL,
  `def14` varchar(100) default NULL,
  `def15` varchar(100) default NULL,
  PRIMARY KEY  (`pk_psnduty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bd_psnduty
-- ----------------------------

-- ----------------------------
-- Table structure for busilog
-- ----------------------------
DROP TABLE IF EXISTS `busilog`;
CREATE TABLE `busilog` (
  `id` varchar(40) NOT NULL,
  `clientip` varchar(18) default NULL,
  `operuser` varchar(40) default NULL,
  `logcategory` varchar(40) default NULL,
  `logcontent` varchar(500) default NULL,
  `sysid` varchar(40) default NULL,
  `tenantid` varchar(40) default NULL,
  `logdate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of busilog
-- ----------------------------
INSERT INTO `busilog` VALUES ('0025d6ce5a4f4d5893d1ec1279b4d026', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:45:16');
INSERT INTO `busilog` VALUES ('00d0b79cd3534943a3b498c3d2c71066', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:03');
INSERT INTO `busilog` VALUES ('01cd4bb9d1714516bd852b8662cfe779', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:06:25');
INSERT INTO `busilog` VALUES ('01f292fb3f444ac19aedd9451265238b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:13:58');
INSERT INTO `busilog` VALUES ('0203055630ec4d6080746efe2079ef1b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:55');
INSERT INTO `busilog` VALUES ('02452f005c244d5aa797b1267fa49f5f', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:52:17');
INSERT INTO `busilog` VALUES ('02ff13c800fe473e80406459ef0fa406', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:20:39');
INSERT INTO `busilog` VALUES ('036c9a626971430d9e818d41f28838fb', null, 'test', '查询类', '用户管理：执行查询方法:[major:01]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:33');
INSERT INTO `busilog` VALUES ('038c30a420564880b7f2c660ebbf7f81', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:49:08');
INSERT INTO `busilog` VALUES ('03afb3e876e845819b80a5884754ac05', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:08:41');
INSERT INTO `busilog` VALUES ('049623b846424a85bca6a1f66e8237bb', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:11');
INSERT INTO `busilog` VALUES ('053a151b673f4394b6a290c128248e47', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:34:13');
INSERT INTO `busilog` VALUES ('05d1d76d3a8e4a9aadb9a29f21974fb8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:23:42');
INSERT INTO `busilog` VALUES ('0694a49cd9fd46cd889f41fcf5587cdb', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:52:07');
INSERT INTO `busilog` VALUES ('06d012bb97464068bbfbf69b1ebc50b2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:15:05');
INSERT INTO `busilog` VALUES ('070aff81c8e1480b91544a7f5fc59305', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:57:01');
INSERT INTO `busilog` VALUES ('0779b36abe384defad3959cd3b8b6e44', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:35:19');
INSERT INTO `busilog` VALUES ('077dc3368c174b82bc7f4e84a37a39af', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:42:34');
INSERT INTO `busilog` VALUES ('07f0baf42717415dbfb9fc791d522352', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:56:01');
INSERT INTO `busilog` VALUES ('0806da7ebc454093b0e505916010bedb', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:24:24');
INSERT INTO `busilog` VALUES ('089101beebe04d1494e7ba4a5f017be2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:22:18');
INSERT INTO `busilog` VALUES ('08a0cad05bdb4d46bae30ed3298f218c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:55:29');
INSERT INTO `busilog` VALUES ('08a138f0145940dc9939cc2eedadf5bd', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:28:22');
INSERT INTO `busilog` VALUES ('08e89cbfcc574489ba2966d24b6b6006', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:03');
INSERT INTO `busilog` VALUES ('090e94abb006475eb4000448a906d348', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:1491321600000]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:21:06');
INSERT INTO `busilog` VALUES ('09119c21e5ff42d3afdedd9be277378e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:15:46');
INSERT INTO `busilog` VALUES ('093e00a8434a4d0a915c7d11386a12cd', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:23:33');
INSERT INTO `busilog` VALUES ('094adfd893fc47c49120db0836dadab6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:52:02');
INSERT INTO `busilog` VALUES ('0a1d2f0bea374a658e3c05a4f0ea7383', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:54');
INSERT INTO `busilog` VALUES ('0ab5a9f4399c4c6482028a3cb2e192f6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:01');
INSERT INTO `busilog` VALUES ('0b1168d874a748c5ad5815e72d24ec57', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:52:34');
INSERT INTO `busilog` VALUES ('0b6e3cdacd704fa4b3db47078f946699', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:17:54');
INSERT INTO `busilog` VALUES ('0b71092e31d949c39d784c841292e03a', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:02, username:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:26:44');
INSERT INTO `busilog` VALUES ('0bf84db63ebe499f8748c9db73295e27', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:48:09');
INSERT INTO `busilog` VALUES ('0bfb28d2e61c40a19a9c5a3f5363f449', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:37:58');
INSERT INTO `busilog` VALUES ('0c0c807eb2a540d58af81a8ed6c22ae1', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:15');
INSERT INTO `busilog` VALUES ('0c48bf2bab41454eab66c77ba3308e46', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:43:59');
INSERT INTO `busilog` VALUES ('0c5255e3651a49f68d5db47d2614f90e', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:20:39');
INSERT INTO `busilog` VALUES ('0c792b9f655a43a584e9501626b3abd2', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:35');
INSERT INTO `busilog` VALUES ('0c8f04f85f11400c911d78e758432c7d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', null, '2017-04-01 22:34:42');
INSERT INTO `busilog` VALUES ('0cd72ee560284820a0e016aa968ab34c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:14:59');
INSERT INTO `busilog` VALUES ('0d0218af134240108a491d87d5e5d1f6', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@70ca9f0a的日志记录', 'sysid', null, '2017-04-04 14:03:20');
INSERT INTO `busilog` VALUES ('0d977f148d8a41b0a06fd8590cffc88e', null, 'test', '查询类', '用户管理：执行查询方法:[sex:1]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:26');
INSERT INTO `busilog` VALUES ('0d9b74c393224da6b6a4e759fa687c86', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:55:46');
INSERT INTO `busilog` VALUES ('0e609b3997634fa8b4ba02681782d782', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:19:35');
INSERT INTO `busilog` VALUES ('0ecc1d00002d46bd835243e93229c3b8', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:, username:1231]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:28:09');
INSERT INTO `busilog` VALUES ('0f2c3c4aa046457fb1a9c64ad4d89b72', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:34');
INSERT INTO `busilog` VALUES ('0f50fde665fd4eeb88c048b09924990e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:37:38');
INSERT INTO `busilog` VALUES ('0f65def8a8084c7c88c9549d8eab30d9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:59:08');
INSERT INTO `busilog` VALUES ('0ff66ef2c6b448a98d22d9a27a0e2af7', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:47:23');
INSERT INTO `busilog` VALUES ('104dbbc9f25e4067885d5728ea4a77fb', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:41:49');
INSERT INTO `busilog` VALUES ('105e4ed6d6d242ffaea176cb30c8451d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:38:12');
INSERT INTO `busilog` VALUES ('1066e72806d4422b915f6d9f0e4d1776', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-01 22:34:40');
INSERT INTO `busilog` VALUES ('1071edbff6484d98b5f817d5b7975ea8', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:26:24');
INSERT INTO `busilog` VALUES ('10806ab014af4237be05d10444a552b6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:25:01');
INSERT INTO `busilog` VALUES ('10ca8ae0b97e447983f14136245137af', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:26:28');
INSERT INTO `busilog` VALUES ('10e356b695e74697a1fcd06aa55e5e39', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:10:16');
INSERT INTO `busilog` VALUES ('1133a0eaed0f45869d8c86751594ceba', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:48');
INSERT INTO `busilog` VALUES ('1145d75f9dc64a96ac524e55162ebcf1', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 17:01:33');
INSERT INTO `busilog` VALUES ('12822a0c15e849078bac30cccce8f324', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:15:35');
INSERT INTO `busilog` VALUES ('1284faba709d449a93ebc454ac7f55b9', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:13:10');
INSERT INTO `busilog` VALUES ('12c69229766e4e49b9031deaa333cf43', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:28');
INSERT INTO `busilog` VALUES ('130e5b36d0504086bec4af3cad068f4f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:37');
INSERT INTO `busilog` VALUES ('13696efca6cf492c8efd1acd334c325b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:19:12');
INSERT INTO `busilog` VALUES ('13b186a506db4167ba3b9d2a43840945', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:40:18');
INSERT INTO `busilog` VALUES ('13c890380f3841d397abe39fad3350f6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:46:19');
INSERT INTO `busilog` VALUES ('13da30d9c0de4179ba66e98dfaf4c120', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:59:03');
INSERT INTO `busilog` VALUES ('13da99a1921947af9081a0fde32b8b10', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:14:00');
INSERT INTO `busilog` VALUES ('13dd2270127144a686a66c5a2fdeb6e2', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:30:59');
INSERT INTO `busilog` VALUES ('1406d268b205486ca54a63ae47abae9c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:32:11');
INSERT INTO `busilog` VALUES ('142b6de15089424487692e85514042de', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:54:22');
INSERT INTO `busilog` VALUES ('144c1b4c897f4b4e844d09c2334423fa', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:16:37');
INSERT INTO `busilog` VALUES ('148fbddefdec40f68edbe1eccb494da7', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:09:00');
INSERT INTO `busilog` VALUES ('14f80020c3414800b186ed13d92043b3', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:52:41');
INSERT INTO `busilog` VALUES ('14fbdeef272545ad912e035148f91063', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:31:48');
INSERT INTO `busilog` VALUES ('1506495b36404108a96b584bcce26778', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 17:12:07');
INSERT INTO `busilog` VALUES ('15db90a88598476790dacc6d5dded774', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 17:06:24');
INSERT INTO `busilog` VALUES ('16277b89a40f4b0297c15cf987a86c9f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:10:26');
INSERT INTO `busilog` VALUES ('16455d8497e24cdc8c3ce12746266f1a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:18:54');
INSERT INTO `busilog` VALUES ('1685e2e2a9f54c77a4703646ae198ce9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:13:07');
INSERT INTO `busilog` VALUES ('16cb464caabb4309bfb19553ac19fc3d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:06:37');
INSERT INTO `busilog` VALUES ('175b451c56ff4d4dbe42b450c56d3c39', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:27:51');
INSERT INTO `busilog` VALUES ('1763b46cd9c546878fac65733d605d69', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:38:12');
INSERT INTO `busilog` VALUES ('1790faadd8e5482ab2f3242b86fe6298', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:15:37');
INSERT INTO `busilog` VALUES ('17c100e4ccf943199b3a0487b8b9a5c7', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:11:01');
INSERT INTO `busilog` VALUES ('1812771564d34d36a240879c7e4e99c9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:59:15');
INSERT INTO `busilog` VALUES ('182efcdf8387481a88a642b9c9f57e55', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:06');
INSERT INTO `busilog` VALUES ('1870103b5ee74f19be7e6e156e2b3ab6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:09:36');
INSERT INTO `busilog` VALUES ('18cc4b73565c47b09eb3cb430618e713', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:54:58');
INSERT INTO `busilog` VALUES ('18e8a13cbf2b4af9842eba0e3868f2de', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 17:04:34');
INSERT INTO `busilog` VALUES ('190705a9833e4dc48c4efa980583361b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:37:04');
INSERT INTO `busilog` VALUES ('198fdc3629e1484799b5f10b8be9355d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:36:23');
INSERT INTO `busilog` VALUES ('19d084e901c344188b203e07a70c2a20', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:00');
INSERT INTO `busilog` VALUES ('19d7e6c022c041f5b487dfb34ded5419', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:40:33');
INSERT INTO `busilog` VALUES ('1ab020e0926a4953b4e5b9d9cf6a02f0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:19:20');
INSERT INTO `busilog` VALUES ('1af2d0abe35c44a792f9fc769e73dc53', null, 'test', '查询类', '用户管理：执行查询方法:[major:02]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:13:31');
INSERT INTO `busilog` VALUES ('1b0a424fbb244417a6ce4b46d0ff3f3c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:28:58');
INSERT INTO `busilog` VALUES ('1b10d86b23c24d6ea5e9f393b1e0ca89', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:00');
INSERT INTO `busilog` VALUES ('1b1889f499414fc5bf91fea199e8e403', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:21:01');
INSERT INTO `busilog` VALUES ('1b4f9a7fa3874d5695c23e8dc8f0efc0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 00:35:31');
INSERT INTO `busilog` VALUES ('1b9352b4fd36414bb615b2cfc92c6e41', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:41:30');
INSERT INTO `busilog` VALUES ('1ba6a76c7e41460dbb98bea0ed615b4d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:22:45');
INSERT INTO `busilog` VALUES ('1c0e553c5b6d4e0e9c28db9deca13d02', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:52:44');
INSERT INTO `busilog` VALUES ('1c116eebb9954db3a2d709b81cc474dd', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:11:46');
INSERT INTO `busilog` VALUES ('1c476b88fbe24df7b2c98ed5303972d9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:18:36');
INSERT INTO `busilog` VALUES ('1c53ba1421554f758d62a577278526f2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:34:10');
INSERT INTO `busilog` VALUES ('1c6a811c7b674e0b9b74bce797cfd4c9', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:33:08');
INSERT INTO `busilog` VALUES ('1c7efe1b2f4a4e95829994c22864cf1e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-07 01:06:26');
INSERT INTO `busilog` VALUES ('1c9ef66a294849b184a35ccfed55451a', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:16:26');
INSERT INTO `busilog` VALUES ('1cdb9aa7b4f4408a8117ef95357d5a01', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:09:11');
INSERT INTO `busilog` VALUES ('1d990b4787ff4dfeb7406618294e0a4e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:]的日志记录', 'sysid', null, '2017-04-04 14:21:06');
INSERT INTO `busilog` VALUES ('1dd257ac4df5476c853b921e118a96d0', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:26:10');
INSERT INTO `busilog` VALUES ('1e1bf067e9fe4c5cace3255461022680', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:28:44');
INSERT INTO `busilog` VALUES ('1ed2f15f125b472d8ce3cb94001a2220', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:47:11');
INSERT INTO `busilog` VALUES ('1f65a8bf0e5749abba7064c8cec19558', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:10');
INSERT INTO `busilog` VALUES ('1fa0cddeb81e49b09912a09373cae93e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:14:30');
INSERT INTO `busilog` VALUES ('1fb5d8cb6e3846e2a581369f08fbaba5', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:14:59');
INSERT INTO `busilog` VALUES ('1fe06ea609904868a2598c1a20e73556', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:03:43');
INSERT INTO `busilog` VALUES ('1ff0fb99058c44a6a264a74bc4e58403', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:39:44');
INSERT INTO `busilog` VALUES ('2008781a10b146a88cfeffc9bda9b16d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:47');
INSERT INTO `busilog` VALUES ('202194a26b46497aba8be61a3debd781', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:45:19');
INSERT INTO `busilog` VALUES ('2047dbdc300c4b2a8045e362acf192c5', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:39');
INSERT INTO `busilog` VALUES ('204b3ce15c3345c69d8b3eb76ccac136', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:16');
INSERT INTO `busilog` VALUES ('206024b3e1f2467fb2b7e0d483c5739a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:12:21');
INSERT INTO `busilog` VALUES ('211271923ce14d46b48c9dbd7dbb7b61', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:27:13');
INSERT INTO `busilog` VALUES ('21184ba6296f49e3a2caf2a611f2baf5', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:19:01');
INSERT INTO `busilog` VALUES ('219b3a5856624035983ebda3e9aa0e3a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:09:01');
INSERT INTO `busilog` VALUES ('22250baeb8474dc1b13b0ff1af7bead3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:33:14');
INSERT INTO `busilog` VALUES ('2248fffad2554c8f9f3f6726a481fac6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:14:47');
INSERT INTO `busilog` VALUES ('22eac62f099343a8b171fe4ddfaf6b66', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:26:00');
INSERT INTO `busilog` VALUES ('22f863a349d14b75a194008337f5ba1c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:48:22');
INSERT INTO `busilog` VALUES ('230fd7908fb34bc0b4079d151eb315bc', null, 'test', '查询类', '用户管理：执行查询主数据方法:[sex:0]的日志记录', 'sysid', null, '2017-04-07 16:31:03');
INSERT INTO `busilog` VALUES ('2353c355644e4bc29ce17c6c355d9dd9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:22:45');
INSERT INTO `busilog` VALUES ('239ed8ff6eaa488996d441d2c183d3d5', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:31:33');
INSERT INTO `busilog` VALUES ('23d21bb109c5464981a12910bd6a8847', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:25:52');
INSERT INTO `busilog` VALUES ('23e803c845094a36a3b7b82f857f760a', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1231, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:22:14');
INSERT INTO `busilog` VALUES ('23f0a72f5c8b40c6a3f12108893233b6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:31:05');
INSERT INTO `busilog` VALUES ('245c7d5696b14cb08a6080567d9fcf8a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:40:31');
INSERT INTO `busilog` VALUES ('247b13b16a5442c1be257cb978856a92', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:18');
INSERT INTO `busilog` VALUES ('248ae9c1e06b4579a7c8d308a3d979f9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 13:48:16');
INSERT INTO `busilog` VALUES ('2498a5a3064f4112a12c8f25dc361b84', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:26:02');
INSERT INTO `busilog` VALUES ('25549c74d1254b8ab745417cbebe92bf', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:06:55');
INSERT INTO `busilog` VALUES ('2560d72cc9ad47aab9ebc7b43bb34a16', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:53');
INSERT INTO `busilog` VALUES ('2561c3d3a08640ed96382921bfa570fc', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:23:16');
INSERT INTO `busilog` VALUES ('2565a622451849d28fb9ee43c9ba33c1', null, 'test', '查询类', '用户管理：执行查询方法:[major:01, sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:28');
INSERT INTO `busilog` VALUES ('259f92f6d7f84490a565384ee6834e91', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:23:11');
INSERT INTO `busilog` VALUES ('25af58c11d9247ee83ce59767441cf2f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:23:06');
INSERT INTO `busilog` VALUES ('25c6823c8c4f4eaf9ca8b383a2152073', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:21:43');
INSERT INTO `busilog` VALUES ('2619eb8bcbd14c5ca88f54a8b31a71e3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:37:16');
INSERT INTO `busilog` VALUES ('2682eee29fb04838b18c15b3f754fdcc', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:40:29');
INSERT INTO `busilog` VALUES ('27b2a60ab22645728c32a578d66ada7a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:05:52');
INSERT INTO `busilog` VALUES ('28ae787478724b378765baf74d68e546', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:18:58');
INSERT INTO `busilog` VALUES ('28c68995f05b4074849e59b89555473e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:37:04');
INSERT INTO `busilog` VALUES ('28d1e53fea354806a8fe9d73517ab922', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:08');
INSERT INTO `busilog` VALUES ('28d917b36452446cbbd1df96ca974672', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:41:21');
INSERT INTO `busilog` VALUES ('299b79890f604615b4519649cb6c18cc', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:27:57');
INSERT INTO `busilog` VALUES ('29cc21fa6514478a839e19b906a353f6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:06');
INSERT INTO `busilog` VALUES ('2a72c048f730437f96fba59cfd57ca4d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:10:16');
INSERT INTO `busilog` VALUES ('2c04000c0ac74bbb95da51ee8e71e22c', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1231, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:25');
INSERT INTO `busilog` VALUES ('2c4b4d7519844617aa37f36df4cdb7ef', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:13:49');
INSERT INTO `busilog` VALUES ('2c7acd174edf40a59a4dcc346665899d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:11:17');
INSERT INTO `busilog` VALUES ('2c90b24d0ff14da2be65c7740e58a5a4', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:25:41');
INSERT INTO `busilog` VALUES ('2cce2335ff0740939346da5054729a2a', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:01:45');
INSERT INTO `busilog` VALUES ('2d796a20783f4431a8558a853d16ad21', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:02:33');
INSERT INTO `busilog` VALUES ('2d9d4a11778b49009ecec3b767a1d719', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:23:46');
INSERT INTO `busilog` VALUES ('2dcde6325a2740dcbc99827efd4193a1', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:19:10');
INSERT INTO `busilog` VALUES ('2fe873d7225a4231baf8c62399d5b337', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:05:27');
INSERT INTO `busilog` VALUES ('30f124a518d5490bad46c445a5596c49', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:25:20');
INSERT INTO `busilog` VALUES ('3165c9e900a344fba4fe7cc0a03047dc', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:10:12');
INSERT INTO `busilog` VALUES ('318f8db56a7c4c48b7210f740c9247bd', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:05:20');
INSERT INTO `busilog` VALUES ('3193ded1e45440ac8221a09a560b71cb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:57:53');
INSERT INTO `busilog` VALUES ('325c595e00d3445da778b4927f8934d2', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:20:38');
INSERT INTO `busilog` VALUES ('3260a58d4ba4447f8f35f817cbb579c4', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@2597803的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:03:46');
INSERT INTO `busilog` VALUES ('32d44e391acb48e8ab3080451aa04612', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:02:00');
INSERT INTO `busilog` VALUES ('3310b6ecef354f30b0e8df42f1a48d00', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:39:30');
INSERT INTO `busilog` VALUES ('336e280cd1ad4f28b528a4512e82f14b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:05');
INSERT INTO `busilog` VALUES ('339b50d45b9d47f5b6b936b41a3859f3', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:40:57');
INSERT INTO `busilog` VALUES ('33a1821e95bb4ad0b12feba2133eef80', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:02:27');
INSERT INTO `busilog` VALUES ('33d07cad1f834b929b64d33eb36c4ba7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:48:14');
INSERT INTO `busilog` VALUES ('340019d816d248f4be86aaed63535be0', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:11:33');
INSERT INTO `busilog` VALUES ('350dfed34ace48358378ffb7e6fb2c51', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:19:57');
INSERT INTO `busilog` VALUES ('350fbccf4b11476797cfa75186d50540', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:15:56');
INSERT INTO `busilog` VALUES ('35ab6cd57e814903b0b25e2bc665db58', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:02:50');
INSERT INTO `busilog` VALUES ('35c50d1f502548538b8a8f42563170f0', null, 'test', '查询类', '用户管理：执行查询方法:[profession:02, sex:1]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:35');
INSERT INTO `busilog` VALUES ('36b39e2b9de647948bbc5ee474fbea65', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:42:04');
INSERT INTO `busilog` VALUES ('378c93fafbc74b07a6fc4d914208db4f', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:13:47');
INSERT INTO `busilog` VALUES ('383ae1c2d7734fd3ac5b91cbc73e637a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:33:44');
INSERT INTO `busilog` VALUES ('3846d314aabb4eb98472c69dfda10e48', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:09:32');
INSERT INTO `busilog` VALUES ('3883f3a80cb2454da9beddabb12d4297', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:33:17');
INSERT INTO `busilog` VALUES ('38f30e361ef34cf7ac52401a8cd7d2cc', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:08:40');
INSERT INTO `busilog` VALUES ('395f3f985bb84e53ad719c4971b5bc79', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:50');
INSERT INTO `busilog` VALUES ('3965ad31f44941ab8851231062189461', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:44:12');
INSERT INTO `busilog` VALUES ('3a1e7bcd9bae49779fe3849162fa024a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:58');
INSERT INTO `busilog` VALUES ('3a1f04d47eec4da781d9cadfa3dd8e71', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:33:07');
INSERT INTO `busilog` VALUES ('3a3a1539bad142418e1ed6be3439ee64', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:26:13');
INSERT INTO `busilog` VALUES ('3a8203d7cc3044efbe9a850e14f5f8c2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:05:52');
INSERT INTO `busilog` VALUES ('3ad65cf69aff44b3bdac281bd635be1d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:50:05');
INSERT INTO `busilog` VALUES ('3afb377bbecf49a5afe760b55ff10232', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:17:09');
INSERT INTO `busilog` VALUES ('3afe51a72d364a1f831236b9e81a0c9b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:47:06');
INSERT INTO `busilog` VALUES ('3b17c2c23df542c6b3a0186fd63e607f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:33:41');
INSERT INTO `busilog` VALUES ('3b2acb9961764d28afdee9a5d2022ba9', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@de8417的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:09:40');
INSERT INTO `busilog` VALUES ('3b38b57929e94003b781ef42098bc71a', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:11');
INSERT INTO `busilog` VALUES ('3ba64882474d4e0381a1a24895c4f8c7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:07:56');
INSERT INTO `busilog` VALUES ('3bc8a8c874cb4db3916bb95fbd1dcac7', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:05:47');
INSERT INTO `busilog` VALUES ('3bc9ec21d6af41d8ab631d4d84ff3848', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:12:19');
INSERT INTO `busilog` VALUES ('3be752be684c46e8b4bab62bc2c97190', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:30:46');
INSERT INTO `busilog` VALUES ('3bed3f9e5f3a4944960ce210f36692b4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 16:05:36');
INSERT INTO `busilog` VALUES ('3c140ecb414f4f5c9f26fde087839c6b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:36:53');
INSERT INTO `busilog` VALUES ('3c36f05f61434a2d9fbd7ab4f4691ec5', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:32');
INSERT INTO `busilog` VALUES ('3c72afb86c7d4bfba4c0c7fa8a043e71', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:17:42');
INSERT INTO `busilog` VALUES ('3cbca0423756446f991bf4734a1dd956', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1231, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:24:13');
INSERT INTO `busilog` VALUES ('3cc095bb60714d0c88c4a2fb862223ce', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:05:12');
INSERT INTO `busilog` VALUES ('3d08259af8ba467d9e06ca6d66512a5c', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:08:40');
INSERT INTO `busilog` VALUES ('3d4404a97f6147e9bfe212d0cd35b49b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:43:59');
INSERT INTO `busilog` VALUES ('3e25004d5024427781dd3c8274821161', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:55:00');
INSERT INTO `busilog` VALUES ('3e7c87d926ba4ddb91db0f569f79bbc3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:09:48');
INSERT INTO `busilog` VALUES ('3eb41d159923421fb59c8fa256f6e5e7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:41:53');
INSERT INTO `busilog` VALUES ('3f89648df2554aa0946ca9fcf42a0e0a', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:33:22');
INSERT INTO `busilog` VALUES ('3fa518d623e74a0aa556074b82c34d0d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:40:26');
INSERT INTO `busilog` VALUES ('3fc2b78f3f1c41bab778ba8836adbbd5', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:11:06');
INSERT INTO `busilog` VALUES ('3ff605c4edda407e8dbb3df9c5afb00c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:14');
INSERT INTO `busilog` VALUES ('4012e57fef9e4551965dfa7dec7404db', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:18:55');
INSERT INTO `busilog` VALUES ('4091216d550b47a586446f66b01f4dca', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:05');
INSERT INTO `busilog` VALUES ('40cc328316194881b662539a3c9b8a10', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:09:20');
INSERT INTO `busilog` VALUES ('40e77efa6f114d43bba23a949271107b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:58:29');
INSERT INTO `busilog` VALUES ('41003645af34499ebf80c69545088d9b', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:09:00');
INSERT INTO `busilog` VALUES ('417e99d62e8343aea2a0bbe1fadccd94', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:33:06');
INSERT INTO `busilog` VALUES ('4248ca7f72fc42009d9cb3c0889d6139', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:11:11');
INSERT INTO `busilog` VALUES ('426ed11cbc294e0cb56aba61b119b06a', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:09:34');
INSERT INTO `busilog` VALUES ('429ad8458ca648308ce80aa829b54a7f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:25:38');
INSERT INTO `busilog` VALUES ('42dadff263d146f3ab22400cd2071f17', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 23:12:05');
INSERT INTO `busilog` VALUES ('42dd823fb0a641a79b43e6e6bd11adc7', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:59:06');
INSERT INTO `busilog` VALUES ('4309aff524064c1c93a269a1aca69c64', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:35:35');
INSERT INTO `busilog` VALUES ('43115b0de6c748d880756cf2ceb66be3', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:11:20');
INSERT INTO `busilog` VALUES ('431fe1cb5deb4fa1a529004c82596bf8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:13:32');
INSERT INTO `busilog` VALUES ('433ac87b33de4700950c1d76c22531d6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:23:09');
INSERT INTO `busilog` VALUES ('43642ce1154b4dd98e990c90576fab60', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:09');
INSERT INTO `busilog` VALUES ('436b62a3a92d4505a986c6159e2a6086', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:01, username:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:27:40');
INSERT INTO `busilog` VALUES ('439731fda7104ce2ac9d7db786156dea', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:04:07');
INSERT INTO `busilog` VALUES ('4430752641ce487a9b6ed08861652fc7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:39:54');
INSERT INTO `busilog` VALUES ('44445ac9e7c742c0a66a70a3cc3962cc', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:41:13');
INSERT INTO `busilog` VALUES ('44eba3a19a664bae82fb9617d4887307', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:30:06');
INSERT INTO `busilog` VALUES ('4545053a8ad34051a1ffb1df48b1709e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:06:24');
INSERT INTO `busilog` VALUES ('45665dd3304c4fe996e097d009ef021c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:55:37');
INSERT INTO `busilog` VALUES ('456838b0372347fab5bd77fa43ab537b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:18:20');
INSERT INTO `busilog` VALUES ('456e5285755343d186ace5395807f520', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:44:02');
INSERT INTO `busilog` VALUES ('45edcf8eadda4bc08698e49a72873991', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:09:06');
INSERT INTO `busilog` VALUES ('465194a892594d95bdaf5c8ee7d76010', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:28:21');
INSERT INTO `busilog` VALUES ('46764ff06b4842e68b1a3ccef0eece5e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:52:07');
INSERT INTO `busilog` VALUES ('46b57984261e462fb61422caf49c7507', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:49:25');
INSERT INTO `busilog` VALUES ('4731180d5fb3430aa42daac687066387', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:46');
INSERT INTO `busilog` VALUES ('473148c043634858b7c1593e2129aa4e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:38:14');
INSERT INTO `busilog` VALUES ('47dba82a6fb241cd84c2247ced56e9f6', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:27:57');
INSERT INTO `busilog` VALUES ('481ffa83294d449bbd58d43f0ed59386', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:08:45');
INSERT INTO `busilog` VALUES ('48468e32328941e2823f44409b79740a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:26');
INSERT INTO `busilog` VALUES ('48a1d5167a654ed3ab97a05048e9e68e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:15:39');
INSERT INTO `busilog` VALUES ('49d9fb9d56f344e1b5502239a3f9a6fd', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:59:35');
INSERT INTO `busilog` VALUES ('49e342b5823b4ef98aaa6c9c5ed3b787', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:10:09');
INSERT INTO `busilog` VALUES ('4a0f3a62deb44164910a6d76680179d3', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:12');
INSERT INTO `busilog` VALUES ('4ac239c121224bc9a3d57bfea07695fe', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:42:30');
INSERT INTO `busilog` VALUES ('4ad13ce188c1445aa22d64d509d185ed', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:27:27');
INSERT INTO `busilog` VALUES ('4aeaeef18b794ef8a913abd1d16323d2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:07:16');
INSERT INTO `busilog` VALUES ('4af1ed668a17464a9c6770144ea3d962', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:43:56');
INSERT INTO `busilog` VALUES ('4afeb4ca7dac4766ac8fc57c50b264ca', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 17:05:33');
INSERT INTO `busilog` VALUES ('4b05da7881494e9086e9ca75d9812f55', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:07');
INSERT INTO `busilog` VALUES ('4b39bbed411d48098445f2d326640d1d', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:11');
INSERT INTO `busilog` VALUES ('4ba487556ea149fc837c454f86b5f338', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:10:43');
INSERT INTO `busilog` VALUES ('4c150b0f822343c6b3cf8c5dd6c8c18d', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:40:17');
INSERT INTO `busilog` VALUES ('4c20aeb382f0416ab590706323a4f6fc', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:43:55');
INSERT INTO `busilog` VALUES ('4c5efdf2365d44f094ff158e43a0846b', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:31:15');
INSERT INTO `busilog` VALUES ('4caae7613dda47899af5f90732a6d564', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:19:21');
INSERT INTO `busilog` VALUES ('4cf61c93ca88452da235152f2ddada91', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:50:55');
INSERT INTO `busilog` VALUES ('4d4511a5dfda492e94a4ab69f5b78d50', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:56');
INSERT INTO `busilog` VALUES ('4d5366a8189347189e36d678c3d66c57', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:45');
INSERT INTO `busilog` VALUES ('4d8150ebe93a4c89b58558ede5d669b6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:10:41');
INSERT INTO `busilog` VALUES ('4e10cc8ad3454b41bfdd2dd127193ac1', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-07 11:15:51');
INSERT INTO `busilog` VALUES ('4e4ee4dc7a9349cfb3748db54c36f1a4', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:55:33');
INSERT INTO `busilog` VALUES ('4f73196ba40b4463b9ad1fcf3569b291', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:37:50');
INSERT INTO `busilog` VALUES ('4f7a908e7eb449cb85d447a41ba948a6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:52:38');
INSERT INTO `busilog` VALUES ('4ff3263c9ec345f0adf3853657dbcd75', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:11:15');
INSERT INTO `busilog` VALUES ('4ff8abbee73b415499961b9cf08ca477', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:43:35');
INSERT INTO `busilog` VALUES ('5059c3d6f7eb4f939ed6e4f46aa994a6', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:19:20');
INSERT INTO `busilog` VALUES ('50c891500bd349e3b03c7e859881df88', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:41');
INSERT INTO `busilog` VALUES ('50d1246e45e24e359c34a81ccd31e5d2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:09:38');
INSERT INTO `busilog` VALUES ('50dd1135194f43d2acef70043c5ff081', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:57:47');
INSERT INTO `busilog` VALUES ('50df182bfa9448eb8ac247d27d86ee29', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:13');
INSERT INTO `busilog` VALUES ('51f0a2ce01044d47af5ec67794bab780', null, 'test', '查询类', '用户管理：执行查询方法:[profession:01]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:44');
INSERT INTO `busilog` VALUES ('5261ac98a2ab46c79b04a86d49311cdc', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:17:16');
INSERT INTO `busilog` VALUES ('528c8ac680744356991412ef27d06ee6', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:09:21');
INSERT INTO `busilog` VALUES ('53d08760d3e24e2985c542c45e9a6dc4', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:24:16');
INSERT INTO `busilog` VALUES ('53dea8af2a6348998919ad5ac8403b1b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:19:48');
INSERT INTO `busilog` VALUES ('53ed38c5ff33447f8ba52663c664c172', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:41:45');
INSERT INTO `busilog` VALUES ('5417fd61ff3c4cf4bf00a5a843a46d07', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:58:35');
INSERT INTO `busilog` VALUES ('5435123e684c4adb84956160f4c4fc41', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:18:57');
INSERT INTO `busilog` VALUES ('544a820abff54d978d0b2a62cf6af1e7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:38:28');
INSERT INTO `busilog` VALUES ('54a1ae05e97a465c98a74b1a701af40f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 19:28:20');
INSERT INTO `busilog` VALUES ('54a9f126f5114f62a5fb113a5f66e958', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:44');
INSERT INTO `busilog` VALUES ('54b445ea6e1a4a06b06d9bf71d801ffb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:53:26');
INSERT INTO `busilog` VALUES ('54d951cd99a84ec5a4acdfac9a08ca49', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:44:52');
INSERT INTO `busilog` VALUES ('54fc48bae9ec491d9ac75c916f6aa2d4', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:12:42');
INSERT INTO `busilog` VALUES ('556b3d75f61c4fc9b050b3877b35171c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:53:15');
INSERT INTO `busilog` VALUES ('565151fdb9bc4100be99034f14bbaa5b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:37');
INSERT INTO `busilog` VALUES ('5675eae8607d4a9385fb44dd92fc2373', null, 'test', '查询类', '用户管理：执行查询主数据方法:[sex:1]的日志记录', 'sysid', null, '2017-04-07 16:31:01');
INSERT INTO `busilog` VALUES ('56d15a151e3546cd8d3a599d2cbf23a0', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 14:47:14');
INSERT INTO `busilog` VALUES ('56f1e41376f7466eba486992e830a9eb', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:23:35');
INSERT INTO `busilog` VALUES ('5707428f0d214eb19f6e3e9fdcd9acee', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:14:08');
INSERT INTO `busilog` VALUES ('571c53080557466ead84ab14b983ed92', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:55:21');
INSERT INTO `busilog` VALUES ('572f970f19354321af855f7cfc6f3788', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:33:00');
INSERT INTO `busilog` VALUES ('578c096a8d494b2a885a57eee6d85b6f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:59:33');
INSERT INTO `busilog` VALUES ('582772095c954355a048c34d7eff237a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:14:44');
INSERT INTO `busilog` VALUES ('582b31c606d84ed8a5462dd561b75094', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 22:34:38');
INSERT INTO `busilog` VALUES ('58505e7315bc4446a176ad6423eb2f23', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:39:35');
INSERT INTO `busilog` VALUES ('587d9028192e4b1d893ee94cf3b8e2d1', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:39:30');
INSERT INTO `busilog` VALUES ('588b3e1a6d164262af72dd86013ce257', null, 'test', '查询类', '用户管理：执行查询方法:[profession:01, sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:52');
INSERT INTO `busilog` VALUES ('589f29c76c29458b935f6dc1be4f14ea', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:03:49');
INSERT INTO `busilog` VALUES ('58d77ef61ad143859cc6d95c76f1b746', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:39');
INSERT INTO `busilog` VALUES ('58e35cde493b462fb04a8929cca72383', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:23:14');
INSERT INTO `busilog` VALUES ('59aed860f0914b0483cb5c34abc4ee62', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:01, username:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:26:40');
INSERT INTO `busilog` VALUES ('59d4562eb1544c8d9677a7d91ac2c61e', null, 'test', '查询类', '用户管理：执行查询方法:[work_date:1491408000000]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:39:31');
INSERT INTO `busilog` VALUES ('5a1eacdd0ab54d35bc556b7cca1dc875', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:52:57');
INSERT INTO `busilog` VALUES ('5a390f3931434927ad4bbc3ccef0a29b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:01:40');
INSERT INTO `busilog` VALUES ('5a5a5baf75824d65aff826e7ef9bb843', null, 'test', '查询类', '用户管理：执行查询方法:[profession:02, sex:1]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:31');
INSERT INTO `busilog` VALUES ('5a878ac635684eec9d6fee802412d6d5', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:22:04');
INSERT INTO `busilog` VALUES ('5ac89a5ba3f447a6877874542958f183', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 16:59:03');
INSERT INTO `busilog` VALUES ('5acb3695a917406ea79d745a9fc84961', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:12:08');
INSERT INTO `busilog` VALUES ('5b27c0693d5c42fca69a6db542213803', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:41:53');
INSERT INTO `busilog` VALUES ('5b37a2d9b4744f9abc0904681cb0c3fb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:40:33');
INSERT INTO `busilog` VALUES ('5b901203c389482b9039ac43a2850767', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:02:03');
INSERT INTO `busilog` VALUES ('5ba943cab26443d89967d75a1a826f04', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:06');
INSERT INTO `busilog` VALUES ('5c3e74cb0e7a44178c0b537657497278', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:06:50');
INSERT INTO `busilog` VALUES ('5c41f306fc7f4a5781117106f37cabbb', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:22:39');
INSERT INTO `busilog` VALUES ('5c868b8031a144f09a3914e09abc7a98', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 16:43:26');
INSERT INTO `busilog` VALUES ('5d5ae77585ec4fb984755a8bd56d94a7', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@1b1badf的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:26:01');
INSERT INTO `busilog` VALUES ('5e911329407a4ff28c57b883958d346b', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:42:20');
INSERT INTO `busilog` VALUES ('5ea5b59db30f43a8a541b1d516e2d856', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:59:14');
INSERT INTO `busilog` VALUES ('5ec6693e65194a96bbbe0c1c48117200', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:22:36');
INSERT INTO `busilog` VALUES ('5ed960bc40264f48938b5b4cbfb3a412', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:19:36');
INSERT INTO `busilog` VALUES ('5eda3ad6d20d4563a07a6ae6fa3a920a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:49:39');
INSERT INTO `busilog` VALUES ('5f4a20da1717422d8a99d97aa68cec99', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:09:52');
INSERT INTO `busilog` VALUES ('5fc1022f1fa8409d869f486b89424036', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:09:55');
INSERT INTO `busilog` VALUES ('5fd139cf99e341c2b4cf521cfee70082', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:03:13');
INSERT INTO `busilog` VALUES ('5fe4483dfcdb422a9ea32fe0e5e26d79', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:15:08');
INSERT INTO `busilog` VALUES ('6021cace21fb4712b05bac568f173914', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:37');
INSERT INTO `busilog` VALUES ('604a871f472a48e8ae8d61bde748f69b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:05:46');
INSERT INTO `busilog` VALUES ('60b7ee8012ff4e0982232449aa2531af', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:46:12');
INSERT INTO `busilog` VALUES ('60ca366304e04f2e9dbfc3a66d474a49', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:41');
INSERT INTO `busilog` VALUES ('613d516a5a354e9aa6c3b87f1a0a851d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:23:44');
INSERT INTO `busilog` VALUES ('618486bb74474933b43db08e9d1efee7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:27:07');
INSERT INTO `busilog` VALUES ('61988bea3535449d8fab7a5c28cf4b57', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:34');
INSERT INTO `busilog` VALUES ('62091cc8676f47e8b1d1a7652b9de37a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:42');
INSERT INTO `busilog` VALUES ('6245d6d5055446a2a40f5c3c567ea1a6', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:02, username:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:26:44');
INSERT INTO `busilog` VALUES ('626eea12f985414c84626d5b4d4f9256', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:03:16');
INSERT INTO `busilog` VALUES ('62742ad1f95e4a03b022712f4522eac9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:57');
INSERT INTO `busilog` VALUES ('62a4b076b5b2468eb3b490b8d4bf32df', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:16:17');
INSERT INTO `busilog` VALUES ('62e9478554904722863fff7650eb77d4', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:11:54');
INSERT INTO `busilog` VALUES ('62f57114a6884dfe9e8d6733aa284229', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:38:38');
INSERT INTO `busilog` VALUES ('62f93c310bdb43ceb3fc6bb034f6064c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:28:38');
INSERT INTO `busilog` VALUES ('64577630c4b64d69aa94583ecc28bdfe', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:47:59');
INSERT INTO `busilog` VALUES ('64d0e793ce02491688ab6b24735abcf0', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:25:08');
INSERT INTO `busilog` VALUES ('64f35eae270d45e1b15adc0f4cb9e137', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:05:33');
INSERT INTO `busilog` VALUES ('651324f07bf541bdbf68732602601f34', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:05:13');
INSERT INTO `busilog` VALUES ('6530e7bd2519400ba945721ae2d948dd', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:07');
INSERT INTO `busilog` VALUES ('65ac130d3899423ba8aad0968cf49262', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:57:39');
INSERT INTO `busilog` VALUES ('667a9a0002af4ec49b1e063fc3e6b564', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:49:47');
INSERT INTO `busilog` VALUES ('6695531aa71a45ceac3dc91b947fe18b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:25:06');
INSERT INTO `busilog` VALUES ('66af3161d5c84794b3a9d5da717cf75f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:30:31');
INSERT INTO `busilog` VALUES ('6758e6cdf2b64d4faf42dece779b4759', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:02:55');
INSERT INTO `busilog` VALUES ('677dd38b094b44508bb9a46740974c8d', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:52:30');
INSERT INTO `busilog` VALUES ('67dfa4916e574b0eb9a22d045a3a5a4e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:20:02');
INSERT INTO `busilog` VALUES ('6822b6a872514e89bb5e0cd0ff6d685e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:38:10');
INSERT INTO `busilog` VALUES ('6888c9583f7149e8908a13e55b8be141', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:02, username:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:26:45');
INSERT INTO `busilog` VALUES ('696b55ed0b1d49289f23363a9adfcc20', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:25:42');
INSERT INTO `busilog` VALUES ('6979026c8bfb4ac4b5240bb72106b8e9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:41:59');
INSERT INTO `busilog` VALUES ('69c9ee2d0e854b2f82e52a4a61150bb4', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:41:00');
INSERT INTO `busilog` VALUES ('69e058a8772845bb87aac245212e8d50', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:27:05');
INSERT INTO `busilog` VALUES ('69e80d3d5a3f49bc9f9803c9153b57f6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 09:28:49');
INSERT INTO `busilog` VALUES ('69f596491b2f40ee8ff4b246e147fa1b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:08');
INSERT INTO `busilog` VALUES ('69f6e1e535894c868633436a54c515a6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:36:47');
INSERT INTO `busilog` VALUES ('69ff0b0802354375a7e4f7646af2036a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:31:02');
INSERT INTO `busilog` VALUES ('6a762cfadd054fc590c8690ef6e2a436', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:37:35');
INSERT INTO `busilog` VALUES ('6a925cdf7de748d6964dbb6d04da2d7f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:31');
INSERT INTO `busilog` VALUES ('6ac88c853a0f48b5aa7bc7d249c91108', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:32:46');
INSERT INTO `busilog` VALUES ('6ad8ba39189846df90915cdfe11ebd7b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:41:54');
INSERT INTO `busilog` VALUES ('6aeda543b63f4b808190c9ab51340815', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:10:04');
INSERT INTO `busilog` VALUES ('6afba5ee91e04fc0b206467a270917db', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:41:50');
INSERT INTO `busilog` VALUES ('6b0222a17a13448abb90d6385adbe128', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:11:29');
INSERT INTO `busilog` VALUES ('6b4090c91a814bb7aa072fa068db9f1d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:27:09');
INSERT INTO `busilog` VALUES ('6b73257a90bc4af9be7f5aa22aaaa8da', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:57:08');
INSERT INTO `busilog` VALUES ('6b9db663086f47b1be16abe625fca360', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:38:26');
INSERT INTO `busilog` VALUES ('6bdc53d0c9214e428d537739e0d68389', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', null, '2017-04-04 09:28:51');
INSERT INTO `busilog` VALUES ('6bf2dd52f5ed41579c1b2cbb818d20b8', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:09:50');
INSERT INTO `busilog` VALUES ('6c349c9b74a2433e89410eb37a83db51', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:57:31');
INSERT INTO `busilog` VALUES ('6c458dd2e8864c5f8d64255615111905', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:08:00');
INSERT INTO `busilog` VALUES ('6c6725aa624f4b779aab092e256d0e5d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 17:11:09');
INSERT INTO `busilog` VALUES ('6cce5739d17545b08f9dbb8259f93527', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:05:57');
INSERT INTO `busilog` VALUES ('6cdd60795c904c01a713b1d35a648b1f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:20:44');
INSERT INTO `busilog` VALUES ('6dbf80a6dfb14a808e3f251c26e505da', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:34:04');
INSERT INTO `busilog` VALUES ('6dddc78d567d452285f58ce55be0f3ef', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:35:59');
INSERT INTO `busilog` VALUES ('6e2f249ecf764f6fb1fb994de5457db8', null, 'test', '查询类', '用户管理：执行查询方法:[major:01]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:37');
INSERT INTO `busilog` VALUES ('6e6614da858d41439a5ed0be22a02861', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:04:41');
INSERT INTO `busilog` VALUES ('6e8b0ec1f46645b8a6a995f7ff941cf6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 23:05:51');
INSERT INTO `busilog` VALUES ('6eb247b092fb4a3ba5e724fc8147d825', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:37');
INSERT INTO `busilog` VALUES ('6edecbeb3fa94a2b80032eda292d9e25', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:03:52');
INSERT INTO `busilog` VALUES ('6f3010ef27344a71a573a6f6d21a6fc4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:53:08');
INSERT INTO `busilog` VALUES ('701cddd1bf95432dabbe8229dc457cbd', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:35:31');
INSERT INTO `busilog` VALUES ('705cfc0cf1fe465797f6998b7b02acbd', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:14:14');
INSERT INTO `busilog` VALUES ('7082380aa566439c966d7869410ac3cf', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:51:46');
INSERT INTO `busilog` VALUES ('70a7bf6c24044756bd308d95b77a2136', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:34:21');
INSERT INTO `busilog` VALUES ('710f356b939748be832c7485fad2832e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:58:28');
INSERT INTO `busilog` VALUES ('7169cef9f870492ab1f65a87daab664e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 13:48:23');
INSERT INTO `busilog` VALUES ('7171953c1959482baf6bc7e79e515a27', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 13:49:49');
INSERT INTO `busilog` VALUES ('720f03370c3d4dc98cf3611645ad05c8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:34');
INSERT INTO `busilog` VALUES ('7238b32c5a64478082a3f926b68b7ab3', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 14:33:23');
INSERT INTO `busilog` VALUES ('7263a64f32e547a89cf89fc5d1cb5c96', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:23:06');
INSERT INTO `busilog` VALUES ('72a6fa34e5764c05bfd25f61ac84af0b', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:45:51');
INSERT INTO `busilog` VALUES ('72e5067c1e924fbe98200329221f4bcd', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:06:26');
INSERT INTO `busilog` VALUES ('7348cb401ec44abdb72c13d51ff0af00', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:12:57');
INSERT INTO `busilog` VALUES ('73e9c548bd0c4e80958b9ac6a9328561', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:37:19');
INSERT INTO `busilog` VALUES ('744004ff46a54677b4bd277a21ab6d87', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:01:44');
INSERT INTO `busilog` VALUES ('747a669fadaa41b9abf3e86b4907be26', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:41:25');
INSERT INTO `busilog` VALUES ('7487d24150fb4d2aa89203df124856b3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:20:55');
INSERT INTO `busilog` VALUES ('74b6250271b744148cda70cf0b7c8628', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:04:11');
INSERT INTO `busilog` VALUES ('752c735882a348c0ba813e5fa0086815', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:02');
INSERT INTO `busilog` VALUES ('75705bfa228c47afa7a7176cdf64dd8e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:35:39');
INSERT INTO `busilog` VALUES ('7589f271d37446ef94ef1988bec3b347', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:21:09');
INSERT INTO `busilog` VALUES ('75b427966d634ce1886299de611a13c2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:31');
INSERT INTO `busilog` VALUES ('75c9b69cabed4ad2b8e1759d338dd3a3', null, 'test', '查询类', '用户管理：执行查询方法:[name:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:29:55');
INSERT INTO `busilog` VALUES ('76558221ab9e4a29bff3969ac195fcb4', null, 'test', '查询类', '用户管理：执行查询方法:[major:01]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:13:23');
INSERT INTO `busilog` VALUES ('765c523336c04c40897c62c767809cfb', null, 'test', '查询类', '用户管理：执行查询方法:[name:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:27:16');
INSERT INTO `busilog` VALUES ('76a32aabb510436abab80a4c16cbbd5a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:18:35');
INSERT INTO `busilog` VALUES ('76e9f7aa2b3e43dbac5e1d62ac37a0f3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:11:32');
INSERT INTO `busilog` VALUES ('77c18f7b192644f6a38b7fc21f82a48e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:36:50');
INSERT INTO `busilog` VALUES ('77da19dd7a6c404b8ef39c4028dcd53d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:21');
INSERT INTO `busilog` VALUES ('7816c1a53dc54d3cb73efa1082730bb1', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@cc0a9d的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:00:49');
INSERT INTO `busilog` VALUES ('782cf9d59cdd4fc3bc83ede399a70846', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:12:07');
INSERT INTO `busilog` VALUES ('782f8dfb1fea40b4888543456443d3a6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:37:10');
INSERT INTO `busilog` VALUES ('78432ca30d7a4e4c9473def1ad2e9718', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:32:18');
INSERT INTO `busilog` VALUES ('78e4dd3015b34411a820db2dcad152e8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:39:51');
INSERT INTO `busilog` VALUES ('78f3d61b12b3497f8c692b1da375a9ea', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:47');
INSERT INTO `busilog` VALUES ('791cac143a2d4f1a8d3a56c1c9624b0a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:48:20');
INSERT INTO `busilog` VALUES ('794b1af1044245e9b3e8a5e62062d8e4', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:56:01');
INSERT INTO `busilog` VALUES ('7a2005cebb22489993680487bbd8bda1', null, 'test', '查询类', '用户管理：执行查询方法:[username:aaa]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:40');
INSERT INTO `busilog` VALUES ('7a8aa19d231941b9aefa17615483510a', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:06:28');
INSERT INTO `busilog` VALUES ('7ab00b14c1fb4eadbe5a7b5cbd48f3da', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:54:04');
INSERT INTO `busilog` VALUES ('7ba1c6ff1d8b4a28b63279f04da5303f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:42');
INSERT INTO `busilog` VALUES ('7c2dea7012804a699d4fc50da5b6c8a0', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@168e16d的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:41:54');
INSERT INTO `busilog` VALUES ('7cb2f74a789140afa4264b934388e2d5', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:35:03');
INSERT INTO `busilog` VALUES ('7ddc805a8d944f16b7053420b0c01fe3', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:27:04');
INSERT INTO `busilog` VALUES ('7dec4f6a0be5445c96e2f8f883fac254', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:23');
INSERT INTO `busilog` VALUES ('7e0415b5ccbf4b5d9216fc654568dd66', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:06:51');
INSERT INTO `busilog` VALUES ('7e0fdceede304adf9b4a4ed35e9ef544', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:07:45');
INSERT INTO `busilog` VALUES ('7e8a18ca80574fe1a9c989cd36d4c9e0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:03');
INSERT INTO `busilog` VALUES ('7ec741b8ae5b4964b8e537b19787d7b2', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:04:22');
INSERT INTO `busilog` VALUES ('7ececa600a414d0cad6c7fd1c8db2a8d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:51');
INSERT INTO `busilog` VALUES ('7fbc64e4c6db4dd498b7417fb158ef90', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:49');
INSERT INTO `busilog` VALUES ('7fc5de5599bf4df8bda1927992b22cee', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:39:57');
INSERT INTO `busilog` VALUES ('801f80ab928f4eceb1840b9fa797a0f5', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:08:50');
INSERT INTO `busilog` VALUES ('8135aee171cb47aa807d79460b89999c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:31:38');
INSERT INTO `busilog` VALUES ('81399eb09e0c40c89bd928d84ae7362c', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:34:10');
INSERT INTO `busilog` VALUES ('81773cc74b144ea09559cd07d31cbdbf', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:14');
INSERT INTO `busilog` VALUES ('81da86dd88e64120a01a9a8d127561da', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:05:29');
INSERT INTO `busilog` VALUES ('82090819a7164f76906aac33fc07a160', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:13:20');
INSERT INTO `busilog` VALUES ('82243d4e57794b96b5a5d9d08c912104', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:48');
INSERT INTO `busilog` VALUES ('8233c95c615e477497204828ea063c2c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:22:40');
INSERT INTO `busilog` VALUES ('82585c67568e400888fb54df446f9d95', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:33:27');
INSERT INTO `busilog` VALUES ('82e49c7b4d824a68974e4f459c19dd9e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:34:11');
INSERT INTO `busilog` VALUES ('82e6c888c65f447ea5b153993a0b9ca0', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:18:25');
INSERT INTO `busilog` VALUES ('835b76ea35b241aa81d164345903eaec', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:16');
INSERT INTO `busilog` VALUES ('83a6bbbaa8a84c1981b30c7c982a9b0e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:27:42');
INSERT INTO `busilog` VALUES ('844476df6b004ae3b889dae62a94aae4', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:07:32');
INSERT INTO `busilog` VALUES ('847375b1dfe24dcfb65b226b52b7f67c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:09:22');
INSERT INTO `busilog` VALUES ('847543a1e04143f7a5c6757a48a1fac4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:38:13');
INSERT INTO `busilog` VALUES ('84dd55724bba4f9e97ba2620dbd3f294', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:33');
INSERT INTO `busilog` VALUES ('8528634fa82244b798df7c2e55f73310', null, 'test', '查询类', '用户管理：执行查询方法:[profession:02, sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:50');
INSERT INTO `busilog` VALUES ('8542786a83c04505812e2795a7ff79df', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:20:17');
INSERT INTO `busilog` VALUES ('85921e7528b846edb0ce0f4417f5676d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:33:57');
INSERT INTO `busilog` VALUES ('863ff52142e54bec81d00292b6722f6e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:51:23');
INSERT INTO `busilog` VALUES ('86a91c8aa1024d0c981b34eed9f1af73', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:16:45');
INSERT INTO `busilog` VALUES ('86ce140131b4455ab909a28c2c00965b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:16:15');
INSERT INTO `busilog` VALUES ('87bd2c871ef2461e991aea44dcdb561f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:46:41');
INSERT INTO `busilog` VALUES ('8831dc687a0144ef87619d46dc9f7482', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:23:47');
INSERT INTO `busilog` VALUES ('8884cfa02a374c7cb74e32ebbb90c03e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:37:10');
INSERT INTO `busilog` VALUES ('88a883bdc30e458ead1e23756b419a5b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:18:32');
INSERT INTO `busilog` VALUES ('88d5a1a098b2470caf463a7867d6c4e6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:29:42');
INSERT INTO `busilog` VALUES ('8936cc0d6349488f8bdd0cdb2918284e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:37');
INSERT INTO `busilog` VALUES ('8945844758774b2193c925865c22f023', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:13:32');
INSERT INTO `busilog` VALUES ('898f78f222394fbfa64b8f0b9694269d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:17');
INSERT INTO `busilog` VALUES ('89b68d861c044f5e855e5e9bf74b17ca', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:19:51');
INSERT INTO `busilog` VALUES ('89c5a5c954704c9bb94a698760638bbd', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:24:54');
INSERT INTO `busilog` VALUES ('89e3785459ea44ddbb895a9e0d55e670', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:39:41');
INSERT INTO `busilog` VALUES ('8a34b5464263466e9f4ac322d268779f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:36:58');
INSERT INTO `busilog` VALUES ('8a36fc98cb174c4e817e79e8931a1497', null, 'test', '查询类', '用户管理：执行查询方法:[profession:01, sex:1]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:29');
INSERT INTO `busilog` VALUES ('8a7d0c730d324141bfb8ae688e9fb6df', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:33:51');
INSERT INTO `busilog` VALUES ('8ad4fc89e4d342d88181098dbb9cd991', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:23');
INSERT INTO `busilog` VALUES ('8afef8b70c2c4330ad5ae9527eb053ee', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:14:08');
INSERT INTO `busilog` VALUES ('8b108b6e11c045309cec9cfd9855b811', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:32:54');
INSERT INTO `busilog` VALUES ('8b81dec65b3a4a01b2bf4f8586538646', null, 'test', '查询类', '用户管理：执行查询方法:[profession:01]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:24:18');
INSERT INTO `busilog` VALUES ('8b90a57cd0864db0872bba4b5b099a8f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 09:28:57');
INSERT INTO `busilog` VALUES ('8bad715a494f4cbabb0d14b18a3e7323', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:16');
INSERT INTO `busilog` VALUES ('8bfea9b085d742dabcbaa50975f33101', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:43:38');
INSERT INTO `busilog` VALUES ('8c2ba6aa097745b494d0f7937e733243', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-07 11:05:30');
INSERT INTO `busilog` VALUES ('8c426c5cc4df484b8b6552e117ff3b83', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 13:44:56');
INSERT INTO `busilog` VALUES ('8cb83379fd474e57bc53e68c005337f1', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:58:39');
INSERT INTO `busilog` VALUES ('8cfa34a0996c4ce184fca627855b5bc9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', null, '2017-04-04 15:56:43');
INSERT INTO `busilog` VALUES ('8d43e7d9e4b147b1b3d44d2a3262ed3d', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@2c95ebe3的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:55:30');
INSERT INTO `busilog` VALUES ('8d62ab63f43042998d860bb724647fd6', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:11:29');
INSERT INTO `busilog` VALUES ('8d8199ab9a24413fb3e1092c63545760', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:32:48');
INSERT INTO `busilog` VALUES ('8d83eb4c3fd249f88e6ffe1b3061e67e', null, 'test', '查询类', '用户管理：执行查询方法:[profession:01, sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:25:35');
INSERT INTO `busilog` VALUES ('8d9f48e9f5cb413ba0df11e98c941617', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:35:56');
INSERT INTO `busilog` VALUES ('8df29b1d0bf64c9b8cd663feaaa72438', null, 'test', '查询类', '用户管理：执行查询主数据方法:[sex:0]的日志记录', 'sysid', null, '2017-04-07 16:31:31');
INSERT INTO `busilog` VALUES ('8dff69dfc2054bd6892a394e387208e3', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:39:56');
INSERT INTO `busilog` VALUES ('8e3e8e327e514de386c7aa10d72382e6', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:47:20');
INSERT INTO `busilog` VALUES ('8e651dd28bf64a7fa5ad56fb93fa15ce', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:16:29');
INSERT INTO `busilog` VALUES ('8eb772bab5c74b299b7fd7faeb44255f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:50:24');
INSERT INTO `busilog` VALUES ('8ec547749c9443c99eede8896ebd527a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:12:59');
INSERT INTO `busilog` VALUES ('8f0be11d3820488b96293a615aa5b090', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:32:38');
INSERT INTO `busilog` VALUES ('8f57cfa23c514348951799833b7e728d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:37:14');
INSERT INTO `busilog` VALUES ('8f8e21b70e72413f92e9180f9509c541', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:22:37');
INSERT INTO `busilog` VALUES ('8faa2714b9a3463b9fc100e3409752af', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:31:31');
INSERT INTO `busilog` VALUES ('9059f52c37774c97ad831731749fa9a9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:41');
INSERT INTO `busilog` VALUES ('905e3435482e4a9ebb2bfbaa42ee69c4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:08:42');
INSERT INTO `busilog` VALUES ('90cee6a6c4ac4e449daa236386613def', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:33:19');
INSERT INTO `busilog` VALUES ('914adb289903444da510e8cce0956279', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:19:56');
INSERT INTO `busilog` VALUES ('91876cb8f1e6409ea934e712d07297bc', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:16:01');
INSERT INTO `busilog` VALUES ('91ad2866cd434139bc384787f6e755e5', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:13:39');
INSERT INTO `busilog` VALUES ('91ecd6843c0f4709a08205b742bfa594', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:46:03');
INSERT INTO `busilog` VALUES ('9211f8c25c1b4db4b6331c34e71af26b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 19:28:40');
INSERT INTO `busilog` VALUES ('92295dd8205d4ee492e1b652cd223ab6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 16:23:15');
INSERT INTO `busilog` VALUES ('92483ab371ad41919afa6febb127563b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:32:40');
INSERT INTO `busilog` VALUES ('925c67e088174051922732cc1d5a2419', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:54:12');
INSERT INTO `busilog` VALUES ('929db50f61d1439b992e6c8ef06ef0c2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:14:10');
INSERT INTO `busilog` VALUES ('92db4e3986f142838bfb700b25db0d9c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:15:49');
INSERT INTO `busilog` VALUES ('933c873bbdd2450b893682c2d1ce600f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:15');
INSERT INTO `busilog` VALUES ('933ed752334147249ce3bd62bef8bdb3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:46:11');
INSERT INTO `busilog` VALUES ('9342b09ecfb64f8799fb10281877acf9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:58:56');
INSERT INTO `busilog` VALUES ('93bef10bf81f4f4eafb77c92b0033894', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:13:56');
INSERT INTO `busilog` VALUES ('93c5134a9aa64654811d6039993b6390', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:30');
INSERT INTO `busilog` VALUES ('93c5926eb9494ad5ae5782574fedffde', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:19:15');
INSERT INTO `busilog` VALUES ('93f81c129c41437ba4e27fc53073b83f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 17:03:40');
INSERT INTO `busilog` VALUES ('942263e5c44a49f5aa6e7ba91e442db5', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 17:01:54');
INSERT INTO `busilog` VALUES ('945976ca95694290b1dff288a3f7021b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:41:05');
INSERT INTO `busilog` VALUES ('94726e6a46644ae38dbe8362d01c8958', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:30:34');
INSERT INTO `busilog` VALUES ('94b3f625e5e242338989ff39f66e77df', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:57:28');
INSERT INTO `busilog` VALUES ('94bcc41c39984402b271597cce3e0da2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:11:42');
INSERT INTO `busilog` VALUES ('94ddb05d85184eb59379748f608ecf00', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:04');
INSERT INTO `busilog` VALUES ('95cd9487c5eb4c1a90eeb2c5b19caf19', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 23:12:08');
INSERT INTO `busilog` VALUES ('95e53e3b65144af993832d34cafc9f23', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:00:34');
INSERT INTO `busilog` VALUES ('960d662c7de24188a54dd7fba64ba5f8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:06:30');
INSERT INTO `busilog` VALUES ('9613006f587845bf934e7339b1db2ed7', null, 'test', '查询类', '用户管理：执行查询方法:[username:aaa]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:18');
INSERT INTO `busilog` VALUES ('961bb16da68443cca47582927cf3bc87', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:10:04');
INSERT INTO `busilog` VALUES ('96613f1d33104f4eb2ff67b740501d2c', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:02, username:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:26:43');
INSERT INTO `busilog` VALUES ('966cf1ab9d234c3db2a3f6c89723e5a4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:21:05');
INSERT INTO `busilog` VALUES ('967b3f2223944c8ba4ae5ea0122069cd', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:37:05');
INSERT INTO `busilog` VALUES ('96866bcf839247aebe4efbd29b0c5780', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:39:00');
INSERT INTO `busilog` VALUES ('96ead9e9ae42466eaf9bc58b359f3311', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:17:07');
INSERT INTO `busilog` VALUES ('98092af9fa464cd1b0709ebcc97709f9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:23:03');
INSERT INTO `busilog` VALUES ('981adb58de85406196c5bb697087672f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 17:03:48');
INSERT INTO `busilog` VALUES ('98aedf255dd94746971176f18c459a24', null, 'test', '查询类', '用户管理：执行查询方法:[sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:46');
INSERT INTO `busilog` VALUES ('998b86759c064173b1acbf6db58718fe', null, 'test', '查询类', '用户管理：执行查询方法:[sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:09:33');
INSERT INTO `busilog` VALUES ('9a43020aa0c846c58f3807b818b93e3e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:31');
INSERT INTO `busilog` VALUES ('9a749c8478b44386b4eca816d6199518', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@2819c4的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:01:03');
INSERT INTO `busilog` VALUES ('9ad9b460aa3c47a6b8d40e598de36760', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:11:17');
INSERT INTO `busilog` VALUES ('9b0b1ee9c4744c758182485e97ae54f1', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:13:26');
INSERT INTO `busilog` VALUES ('9b3d1faad1d04731a6a3716aed39f0b2', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:05');
INSERT INTO `busilog` VALUES ('9b5d2b735a644e1280c92ac2b56ad589', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:17:27');
INSERT INTO `busilog` VALUES ('9b79c418566d4c4694cfbf388105004a', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:46:17');
INSERT INTO `busilog` VALUES ('9c575584778c4858b46db863e00d8661', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:17:13');
INSERT INTO `busilog` VALUES ('9d15ae57fdfd44fd9b92e07829cb48df', null, 'test', '查询类', '用户管理：执行查询方法:[username:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:33:04');
INSERT INTO `busilog` VALUES ('9d70a12932b84fcdb2639d0d8a48240b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:18:41');
INSERT INTO `busilog` VALUES ('9ee3384a6d6b455eaf5f120f97f181f7', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:16:28');
INSERT INTO `busilog` VALUES ('9f86d90ef9dd40fb9f09220e4012f905', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:51:58');
INSERT INTO `busilog` VALUES ('a00a04e184754f82923316909cc0ef28', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 14:06:32');
INSERT INTO `busilog` VALUES ('a103d22149b444aeba182ccecd39e524', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:]的日志记录', 'sysid', null, '2017-04-04 15:32:17');
INSERT INTO `busilog` VALUES ('a13f1719571641218b2b3b53992a4786', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:28:05');
INSERT INTO `busilog` VALUES ('a146e58d0fec41e78186c8daa9ebb0f6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:36:39');
INSERT INTO `busilog` VALUES ('a14c8041f10d495bb1f2021ae4f38e14', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@1f1f20的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:01:22');
INSERT INTO `busilog` VALUES ('a16f5db188a1462eabff6fefc8f35ffb', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:36:06');
INSERT INTO `busilog` VALUES ('a2e6ce931de64489b5de7d00635b102e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 14:02:58');
INSERT INTO `busilog` VALUES ('a2fefe66a53244319f0691582a45fd3f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:48:29');
INSERT INTO `busilog` VALUES ('a363a8cd997d4121ab7295101fb98e67', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:24:20');
INSERT INTO `busilog` VALUES ('a3d7664d89144afda74d8d29fe7f2400', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 23:05:37');
INSERT INTO `busilog` VALUES ('a3ee50fca49541faacc8e9635d59904e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:13:10');
INSERT INTO `busilog` VALUES ('a45dd5a2367442cd82125aab9e8f61a5', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:36:04');
INSERT INTO `busilog` VALUES ('a45eb16041094bcf8692ce86ef538449', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:18:31');
INSERT INTO `busilog` VALUES ('a476755e063e4bb1822ab9954cf9ed5a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:12');
INSERT INTO `busilog` VALUES ('a4edc7639c7540c68545338742d76337', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:07:21');
INSERT INTO `busilog` VALUES ('a5150dd55657493096107ea0f5c14efe', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:21:24');
INSERT INTO `busilog` VALUES ('a5809d5d6348441fb90cdbaecc45646f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:48:05');
INSERT INTO `busilog` VALUES ('a59ceb1c13784c2aa21a8f627a3bfb01', null, 'test', '查询类', '用户管理：执行查询方法:[name:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:30:30');
INSERT INTO `busilog` VALUES ('a5a0451137364e5e910987d0bbcdc054', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:20:40');
INSERT INTO `busilog` VALUES ('a5eb748b3aee47bc89c746c5f25afc42', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:11:32');
INSERT INTO `busilog` VALUES ('a604e253e3ed46a0962b87a748f63ea6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:58:16');
INSERT INTO `busilog` VALUES ('a639b1d9798a49eaaf0473693ce3c5b4', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:20:39');
INSERT INTO `busilog` VALUES ('a6cea6bcd0994d08b84366c2820953ef', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 16:46:16');
INSERT INTO `busilog` VALUES ('a6db355ba89b468da66433e9ebe5b4db', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:42');
INSERT INTO `busilog` VALUES ('a723a732e91d4082bec7ce9a55f389cf', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:24:04');
INSERT INTO `busilog` VALUES ('a743f77d85ae4150965b0b6f0b2ee26c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:23:17');
INSERT INTO `busilog` VALUES ('a757c0363f714b6c81e43a6be5acf2d5', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:19:16');
INSERT INTO `busilog` VALUES ('a8008e203f3645cca23cea309007c83c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:47');
INSERT INTO `busilog` VALUES ('a86889de25884265b29f4e569b92aa3a', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:18:31');
INSERT INTO `busilog` VALUES ('a8f18c42bdba4825af06023b42d9fba1', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:12:46');
INSERT INTO `busilog` VALUES ('aa78050ba7824da9a087b2bcda08d295', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:44:03');
INSERT INTO `busilog` VALUES ('aaa4f2f4a4904af9990e6f10a1ac85b0', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@1f5132b的日志记录', 'sysid', null, '2017-04-01 15:06:30');
INSERT INTO `busilog` VALUES ('ab174bab50a24b20ab03d4cc00dc0b38', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:22:15');
INSERT INTO `busilog` VALUES ('ab42efdc91334b5cb6b6a5c74cbae21e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:08:25');
INSERT INTO `busilog` VALUES ('ab4b8dc614fe4096a9fffffdc1c087c4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 17:12:17');
INSERT INTO `busilog` VALUES ('ab4d731c9f824ef891fb0e7eee8c6100', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:23:29');
INSERT INTO `busilog` VALUES ('ab5186ba8c564194923f4dd7c48f831f', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:25:51');
INSERT INTO `busilog` VALUES ('ab58b066cc2141b1ad5e5fd634cb01cb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:05');
INSERT INTO `busilog` VALUES ('ab9f201b420f4b99b4c397c04f4066f9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 17:04:40');
INSERT INTO `busilog` VALUES ('abbcf3c15e4a4fe993f3bdb7923ad071', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:00:08');
INSERT INTO `busilog` VALUES ('abc095bebb6d45d390629e5ade40d056', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:19:31');
INSERT INTO `busilog` VALUES ('abc1c95e0cf94746a9a35e8e684fcda0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:44:47');
INSERT INTO `busilog` VALUES ('abcbf35cfdab452f9ed2dbbb5dc2e2df', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1231, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:23:42');
INSERT INTO `busilog` VALUES ('abe66cc7ca9b4b8eb9c664bde87590f6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:57:01');
INSERT INTO `busilog` VALUES ('ac3a66dca5a8400b83b18a8cef4fd26f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:37:03');
INSERT INTO `busilog` VALUES ('ac4e34fe87a3420e931fb7aa96ef4410', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:41:52');
INSERT INTO `busilog` VALUES ('ac6f7d82cd874727b79349c8c826eb2e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:46:09');
INSERT INTO `busilog` VALUES ('acb8c591b7a542ec92c8a7d0702e2269', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 16:43:39');
INSERT INTO `busilog` VALUES ('accc0164c1e84d609f1465d1822d5485', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:23');
INSERT INTO `busilog` VALUES ('ad17a675d16241789f347b75c9bd5eac', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:31');
INSERT INTO `busilog` VALUES ('ad3960c9d99f41dfabe73257b115a4a9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:18:45');
INSERT INTO `busilog` VALUES ('ad3ea14158da4b438d5389ecdbc2ea1d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:26:35');
INSERT INTO `busilog` VALUES ('adbd231c67fe4edea06ea93ed4d7513f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:10:09');
INSERT INTO `busilog` VALUES ('add13039360e4b43a9186fb895d24c71', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:40');
INSERT INTO `busilog` VALUES ('adf654c5f39b4a59be05b04f9e9adbf4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:]的日志记录', 'sysid', null, '2017-04-04 14:04:06');
INSERT INTO `busilog` VALUES ('ae8e59bcf5b349bbacbb2afa9a468d27', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:26:51');
INSERT INTO `busilog` VALUES ('aea23b32d75c427998b1b2da5317a72a', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:33:43');
INSERT INTO `busilog` VALUES ('aecae80f7f444047b9a126ec9acc46ae', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:41:11');
INSERT INTO `busilog` VALUES ('af46f61223fa455db3ec3bb0254682f1', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:05:54');
INSERT INTO `busilog` VALUES ('af5d46a4a8bc4eaeb0a4fca3969f20ad', null, 'test', '查询类', '用户管理：执行查询方法:[username:1231]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:31:35');
INSERT INTO `busilog` VALUES ('af9e4b46e38743268b29dbfe625b475b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:47:05');
INSERT INTO `busilog` VALUES ('b04704cb170f46758deb111081510941', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:38:44');
INSERT INTO `busilog` VALUES ('b0a856d682824199a555627503277748', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:59:01');
INSERT INTO `busilog` VALUES ('b0c16dafb8e54a4592fba27684ee07ee', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:22:19');
INSERT INTO `busilog` VALUES ('b0c75932f72a4da1a42483e9a4103f17', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:40:17');
INSERT INTO `busilog` VALUES ('b0e660e5fbe7425d89b2e6e55833fea4', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:03:10');
INSERT INTO `busilog` VALUES ('b1739b9e165a44bc8bb1e784351dece9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:35:04');
INSERT INTO `busilog` VALUES ('b179938d24594901baa29ffd4e4054a7', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:12:07');
INSERT INTO `busilog` VALUES ('b198f3486d17426bb5146b407c0f68f7', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:45');
INSERT INTO `busilog` VALUES ('b1d32500a24b490aab2a7d629671be98', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 15:46:43');
INSERT INTO `busilog` VALUES ('b217d01b50124fb5b0ed4fccd68b21d3', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:52:39');
INSERT INTO `busilog` VALUES ('b230226c17004108a2b62350786c5692', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 14:42:00');
INSERT INTO `busilog` VALUES ('b27bfc8368cb41ffab9aaaa93e2c15a6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:51:56');
INSERT INTO `busilog` VALUES ('b2a54d855c9247cda6abdd796e18f13b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:50');
INSERT INTO `busilog` VALUES ('b2c60d2499e94193848f888e880102ca', null, 'test', '查询类', '用户管理：执行查询方法:[major:01]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:11:24');
INSERT INTO `busilog` VALUES ('b393b5abadb7420f903f37f239c40178', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:38:34');
INSERT INTO `busilog` VALUES ('b3cb57c615b647ee8b74441c69a3b29d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:23:46');
INSERT INTO `busilog` VALUES ('b40250157d7d4d928b02b4ebeaca8c16', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:05:36');
INSERT INTO `busilog` VALUES ('b50b20f6ea65441f9c8a411571ba1b53', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:36');
INSERT INTO `busilog` VALUES ('b576003992aa474ca8eb1def3fce382c', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:01:46');
INSERT INTO `busilog` VALUES ('b5772114b7e04a22b1bb4892b2adb89e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 16:30:57');
INSERT INTO `busilog` VALUES ('b5f92b50ad804f72a5cabda47c55060d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:31:25');
INSERT INTO `busilog` VALUES ('b6e7aab9cade4a26aeb085da1d70c5e9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:28:48');
INSERT INTO `busilog` VALUES ('b74e9989742c4567878de5cd4dfce87e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:56:15');
INSERT INTO `busilog` VALUES ('b8101f57554d49e9a7308dd8bb363028', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:06:13');
INSERT INTO `busilog` VALUES ('b8146111b932443a828f4a817b0884a3', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:22:22');
INSERT INTO `busilog` VALUES ('b8879f7195ae4c26ae9f55d4e629d8ec', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:39:26');
INSERT INTO `busilog` VALUES ('b88b496fb52b4404be701e568fec8d3b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:]的日志记录', 'sysid', null, '2017-04-04 15:57:26');
INSERT INTO `busilog` VALUES ('b8c1d6692e164c7b89a5fcd306dbf011', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:17:25');
INSERT INTO `busilog` VALUES ('b8f67ff415b046c0ac5f0055d4ea8f41', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@1126385的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:42:01');
INSERT INTO `busilog` VALUES ('b9311c70cb284a078c12c8db2f0c4227', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:27:10');
INSERT INTO `busilog` VALUES ('b95b31c5f6c0422eb8ec774cf428ebb3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:59:19');
INSERT INTO `busilog` VALUES ('b990f7486312404bae7d21a83427bc4c', null, 'test', '查询类', '用户管理：执行查询方法:[sex:1]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:44');
INSERT INTO `busilog` VALUES ('b9a8aec38c3145819fbd7403437e8f68', null, 'test', '查询类', '用户管理：执行查询主数据方法:[sex:1]的日志记录', 'sysid', null, '2017-04-07 16:31:33');
INSERT INTO `busilog` VALUES ('ba3ef98512c44fe59051f186bcabaf4a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:11:40');
INSERT INTO `busilog` VALUES ('ba723e7a6ae248c5b05ef06194c0a295', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:12');
INSERT INTO `busilog` VALUES ('ba801a88154447249b0bbb28f03dae3b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:36:04');
INSERT INTO `busilog` VALUES ('ba91a0e369d041319cdf93eeac17d0f1', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:57:35');
INSERT INTO `busilog` VALUES ('baa345f8b4b64b89af7e9dc0a1afa2e3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 16:46:31');
INSERT INTO `busilog` VALUES ('bade710825e44e549ea0ca4709079273', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:09:50');
INSERT INTO `busilog` VALUES ('bb2f0f37c92e47229d789226ab18717b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:02');
INSERT INTO `busilog` VALUES ('bbd659af030e48f6b8efb65e2095c202', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:25');
INSERT INTO `busilog` VALUES ('bc4b2068ace34e1b81289d3040ab80ea', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:01');
INSERT INTO `busilog` VALUES ('bc5c1a7c3c7b423ead432c547fa64364', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:08:02');
INSERT INTO `busilog` VALUES ('bcc0a50fd4a14cdb96a1e53c5a09319e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:59:10');
INSERT INTO `busilog` VALUES ('bcf02f02a57146afacf7024cd912e977', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:46:17');
INSERT INTO `busilog` VALUES ('bcffb783fe8d4a819eb06e62b72a1346', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:32:22');
INSERT INTO `busilog` VALUES ('bda328193d7e4d23b6a662d9761c1d41', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:34:39');
INSERT INTO `busilog` VALUES ('bdea1a0a6fc34496b9e47d68e44b6265', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:18:40');
INSERT INTO `busilog` VALUES ('be31c76f973044319cfc80806f22a30a', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:37:01');
INSERT INTO `busilog` VALUES ('be54b57795ff48b9bbd2e1c18822aee1', null, 'test', '查询类', '用户管理：执行查询方法:[profession:02, sex:1]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:34');
INSERT INTO `busilog` VALUES ('be7fdfcf06514e668a46e0b9741521ab', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:10');
INSERT INTO `busilog` VALUES ('be9cc380883747b29803a899a15a382a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:41:59');
INSERT INTO `busilog` VALUES ('be9ccbe924804ef2b6c2d74e90a48998', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:06:55');
INSERT INTO `busilog` VALUES ('bebbd64b75fa45ab81b221bd6e19cf71', null, 'test', '查询类', '用户管理：执行查询方法:[name:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:30:08');
INSERT INTO `busilog` VALUES ('beea8498c33d431199aa192f56455da6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:07:13');
INSERT INTO `busilog` VALUES ('bf37ff39547445b9969c82730237aedd', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:41');
INSERT INTO `busilog` VALUES ('c01bbd45feda46ecb84fe341c0b9a791', null, 'test', '查询类', '用户管理：执行查询方法:[username:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:33:49');
INSERT INTO `busilog` VALUES ('c0aef7df84714b549e68d95541de8fc9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:52:58');
INSERT INTO `busilog` VALUES ('c0f32b7d7b9d470a9f819e26608e0562', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, name:1, profession:, sex:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:21:12');
INSERT INTO `busilog` VALUES ('c11bc4430d1a4571b81c1709f24a87d4', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:05');
INSERT INTO `busilog` VALUES ('c16aef3caf3d433e8363aebaeadaf380', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:27:58');
INSERT INTO `busilog` VALUES ('c2bb01759b6340ae8389fe193a722965', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:19:00');
INSERT INTO `busilog` VALUES ('c3c40366c0234fbba2bed42d6de93b22', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:10:09');
INSERT INTO `busilog` VALUES ('c4322d65742a4ca7856462e563752aa7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:05:59');
INSERT INTO `busilog` VALUES ('c43881e75a1e4fb2b202aebb3c34443a', null, 'test', '查询类', '用户管理：执行查询方法:[sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:32:06');
INSERT INTO `busilog` VALUES ('c442346ce5284e4e8f78173f7e520f29', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:12:15');
INSERT INTO `busilog` VALUES ('c44692c425de45079608d0810b58bd5b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:43:26');
INSERT INTO `busilog` VALUES ('c4844ca8633f4d40b71a0c9c5655912e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:44:57');
INSERT INTO `busilog` VALUES ('c52ce86bea42442fbfd2a18cf218c695', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:, username:1231]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:24:22');
INSERT INTO `busilog` VALUES ('c57ebc172513479baf48a3646e763ff9', null, 'test', '查询类', '用户管理：执行查询主数据方法:[sex:0]的日志记录', 'sysid', null, '2017-04-07 16:31:04');
INSERT INTO `busilog` VALUES ('c6406b39849a4fdf9d5483872f46f0bd', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@1db46c的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:13:07');
INSERT INTO `busilog` VALUES ('c6556e6412cf4ac6bf905646d0e80d63', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:09:28');
INSERT INTO `busilog` VALUES ('c65d72e7788940d6bd246a8a8262dc11', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:34:53');
INSERT INTO `busilog` VALUES ('c666e45d2efc40c0b11ff216c70cdf76', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-07 11:16:16');
INSERT INTO `busilog` VALUES ('c677c29f0b304517907673ababdbc019', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:, username:æµè¯ç¨æ·]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:25:17');
INSERT INTO `busilog` VALUES ('c6bff57439dd4e30ad148900e6775663', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@5b649020的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:58:01');
INSERT INTO `busilog` VALUES ('c780cab3e9f9499dac5aea1788fcaf9c', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:30:47');
INSERT INTO `busilog` VALUES ('c7a795f073cc4a5aa68559d8d46f324e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:11:45');
INSERT INTO `busilog` VALUES ('c943d4be030d4efab145384e8ebad555', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 17:11:01');
INSERT INTO `busilog` VALUES ('c97be96ea06a4ccaa0bae23ca70dfd56', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:40:17');
INSERT INTO `busilog` VALUES ('cb02bd75cddb4940bdd262bdf2c5626d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:35:36');
INSERT INTO `busilog` VALUES ('cb21a91dc22648ee8cfacacf2ecd6e97', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 19:13:52');
INSERT INTO `busilog` VALUES ('cb4c67c647244e0189fa9cb87f586219', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:11:27');
INSERT INTO `busilog` VALUES ('cb591589f8914400aa0119105d11dd23', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:30:35');
INSERT INTO `busilog` VALUES ('cb655aa70a6f46fca80629b67a3a6969', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:00:27');
INSERT INTO `busilog` VALUES ('cbe2f06e1a774d54bb4763ee65248e9c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:17:05');
INSERT INTO `busilog` VALUES ('cc2d3573a9104416ac490ce553efc78d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:48:20');
INSERT INTO `busilog` VALUES ('cd2a118a303f4fdc9f4bc030868fd41d', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:33:02');
INSERT INTO `busilog` VALUES ('cdfa66c3e528418d86ea77abeed08230', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:32:46');
INSERT INTO `busilog` VALUES ('cec61f7d8eaf44c48184eca4120073b0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:42:23');
INSERT INTO `busilog` VALUES ('cef9f214916d44be8970fc30e31bf24e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 15:52:08');
INSERT INTO `busilog` VALUES ('cf21d2be4893455eaa29a8e39137625d', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:11:29');
INSERT INTO `busilog` VALUES ('cf6ba65e4e134faeb2c3fcbd216b9c8c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:05:05');
INSERT INTO `busilog` VALUES ('cfb74e4d51794cd3a4dbfda9e849c833', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:21');
INSERT INTO `busilog` VALUES ('cfbad6ce02134d8e9ad35da9ce9bb57b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:08');
INSERT INTO `busilog` VALUES ('cfbcdaa7abbf45c0a0b286cb3cf5633e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:13:43');
INSERT INTO `busilog` VALUES ('d0a543241cf44448986cf5a308efa32e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:24:13');
INSERT INTO `busilog` VALUES ('d0ae980b8c624ddba26e28151bbfab44', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:12');
INSERT INTO `busilog` VALUES ('d0b09ebb965c4ca1a0913035558b3074', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:08:07');
INSERT INTO `busilog` VALUES ('d0c9a62966574acdb98285e0a50779c1', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:55:20');
INSERT INTO `busilog` VALUES ('d1703cd48e7e4db6a5b4bc20ea48a6d5', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:06');
INSERT INTO `busilog` VALUES ('d1e539661b6f4db1a9fa4c92ba005414', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:42:34');
INSERT INTO `busilog` VALUES ('d2147391b9634c5eb86c83e5d3116e8a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:13:58');
INSERT INTO `busilog` VALUES ('d22639348fb6468bb4cee6e56e0475be', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:53:05');
INSERT INTO `busilog` VALUES ('d2367d39e6cb401b9b2b1a39f5bfc543', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:52:23');
INSERT INTO `busilog` VALUES ('d243d056810c45db904d1c2ca0ac954b', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:12:25');
INSERT INTO `busilog` VALUES ('d2b431f45df74651a795d2e033ae5ebf', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:14:16');
INSERT INTO `busilog` VALUES ('d2b4516cba3c4f9bb86ef82ec97df03b', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:, username:1231]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:30:15');
INSERT INTO `busilog` VALUES ('d2c7212ab7304c68aac5c14ea4041ccd', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:09:26');
INSERT INTO `busilog` VALUES ('d2e1b0984f9f4a3eba970a3518efb74b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 16:22:33');
INSERT INTO `busilog` VALUES ('d2ea443e67cf4eb2a13329030da9057e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:07:07');
INSERT INTO `busilog` VALUES ('d304cb7a2c43433ba27af65a70c38666', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:22');
INSERT INTO `busilog` VALUES ('d3295d0a8c4d47c4b5583c38af0fd298', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:26:08');
INSERT INTO `busilog` VALUES ('d3f8a7ff0bb547bfb2aedf565435c066', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:03:20');
INSERT INTO `busilog` VALUES ('d41a1c8a3e8941e5ab1c19389b546b36', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:27:25');
INSERT INTO `busilog` VALUES ('d41db75c8bc64677beb38fe44b832577', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:13:41');
INSERT INTO `busilog` VALUES ('d4483d373a9d4bbf824f2572a85e6e64', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-07 11:15:46');
INSERT INTO `busilog` VALUES ('d47311e33ba6419b9c2318de8468938d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:02');
INSERT INTO `busilog` VALUES ('d4bb5102609f4815981c3e7a6c537e04', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:10:15');
INSERT INTO `busilog` VALUES ('d4c35e1ef98e4b56894d726ea2bff071', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:51:27');
INSERT INTO `busilog` VALUES ('d540b3f6851340f98366109c5fe5920e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:38:00');
INSERT INTO `busilog` VALUES ('d5980a5da44b41a3969ec56e83d6dfd5', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:54:16');
INSERT INTO `busilog` VALUES ('d648cb6aecdc4761b2fe164a3f162629', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:05:53');
INSERT INTO `busilog` VALUES ('d69c2d33de5a4a87a2e8e3c689f0f1e6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:41:33');
INSERT INTO `busilog` VALUES ('d7af03708d4f4b6c842832bb425eb6ec', null, 'test', '查询类', '用户管理：执行查询方法:[name:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:33:00');
INSERT INTO `busilog` VALUES ('d8302979edd24c9498919199455d280f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:33:19');
INSERT INTO `busilog` VALUES ('d93893c1e49341898a4b2381e678cc78', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:15:51');
INSERT INTO `busilog` VALUES ('d97d56afb3cb462dbe2803ba28c1c18a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:22:27');
INSERT INTO `busilog` VALUES ('da138f28de5d494d8469893a8bc17c50', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-01 19:28:28');
INSERT INTO `busilog` VALUES ('db323bb8ad2e43e6a39dd44d8c077315', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:11:49');
INSERT INTO `busilog` VALUES ('db60fb99bfd94f24b08ece9d0c7c00f2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-08 00:48:30');
INSERT INTO `busilog` VALUES ('db612891dc0349a2af34e3bcdd4819d9', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:40:30');
INSERT INTO `busilog` VALUES ('db7d49988a1246838be4779b47d80c16', null, 'test', '查询类', '用户管理：执行查询方法:[profession:01]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:08:43');
INSERT INTO `busilog` VALUES ('dbe8513031db4b9ea89969076601d5e6', null, 'test', '查询类', '用户管理：执行查询方法:[sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:06:24');
INSERT INTO `busilog` VALUES ('dbfe30d9c0d04032b0aeda733a7b776e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:49:12');
INSERT INTO `busilog` VALUES ('dc69839cebd447c0b6f5db4cef9c0847', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:52:37');
INSERT INTO `busilog` VALUES ('dc6d6f288db64af189458390c00f6e73', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:41:23');
INSERT INTO `busilog` VALUES ('dc9c0f3e42d54a1d830d594de4899b98', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:34:00');
INSERT INTO `busilog` VALUES ('dcc67fe44ad14841b19c88660cac9fee', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 17:01:13');
INSERT INTO `busilog` VALUES ('dccbef49587a471da40eb99ff1fd0495', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 14:58:23');
INSERT INTO `busilog` VALUES ('dd05ddd7102843ab8b4bb19165568ff8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 16:44:39');
INSERT INTO `busilog` VALUES ('dd297a22de824edcb1515b47b02f6562', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:59');
INSERT INTO `busilog` VALUES ('dd3fd02cab7c4be6aaf2ed7c43eb3a73', null, 'test', '查询类', '用户管理：执行查询方法:[profession:01, sex:0]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:20:48');
INSERT INTO `busilog` VALUES ('dd6dda172641454ba23edc6d169c357a', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-07 11:27:01');
INSERT INTO `busilog` VALUES ('dd70d7c500104b00b13e3de842ad5f64', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:19:32');
INSERT INTO `busilog` VALUES ('dd7ca2e7b16842bf86a80bae9f786ec2', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:29');
INSERT INTO `busilog` VALUES ('dd8575c326d94742858ca0d0414a1657', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:32:14');
INSERT INTO `busilog` VALUES ('de0ba80305ef43208dc210308583d0dc', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:09:30');
INSERT INTO `busilog` VALUES ('de7a68e32db443a5a180c66195e4f0f2', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:58:45');
INSERT INTO `busilog` VALUES ('de8edb7cc73944a0a484cb62cb3d0ab1', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 17:03:20');
INSERT INTO `busilog` VALUES ('deb464a8ac3346119eb931cc2fa5ad8b', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:50');
INSERT INTO `busilog` VALUES ('deb668b8a2ba47318127f980c8096edd', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:59:01');
INSERT INTO `busilog` VALUES ('dee4931e5d79435e879b0c53b192ffda', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:26:30');
INSERT INTO `busilog` VALUES ('dfa33645bed64a7cb0fd35a6143abe87', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:33:40');
INSERT INTO `busilog` VALUES ('dfcde6c317d149c28203da50c95a4c06', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:20:49');
INSERT INTO `busilog` VALUES ('dff94fe8ecf34d289dea30ac2f42d3c3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:41:08');
INSERT INTO `busilog` VALUES ('e007cf93127f4111baca45b7420129a4', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:11:59');
INSERT INTO `busilog` VALUES ('e00aa12ef1e84e5e8a1e334c6627f1fa', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:57:58');
INSERT INTO `busilog` VALUES ('e0649d3c82e54e93814839e8e1a78d06', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:36:50');
INSERT INTO `busilog` VALUES ('e0700ab7aeb64a40bfdd7db8ae54a900', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 15:05:01');
INSERT INTO `busilog` VALUES ('e08d3aa2377541469f0f048b3ce88acb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:31:56');
INSERT INTO `busilog` VALUES ('e08d5dac28fe4ed499a92da29d07168a', null, 'test', '查询类', '用户管理：执行查询方法:[username:12]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:33:36');
INSERT INTO `busilog` VALUES ('e0a271a909b84ab2b5874fbee5c452d8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:14:14');
INSERT INTO `busilog` VALUES ('e1671507b65944018c996716d17ec8fe', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:32:24');
INSERT INTO `busilog` VALUES ('e179b957089a47e5ae2daa978f31fc60', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:58:39');
INSERT INTO `busilog` VALUES ('e189fff63cdc4de8ae721d5ae870d2e6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:03:16');
INSERT INTO `busilog` VALUES ('e1f6157f5fca4c5ba6c1406c729b7210', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:01, username:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:27:13');
INSERT INTO `busilog` VALUES ('e2687244cea441d99e216f7124d2a6d3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:34:06');
INSERT INTO `busilog` VALUES ('e2f67dcaf56b435c9d94bb2e9d37ddc3', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:31:24');
INSERT INTO `busilog` VALUES ('e31c8ca505174e54bce32387d943f919', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:42');
INSERT INTO `busilog` VALUES ('e3299c2012a240cbad1ca05df0fd923d', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:45:03');
INSERT INTO `busilog` VALUES ('e33bb1d155fc463b8cf40a98d1a14783', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:41:15');
INSERT INTO `busilog` VALUES ('e3a076a9d2c240ab80ab1fd720633c70', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:48:17');
INSERT INTO `busilog` VALUES ('e3b2c9914e9f4a7a91c31ebb4d308b35', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:08:35');
INSERT INTO `busilog` VALUES ('e410ef03d57a48119208575a6ba8ae92', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:22:33');
INSERT INTO `busilog` VALUES ('e457302f254a44fe9a805f8dbccd525e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:45:22');
INSERT INTO `busilog` VALUES ('e4e6099c22704eb5b737d91a360fb85f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:18:30');
INSERT INTO `busilog` VALUES ('e4ff0bbdc7bd4733a5db5fd7c8ce9aa2', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:26:28');
INSERT INTO `busilog` VALUES ('e50a004a4554481d9db7577776f0a1bb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:40:45');
INSERT INTO `busilog` VALUES ('e50faf56c53f4996accc44924d2c971a', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 14:45:20');
INSERT INTO `busilog` VALUES ('e523b722c09447db86d9cbbad1d8b0e5', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:23:45');
INSERT INTO `busilog` VALUES ('e57c6044a3854738aeb8ac3c89d58af6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:ed631e6d-921e-46dc-ab3b-6970a3f2a06a]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:16:32');
INSERT INTO `busilog` VALUES ('e5c01b4f64554c5e98a3269d7534cd19', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:19:52');
INSERT INTO `busilog` VALUES ('e5caeecf083b4e69bb8d74df6cfd0333', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 16:20:58');
INSERT INTO `busilog` VALUES ('e63cf815c7434f22a816e249002f7bcc', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:24:14');
INSERT INTO `busilog` VALUES ('e66e75335dcd45c6b66cf787868390af', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:55:22');
INSERT INTO `busilog` VALUES ('e67929c1033e4bdc95d502cc8db3e254', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 19:10:08');
INSERT INTO `busilog` VALUES ('e7090c55e2ee4041aaf049ba227a77a8', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:52:24');
INSERT INTO `busilog` VALUES ('e7c2f260fdf746fa87ef7149fb6b1fef', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@5fc997的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:55:53');
INSERT INTO `busilog` VALUES ('e8a7dce062a544d3b5303cfc6e084b60', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:43:28');
INSERT INTO `busilog` VALUES ('e9b79b178bb5442baefec02651612c0c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:21:02');
INSERT INTO `busilog` VALUES ('e9d7d0989df64036acc18c43f7bbb91e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:19');
INSERT INTO `busilog` VALUES ('ea5ba4b727c6435b8a6dc82011e0c29b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:15:52');
INSERT INTO `busilog` VALUES ('ea5ead1619ee466ba5afc8a918b35fab', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:55:19');
INSERT INTO `busilog` VALUES ('ea5fd767ef5a4affb46d64b6c4823302', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 13:44:23');
INSERT INTO `busilog` VALUES ('ea93e166d7294f769ab50da973bc9959', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:23:41');
INSERT INTO `busilog` VALUES ('eaa0dd0eeaa84643a4bc5ea9948deb36', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@890eba的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:59:37');
INSERT INTO `busilog` VALUES ('eaa66fc7157a4737932ba28ddf72d6da', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:21:09');
INSERT INTO `busilog` VALUES ('eaf1283b70d1412db21af53f46c1173b', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@6c99fa的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 22:04:25');
INSERT INTO `busilog` VALUES ('eb124e72e2934acd9fc7b7befe337483', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:09:25');
INSERT INTO `busilog` VALUES ('eb2a510a94204d0cbc64fe4db258ea4a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:25');
INSERT INTO `busilog` VALUES ('eb9722042c5f4f50a59f81a2cd68f60c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:34:55');
INSERT INTO `busilog` VALUES ('ebd59ad4ed5543acab3cd126b9bb9a82', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:58:31');
INSERT INTO `busilog` VALUES ('eca538cc112e4bdf9080b837ed793391', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 15:23:03');
INSERT INTO `busilog` VALUES ('ed6acc242e5f47e6871e6a25686729a6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:29:38');
INSERT INTO `busilog` VALUES ('eda4e84d276f4c46ba630b095ce357e3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:18:10');
INSERT INTO `busilog` VALUES ('ee1560080b8c4152af91deff54626099', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:50:27');
INSERT INTO `busilog` VALUES ('ee2ff62dc96c44a8b0024b5923895eb7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:27:23');
INSERT INTO `busilog` VALUES ('ee8231e44f3c41fdab18eabe3d047d06', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:13:14');
INSERT INTO `busilog` VALUES ('eec85a69bde2478fa9489c0ef52ab6bb', null, 'test', '查询类', '用户管理：执行查询方法:[entry_start:, profession:, sex:, username:1231]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:24:32');
INSERT INTO `busilog` VALUES ('ef4764a3f5e949fda288d2f5a1ca0d47', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:56:40');
INSERT INTO `busilog` VALUES ('ef5e5b51f60f4915b67421e31b84ccd3', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:11:53');
INSERT INTO `busilog` VALUES ('ef82e085905a458ea6e9ebae8effa0b9', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:05:00');
INSERT INTO `busilog` VALUES ('efc057f827044f608abb7ae2df4e5e8f', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 12:39:57');
INSERT INTO `busilog` VALUES ('efc11b0df94e4d65a80029cb45ad2a10', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-01 19:13:13');
INSERT INTO `busilog` VALUES ('efd8c069571d4d929027116a02e6d34e', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:18:38');
INSERT INTO `busilog` VALUES ('f09ab14b894c48389edc8312920ce6aa', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:43:46');
INSERT INTO `busilog` VALUES ('f0bccb308686416b848e50e467f36ca3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:58:51');
INSERT INTO `busilog` VALUES ('f198bd7bb67043c689a9f8f1adb894ee', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:18:18');
INSERT INTO `busilog` VALUES ('f2062cf0cf0548348080078949dae769', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 15:24:49');
INSERT INTO `busilog` VALUES ('f24e593720ae4018bbe9c49f05ac9b82', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:28:55');
INSERT INTO `busilog` VALUES ('f2900ad6ec4c4a97b1e36a814548c81f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:32:31');
INSERT INTO `busilog` VALUES ('f2b62543dbe349a49138ff213985f99e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:33:19');
INSERT INTO `busilog` VALUES ('f2f46ad3c3f846dca13873b2dd514561', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:15:41');
INSERT INTO `busilog` VALUES ('f30114bf241643dabf44c47a848d0a49', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:04:20');
INSERT INTO `busilog` VALUES ('f3039d996f22464689c3ceb3f03c7f5b', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:21:57');
INSERT INTO `busilog` VALUES ('f3162cbba40549d9b11ec8a779df7004', null, 'test', '查询类', '用户管理：执行查询方法:[major:02]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:35');
INSERT INTO `busilog` VALUES ('f31f052836b44339b91a498be2340709', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 20:11:13');
INSERT INTO `busilog` VALUES ('f3832f849bf1439fa9ae8c6ad719465e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:40:30');
INSERT INTO `busilog` VALUES ('f3bcf92c3f7243d491f9632556fdbeb0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:14:55');
INSERT INTO `busilog` VALUES ('f3c05e7fd20740d982145352391b56fc', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 18:03:33');
INSERT INTO `busilog` VALUES ('f3e77a7accf84383ae4a4e4770a13270', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:55:18');
INSERT INTO `busilog` VALUES ('f4093df4c8f7487c95f24a767be0dc7d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:]的日志记录', 'sysid', null, '2017-04-04 16:21:08');
INSERT INTO `busilog` VALUES ('f429f0fe244a4cf7bb017c0c6a35e0e6', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:85b57ac6-a407-431a-b12a-238d00f668e8]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:14:00');
INSERT INTO `busilog` VALUES ('f4b410482929493d881731c2fc5e7c9c', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:36:19');
INSERT INTO `busilog` VALUES ('f4fe2a4672b74898b191b679984d97cf', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:53');
INSERT INTO `busilog` VALUES ('f50d9ab9821248759a691a5a11a106bb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 17:01:22');
INSERT INTO `busilog` VALUES ('f5246ba8f4c94395a0c5100046fdf1b6', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:08:44');
INSERT INTO `busilog` VALUES ('f54bdbd9c6ba4c5594d84d1c78d9181f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', null, '2017-04-04 14:42:37');
INSERT INTO `busilog` VALUES ('f589ecaf36294595b9c3d87c4d77cb80', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:18:25');
INSERT INTO `busilog` VALUES ('f5c779bae7cb48998ce913311945e43e', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 16:32:53');
INSERT INTO `busilog` VALUES ('f5d9940b4f5149dfaa3e51ae51625f96', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:09:43');
INSERT INTO `busilog` VALUES ('f616ac9763234d4fbdaee68f6afa63f1', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:5257a17a-ace9-4c4c-85e6-4a173ece0104]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:10:26');
INSERT INTO `busilog` VALUES ('f69b27c68ab74b2a86a7064a8cede9c3', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:26:02');
INSERT INTO `busilog` VALUES ('f6ebc638730c46b18213b33ca0983173', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:18:36');
INSERT INTO `busilog` VALUES ('f79470ccb2b749029e7afc491c30d342', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 16:40:09');
INSERT INTO `busilog` VALUES ('f7fd498545f14853ac080ea96a038474', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:55:06');
INSERT INTO `busilog` VALUES ('f8346630ccb246b2ab4885d5222daff0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:36:50');
INSERT INTO `busilog` VALUES ('f882bc3e01d749b8b95b3ce53fc5b738', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 14:03:28');
INSERT INTO `busilog` VALUES ('f8924e45cd194f189c4c052cf6cd8003', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 17:03:18');
INSERT INTO `busilog` VALUES ('f8ad6d31a7b94e918caf05035a789d07', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:06:26');
INSERT INTO `busilog` VALUES ('f8b5b971e26d4846ae3041e0cc33e41f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', null, '2017-04-04 14:05:37');
INSERT INTO `busilog` VALUES ('f992ca80e9454cd1868aec2e876e02b0', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:07:08');
INSERT INTO `busilog` VALUES ('f9c465e7aed1415e9a52b5c23165d84f', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:15:12');
INSERT INTO `busilog` VALUES ('f9f6d89b35de494fa98f45d2882a511d', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:33:25');
INSERT INTO `busilog` VALUES ('fa7b14df83554aaf88072e0d5aa94a6e', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:eb831d9c-6684-425c-a7d8-d2e0f757e61e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 17:39:58');
INSERT INTO `busilog` VALUES ('fb12d0ba527f4467b2cfc5ea74aec2b7', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:41:40');
INSERT INTO `busilog` VALUES ('fb34ef39c6d145b58c5ef9fbd6e9c17b', null, 'test', '查询类', '用户管理：执行查询主数据方法:[:]的日志记录', 'sysid', null, '2017-04-07 13:04:21');
INSERT INTO `busilog` VALUES ('fb5228f0303d430e91fd52af534deff9', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@7658785a的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:11:50');
INSERT INTO `busilog` VALUES ('fba43553ab394021bcf6d0898718eb60', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 21:35:59');
INSERT INTO `busilog` VALUES ('fbab5773ac9749f8b310f1021e56e63f', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:40:42');
INSERT INTO `busilog` VALUES ('fc01d993b9814e9090c5014c579a9e05', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:86e01359-6793-4c43-9f15-359c29bbd74e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 18:56:09');
INSERT INTO `busilog` VALUES ('fc0896b494f64f33915052b9e4f868b1', null, 'test', '查询类', '用户管理：执行查询方法:[major:02]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:25:40');
INSERT INTO `busilog` VALUES ('fccf36a5e970472b82cc0a2f0be2473d', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:6bc2b7ed-ce71-4a19-8451-051dd6db9b7d]的日志记录', 'sysid', 'test_tenant_id', '2017-04-06 17:51:57');
INSERT INTO `busilog` VALUES ('fd36be155d8a456a8cb3b030ac19c049', null, 'test', '查询类', '所属角色：执行查询方法:[fk_id_userrole:29b3ae05-4d66-4681-8279-7a61fa3abe6e]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 11:22:26');
INSERT INTO `busilog` VALUES ('fd553e5d7608414588b7d7a00cc19f00', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 15:32:27');
INSERT INTO `busilog` VALUES ('fdde71aecabd40ecb6db2773bd971059', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 10:20:55');
INSERT INTO `busilog` VALUES ('fdf7ce96842e4f1ca705b0cb0857cf0a', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', 'test_tenant_id', '2017-04-05 09:14:52');
INSERT INTO `busilog` VALUES ('fe25be5b278f4c28b05600ab9facbb6e', null, 'test', '保存类', '用户管理：执行保存方法:com.yonyou.iuap.tepoc.entity.UserPsnVO@5c027c76的日志记录', 'sysid', 'test_tenant_id', '2017-04-04 19:05:13');
INSERT INTO `busilog` VALUES ('fe3ca1362004437898ac598a4b14ebeb', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 14:38:32');
INSERT INTO `busilog` VALUES ('fec5abf2680747db8fcfe3eabc0fe374', null, 'test', '查询类', '用户管理：执行查询方法:[:]的日志记录', 'sysid', null, '2017-04-04 16:46:00');

-- ----------------------------
-- Table structure for cardtable
-- ----------------------------
DROP TABLE IF EXISTS `cardtable`;
CREATE TABLE `cardtable` (
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `pk_system` varchar(50) NOT NULL,
  `i18n` varchar(50) default NULL,
  `gateway` varchar(100) default NULL,
  `radiodatacontroller` varchar(50) default NULL,
  `radiodataassociate` varchar(50) default NULL,
  `combodatamodel` varchar(50) default NULL,
  `tag` varchar(50) default NULL,
  `system` varchar(50) default NULL,
  `tenant` varchar(50) default NULL,
  `ts` timestamp NULL default NULL,
  `dr` decimal(10,0) default NULL,
  `secretkey` varchar(50) default NULL,
  `createtime` timestamp NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`pk_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cardtable
-- ----------------------------
INSERT INTO `cardtable` VALUES ('考评系统', '005', '2fa142a7-2107-40fc-a3c4-2b5bd9a3643e', null, '172.20.8.18', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:58');
INSERT INTO `cardtable` VALUES ('决策系统', '002', '37caed5b-0ff9-4ff1-9663-5e399fe8c88b', null, '172.20.8.15', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:15');
INSERT INTO `cardtable` VALUES ('报销系统', '004', '6d106901-c737-4bd1-b238-f2251923e5ad', null, '172.20.8.17', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:41');
INSERT INTO `cardtable` VALUES ('邮件系统', '001', '70e27aa7-c4a7-4aa7-a330-b7ec441a8313', null, '172.20.8.14', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:22:54');
INSERT INTO `cardtable` VALUES ('门户系统', '006', '963ae96f-2de6-425e-bbb0-2c1eef89ce08', null, '172.20.8.19', 'N', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:24:24');
INSERT INTO `cardtable` VALUES ('测试系统', '003', 'af527c77-5893-43a6-94f5-efd27deb9b42', null, '172.20.8.16', 'Y', 'Y', 'Y', null, null, null, null, '0', null, '2016-12-15 10:23:27');

-- ----------------------------
-- Table structure for cardtablemeta
-- ----------------------------
DROP TABLE IF EXISTS `cardtablemeta`;
CREATE TABLE `cardtablemeta` (
  `radiodataassociate` varchar(50) default NULL,
  `radiodatacontroller` varchar(50) default NULL,
  `CODE` varchar(50) default NULL,
  `NAME` varchar(100) default NULL,
  `combodatamodel` varchar(50) default NULL,
  `gateway` varchar(50) default NULL,
  `tag` varchar(50) default NULL,
  `createtime` datetime default NULL,
  `pk_system` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`pk_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cardtablemeta
-- ----------------------------
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '001', '邮件系统', 'Y', '172.20.8.14', null, null, '07ff6b9c-3496-49f2-8958-307439abc5d4', '2016-12-15 10:36:01', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '006', '门户系统', 'Y', '172.20.8.19', null, null, '76ce0e72-0dfb-49d8-9c32-80713b6a9488', '2016-12-15 10:37:28', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '002', '决策系统', 'Y', '172.20.8.15', null, null, 'b9cd70a0-f46c-43bc-9fd2-967c948c3ef6', '2016-12-15 10:36:36', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '005', '考评系统', 'Y', '172.20.8.18', null, null, 'cb636c1b-6f83-45b8-bde0-d07de3c1b608', '2016-12-15 10:37:17', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '004', '报销系统', 'Y', '172.20.8.17', null, null, 'f7362fe4-8d4a-4c50-9e8c-f5208dbe262f', '2016-12-15 10:37:03', '0');
INSERT INTO `cardtablemeta` VALUES ('Y', 'Y', '003', '测试系统', 'Y', '172.20.8.16', null, null, 'ffafedc6-19bc-4ecb-80a9-1054009f38f5', '2016-12-15 10:36:51', '0');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `parent_id` varchar(36) default NULL,
  `short_name` varchar(50) default NULL,
  `dept_type` varchar(20) default NULL,
  `org_id` varchar(50) NOT NULL,
  `creator` varchar(20) default NULL,
  `dept_name` varchar(50) default NULL,
  `dept_code` varchar(40) NOT NULL,
  `deptcanceldate` datetime default NULL,
  `creationtime` datetime default NULL,
  `createdate` datetime default NULL,
  `pk_dept` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`pk_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '同江区域组', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '李国志', '北京区域组', '40506', '2016-11-17 10:21:32', '2016-11-17 10:21:24', '2016-11-17 10:21:15', '18aa2958-60bb-436f-8e64-0343e8f108f7', '2016-11-17 10:21:34', '0');
INSERT INTO `dept` VALUES (null, '小贷业务部', '1', '857cc73f-1a08-4053-b717-09404168f081', '徐杰春', 'IUAP运维部', '40801', '2016-11-17 10:24:18', '2016-11-17 10:24:10', '2016-11-17 10:24:02', '29b6597a-5727-405f-b9c6-c72c381d8d8f', '2016-11-17 10:24:20', '0');
INSERT INTO `dept` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', '富锦风险管理部', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '王长林', '风险管理部', '40502', '2016-11-17 10:22:38', '2016-11-17 10:22:29', '2016-11-17 10:22:20', '383a50d4-5a78-4004-8fa0-932945cc0949', '2016-11-17 10:22:41', '0');
INSERT INTO `dept` VALUES (null, null, '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '王仰波', '北京高管', '40509', '2016-11-17 10:23:31', '2016-11-17 10:23:25', '2016-11-17 10:23:18', '56b5e6e8-2656-46f8-b1a8-f42a42140c88', '2016-11-17 10:23:33', '0');
INSERT INTO `dept` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '绥滨区域组', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '宋广民', '上海区域组', '40505', '2016-11-17 10:20:50', '2016-11-17 10:20:11', '2016-11-17 10:19:56', 'aa38692e-7398-436a-b2b8-a1440821774c', '2016-11-17 10:20:53', '0');
INSERT INTO `dept` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '富锦区域组', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '徐立国', 'IUAP平台部', '40503', '2016-09-23 10:35:40', '2016-09-23 10:35:40', '2016-09-23 10:35:40', 'b676078b-a786-4c76-ab80-f5a9b7418e98', '2016-09-23 10:35:40', '0');
INSERT INTO `dept` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', '富锦单证部', '1', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '刘馥嘉', '单证部', '40504', '2016-11-17 10:19:29', '2016-11-17 10:19:20', '2016-11-17 10:19:10', 'ead53046-cf02-44ac-8ed1-23cee26f6159', '2016-11-17 10:19:32', '0');

-- ----------------------------
-- Table structure for ext_bd_countryzone
-- ----------------------------
DROP TABLE IF EXISTS `ext_bd_countryzone`;
CREATE TABLE `ext_bd_countryzone` (
  `ext_pk_country` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_pk_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_bd_countryzone
-- ----------------------------

-- ----------------------------
-- Table structure for ext_cardtablemeta
-- ----------------------------
DROP TABLE IF EXISTS `ext_cardtablemeta`;
CREATE TABLE `ext_cardtablemeta` (
  `ext_pk_system` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_pk_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_cardtablemeta
-- ----------------------------

-- ----------------------------
-- Table structure for ext_dept
-- ----------------------------
DROP TABLE IF EXISTS `ext_dept`;
CREATE TABLE `ext_dept` (
  `ext_pk_dept` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_pk_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_dept
-- ----------------------------

-- ----------------------------
-- Table structure for ext_instit
-- ----------------------------
DROP TABLE IF EXISTS `ext_instit`;
CREATE TABLE `ext_instit` (
  `ext_institid` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_institid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_instit
-- ----------------------------

-- ----------------------------
-- Table structure for ext_iuaptraincrm_ygdemo_yw_info
-- ----------------------------
DROP TABLE IF EXISTS `ext_iuaptraincrm_ygdemo_yw_info`;
CREATE TABLE `ext_iuaptraincrm_ygdemo_yw_info` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_iuaptraincrm_ygdemo_yw_info
-- ----------------------------

-- ----------------------------
-- Table structure for ext_iuaptraincrm_ygdemo_yw_sub
-- ----------------------------
DROP TABLE IF EXISTS `ext_iuaptraincrm_ygdemo_yw_sub`;
CREATE TABLE `ext_iuaptraincrm_ygdemo_yw_sub` (
  `ext_sub_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_iuaptraincrm_ygdemo_yw_sub
-- ----------------------------

-- ----------------------------
-- Table structure for ext_org
-- ----------------------------
DROP TABLE IF EXISTS `ext_org`;
CREATE TABLE `ext_org` (
  `ext_org_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_org
-- ----------------------------

-- ----------------------------
-- Table structure for ext_role
-- ----------------------------
DROP TABLE IF EXISTS `ext_role`;
CREATE TABLE `ext_role` (
  `ext_pk_role` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_pk_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_role
-- ----------------------------

-- ----------------------------
-- Table structure for ext_sys_dict_type_meta
-- ----------------------------
DROP TABLE IF EXISTS `ext_sys_dict_type_meta`;
CREATE TABLE `ext_sys_dict_type_meta` (
  `ext_dict_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_sys_dict_type_meta
-- ----------------------------

-- ----------------------------
-- Table structure for ext_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `ext_sys_user`;
CREATE TABLE `ext_sys_user` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for ext_sys_user_job
-- ----------------------------
DROP TABLE IF EXISTS `ext_sys_user_job`;
CREATE TABLE `ext_sys_user_job` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_sys_user_job
-- ----------------------------

-- ----------------------------
-- Table structure for ext_telbook
-- ----------------------------
DROP TABLE IF EXISTS `ext_telbook`;
CREATE TABLE `ext_telbook` (
  `ext_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_telbook
-- ----------------------------

-- ----------------------------
-- Table structure for ext_userpsn
-- ----------------------------
DROP TABLE IF EXISTS `ext_userpsn`;
CREATE TABLE `ext_userpsn` (
  `ext_pk_user` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_pk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_userpsn
-- ----------------------------

-- ----------------------------
-- Table structure for ext_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `ext_user_dept`;
CREATE TABLE `ext_user_dept` (
  `ext_pk_user_dept` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_pk_user_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_user_dept
-- ----------------------------

-- ----------------------------
-- Table structure for ext_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ext_user_role`;
CREATE TABLE `ext_user_role` (
  `ext_pk_user_role` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`ext_pk_user_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ext_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for ieop_user
-- ----------------------------
DROP TABLE IF EXISTS `ieop_user`;
CREATE TABLE `ieop_user` (
  `id` varchar(64) NOT NULL,
  `login_name` varchar(64) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) default NULL,
  `roles` varchar(255) default NULL,
  `states` varchar(64) default NULL,
  `register_date` date default NULL,
  `def1` varchar(100) default NULL,
  `def2` varchar(100) default NULL,
  `def3` varchar(100) default NULL,
  `def4` varchar(100) default NULL,
  `def5` varchar(100) default NULL,
  `def6` varchar(100) default NULL,
  `def7` varchar(100) default NULL,
  `def8` varchar(100) default NULL,
  `def9` varchar(100) default NULL,
  `def10` varchar(100) default NULL,
  `def11` varchar(100) default NULL,
  `def12` varchar(100) default NULL,
  `def13` varchar(100) default NULL,
  `def14` varchar(100) default NULL,
  `def15` varchar(100) default NULL,
  `tenant_userid` varchar(100) default NULL,
  `passrank` varchar(50) default NULL,
  `pk_usertype` varchar(50) default NULL,
  `pk_corp` varchar(50) default NULL,
  `pk_dept` varchar(50) default NULL,
  `creator` varchar(50) default NULL,
  `creationtime` date default NULL,
  `modifier` varchar(50) default NULL,
  `modifiedtime` date default NULL,
  `pk_psndoc` varchar(50) default NULL,
  `psnseal` int(11) default NULL,
  `locked` int(11) default NULL,
  `psntel` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `dr` int(255) default NULL,
  `ts` timestamp NULL default NULL,
  `pk_propt` varchar(100) default NULL,
  `userattr` varchar(11) default NULL,
  `sys_id` varchar(64) default NULL,
  `tenant_id` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ieop_user
-- ----------------------------
INSERT INTO `ieop_user` VALUES ('00000000000000000001', 'admin', 'admin', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000001', null, null, null, null, 'iuaptcrm10000000iv0j', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('iuaptcrm1000000112vn', 'a', 'a', 'e0155660d90dbb135e1176f2afda336dc555e5cd', '169bb9735c32bf7d', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000003', 'DEPT0000000000000001', 'admin', '2017-02-17', null, null, '', '1', '1', '~', null, '1', '2017-02-17 16:28:17', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('iuaptcrm100000011ale', 'a', 'a', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000003', 'DEPT0000000000000001', '00000000000000000001', '2017-02-21', null, null, 'iuaptcrm100000011ald', '0', '0', 'a', 'a', '1', '2017-02-21 14:52:14', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000001', 'usr001', '王杰', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000003', null, null, null, null, '1000001', '1', '0', null, null, '0', '2017-01-19 13:58:17', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000002', 'usr002', '佟杰', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000009', null, null, null, null, '1000002', '1', '0', null, null, '1', '2017-03-17 21:41:34', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000003', 'usr003', '郭录军', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000010', null, null, null, null, '1000003', '1', '0', null, null, '1', '2017-03-17 22:48:56', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000004', 'usr004', '刘关生', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000011', null, null, null, null, '1000004', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000005', 'usr005', '谢玉秀', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000012', null, null, null, null, '1000005', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000006', 'usr006', '林阳志', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000013', null, null, null, null, '1000006', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000007', 'usr007', '李志伟', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000014', null, null, null, null, '1000007', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000008', 'usr008', '舒波', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000015', null, null, null, null, '1000008', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000009', 'usr009', '李伟', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000016', null, null, null, null, '1000009', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000010', 'usr010', '吴文波', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000017', null, null, null, null, '1000010', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000011', 'usr011', '强剑', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000018', null, null, null, null, '1000011', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000012', 'usr012', '张金龙', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000019', null, null, null, null, '1000012', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000013', 'usr013', '谢利芬', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000020', null, null, null, null, '1000013', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000014', 'usr014', '童敏', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000021', null, null, null, null, '1000014', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000015', 'usr015', '王韶辉', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000022', null, null, null, null, '1000015', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000016', 'usr016', '商晓光', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000023', null, null, null, null, '1000016', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000017', 'usr017', '熊明', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000023', null, null, null, null, '1000017', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000018', 'usr018', '宋健华', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000002', null, null, null, null, '1000018', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000019', 'usr019', '陈富军', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000004', null, null, null, null, '1000019', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000020', 'usr020', '王娜', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000005', null, null, null, null, '1000020', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000021', 'usr021', '谭姝霖', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000001', null, null, null, null, '1000021', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000022', 'usr022', '丛薇', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000006', null, null, null, null, '1000022', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000023', 'usr023', '肖海平', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000007', null, null, null, null, '1000023', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000024', 'usr024', '周灵敏', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000003', 'DEPT0000000000000008', null, null, null, null, '1000024', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000025', 'usr025', '周亚林', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000003', 'DEPT0000000000000008', null, null, null, null, '1000025', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000026', 'usr026', '丁小红', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000005', null, null, null, null, '1000026', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000027', 'usr027', '崔红', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000005', null, null, null, null, '1000027', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000028', 'usr028', '王维杰', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000004', null, null, null, null, '1000028', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000029', 'usr029', '郭晓文', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000019', null, null, null, null, '1000029', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000030', 'usr030', '杨彪', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000001', null, null, null, null, '1000030', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000031', 'usr031', '严媛媛', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000001', null, null, null, null, '1000031', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000032', 'usr032', '刘春况', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000006', null, null, null, null, '1000032', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000033', 'usr033', '杨敏娜', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000002', null, null, null, null, '1000033', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000034', 'usr034', '佘正', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000002', null, null, null, null, '1000034', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000035', 'usr035', '许书领', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000004', null, null, null, null, '1000035', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000036', 'usr036', '吴海燕', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000001', null, null, null, null, '1000036', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);
INSERT INTO `ieop_user` VALUES ('U1000037', 'usr037', '陈国徐', '5a2ae9e5301af463a04b79ee1e391ba8d65cfa37', 'e3af403c455cd77a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'CORP0000000000000002', 'DEPT0000000000000004', null, null, null, null, '1000037', '1', '0', null, null, '0', '2017-01-11 00:00:00', null, null, null, null);

-- ----------------------------
-- Table structure for instit
-- ----------------------------
DROP TABLE IF EXISTS `instit`;
CREATE TABLE `instit` (
  `parent_id` varchar(36) default NULL,
  `instit_code` varchar(200) NOT NULL,
  `email` varchar(50) default NULL,
  `short_name` varchar(50) default NULL,
  `instit_type` varchar(10) default NULL,
  `instit_name` varchar(200) NOT NULL,
  `creator` varchar(20) default NULL,
  `creationtime` datetime default NULL,
  `institid` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`institid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instit
-- ----------------------------
INSERT INTO `instit` VALUES (null, '100', null, '象屿集团', null, '用友网络集团有限公司', 'Admin', '2016-09-22 09:56:57', '3f362161-e32b-4e59-b703-df11d871244e', '2016-09-22 09:56:57', '0');
INSERT INTO `instit` VALUES ('3f362161-e32b-4e59-b703-df11d871244e', '002', null, '测试部门', null, '用友网络测试部门', null, '2016-09-22 09:56:57', '46c6129e-05f0-43f3-997f-bc672aebec7c', '2016-12-14 09:55:43', '0');
INSERT INTO `instit` VALUES ('3f362161-e32b-4e59-b703-df11d871244e', '200', null, '象屿股份', null, '用友网络IUAP开发平台', 'Admin', '2016-09-22 09:56:57', '761dc79a-69ac-490b-8868-4e1e4f42d039', '2016-09-22 09:56:57', '0');
INSERT INTO `instit` VALUES ('46c6129e-05f0-43f3-997f-bc672aebec7c', '003', null, '测试小组', null, '用友网络IUAP开发测试小组', null, '2016-09-22 09:56:57', '98d0c98d-24f3-49e3-9343-df6c4d2b6cd5', '2016-12-15 10:29:23', '0');

-- ----------------------------
-- Table structure for iuaptraincrm_ygdemo_yw_info
-- ----------------------------
DROP TABLE IF EXISTS `iuaptraincrm_ygdemo_yw_info`;
CREATE TABLE `iuaptraincrm_ygdemo_yw_info` (
  `zrr` varchar(36) default NULL,
  `dbr` varchar(36) default NULL,
  `zbr` varchar(36) default NULL,
  `update_name` varchar(36) default NULL,
  `create_name` varchar(36) default NULL,
  `zr_dw` varchar(36) default NULL,
  `unitid` varchar(36) default NULL,
  `xb_dw` varchar(50) default NULL,
  `qt_ld` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `code` varchar(50) default NULL,
  `xbr` varchar(50) default NULL,
  `ly_code` varchar(50) default NULL,
  `state` int(11) default NULL,
  `kpi_level` int(11) default NULL,
  `kpi_flag` int(11) default NULL,
  `zy_cd` int(11) default NULL,
  `db_info` text,
  `jfyq` text,
  `ly_sm` text,
  `end_date` datetime default NULL,
  `begin_date` datetime default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  `jd_bl` decimal(28,8) default NULL,
  `rwpf` decimal(28,8) default NULL,
  `id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iuaptraincrm_ygdemo_yw_info
-- ----------------------------
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', '~', '~', null, null, '999', '9999', null, '1', '1', '1', '0', '1', null, null, null, null, null, null, null, null, null, '2331dd57-6aae-4304-909b-17c7ad84cf46', '2017-04-07 15:55:22', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', '~', '~', null, null, '44', '44', null, '1', '1', '1', '0', '2', null, null, null, null, null, null, null, null, null, '42ff5533-f026-4cb5-9963-3462c3e619fe', '2017-04-07 01:09:56', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('1000002', '1000004', '1000004', 'U1000004', 'U1000001', 'CORP0000000000000002', 'CORP0000000000000002', 'CORP0000000000000002', '1000003', '111', '11', '1000003', '2', '1', '1', '0', '1', '111222', '112233', '111', null, '2017-03-07 00:00:00', '2017-03-08 00:00:00', null, '10.00000000', '80.00000000', '65ef2e94-703e-4e72-b3bc-5a226630629e', '2017-03-29 18:44:56', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', 'CORP0000000000000002', '~', null, null, '33', '33', null, '1', '1', '1', '1', '1', null, null, null, null, null, null, null, null, null, '6915149a-a213-42e3-92e6-56c2a61da366', '2017-04-07 01:09:17', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', '~', '~', null, null, '88', '888', null, '1', '1', '1', '0', '1', null, null, null, null, null, null, null, null, null, '6af0a61b-9168-4a64-9286-3ac5d424ffce', '2017-04-07 15:34:31', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', '~', '~', null, null, '101011', '101011', null, '1', '1', null, '0', '1', null, null, null, null, null, null, null, null, null, '6f38d805-9c24-44bf-84af-844d72cda0ea', '2017-04-07 16:40:36', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', '~', '~', null, null, '777', '777', null, '1', '1', '1', '0', null, null, null, null, null, null, null, null, null, null, 'b63e1963-ac3f-4e28-8252-0a90219e95cf', '2017-04-07 15:23:26', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('1000002', '~', '~', '~', '~', 'CORP0000000000000002', '~', 'CORP0000000000000002', null, '22', '22', null, '1', '1', '2', '0', '1', null, null, null, null, null, null, null, null, null, 'c9df5629-912e-4875-b1f5-0cefa4b405cc', '2017-04-06 00:41:04', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', '~', '~', null, null, '66', '666', null, '1', '1', '1', '0', null, null, null, null, null, null, null, null, null, null, 'cfb1d8b5-28b2-46a9-a2d0-d9481783f947', '2017-04-07 14:55:52', '0');
INSERT INTO `iuaptraincrm_ygdemo_yw_info` VALUES ('~', '~', '~', '~', '~', '~', '~', null, null, '55', '55', null, '1', '1', '2', '0', null, null, null, null, null, null, null, null, null, null, 'dedf3245-11d9-444c-a2d1-07df68b7f218', '2017-04-07 13:35:53', '0');

-- ----------------------------
-- Table structure for iuaptraincrm_ygdemo_yw_sub
-- ----------------------------
DROP TABLE IF EXISTS `iuaptraincrm_ygdemo_yw_sub`;
CREATE TABLE `iuaptraincrm_ygdemo_yw_sub` (
  `fk_id_ygdemo_yw_sub` char(36) default NULL,
  `zbr` varchar(36) default NULL,
  `create_name` varchar(36) default NULL,
  `update_name` varchar(36) default NULL,
  `sub_ms` varchar(200) default NULL,
  `sub_code` varchar(50) default NULL,
  `sub_name` varchar(50) default NULL,
  `update_time` datetime default NULL,
  `end_date` datetime default NULL,
  `create_time` datetime default NULL,
  `begin_date` datetime default NULL,
  `sub_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iuaptraincrm_ygdemo_yw_sub
-- ----------------------------
INSERT INTO `iuaptraincrm_ygdemo_yw_sub` VALUES ('65ef2e94-703e-4e72-b3bc-5a226630629e', '1000002', 'iuaptcrm100000011ale', 'U1000005', '111222', '111', '111', null, '2017-03-07 00:00:00', '2017-03-07 00:00:00', '2017-03-09 00:00:00', '5ba463f0-1a31-41bb-b4ec-65e9d933ccd1', '2017-03-29 18:44:56', '0');

-- ----------------------------
-- Table structure for md_accessorpara
-- ----------------------------
DROP TABLE IF EXISTS `md_accessorpara`;
CREATE TABLE `md_accessorpara` (
  `id` varchar(128) NOT NULL,
  `assosequence` smallint(6) NOT NULL,
  `paravalue` varchar(512) default NULL,
  `versiontype` smallint(6) default NULL,
  `industry` varchar(50) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`assosequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_accessorpara
-- ----------------------------

-- ----------------------------
-- Table structure for md_association
-- ----------------------------
DROP TABLE IF EXISTS `md_association`;
CREATE TABLE `md_association` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(60) NOT NULL,
  `componentid` varchar(50) default NULL,
  `startbeanid` varchar(50) NOT NULL,
  `startelementid` varchar(50) NOT NULL,
  `endelementid` varchar(50) NOT NULL,
  `startcardinality` varchar(10) default NULL,
  `endcardinality` varchar(10) default NULL,
  `type` smallint(6) default NULL,
  `cascadeupdate` char(1) default NULL,
  `cascadedelete` char(1) default NULL,
  `isactive` char(1) default NULL,
  `creator` varchar(30) default NULL,
  `modifier` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `industry` varchar(50) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_association
-- ----------------------------
INSERT INTO `md_association` VALUES ('265b5185-a233-4fdd-b5a6-8e6c9228fb69', '0', 'Aggregation Relation', 'a6095921-3f9c-4a5e-9f50-b5a841300bb4', '1d0864c9-241a-4fc2-940d-2a80e474cb33', '9e15a310-18b4-4e01-84fe-0c710391dcf8', 'd2c264ee-a7ba-4710-a6d2-359d10b19746', '1', '1..n', '1', null, null, 'N', null, null, '2017-03-31 15:14:44', '2017-03-31 15:14:44', '0', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_association` VALUES ('340860ca-f171-4256-9971-9d74a08cb036', '0', 'UserRole_pk_role', 'a6095921-3f9c-4a5e-9f50-b5a841300bb4', 'd2c264ee-a7ba-4710-a6d2-359d10b19746', '4fb125f1-033a-4b23-a3a9-5e827c63af2b', 'f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_association` VALUES ('4fd1e4a0-576a-4274-b2cd-872877c944f9', '0', 'UserDept_pk_dept', '826d67d7-1f2b-410e-be95-5a681308c2b1', 'a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', '90996160-893d-4539-b3dc-903f3ce34a7f', '17ffb644-c70c-48de-a47f-c5b53f75460f', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_association` VALUES ('60684599-d35a-4fee-9044-4f3e237302d8', '0', 'dept_parentid', 'a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', '17ffb644-c70c-48de-a47f-c5b53f75460f', 'b1b3407c-71a9-4944-ac3e-2e4f1f4a03c4', '17ffb644-c70c-48de-a47f-c5b53f75460f', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_association` VALUES ('61113bce-c0f6-4dc7-aa6c-311b2d4e4925', '0', 'sysUserJob_orgid', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'e37eed0f-507c-4c84-92f5-7c83644844f8', '073683a2-12c5-4fc2-9008-be234c27c43f', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_association` VALUES ('863c3d6b-92b1-4597-a236-62fcf6a4661c', '0', 'sysUser_orgid', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'af352b2f-4281-4f55-92e5-fdd095bbdff5', '7fc16fb0-71ee-4daf-951b-e524a0051bc7', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_association` VALUES ('88543fb7-4ab2-46fd-b70f-7402dd644a79', '0', 'telbook_countryzone', '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '4bdf8034-83f4-48d4-8e2c-04aca3693586', '16df9de7-2ac7-4458-a95d-185619fe66a4', '08ffeabe-e01d-4072-a4c3-025345386ebb', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_association` VALUES ('8b1762aa-5c3c-48a3-b240-bfb8f39207a5', '0', 'Aggregation Relation', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'af352b2f-4281-4f55-92e5-fdd095bbdff5', '61c291c3-506c-4673-81da-b1e718e56fbc', 'e37eed0f-507c-4c84-92f5-7c83644844f8', '1', '1..n', '1', null, null, null, null, null, '2016-11-08 09:45:49', '2016-11-08 09:45:49', '0', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_association` VALUES ('8ebcced7-6002-44c8-8928-89dd1b527d30', '0', 'org_parentid', 'f7adbc5a-fc68-40bb-a18c-3a7fc4dbd606', '8254a6a2-5933-422e-b4bb-f13d1d22108a', 'de44d0af-7538-41dd-8efd-a5b11940ba25', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_association` VALUES ('934d29d7-89af-4de6-a79d-2c2e3d4a4eaa', '0', 'UserPsn_pk_dept', 'a6095921-3f9c-4a5e-9f50-b5a841300bb4', '1d0864c9-241a-4fc2-940d-2a80e474cb33', '413caf40-1a42-4299-aba9-753ecd6f2c04', '17ffb644-c70c-48de-a47f-c5b53f75460f', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_association` VALUES ('9d27a134-2dac-48fb-822b-814f60c117a0', '0', 'UserPsn_pk_corp', 'a6095921-3f9c-4a5e-9f50-b5a841300bb4', '1d0864c9-241a-4fc2-940d-2a80e474cb33', '28d3a192-3cc9-4d0f-95e1-47f7c059a3f2', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_association` VALUES ('a99555b2-c8ba-4dba-9b2f-419ac3872384', '0', 'Aggregation Relation', '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1462bbcc-84be-46df-bde4-03037203216b', '4bdf8034-83f4-48d4-8e2c-04aca3693586', '1', '1..n', '1', null, null, 'N', null, null, '2016-12-13 13:12:28', '2016-12-13 13:12:28', '0', null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_association` VALUES ('bf4c6d77-1a5b-4f11-82c3-2af103bddc49', '0', 'instit_parentid', '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '2c3c1f2b-2c3c-49f9-b7fe-fcff773f4749', '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_association` VALUES ('caab159b-b894-44a6-abc9-91cf8fbe74fb', '0', 'sysUserJob_deptid', '0f1d958f-39a5-41f8-b977-551f360f40a3', 'e37eed0f-507c-4c84-92f5-7c83644844f8', 'f564d08b-04d2-49d2-8c44-dafa11ec758b', '17ffb644-c70c-48de-a47f-c5b53f75460f', '1', '1', '3', null, null, 'Y', null, null, null, null, '0', null, '2016-12-15 09:49:06', '0');

-- ----------------------------
-- Table structure for md_bizitfmap
-- ----------------------------
DROP TABLE IF EXISTS `md_bizitfmap`;
CREATE TABLE `md_bizitfmap` (
  `bizinterfaceid` varchar(50) NOT NULL,
  `intattrid` varchar(50) NOT NULL,
  `classid` varchar(50) NOT NULL,
  `classattrid` varchar(50) default NULL,
  `bizitfimpclassname` varchar(256) default NULL,
  `classattrpath` varchar(512) default NULL,
  `versiontype` smallint(6) default NULL,
  `industry` varchar(50) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`intattrid`,`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_bizitfmap
-- ----------------------------
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', '5dd3c721-22ad-42b1-9c10-4351c236bc77', '08ffeabe-e01d-4072-a4c3-025345386ebb', 'a38c429f-caeb-413f-8b1f-a3727a75ce4e', null, null, null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', '89578a97-42fe-439b-827c-8eabd9e3604c', '08ffeabe-e01d-4072-a4c3-025345386ebb', '449282ce-da9c-44c3-9f97-75dec757519b', null, null, null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', 'c8334364-7ab9-4266-8d4b-e74537935e46', '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_bizitfmap` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', 'd32cc17b-f415-415a-923f-0764443eb102', '08ffeabe-e01d-4072-a4c3-025345386ebb', '2702b115-ae64-471f-a12a-0ffb85d5a61c', null, null, null, null, null, '2017-04-01 10:44:34', '0');

-- ----------------------------
-- Table structure for md_class
-- ----------------------------
DROP TABLE IF EXISTS `md_class`;
CREATE TABLE `md_class` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `parentclassid` varchar(50) default NULL,
  `componentid` varchar(50) default NULL,
  `keyattribute` varchar(50) default NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `fullclassname` varchar(256) default NULL,
  `classtype` smallint(6) default NULL,
  `accessorclassname` varchar(256) default NULL,
  `fixedlength` char(1) default NULL,
  `precise` smallint(6) default NULL,
  `refmodelname` varchar(768) default NULL,
  `returntype` varchar(50) default NULL,
  `isprimary` char(1) default NULL,
  `isactive` char(1) default NULL,
  `creator` varchar(30) default NULL,
  `modifier` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `isauthen` char(1) default NULL,
  `resid` varchar(90) default NULL,
  `bizitfimpclassname` varchar(256) default NULL,
  `modinfoclassname` varchar(256) default NULL,
  `iscreatesql` char(1) default NULL,
  `defaulttablename` varchar(50) default NULL,
  `isextendbean` char(1) default NULL,
  `userdefclassname` varchar(256) default NULL,
  `stereotype` varchar(256) default NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_class
-- ----------------------------
INSERT INTO `md_class` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '0', null, '7ab0a8fc-d04b-4ac5-811d-5d19fa67c174', 'a38c429f-caeb-413f-8b1f-a3727a75ce4e', 'countryzone', '国家地区', null, null, 'com.yonyou.iuap.example.entity.meta.Countryzone', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-16 11:11:17', '2016-12-13 14:58:33', 'Y', null, null, null, 'Y', 'bd_countryzone', null, null, null, '0', null, '2017-04-01 10:44:33', '0');
INSERT INTO `md_class` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '0', null, 'a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', '03fd3103-1d97-43ea-a122-9e0cc1196359', 'dept', '部门', null, null, 'com.yonyou.iuap.example.entity.meta.Dept', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-16 10:53:23', '2016-12-13 11:20:46', 'Y', null, null, null, 'Y', 'dept', null, null, null, '0', null, '2017-04-01 10:45:47', '0');
INSERT INTO `md_class` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '0', null, 'a6095921-3f9c-4a5e-9f50-b5a841300bb4', 'bf09b9e3-3857-41e9-aff9-a573c0f3e24c', 'UserPsn', '人员信息', null, null, 'com.yonyou.iuaptraincrm.userpsn.UserPsn', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2017-03-31 13:28:54', '2017-04-01 10:44:28', 'Y', null, null, null, 'Y', 'userpsn', null, null, null, '0', null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_class` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '0', null, '2ffbee6a-001e-4459-a7ba-8f14e45a41b8', 'f1c3dfb6-2d26-4f85-8173-efa3a1a412be', 'cardTableMeta', '卡片列表', null, null, 'com.yonyou.iuap.example.entity.meta.CardTableMeta', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-12-12 15:03:23', '2016-12-13 14:58:29', 'Y', null, null, null, 'Y', 'cardTableMeta', null, null, null, '0', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_class` VALUES ('4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '0', null, 'a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', null, 'DeptType', '部门类型', null, null, 'com.yonyou.iuap.example.entity.meta.DeptType', '203', null, null, null, null, 'BS000010000100001001', 'N', null, null, null, '2016-11-16 11:00:09', '2016-12-13 11:15:25', null, null, null, null, null, 'DeptType', null, null, null, '0', null, '2017-04-01 10:45:47', '0');
INSERT INTO `md_class` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '0', null, '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '45259f0e-2d6e-4fd2-bc56-51a322860eed', 'telbook', '通讯录', null, null, 'com.yonyou.iuap.example.entity.meta.Telbook', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'N', null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', 'Y', null, null, null, 'Y', 'telbook', null, null, null, '0', null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_class` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '0', null, '65579d3f-110c-4fdf-8d0b-63ba24007a3d', '2b8fdeeb-577c-417d-8e90-627b8fed67e6', 'instit', '机构', null, null, 'com.yonyou.iuap.example.entity.meta.Instit', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', 'Y', null, null, null, 'Y', 'instit', null, null, null, '0', null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_class` VALUES ('6c8722b9-911a-489b-8d0d-18bd3734fcf6', '0', null, 'aa1e1c21-6241-4134-a71a-05624e14140f', null, 'IBDObject', 'IBDObject', null, null, 'com.yonyou.iuap.example.entity.meta.IBDObject', '206', null, null, null, null, null, 'N', null, null, null, '2008-02-20 13:38:36', '2016-11-16 15:20:12', null, null, null, null, null, 'IBDObject', null, null, null, '0', null, '2017-04-01 10:45:00', '0');
INSERT INTO `md_class` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '0', null, 'f7adbc5a-fc68-40bb-a18c-3a7fc4dbd606', 'bc9aa608-9761-450a-a718-7feaa0df2429', 'org', '组织', null, null, 'com.yonyou.iuap.example.entity.meta.Org', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-07 13:30:47', '2016-12-13 11:15:38', 'Y', null, null, null, 'Y', 'org', null, null, null, '0', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_class` VALUES ('90c3c346-8efe-4e48-b892-23e7b2d5f096', '0', null, '65579d3f-110c-4fdf-8d0b-63ba24007a3d', null, 'Sex', '性别', null, null, 'com.yonyou.iuap.example.entity.meta.Sex', '203', null, null, null, null, 'BS000010000100001001', 'N', null, null, null, '2016-12-13 13:12:51', '2016-12-14 09:58:47', null, null, null, null, null, 'Sex', null, null, null, '0', null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_class` VALUES ('a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', '0', null, '826d67d7-1f2b-410e-be95-5a681308c2b1', 'de3cb9bb-064c-4efb-b7a1-00aab49828a0', 'UserDept', '管辖部门', null, null, 'com.yonyou.tepoc.user_dept.UserDept', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2017-03-31 16:21:39', '2017-03-31 20:39:13', 'Y', null, null, null, 'Y', 'user_dept', null, null, null, '0', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_class` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '0', null, '0f1d958f-39a5-41f8-b977-551f360f40a3', '01a74741-fa52-477a-a58e-5565db36de0b', 'sysUser', '用户管理表', null, null, 'com.yonyou.iuap.example.entity.meta.SysUser', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-11-08 09:18:08', '2016-12-14 14:15:14', 'Y', null, null, null, 'Y', 'sys_user', null, null, null, '0', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001001', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'String', '字符串', 'String', 'String', 'java.lang.String', '1', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000015', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001004', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Integer', '整数', 'Integer', 'Integer', 'java.lang.Integer', '4', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000002', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001015', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'BigInteger', '长整数', 'BigInteger', 'BigInteger', 'java.math.BigInteger', '15', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000002', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001030', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'MEMO', '备注', '备注', 'MEMO', 'java.lang.String', '30', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000003', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001031', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Double', '数值', 'Double', 'Double', 'java.lang.Double', '31', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000012', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001032', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Boolean', '布尔类型', 'Boolean', 'Boolean', 'java.lang.Boolean', '32', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000016', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001033', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Date', '日期', 'Date', 'Date', 'java.util.Date', '33', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000007', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001034', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'DateTime', '日期时间', 'DateTime', 'DateTime', 'java.util.Date', '34', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000010', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001036', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Time', '时间', 'Time', 'Time', 'java.util.Date', '36', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000011', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001037', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'DateBegin', '日期(开始)', 'DateBegin', 'DateBegin', 'java.util.Date', '37', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000009', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001038', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'DateEnd', '日期(结束)', 'DateEnd', 'DateEnd', 'java.util.Date', '38', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000008', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001039', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'LiteralDate', '模糊日期', 'LiteralDate', 'LiteralDate', 'java.util.Date', '39', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000006', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001040', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'BigDecimal', 'BigDecimal', 'BigDecimal', 'BigDecimal', 'java.math.BigDecimal', '40', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', null, null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001051', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'ID', '主键', 'ID', 'ID', 'java.lang.String', '51', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000017', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001052', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'Money', '金额', 'Money', 'Money', 'java.math.BigDecimal', '52', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000005', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001053', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'BLOB', 'BLOB', 'BLOB', 'BLOB', 'java.lang.Object', '53', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', null, null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001054', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'CLOB', 'CLOB', 'CLOB', 'CLOB', 'java.lang.String', '54', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', null, null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001055', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'IMAGE', '图片类型', '图片类型', 'IMAGE', 'java.lang.Object', '55', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000018', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001056', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'CUSTOM', '自定义项', '自定义项', 'CUSTOM', 'java.lang.String', '56', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000013', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001058', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'MULTILANGTEXT', '多语文本', '多语文本', 'MULTILANGTEXT', 'java.lang.String', '58', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000004', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001059', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'CUSTOM', '自由项', '自由项', 'FREEDOM', 'java.lang.String', '59', null, null, null, null, null, null, 'Y', 'cch', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000014', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:14', '0');
INSERT INTO `md_class` VALUES ('BS000010000100001070', '0', null, 'UAP-BASE-COMPONENT-ID', null, 'ConversionRate', '换算率', '换算率', 'ConversionRate', 'java.lang.String', '70', null, null, null, null, null, null, 'Y', 'dingxm', 'cch', '2007-07-25 12:00:00', '2007-07-25 12:30:00', 'Y', '2UC011-000020', null, null, null, null, null, null, null, '0', null, '2012-02-08 17:06:13', '0');
INSERT INTO `md_class` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '0', null, '168ffa92-56c5-4c60-a7d8-3cf0b7f4734b', '636b7e2d-7d10-4dcb-802f-3bd8f3f399de', 'sysDictTypeMeta', '档案', null, null, 'com.yonyou.iuap.example.entity.meta.SysDictTypeMeta', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2016-12-12 15:28:29', '2016-12-13 11:10:33', 'Y', null, null, null, 'Y', 'sys_dict_type_meta', null, null, null, '0', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_class` VALUES ('d2c264ee-a7ba-4710-a6d2-359d10b19746', '0', null, 'a6095921-3f9c-4a5e-9f50-b5a841300bb4', '8ecdcd44-fd12-4667-9cdd-43fe694bb08c', 'UserRole', '所属角色', null, null, 'com.yonyou.tepoc.userpsn.UserRole', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'N', null, null, null, '2017-03-31 15:12:25', '2017-04-01 10:44:28', 'Y', null, null, null, 'Y', 'user_role', null, null, null, '0', null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_class` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '0', null, '0f1d958f-39a5-41f8-b977-551f360f40a3', 'c626af22-65ed-4d02-ac21-9e99ee465a96', 'sysUserJob', '用户任职表', null, null, 'com.yonyou.iuap.example.entity.meta.SysUserJob', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'N', null, null, null, '2016-11-08 09:33:28', '2016-12-14 14:15:14', 'Y', null, null, null, 'Y', 'sys_user_job', null, null, null, '0', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_class` VALUES ('f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', '0', null, '76e76a74-c7dc-4238-8144-bb41b1a96555', 'c9f8a353-8b13-45c5-b07c-0fe14d90fe42', 'Role', '角色', null, null, 'com.yonyou.tepoc.role.Role', '201', 'nc.md.model.access.javamap.POJOStyle', null, null, null, null, 'Y', null, null, null, '2017-03-31 14:55:24', '2017-03-31 14:57:43', 'Y', null, null, null, 'Y', 'role', null, null, null, '0', null, '2017-04-01 22:19:08', '0');

-- ----------------------------
-- Table structure for md_column
-- ----------------------------
DROP TABLE IF EXISTS `md_column`;
CREATE TABLE `md_column` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `tableid` varchar(50) default NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `isactive` char(1) default NULL,
  `sqldatetype` varchar(50) default NULL,
  `pkey` char(1) default NULL,
  `identitied` char(1) default NULL,
  `incrementstep` smallint(6) default NULL,
  `incrementseed` smallint(6) default NULL,
  `nullable` char(1) default NULL,
  `precise` smallint(6) default NULL,
  `columnlength` smallint(6) default NULL,
  `defaultvalue` varchar(512) default NULL,
  `columnsequence` smallint(6) default NULL,
  `modifytime` char(19) default NULL,
  `createtime` char(19) default NULL,
  `modifier` varchar(30) default NULL,
  `creator` varchar(30) default NULL,
  `resid` varchar(90) default NULL,
  `groupid` varchar(50) default NULL,
  `columntype` smallint(6) default NULL,
  `forlocale` char(1) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_column
-- ----------------------------
INSERT INTO `md_column` VALUES ('bd_countryzone@@@code', '0', 'bd_countryzone', 'code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '40', null, '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@creationtime', '0', 'bd_countryzone', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '9', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@creator', '0', 'bd_countryzone', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '8', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@description', '0', 'bd_countryzone', 'description', '描述', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '5', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@modifiedtime', '0', 'bd_countryzone', 'modifiedtime', '最后修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '11', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@modifier', '0', 'bd_countryzone', 'modifier', '最后修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '10', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@name', '0', 'bd_countryzone', 'name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@phonecode', '0', 'bd_countryzone', 'phonecode', '电话代码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '20', null, '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@pk_lang', '0', 'bd_countryzone', 'pk_lang', '语种', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@pk_timezone', '0', 'bd_countryzone', 'pk_timezone', '时区', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '20', null, '6', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@@wholename', '0', 'bd_countryzone', 'wholename', '全称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '200', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('bd_countryzone@@PK@@', '0', 'bd_countryzone', 'pk_country', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@code', '0', 'cardTableMeta', 'code', '系统编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@combodatamodel', '0', 'cardTableMeta', 'combodatamodel', '认证模式', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@createtime', '0', 'cardTableMeta', 'createtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@gateway', '0', 'cardTableMeta', 'gateway', '网管地址', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@name', '0', 'cardTableMeta', 'name', '系统名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@radiodataassociate', '0', 'cardTableMeta', 'radiodataassociate', '用户自关联', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@radiodatacontroller', '0', 'cardTableMeta', 'radiodatacontroller', '需要授权', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@@tag', '0', 'cardTableMeta', 'tag', 'tag', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('cardTableMeta@@PK@@', '0', 'cardTableMeta', 'pk_system', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_column` VALUES ('dept@@@createdate', '0', 'dept', 'createdate', '部门成立时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '6', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_column` VALUES ('dept@@@creationtime', '0', 'dept', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '9', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_column` VALUES ('dept@@@creator', '0', 'dept', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '20', null, '8', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_column` VALUES ('dept@@@deptcanceldate', '0', 'dept', 'deptcanceldate', '部门撤销日期', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '10', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_column` VALUES ('dept@@@dept_code', '0', 'dept', 'dept_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '40', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_column` VALUES ('dept@@@dept_name', '0', 'dept', 'dept_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_column` VALUES ('dept@@@dept_type', '0', 'dept', 'dept_type', '部门类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '20', null, '5', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_column` VALUES ('dept@@@org_id', '0', 'dept', 'org_id', '组织ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_column` VALUES ('dept@@@parent_id', '0', 'dept', 'parent_id', '上级ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_column` VALUES ('dept@@@short_name', '0', 'dept', 'short_name', '简称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_column` VALUES ('dept@@PK@@', '0', 'dept', 'pk_dept', '部门主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_column` VALUES ('instit@@@creationtime', '0', 'instit', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '8', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@@creator', '0', 'instit', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '20', null, '7', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@@email', '0', 'instit', 'email', '邮箱', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@@instit_code', '0', 'instit', 'instit_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@@instit_name', '0', 'instit', 'instit_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@@instit_type', '0', 'instit', 'instit_type', '类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '10', null, '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@@parent_id', '0', 'instit', 'parent_id', '上级ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '6', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@@short_name', '0', 'instit', 'short_name', '简称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('instit@@PK@@', '0', 'instit', 'institid', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('org@@@creationtime', '0', 'org', 'creationtime', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '8', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@@creator', '0', 'org', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '20', null, '7', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@@email', '0', 'org', 'email', '邮箱', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@@org_code', '0', 'org', 'org_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@@org_name', '0', 'org', 'org_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '200', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@@org_type', '0', 'org', 'org_type', '类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '10', null, '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@@parent_id', '0', 'org', 'parent_id', '上级ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '6', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@@short_name', '0', 'org', 'short_name', '简称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('org@@PK@@', '0', 'org', 'org_id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_column` VALUES ('role@@@rolecode', '0', 'role', 'rolecode', '角色编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_column` VALUES ('role@@@rolename', '0', 'role', 'rolename', '角色名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_column` VALUES ('role@@@roletype', '0', 'role', 'roletype', '角色类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_column` VALUES ('role@@PK@@', '0', 'role', 'pk_role', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@create_time', '0', 'sys_dict_type_meta', 'create_time', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@creator', '0', 'sys_dict_type_meta', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@creator_id', '0', 'sys_dict_type_meta', 'creator_id', '创建人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@dict_type_code', '0', 'sys_dict_type_meta', 'dict_type_code', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@dict_type_name', '0', 'sys_dict_type_meta', 'dict_type_name', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@is_fixed', '0', 'sys_dict_type_meta', 'is_fixed', '系统预制', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@modifier', '0', 'sys_dict_type_meta', 'modifier', '修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@modifier_id', '0', 'sys_dict_type_meta', 'modifier_id', '修改人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@modify_time', '0', 'sys_dict_type_meta', 'modify_time', '修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@@remark', '0', 'sys_dict_type_meta', 'remark', '评论', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '512', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_dict_type_meta@@PK@@', '0', 'sys_dict_type_meta', 'dict_id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@birthdate', '0', 'sys_user', 'birthdate', '出生日期', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '13', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@certificate_code', '0', 'sys_user', 'certificate_code', '证件号码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '32', null, '12', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@certificate_id', '0', 'sys_user', 'certificate_id', '证件类型ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@certificate_name', '0', 'sys_user', 'certificate_name', '证件类型名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '11', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@create_time', '0', 'sys_user', 'create_time', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '25', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@creator', '0', 'sys_user', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '24', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@creator_id', '0', 'sys_user', 'creator_id', '创建人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '23', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@image_url', '0', 'sys_user', 'image_url', '电子印章图片地址或头像', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '19', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@level_id', '0', 'sys_user', 'level_id', '用户级别ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '17', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@level_name', '0', 'sys_user', 'level_name', '用户级别名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '18', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@login_name', '0', 'sys_user', 'login_name', '登录名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@modifier', '0', 'sys_user', 'modifier', '修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '27', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@modifier_id', '0', 'sys_user', 'modifier_id', '修改人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '26', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@modify_time', '0', 'sys_user', 'modify_time', '修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '28', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@org_id', '0', 'sys_user', 'org_id', '所属组织ID', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@org_name', '0', 'sys_user', 'org_name', '所属组织名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@platform_id', '0', 'sys_user', 'platform_id', '所属平台ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '15', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@platform_name', '0', 'sys_user', 'platform_name', '所属平台名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '16', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@register_date', '0', 'sys_user', 'register_date', '系统注册日期', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '14', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@remark', '0', 'sys_user', 'remark', '备注', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '512', null, '22', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@sex_id', '0', 'sys_user', 'sex_id', '性别ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@status_id', '0', 'sys_user', 'status_id', '状态ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '1', null, '20', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@status_name', '0', 'sys_user', 'status_name', '状态姓名', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '21', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_code', '0', 'sys_user', 'user_code', '用户编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '32', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_email', '0', 'sys_user', 'user_email', '用户邮件', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_mobile', '0', 'sys_user', 'user_mobile', '用户手机号', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '16', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_name', '0', 'sys_user', 'user_name', '用户名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@@user_password', '0', 'sys_user', 'user_password', '登录密码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '64', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user@@PK@@', '0', 'sys_user', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@create_time', '0', 'sys_user_job', 'create_time', '创建时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'N', '0', '0', null, '10', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@creator', '0', 'sys_user_job', 'creator', '创建人', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '20', null, '9', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@creator_id', '0', 'sys_user_job', 'creator_id', '创建人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '40', null, '8', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@dept_id', '0', 'sys_user_job', 'dept_id', '部门ID', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, '2', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@fk_id_sys_user_job', '0', 'sys_user_job', 'fk_id_sys_user_job', '用户管理表_主键', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, null, null, null, null, null, '2UC000-000003', null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@is_active', '0', 'sys_user_job', 'is_active', '启用状态', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@is_default', '0', 'sys_user_job', 'is_default', '是否默认职责', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@modifier', '0', 'sys_user_job', 'modifier', '修改人', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '20', null, '12', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@modifier_id', '0', 'sys_user_job', 'modifier_id', '修改人ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '40', null, '11', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@modify_time', '0', 'sys_user_job', 'modify_time', '修改时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', '0', '0', null, '13', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@org_id', '0', 'sys_user_job', 'org_id', '组织ID', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, '1', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@user_id', '0', 'sys_user_job', 'user_id', '用户ID', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '40', null, '3', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@user_job_note', '0', 'sys_user_job', 'user_job_note', '说明', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', '0', '256', null, '7', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@@user_name', '0', 'sys_user_job', 'user_name', '用户名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', '0', '24', null, '4', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('sys_user_job@@PK@@', '0', 'sys_user_job', 'id', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', '0', '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_column` VALUES ('telbook@@@countryzone', '0', 'telbook', 'countryzone', '国家地区', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '8', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_column` VALUES ('telbook@@@email', '0', 'telbook', 'email', '邮箱', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('telbook@@@institid', '0', 'telbook', 'institid', '机构_主键', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, null, null, null, null, null, '2UC000-000003', null, '0', 'N', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_column` VALUES ('telbook@@@office', '0', 'telbook', 'office', '办公室', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '7', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_column` VALUES ('telbook@@@peocode', '0', 'telbook', 'peocode', '编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '100', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('telbook@@@peoname', '0', 'telbook', 'peoname', '名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'N', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('telbook@@@sex', '0', 'telbook', 'sex', '性别', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_column` VALUES ('telbook@@@tel', '0', 'telbook', 'tel', '电话', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '6', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_column` VALUES ('telbook@@@worktel', '0', 'telbook', 'worktel', '工作电话', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '100', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('telbook@@PK@@', '0', 'telbook', 'id', 'id', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:56', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@brithdate', '0', 'userpsn', 'brithdate', '出生日期', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@defitem1', '0', 'userpsn', 'defitem1', '自定义项1', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '13', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@defitem2', '0', 'userpsn', 'defitem2', '自定义项2', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '14', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@defitem3', '0', 'userpsn', 'defitem3', '自定义项3', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '15', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@defitem4', '0', 'userpsn', 'defitem4', '自定义项4', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '16', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@defitem5', '0', 'userpsn', 'defitem5', '自定义项5', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '17', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@edution', '0', 'userpsn', 'edution', '学历', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '7', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@email', '0', 'userpsn', 'email', '邮箱', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '5', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@idcard', '0', 'userpsn', 'idcard', '身份证', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@major', '0', 'userpsn', 'major', '专业', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '8', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@photo', '0', 'userpsn', 'photo', '照片', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '12', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@pk_corp', '0', 'userpsn', 'pk_corp', '所属公司', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '10', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@pk_dept', '0', 'userpsn', 'pk_dept', '部门', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '11', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@sex', '0', 'userpsn', 'sex', '性别', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@telphone', '0', 'userpsn', 'telphone', '手机', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '6', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@username', '0', 'userpsn', 'username', '用户名', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_column` VALUES ('userpsn@@@work_date', '0', 'userpsn', 'work_date', '入职时间', null, null, 'Y', 'datetime', 'N', null, null, null, 'Y', null, null, null, '9', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');
INSERT INTO `md_column` VALUES ('userpsn@@PK@@', '0', 'userpsn', 'pk_user', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_column` VALUES ('user_dept@@@deptcode', '0', 'user_dept', 'deptcode', '部门编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_column` VALUES ('user_dept@@@deptname', '0', 'user_dept', 'deptname', '部门名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_column` VALUES ('user_dept@@@fk_id_userdept', '0', 'user_dept', 'fk_id_userdept', 'id_UserDept', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', null, '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_column` VALUES ('user_dept@@@pk_dept', '0', 'user_dept', 'pk_dept', '部门主键', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_column` VALUES ('user_dept@@PK@@', '0', 'user_dept', 'pk_user_dept', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_column` VALUES ('user_role@@@fk_id_userrole', '0', 'user_role', 'fk_id_userrole', '人员信息_主键', null, null, 'Y', 'char', 'N', null, null, null, 'N', '0', '36', null, null, null, null, null, null, '2UC000-000003', null, '0', 'N', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_column` VALUES ('user_role@@@pk_role', '0', 'user_role', 'pk_role', '角色主键', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '36', '*~', '1', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_column` VALUES ('user_role@@@rolecode', '0', 'user_role', 'rolecode', '角色编码', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '2', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_column` VALUES ('user_role@@@rolename', '0', 'user_role', 'rolename', '角色名称', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '3', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_column` VALUES ('user_role@@@roletype', '0', 'user_role', 'roletype', '角色类型', null, null, 'Y', 'varchar', 'N', null, null, null, 'Y', null, '50', null, '4', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_column` VALUES ('user_role@@PK@@', '0', 'user_role', 'pk_user_role', '主键', null, null, 'Y', 'char', 'Y', null, null, null, 'N', null, '36', null, '0', null, null, null, null, null, null, '0', 'N', null, '2017-04-01 10:44:46', '0');

-- ----------------------------
-- Table structure for md_component
-- ----------------------------
DROP TABLE IF EXISTS `md_component`;
CREATE TABLE `md_component` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `namespace` varchar(512) default NULL,
  `ownmodule` varchar(50) default NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `creator` varchar(30) default NULL,
  `modifier` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `version` varchar(512) default NULL,
  `resmodule` varchar(90) default NULL,
  `resid` varchar(90) default NULL,
  `preload` char(1) default NULL,
  `isbizmodel` char(1) default NULL,
  `fromsourcebmf` char(1) default NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_component
-- ----------------------------
INSERT INTO `md_component` VALUES ('0f1d958f-39a5-41f8-b977-551f360f40a3', '0', 'metadata', 'metadata', 'userManagement', 'userManagement', null, null, null, null, '2016-11-08 09:18:02', '2016-12-14 13:56:23', '78', 'userManagement', null, null, 'N', 'Y', '0', null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_component` VALUES ('168ffa92-56c5-4c60-a7d8-3cf0b7f4734b', '0', 'metadata', 'metadata', 'sys_dict_type', 'sys_dict_type', null, null, null, null, '2016-12-12 15:28:28', '2016-12-13 10:51:25', '11', 'sys_dict_type', null, null, 'N', 'Y', '0', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_component` VALUES ('2ffbee6a-001e-4459-a7ba-8f14e45a41b8', '0', 'metadata', 'metadata', 'cardtable', 'cardtable', null, null, null, null, '2016-12-12 15:03:21', '2016-12-13 14:57:55', '13', 'cardtable', null, null, 'N', 'Y', '0', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_component` VALUES ('65579d3f-110c-4fdf-8d0b-63ba24007a3d', '0', 'metadata', 'metadata', 'address', 'address', null, null, null, null, '2016-12-13 13:12:19', '2016-12-14 09:58:47', '14', 'address', null, null, 'N', 'Y', '0', null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_component` VALUES ('76e76a74-c7dc-4238-8144-bb41b1a96555', '0', 'tepoc', 'tepoc', 'role', 'role', null, null, null, null, '2017-03-31 14:55:22', '2017-03-31 14:55:25', '1', 'role', null, null, 'N', 'Y', '0', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_component` VALUES ('7ab0a8fc-d04b-4ac5-811d-5d19fa67c174', '0', 'uap', 'metadata', 'countryzone', '国家地区', null, null, null, null, '2016-11-16 11:11:12', '2016-12-13 14:57:32', '41', 'countryzone', null, null, 'N', 'Y', '0', null, '2017-04-01 10:44:33', '0');
INSERT INTO `md_component` VALUES ('826d67d7-1f2b-410e-be95-5a681308c2b1', '0', 'tepoc', 'tepoc', 'user_dept', 'user_dept', null, null, null, null, '2017-03-31 16:21:23', '2017-03-31 20:37:42', '4', 'user_dept', null, null, 'N', 'Y', '0', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_component` VALUES ('a6095921-3f9c-4a5e-9f50-b5a841300bb4', '0', 'tepoc', 'tepoc', 'userpsn', 'userpsn', null, null, null, null, '2017-03-31 11:26:39', '2017-04-01 10:44:24', '16', 'userpsn', null, null, 'N', 'Y', '0', null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_component` VALUES ('a787718a-39a5-42c3-acf3-f9bf5ce3d8d6', '0', 'metadata', 'metadata', 'dept', '部门', null, null, null, null, '2016-11-16 10:53:19', '2016-12-13 11:15:25', '41', 'dept', null, null, 'N', 'Y', '0', null, '2017-04-01 10:45:47', '0');
INSERT INTO `md_component` VALUES ('aa1e1c21-6241-4134-a71a-05624e14140f', '0', 'uap', 'baseapp', 'public', 'public', null, null, null, null, '2008-02-20 13:38:20', '2016-11-16 15:18:32', '24', 'public', null, null, 'N', 'Y', '0', null, '2017-04-01 10:45:00', '0');
INSERT INTO `md_component` VALUES ('f7adbc5a-fc68-40bb-a18c-3a7fc4dbd606', '0', 'metadata', 'metadata', 'org', '组织', null, null, null, null, '2016-11-07 13:23:42', '2016-12-13 11:15:02', '26', 'org', null, null, 'N', 'Y', '0', null, '2017-04-01 22:17:55', '0');

-- ----------------------------
-- Table structure for md_comp_busimodule
-- ----------------------------
DROP TABLE IF EXISTS `md_comp_busimodule`;
CREATE TABLE `md_comp_busimodule` (
  `componentid` varchar(50) NOT NULL,
  `busimodulecode` varchar(50) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_comp_busimodule
-- ----------------------------

-- ----------------------------
-- Table structure for md_db
-- ----------------------------
DROP TABLE IF EXISTS `md_db`;
CREATE TABLE `md_db` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `isactive` char(1) NOT NULL,
  `modifytime` char(19) default NULL,
  `createtime` char(19) default NULL,
  `modifier` varchar(30) default NULL,
  `creator` varchar(30) default NULL,
  `resid` varchar(90) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_db
-- ----------------------------

-- ----------------------------
-- Table structure for md_db_relation
-- ----------------------------
DROP TABLE IF EXISTS `md_db_relation`;
CREATE TABLE `md_db_relation` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(90) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `starttableid` varchar(50) NOT NULL,
  `startfieldid` varchar(50) NOT NULL,
  `startattrid` varchar(50) default NULL,
  `startcardinality` varchar(10) default NULL,
  `endtableid` varchar(50) NOT NULL,
  `endfieldid` varchar(50) NOT NULL,
  `endcardinality` varchar(10) default NULL,
  `asstype` smallint(6) default NULL,
  `creator` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifier` varchar(30) default NULL,
  `modifytime` char(19) default NULL,
  `resid` varchar(90) default NULL,
  `isforeignkey` char(1) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_db_relation
-- ----------------------------
INSERT INTO `md_db_relation` VALUES ('4651e096-6737-4d1b-a259-0e37abde394d', '0', 'user_role->userpsn', 'user_role->userpsn', null, null, 'user_role', 'user_role@@@fk_id_userrole', '9e15a310-18b4-4e01-84fe-0c710391dcf8', null, 'userpsn', 'userpsn@@PK@@', null, '1', null, null, null, null, null, 'Y', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_db_relation` VALUES ('49151871-674a-472e-8d87-114c38a6e748', '0', 'telbook->instit', 'telbook->instit', null, null, 'telbook', 'telbook@@@institid', '1462bbcc-84be-46df-bde4-03037203216b', null, 'instit', 'instit@@PK@@', null, '1', null, null, null, null, null, 'Y', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_db_relation` VALUES ('9a26ddb6-a41b-4ce6-9283-957305fb36f1', '0', 'sys_user_job->sys_user', 'sys_user_job->sys_user', null, null, 'sys_user_job', 'sys_user_job@@@fk_id_sys_user_job', '61c291c3-506c-4673-81da-b1e718e56fbc', null, 'sys_user', 'sys_user@@PK@@', null, '1', null, null, null, null, null, 'Y', null, '2016-12-15 09:49:07', '0');

-- ----------------------------
-- Table structure for md_enumvalue
-- ----------------------------
DROP TABLE IF EXISTS `md_enumvalue`;
CREATE TABLE `md_enumvalue` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `value` varchar(128) NOT NULL,
  `name` varchar(512) default NULL,
  `description` varchar(512) default NULL,
  `resid` varchar(90) default NULL,
  `enumsequence` smallint(6) default NULL,
  `hidden` char(1) default NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`,`value`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_enumvalue
-- ----------------------------
INSERT INTO `md_enumvalue` VALUES ('4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '0', '0', '普通部门', null, null, '0', 'N', '0', null, '2017-04-01 10:45:47', '0');
INSERT INTO `md_enumvalue` VALUES ('4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '0', '1', '虚拟部门', null, null, '1', 'N', '0', null, '2017-04-01 10:45:47', '0');
INSERT INTO `md_enumvalue` VALUES ('90c3c346-8efe-4e48-b892-23e7b2d5f096', '0', '0', '男', null, null, '0', 'N', '0', null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_enumvalue` VALUES ('90c3c346-8efe-4e48-b892-23e7b2d5f096', '0', '1', '女', null, null, '1', 'N', '0', null, '2017-04-01 10:44:54', '0');

-- ----------------------------
-- Table structure for md_module
-- ----------------------------
DROP TABLE IF EXISTS `md_module`;
CREATE TABLE `md_module` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `parentmoduleid` varchar(50) default NULL,
  `isactive` char(1) default NULL,
  `creator` varchar(30) default NULL,
  `modifier` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `resid` varchar(90) default NULL,
  `resmodule` varchar(90) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_module
-- ----------------------------
INSERT INTO `md_module` VALUES ('baseapp', '0', 'baseapp', 'baseapp', null, null, null, null, null, null, null, null, null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_module` VALUES ('iuaptraincrm', '0', 'iuaptraincrm', 'iuaptraincrm', null, null, null, null, null, null, null, null, null, null, null, '2017-03-31 14:34:00', '0');
INSERT INTO `md_module` VALUES ('metadata', '0', 'metadata', 'metadata', null, null, null, null, null, null, null, null, null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_module` VALUES ('tepoc', '0', 'tepoc', 'tepoc', null, null, null, null, null, null, null, null, null, null, null, '2017-03-31 14:38:40', '0');

-- ----------------------------
-- Table structure for md_opinterface
-- ----------------------------
DROP TABLE IF EXISTS `md_opinterface`;
CREATE TABLE `md_opinterface` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `parentid` varchar(50) default NULL,
  `componentid` varchar(50) NOT NULL,
  `fullclassname` varchar(256) default NULL,
  `isservice` char(1) default NULL,
  `visibility` smallint(6) default NULL,
  `remote` char(1) default NULL,
  `singleton` char(1) default NULL,
  `creator` varchar(30) default NULL,
  `modifier` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `implstrategy` varchar(256) default NULL,
  `resid` varchar(90) default NULL,
  `authorizable` char(1) default NULL,
  `ownertype` varchar(50) default NULL,
  `defaultimplclassname` varchar(256) default NULL,
  `isbusioperation` char(1) default NULL,
  `isbusiactivity` char(1) default NULL,
  `industry` varchar(50) NOT NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_opinterface
-- ----------------------------

-- ----------------------------
-- Table structure for md_ormap
-- ----------------------------
DROP TABLE IF EXISTS `md_ormap`;
CREATE TABLE `md_ormap` (
  `classid` varchar(50) NOT NULL,
  `attributeid` varchar(50) NOT NULL,
  `tableid` varchar(50) NOT NULL,
  `columnid` varchar(50) NOT NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`attributeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_ormap
-- ----------------------------
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '0014e7e6-562a-43c5-b4e8-c9e364b0d8d8', 'userpsn', 'userpsn@@@major', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '0059ad75-9454-44df-ac06-cb1b7c28dc33', 'sys_user', 'sys_user@@@user_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '01a74741-fa52-477a-a58e-5565db36de0b', 'sys_user', 'sys_user@@PK@@', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '03fd3103-1d97-43ea-a122-9e0cc1196359', 'dept', 'dept@@PK@@', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '064841b3-cd0c-4194-a810-5a0936993b74', 'bd_countryzone', 'bd_countryzone@@@creator', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '073683a2-12c5-4fc2-9008-be234c27c43f', 'sys_user_job', 'sys_user_job@@@org_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '07a56fb1-3a38-4ed8-a059-5b8701b59491', 'sys_user_job', 'sys_user_job@@@modifier', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '092c94ba-807f-471c-9507-ef8f995fb602', 'cardTableMeta', 'cardTableMeta@@@name', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '0c102a47-833e-4081-93f2-75992450e344', 'sys_user_job', 'sys_user_job@@@is_default', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '0e1332c0-7048-4ba2-b411-77c925f87476', 'sys_user', 'sys_user@@@image_url', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1462bbcc-84be-46df-bde4-03037203216b', 'telbook', 'telbook@@@institid', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', '15957a32-b10e-40a9-8055-b39c381a5e41', 'user_dept', 'user_dept@@@fk_id_userdept', null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '15c7b85a-c745-4c67-b4c9-cb6cb0636aee', 'dept', 'dept@@@org_id', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '16df9de7-2ac7-4458-a95d-185619fe66a4', 'telbook', 'telbook@@@countryzone', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '178ef85b-3293-4c91-81f2-ed02c8db707d', 'sys_dict_type_meta', 'sys_dict_type_meta@@@modifier', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '18c04349-b4a0-47b6-985d-01bd42447ab5', 'sys_user', 'sys_user@@@level_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '199d907a-f6c3-4143-82ec-3b4a1d49d35d', 'bd_countryzone', 'bd_countryzone@@@modifier', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '1a90d15e-9500-41e8-a105-2bb953dfd41e', 'sys_user', 'sys_user@@@sex_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '1b1d0fdd-ece0-40ca-8702-133a6c6f99f4', 'instit', 'instit@@@email', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '1bd9c911-de4f-447b-8174-7b1cf7b99bc9', 'sys_user', 'sys_user@@@platform_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '1d2bf6da-8442-45f6-9f38-163b8508f7a3', 'dept', 'dept@@@dept_code', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '200f3add-1a8b-4070-a4ea-95e417d84632', 'userpsn', 'userpsn@@@edution', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '21d10890-c10e-4fb8-84eb-5a52b7b837b6', 'telbook', 'telbook@@@peocode', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '229817f7-6810-4f85-ac65-19410cb2fdc5', 'sys_user', 'sys_user@@@modifier', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '24acc470-cfd0-485e-bd68-bc7976f57c46', 'sys_user_job', 'sys_user_job@@@creator', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '25e6baab-befa-4f21-ad8a-02b86447987d', 'sys_user', 'sys_user@@@birthdate', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '2646406c-eacc-4374-82d0-156b3e25a71f', 'userpsn', 'userpsn@@@brithdate', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '2702b115-ae64-471f-a12a-0ffb85d5a61c', 'bd_countryzone', 'bd_countryzone@@@code', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '283224cd-4613-47bc-aee2-021086bcf0e0', 'telbook', 'telbook@@@office', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '28d3a192-3cc9-4d0f-95e1-47f7c059a3f2', 'userpsn', 'userpsn@@@pk_corp', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '296cd7f9-c21d-4245-b0c0-155787f1ed73', 'cardTableMeta', 'cardTableMeta@@@code', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '2acf6d81-abfe-4e69-994e-677077811aaf', 'org', 'org@@@creationtime', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '2b8fdeeb-577c-417d-8e90-627b8fed67e6', 'instit', 'instit@@PK@@', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '2bca9d99-8962-47f0-9c7d-cb5d3a9f87f7', 'sys_user', 'sys_user@@@certificate_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '2c3c1f2b-2c3c-49f9-b7fe-fcff773f4749', 'instit', 'instit@@@parent_id', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '2f019658-5914-47d7-87b0-2f3e07db35bd', 'cardTableMeta', 'cardTableMeta@@@radiodataassociate', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '2faa7a0a-b047-45af-b248-da29b6bf1d03', 'sys_dict_type_meta', 'sys_dict_type_meta@@@creator_id', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '340fde41-7dac-4006-9ad4-ad1115203ee7', 'sys_dict_type_meta', 'sys_dict_type_meta@@@dict_type_name', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '36b393d0-a21b-45cc-914e-7cb595634c6f', 'sys_user', 'sys_user@@@user_code', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '36c98631-8ab2-4128-87db-d399db66441b', 'sys_dict_type_meta', 'sys_dict_type_meta@@@create_time', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '38027b4b-bf97-45d2-a304-605f1de4affd', 'cardTableMeta', 'cardTableMeta@@@tag', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '38254213-08e2-44fe-b99c-4fb2b623dcff', 'sys_user_job', 'sys_user_job@@@modify_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '3910c261-d517-4588-b777-1b9f0e50db50', 'instit', 'instit@@@instit_name', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '3b9daffc-4b2b-43f5-ac61-c300096d535e', 'org', 'org@@@org_name', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '3c7da34b-6479-4050-865e-cba9d2537c10', 'bd_countryzone', 'bd_countryzone@@@pk_lang', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '3c985562-9508-49d3-bac9-c9e4e67c5992', 'sys_user', 'sys_user@@@status_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', '3d4a2c45-4188-4ad8-b756-01a264d35930', 'org', 'org@@@org_code', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '3e4c96c5-dc67-4bbc-bb59-434ad6d24154', 'sys_user', 'sys_user@@@register_date', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '3e5cf1cc-0185-48cd-8ac6-f94ce54b9654', 'sys_user', 'sys_user@@@platform_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '3eb389dd-08bb-4fbc-bbfd-ca7a48330387', 'sys_dict_type_meta', 'sys_dict_type_meta@@@creator', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '40cca0cc-3c5c-433c-88bb-9a3019039677', 'sys_user_job', 'sys_user_job@@@user_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '413caf40-1a42-4299-aba9-753ecd6f2c04', 'userpsn', 'userpsn@@@pk_dept', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '436564d3-0668-41d7-82c2-7d7581eb89c2', 'dept', 'dept@@@createdate', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '43bd6df6-011a-4a2a-ad97-8dfe49777fab', 'sys_dict_type_meta', 'sys_dict_type_meta@@@remark', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '449282ce-da9c-44c3-9f97-75dec757519b', 'bd_countryzone', 'bd_countryzone@@@name', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '45259f0e-2d6e-4fd2-bc56-51a322860eed', 'telbook', 'telbook@@PK@@', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '476aa1bb-79da-4e15-868f-c716ddb8be7d', 'sys_user_job', 'sys_user_job@@@user_job_note', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '4b13d325-c5b3-46c0-a9f3-74cfa74e3c6e', 'sys_user', 'sys_user@@@user_email', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '4b5a5c4d-d097-487b-9e6c-10f2c660c674', 'telbook', 'telbook@@@worktel', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '4bec1d43-498b-4f7d-b4b8-91affdad991b', 'userpsn', 'userpsn@@@work_date', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '4ebc2d73-fbf7-4138-85b9-0138434dae24', 'bd_countryzone', 'bd_countryzone@@@modifiedtime', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('d2c264ee-a7ba-4710-a6d2-359d10b19746', '4fb125f1-033a-4b23-a3a9-5e827c63af2b', 'user_role', 'user_role@@@pk_role', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', '5149419a-1f40-4a75-9452-b720feea9cc3', 'user_dept', 'user_dept@@@deptcode', null, '2017-04-01 10:45:45', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '520f90df-42d4-4d85-888d-e38f915d6adf', 'bd_countryzone', 'bd_countryzone@@@phonecode', null, '2017-04-01 10:44:35', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', '53c25e75-5354-4038-8a22-f33565f01c46', 'telbook', 'telbook@@@email', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '583e4adc-8337-479f-b9fa-3bbef0092d8e', 'sys_user_job', 'sys_user_job@@@modifier_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '58a39057-473f-41c1-b5c3-7ea443f4c21c', 'sys_user', 'sys_user@@@org_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '5b5a6192-7d99-4aa8-aa0a-0d7f2aec57a4', 'sys_user_job', 'sys_user_job@@@is_active', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', '5d917a4c-7880-434f-8717-28fb03687cf8', 'sys_user_job', 'sys_user_job@@@creator_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '6113a3d4-143c-4db7-837d-cdd748dca62b', 'cardTableMeta', 'cardTableMeta@@@createtime', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '61c291c3-506c-4673-81da-b1e718e56fbc', 'sys_user_job', 'sys_user_job@@@fk_id_sys_user_job', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '61f33f2c-802e-4b7a-b5a6-17ad552cd6e3', 'instit', 'instit@@@instit_type', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '636b7e2d-7d10-4dcb-802f-3bd8f3f399de', 'sys_dict_type_meta', 'sys_dict_type_meta@@PK@@', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '6af78e6b-21b5-4c7b-8e93-fd1213644b87', 'sys_user', 'sys_user@@@certificate_code', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '6d90bc4b-a95c-4679-9aee-f38a374403ec', 'sys_user', 'sys_user@@@user_mobile', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '6e476c13-f740-46f0-83bd-19aacd43d6aa', 'sys_dict_type_meta', 'sys_dict_type_meta@@@is_fixed', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '6f22f572-b114-4232-bf91-9671acf008db', 'userpsn', 'userpsn@@@telphone', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '6f826944-0ab2-4cab-b1c5-ef65fbf8720d', 'userpsn', 'userpsn@@@photo', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '739eb675-c24f-4ba9-bef8-7ae7e573c9a5', 'bd_countryzone', 'bd_countryzone@@@pk_timezone', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', '7dc4f139-c0e3-4478-bf1e-f6b0bb7d5fa0', 'bd_countryzone', 'bd_countryzone@@@creationtime', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '7fc16fb0-71ee-4daf-951b-e524a0051bc7', 'sys_user', 'sys_user@@@org_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', '84f91a16-1236-4778-82f8-d4148828249c', 'sys_dict_type_meta', 'sys_dict_type_meta@@@dict_type_code', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', '8a40f0d6-0caa-4040-9e13-e37fa8888089', 'cardTableMeta', 'cardTableMeta@@@gateway', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '8c9097b4-ca4c-4514-83f1-fe2516e0e0b7', 'sys_user', 'sys_user@@@login_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d2c264ee-a7ba-4710-a6d2-359d10b19746', '8ecdcd44-fd12-4667-9cdd-43fe694bb08c', 'user_role', 'user_role@@PK@@', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', '90996160-893d-4539-b3dc-903f3ce34a7f', 'user_dept', 'user_dept@@@pk_dept', null, '2017-04-01 10:45:45', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '91aeb35e-ed3b-408a-ad3b-de0df96bf343', 'instit', 'instit@@@creationtime', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '91f39d67-c929-48df-a463-5662acb72319', 'userpsn', 'userpsn@@@idcard', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '91fa4471-0032-4677-bf2e-f9ec8c82a4c8', 'userpsn', 'userpsn@@@defitem1', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('d2c264ee-a7ba-4710-a6d2-359d10b19746', '93d247bb-a53d-43e3-875f-903caa8a90f4', 'user_role', 'user_role@@@roletype', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', '97a389a7-e8c0-4d0f-9cc3-f1fdfa6ad6e2', 'dept', 'dept@@@dept_type', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '98b3975e-872a-40e4-8496-3c9b965ad609', 'sys_user', 'sys_user@@@creator_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', '98e9364b-abc3-4b10-8b32-89c7d295d21d', 'sys_user', 'sys_user@@@create_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', '9d9824a2-aa0b-4d9c-b775-487240e8fe4b', 'user_dept', 'user_dept@@@deptname', null, '2017-04-01 10:45:45', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', '9e15a310-18b4-4e01-84fe-0c710391dcf8', 'user_role', 'user_role@@@fk_id_userrole', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', 'a38c429f-caeb-413f-8b1f-a3727a75ce4e', 'bd_countryzone', 'bd_countryzone@@PK@@', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'a523ce91-796f-41a7-bf3a-6b4fc752e3fc', 'org', 'org@@@org_type', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'a6776e2c-c998-4b2e-80df-f140cde809a8', 'sys_user', 'sys_user@@@modify_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('d2c264ee-a7ba-4710-a6d2-359d10b19746', 'aa602333-7863-44a0-9ad2-67077f9ecc35', 'user_role', 'user_role@@@rolename', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', 'aff467e2-1d37-47af-8104-2fb9707609d7', 'instit', 'instit@@@short_name', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'b1b3407c-71a9-4944-ac3e-2e4f1f4a03c4', 'dept', 'dept@@@parent_id', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', 'b1f3b2c3-8139-4135-bb4e-4430540404d2', 'instit', 'instit@@@instit_code', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_ormap` VALUES ('d2c264ee-a7ba-4710-a6d2-359d10b19746', 'b46960a8-0de7-47e6-bcc5-843a85b6f26d', 'user_role', 'user_role@@@rolecode', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'b791309c-0acf-4689-81ed-1b9fa2273126', 'dept', 'dept@@@creationtime', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'b9c2a196-8696-41e0-b829-933a1baeeef6', 'org', 'org@@@creator', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'bb182249-9437-4e94-9e78-da9cc1316615', 'userpsn', 'userpsn@@@username', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'bb25fbc1-7528-45e7-801d-ae413fa1e445', 'sys_user', 'sys_user@@@creator', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'bc9aa608-9761-450a-a718-7feaa0df2429', 'org', 'org@@PK@@', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'bdc6bca4-4884-487f-838f-addc10d33f64', 'sys_user', 'sys_user@@@remark', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'bf09b9e3-3857-41e9-aff9-a573c0f3e24c', 'userpsn', 'userpsn@@PK@@', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'c0cf284b-9fe7-4620-bc4b-71eb4afb7a7a', 'sys_user_job', 'sys_user_job@@@create_time', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'c28b13d4-d7ff-4d21-944b-554b02f1e247', 'sys_user', 'sys_user@@@status_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', 'c44a1085-6598-454a-b9e6-f77e7875c119', 'bd_countryzone', 'bd_countryzone@@@description', null, '2017-04-01 10:44:36', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', 'c5ed8edf-5f04-4a5c-9064-59ea26f40299', 'sys_dict_type_meta', 'sys_dict_type_meta@@@modify_time', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'c626af22-65ed-4d02-ac21-9e99ee465a96', 'sys_user_job', 'sys_user_job@@PK@@', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'c80f1798-ce8e-43c4-9cd4-ba2e2c4950d1', 'dept', 'dept@@@deptcanceldate', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'c9bfd39a-4935-460a-8e25-a8e0b3e15670', 'userpsn', 'userpsn@@@defitem5', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', 'c9f8a353-8b13-45c5-b07c-0fe14d90fe42', 'role', 'role@@PK@@', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'cd18aa45-2a2a-4f5f-9e08-87d9ad86ca37', 'userpsn', 'userpsn@@@defitem3', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'cf036002-6ec2-4078-b281-f87bebef7fa9', 'userpsn', 'userpsn@@@email', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', 'd028afd2-12f1-4668-b4ac-fce669edd72e', 'instit', 'instit@@@creator', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', 'd03f50b7-3778-4c16-9bde-5d0b38b4bb61', 'cardTableMeta', 'cardTableMeta@@@combodatamodel', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('d08bf8be-62d0-498d-931b-0d80e49022fb', 'd1bbb871-65d8-417d-ac80-dda7e4237e28', 'sys_dict_type_meta', 'sys_dict_type_meta@@@modifier_id', null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'd1c99f13-0e46-458e-94c9-65451b55724e', 'org', 'org@@@short_name', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'd29f3254-56dc-47cf-81a4-513c9923bb1e', 'sys_user', 'sys_user@@@level_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'd5d9c875-0578-4c85-a1cd-c0c2b7f7de90', 'sys_user', 'sys_user@@@user_password', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'd7d799c4-4c78-494a-bcb9-71a3a1b73622', 'userpsn', 'userpsn@@@sex', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', 'dba22392-42c5-4cd8-a203-6eaa3bd9d292', 'telbook', 'telbook@@@tel', null, '2017-04-01 10:44:58', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'dbcb31c7-fb04-41d9-ae97-0e100dc3a6c4', 'org', 'org@@@email', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', 'de3cb9bb-064c-4efb-b7a1-00aab49828a0', 'user_dept', 'user_dept@@PK@@', null, '2017-04-01 10:45:45', '0');
INSERT INTO `md_ormap` VALUES ('8254a6a2-5933-422e-b4bb-f13d1d22108a', 'de44d0af-7538-41dd-8efd-a5b11940ba25', 'org', 'org@@@parent_id', null, '2017-04-01 22:17:56', '0');
INSERT INTO `md_ormap` VALUES ('f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', 'dee7230d-4d8f-4c0d-9c83-25ebc7bc8272', 'role', 'role@@@rolename', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_ormap` VALUES ('f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', 'e0035917-bff5-4ab9-a277-89b2f4ed589a', 'role', 'role@@@roletype', null, '2017-04-01 22:19:09', '0');
INSERT INTO `md_ormap` VALUES ('f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', 'e328a0a7-5d12-4b9c-a322-687f60b875d2', 'role', 'role@@@rolecode', null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'e45cb75f-a4f8-4b8e-a64e-15dc61333510', 'sys_user', 'sys_user@@@certificate_name', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'e4f79765-f9b9-45c2-b3cc-420d67d16687', 'sys_user_job', 'sys_user_job@@@user_name', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', 'e62f95a0-0b1e-4438-8a65-64b965bac29c', 'telbook', 'telbook@@@sex', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_ormap` VALUES ('af352b2f-4281-4f55-92e5-fdd095bbdff5', 'eae1d63c-46e4-4823-af45-81e75002e245', 'sys_user', 'sys_user@@@modifier_id', null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'ec5951cc-4b3e-41d3-a357-fb0a1070d3f7', 'userpsn', 'userpsn@@@defitem4', null, '2017-04-01 10:44:48', '0');
INSERT INTO `md_ormap` VALUES ('1d0864c9-241a-4fc2-940d-2a80e474cb33', 'ed15eb8c-e36d-437d-a0e8-6423ee303076', 'userpsn', 'userpsn@@@defitem2', null, '2017-04-01 10:44:47', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'ef571efd-9627-48c9-b603-a53f022e4fac', 'dept', 'dept@@@short_name', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('4bdf8034-83f4-48d4-8e2c-04aca3693586', 'f1b5fae8-796c-4c5e-a834-0aca9f5f6fe8', 'telbook', 'telbook@@@peoname', null, '2017-04-01 10:44:57', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', 'f1c3dfb6-2d26-4f85-8173-efa3a1a412be', 'cardTableMeta', 'cardTableMeta@@PK@@', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('4392297d-3430-4433-ba48-55266005bcc2', 'f23af737-d7fa-4e57-bbce-88273ee6a01f', 'cardTableMeta', 'cardTableMeta@@@radiodatacontroller', null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'f3af0453-4899-43de-8f12-a22d64d2dd64', 'dept', 'dept@@@dept_name', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('17ffb644-c70c-48de-a47f-c5b53f75460f', 'f462f724-4591-45a5-9a38-6394b565be21', 'dept', 'dept@@@creator', null, '2017-04-01 10:45:49', '0');
INSERT INTO `md_ormap` VALUES ('e37eed0f-507c-4c84-92f5-7c83644844f8', 'f564d08b-04d2-49d2-8c44-dafa11ec758b', 'sys_user_job', 'sys_user_job@@@dept_id', null, '2016-12-15 09:49:07', '0');
INSERT INTO `md_ormap` VALUES ('08ffeabe-e01d-4072-a4c3-025345386ebb', 'f5b4da25-a7ed-40bb-84a5-caecc57de577', 'bd_countryzone', 'bd_countryzone@@@wholename', null, '2017-04-01 10:44:36', '0');

-- ----------------------------
-- Table structure for md_parameter
-- ----------------------------
DROP TABLE IF EXISTS `md_parameter`;
CREATE TABLE `md_parameter` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `operationid` varchar(50) default NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `datatype` varchar(50) NOT NULL,
  `datatypestyle` smallint(6) NOT NULL,
  `parasequence` smallint(6) NOT NULL,
  `modifier` varchar(30) default NULL,
  `creator` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `resid` varchar(90) default NULL,
  `paramdefclassname` varchar(50) default NULL,
  `isaggvo` char(1) default NULL,
  `paramtypeforlog` varchar(10) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for md_property
-- ----------------------------
DROP TABLE IF EXISTS `md_property`;
CREATE TABLE `md_property` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(90) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `classid` varchar(50) default NULL,
  `defaultvalue` varchar(512) default NULL,
  `attrminvalue` varchar(50) default NULL,
  `attrmaxvalue` varchar(50) default NULL,
  `fixedlength` char(1) default NULL,
  `attrlength` smallint(6) default NULL,
  `precise` smallint(6) default NULL,
  `datatype` varchar(50) default NULL,
  `datatypestyle` smallint(6) default NULL,
  `nullable` char(1) default NULL,
  `customattr` char(1) default NULL,
  `calculation` char(1) default NULL,
  `readonly` char(1) default NULL,
  `visibility` smallint(6) default NULL,
  `accessorclassname` varchar(256) default NULL,
  `attrsequence` smallint(6) default NULL,
  `hided` char(1) default NULL,
  `refmodelname` varchar(256) default NULL,
  `isactive` char(1) default NULL,
  `creator` varchar(30) default NULL,
  `modifier` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `isauthen` char(1) default NULL,
  `resid` varchar(90) default NULL,
  `dynamicattr` char(1) default NULL,
  `notserialize` char(1) default NULL,
  `accesspower` char(1) default NULL,
  `accesspowergroup` varchar(256) default NULL,
  `industry` varchar(50) NOT NULL,
  `createindustry` varchar(50) default NULL,
  `tenantid` varchar(50) default NULL,
  `dynamictable` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`,`versiontype`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_property
-- ----------------------------
INSERT INTO `md_property` VALUES ('0014e7e6-562a-43c5-b4e8-c9e364b0d8d8', '0', 'major', '专业', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('0059ad75-9454-44df-ac06-cb1b7c28dc33', '0', 'username', '用户名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('01a74741-fa52-477a-a58e-5565db36de0b', '0', 'id', '主键', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('03fd3103-1d97-43ea-a122-9e0cc1196359', '0', 'pk_dept', '部门主键', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:47', '0');
INSERT INTO `md_property` VALUES ('064841b3-cd0c-4194-a810-5a0936993b74', '0', 'creator', '创建人', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_property` VALUES ('073683a2-12c5-4fc2-9008-be234c27c43f', '0', 'orgid', '组织ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '36', '0', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('07a56fb1-3a38-4ed8-a059-5b8701b59491', '0', 'modifier', '修改人', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '12', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('092c94ba-807f-471c-9507-ef8f995fb602', '0', 'name', '系统名称', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('0c102a47-833e-4081-93f2-75992450e344', '0', 'isdefault', '是否默认职责', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('0e1332c0-7048-4ba2-b411-77c925f87476', '0', 'imageurl', '电子印章图片地址或头像', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '19', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('1462bbcc-84be-46df-bde4-03037203216b', '0', 'fktelbook', 'fkTelbook', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '36', null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', '302', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('15957a32-b10e-40a9-8055-b39c381a5e41', '0', 'fk_id_userdept', 'id_UserDept', null, null, 'a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', null, null, null, 'N', '36', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_property` VALUES ('15c7b85a-c745-4c67-b4c9-cb6cb0636aee', '0', 'orgid', '组织ID', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:47', '0');
INSERT INTO `md_property` VALUES ('16df9de7-2ac7-4458-a95d-185619fe66a4', '0', 'countryzone', '国家地区', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '36', null, '08ffeabe-e01d-4072-a4c3-025345386ebb', '305', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('178ef85b-3293-4c91-81f2-ed02c8db707d', '0', 'modifier', '修改人', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('18c04349-b4a0-47b6-985d-01bd42447ab5', '0', 'levelname', '用户级别名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '18', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('199d907a-f6c3-4143-82ec-3b4a1d49d35d', '0', 'modifier', '最后修改人', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_property` VALUES ('1a90d15e-9500-41e8-a105-2bb953dfd41e', '0', 'sexid', '性别ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '50', '0', '90c3c346-8efe-4e48-b892-23e7b2d5f096', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('1b1d0fdd-ece0-40ca-8702-133a6c6f99f4', '0', 'email', '邮箱', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_property` VALUES ('1bd9c911-de4f-447b-8174-7b1cf7b99bc9', '0', 'platformname', '所属平台名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '16', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('1d2bf6da-8442-45f6-9f38-163b8508f7a3', '0', 'deptcode', '编码', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '40', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('200f3add-1a8b-4070-a4ea-95e417d84632', '0', 'edution', '学历', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('21d10890-c10e-4fb8-84eb-5a52b7b837b6', '0', 'peocode', '编码', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('229817f7-6810-4f85-ac65-19410cb2fdc5', '0', 'modifier', '修改人', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '27', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('24acc470-cfd0-485e-bd68-bc7976f57c46', '0', 'creator', '创建人', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('25e6baab-befa-4f21-ad8a-02b86447987d', '0', 'birthdate', '出生日期', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001033', '300', 'Y', 'N', 'N', 'N', '0', null, '13', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('2646406c-eacc-4374-82d0-156b3e25a71f', '0', 'brithdate', '出生日期', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('2702b115-ae64-471f-a12a-0ffb85d5a61c', '0', 'code', '编码', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '40', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:33', '0');
INSERT INTO `md_property` VALUES ('283224cd-4613-47bc-aee2-021086bcf0e0', '0', 'office', '办公室', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('28d3a192-3cc9-4d0f-95e1-47f7c059a3f2', '0', 'pk_corp', '所属公司', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '36', null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('296cd7f9-c21d-4245-b0c0-155787f1ed73', '0', 'code', '系统编码', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('2acf6d81-abfe-4e69-994e-677077811aaf', '0', 'creationtime', '创建时间', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('2b8fdeeb-577c-417d-8e90-627b8fed67e6', '0', 'institid', '主键', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_property` VALUES ('2bca9d99-8962-47f0-9c7d-cb5d3a9f87f7', '0', 'certificateid', '证件类型ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('2c3c1f2b-2c3c-49f9-b7fe-fcff773f4749', '0', 'parentid', '上级ID', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '36', null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', '305', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('2f019658-5914-47d7-87b0-2f3e07db35bd', '0', 'radiodataassociate', '用户自关联', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('2faa7a0a-b047-45af-b248-da29b6bf1d03', '0', 'creatorid', '创建人ID', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('340fde41-7dac-4006-9ad4-ad1115203ee7', '0', 'dicttypename', '名称', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('36b393d0-a21b-45cc-914e-7cb595634c6f', '0', 'usercode', '用户编码', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '32', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('36c98631-8ab2-4128-87db-d399db66441b', '0', 'createtime', '创建时间', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('38027b4b-bf97-45d2-a304-605f1de4affd', '0', 'tag', 'tag', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('38254213-08e2-44fe-b99c-4fb2b623dcff', '0', 'modifytime', '修改时间', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '13', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3910c261-d517-4588-b777-1b9f0e50db50', '0', 'institname', '名称', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_property` VALUES ('3b9daffc-4b2b-43f5-ac61-c300096d535e', '0', 'orgname', '名称', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('3c7da34b-6479-4050-865e-cba9d2537c10', '0', 'pklang', '语种', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_property` VALUES ('3c985562-9508-49d3-bac9-c9e4e67c5992', '0', 'statusid', '状态ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '20', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3d4a2c45-4188-4ad8-b756-01a264d35930', '0', 'orgcode', '编码', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('3e4c96c5-dc67-4bbc-bb59-434ad6d24154', '0', 'registerdate', '系统注册日期', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '14', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3e5cf1cc-0185-48cd-8ac6-f94ce54b9654', '0', 'platformid', '所属平台ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '15', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('3eb389dd-08bb-4fbc-bbfd-ca7a48330387', '0', 'creator', '创建人', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('40cca0cc-3c5c-433c-88bb-9a3019039677', '0', 'userid', '用户ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('413caf40-1a42-4299-aba9-753ecd6f2c04', '0', 'pk_dept', '部门', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '36', null, '17ffb644-c70c-48de-a47f-c5b53f75460f', '305', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('436564d3-0668-41d7-82c2-7d7581eb89c2', '0', 'createdate', '部门成立时间', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('43bd6df6-011a-4a2a-ad97-8dfe49777fab', '0', 'remark', '评论', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '512', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('449282ce-da9c-44c3-9f97-75dec757519b', '0', 'name', '名称', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:33', '0');
INSERT INTO `md_property` VALUES ('45259f0e-2d6e-4fd2-bc56-51a322860eed', '0', 'id', 'id', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('476aa1bb-79da-4e15-868f-c716ddb8be7d', '0', 'userjobnote', '说明', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '256', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('4b13d325-c5b3-46c0-a9f3-74cfa74e3c6e', '0', 'useremail', '用户邮件', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('4b5a5c4d-d097-487b-9e6c-10f2c660c674', '0', 'worktel', '工作电话', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('4bec1d43-498b-4f7d-b4b8-91affdad991b', '0', 'work_date', '入职时间', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('4ebc2d73-fbf7-4138-85b9-0138434dae24', '0', 'modifiedtime', '最后修改时间', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_property` VALUES ('4fb125f1-033a-4b23-a3a9-5e827c63af2b', '0', 'pk_role', '角色主键', null, null, 'd2c264ee-a7ba-4710-a6d2-359d10b19746', null, null, null, 'N', '36', null, 'f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', '305', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_property` VALUES ('5149419a-1f40-4a75-9452-b720feea9cc3', '0', 'deptcode', '部门编码', null, null, 'a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_property` VALUES ('520f90df-42d4-4d85-888d-e38f915d6adf', '0', 'phonecode', '电话代码', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '20', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:33', '0');
INSERT INTO `md_property` VALUES ('53c25e75-5354-4038-8a22-f33565f01c46', '0', 'email', '邮箱', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('583e4adc-8337-479f-b9fa-3bbef0092d8e', '0', 'modifierid', '修改人ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('58a39057-473f-41c1-b5c3-7ea443f4c21c', '0', 'orgname', '所属组织名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('5b5a6192-7d99-4aa8-aa0a-0d7f2aec57a4', '0', 'isactive', '启用状态', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('5d917a4c-7880-434f-8717-28fb03687cf8', '0', 'creatorid', '创建人ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('5dd3c721-22ad-42b1-9c10-4351c236bc77', '0', 'id', 'id', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, 'N', null, null, null, null, 'Y', null, 'N', 'Y', 'N', null, '0', null, null, null, '2017-04-01 10:45:00', '0');
INSERT INTO `md_property` VALUES ('6113a3d4-143c-4db7-837d-cdd748dca62b', '0', 'createtime', '创建时间', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('61c291c3-506c-4673-81da-b1e718e56fbc', '0', 'idsysuserjob', 'idSysUserJob', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '36', '0', 'e37eed0f-507c-4c84-92f5-7c83644844f8', '302', 'Y', 'N', 'N', 'N', '0', null, '29', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('61f33f2c-802e-4b7a-b5a6-17ad552cd6e3', '0', 'instittype', '类型', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '10', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_property` VALUES ('636b7e2d-7d10-4dcb-802f-3bd8f3f399de', '0', 'dictid', '主键', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('6af78e6b-21b5-4c7b-8e93-fd1213644b87', '0', 'certificatecode', '证件号码', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '32', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '12', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('6d90bc4b-a95c-4679-9aee-f38a374403ec', '0', 'usermobile', '用户手机号', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('6e476c13-f740-46f0-83bd-19aacd43d6aa', '0', 'isfixed', '系统预制', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('6f22f572-b114-4232-bf91-9671acf008db', '0', 'telphone', '手机', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('6f826944-0ab2-4cab-b1c5-ef65fbf8720d', '0', 'photo', '照片', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '12', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('739eb675-c24f-4ba9-bef8-7ae7e573c9a5', '0', 'pktimezone', '时区', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '20', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_property` VALUES ('7dc4f139-c0e3-4478-bf1e-f6b0bb7d5fa0', '0', 'creationtime', '创建时间', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_property` VALUES ('7fc16fb0-71ee-4daf-951b-e524a0051bc7', '0', 'orgid', '所属组织ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '36', '0', '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('84f91a16-1236-4778-82f8-d4148828249c', '0', 'dicttypecode', '编码', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '100', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('89578a97-42fe-439b-827c-8eabd9e3604c', '0', 'name', 'name', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, 'N', null, null, null, null, 'Y', null, 'N', 'Y', 'N', null, '0', null, null, null, '2017-04-01 10:45:00', '0');
INSERT INTO `md_property` VALUES ('8a40f0d6-0caa-4040-9e13-e37fa8888089', '0', 'gateway', '网管地址', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('8c9097b4-ca4c-4514-83f1-fe2516e0e0b7', '0', 'loginname', '登录名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('8ecdcd44-fd12-4667-9cdd-43fe694bb08c', '0', 'pk_user_role', '主键', null, null, 'd2c264ee-a7ba-4710-a6d2-359d10b19746', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_property` VALUES ('90996160-893d-4539-b3dc-903f3ce34a7f', '0', 'pk_dept', '部门主键', null, null, 'a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', null, null, null, 'N', '36', null, '17ffb644-c70c-48de-a47f-c5b53f75460f', '305', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_property` VALUES ('91aeb35e-ed3b-408a-ad3b-de0df96bf343', '0', 'creationtime', '创建时间', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('91f39d67-c929-48df-a463-5662acb72319', '0', 'idcard', '身份证', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('91fa4471-0032-4677-bf2e-f9ec8c82a4c8', '0', 'defitem1', '自定义项1', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '13', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('93d247bb-a53d-43e3-875f-903caa8a90f4', '0', 'roletype', '角色类型', null, null, 'd2c264ee-a7ba-4710-a6d2-359d10b19746', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_property` VALUES ('97a389a7-e8c0-4d0f-9cc3-f1fdfa6ad6e2', '0', 'depttype', '部门类型', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '20', null, '4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('98b3975e-872a-40e4-8496-3c9b965ad609', '0', 'creatorid', '创建人ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '23', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('98e9364b-abc3-4b10-8b32-89c7d295d21d', '0', 'createtime', '创建时间', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '25', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('9d9824a2-aa0b-4d9c-b775-487240e8fe4b', '0', 'deptname', '部门名称', null, null, 'a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_property` VALUES ('9e15a310-18b4-4e01-84fe-0c710391dcf8', '0', 'id_userrole', 'id_UserRole', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '36', null, 'd2c264ee-a7ba-4710-a6d2-359d10b19746', '302', 'Y', 'N', 'N', 'N', '0', null, '18', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_property` VALUES ('a38c429f-caeb-413f-8b1f-a3727a75ce4e', '0', 'pkcountry', '主键', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:33', '0');
INSERT INTO `md_property` VALUES ('a523ce91-796f-41a7-bf3a-6b4fc752e3fc', '0', 'orgtype', '类型', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '10', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('a6776e2c-c998-4b2e-80df-f140cde809a8', '0', 'modifytime', '修改时间', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '28', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('aa602333-7863-44a0-9ad2-67077f9ecc35', '0', 'rolename', '角色名称', null, null, 'd2c264ee-a7ba-4710-a6d2-359d10b19746', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_property` VALUES ('aff467e2-1d37-47af-8104-2fb9707609d7', '0', 'shortname', '简称', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_property` VALUES ('b1b3407c-71a9-4944-ac3e-2e4f1f4a03c4', '0', 'parentid', '上级ID', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '36', null, '17ffb644-c70c-48de-a47f-c5b53f75460f', '305', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('b1f3b2c3-8139-4135-bb4e-4430540404d2', '0', 'institcode', '编码', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:54', '0');
INSERT INTO `md_property` VALUES ('b46960a8-0de7-47e6-bcc5-843a85b6f26d', '0', 'rolecode', '角色编码', null, null, 'd2c264ee-a7ba-4710-a6d2-359d10b19746', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_property` VALUES ('b791309c-0acf-4689-81ed-1b9fa2273126', '0', 'creationtime', '创建时间', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '9', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('b9c2a196-8696-41e0-b829-933a1baeeef6', '0', 'creator', '创建人', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '20', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('bb182249-9437-4e94-9e78-da9cc1316615', '0', 'username', '用户名', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('bb25fbc1-7528-45e7-801d-ae413fa1e445', '0', 'creator', '创建人', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '20', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '24', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('bc9aa608-9761-450a-a718-7feaa0df2429', '0', 'orgid', '主键', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('bdc6bca4-4884-487f-838f-addc10d33f64', '0', 'remark', '备注', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '512', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '22', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('bf09b9e3-3857-41e9-aff9-a573c0f3e24c', '0', 'pk_user', '主键', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('c0cf284b-9fe7-4620-bc4b-71eb4afb7a7a', '0', 'createtime', '创建时间', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'N', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('c28b13d4-d7ff-4d21-944b-554b02f1e247', '0', 'statusname', '状态姓名', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '21', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('c44a1085-6598-454a-b9e6-f77e7875c119', '0', 'description', '描述', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:34', '0');
INSERT INTO `md_property` VALUES ('c5ed8edf-5f04-4a5c-9064-59ea26f40299', '0', 'modifytime', '修改时间', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '0', '0', 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('c626af22-65ed-4d02-ac21-9e99ee465a96', '0', 'id', '主键', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('c80f1798-ce8e-43c4-9cd4-ba2e2c4950d1', '0', 'deptcanceldate', '部门撤销日期', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', null, null, 'BS000010000100001034', '300', 'Y', 'N', 'N', 'N', '0', null, '10', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('c8334364-7ab9-4266-8d4b-e74537935e46', '0', 'pid', 'pid', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, 'N', null, null, null, null, 'Y', null, 'N', 'Y', 'N', null, '0', null, null, null, '2017-04-01 10:45:00', '0');
INSERT INTO `md_property` VALUES ('c9bfd39a-4935-460a-8e25-a8e0b3e15670', '0', 'defitem5', '自定义项5', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '17', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:45', '0');
INSERT INTO `md_property` VALUES ('c9f8a353-8b13-45c5-b07c-0fe14d90fe42', '0', 'pk_role', '主键', null, null, 'f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_property` VALUES ('cd18aa45-2a2a-4f5f-9e08-87d9ad86ca37', '0', 'defitem3', '自定义项3', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '15', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('cf036002-6ec2-4078-b281-f87bebef7fa9', '0', 'email', '邮箱', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('d028afd2-12f1-4668-b4ac-fce669edd72e', '0', 'creator', '创建人', null, null, '6578c47e-3b55-4c9f-9c22-a9bfad79d8cb', null, null, null, 'N', '20', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('d03f50b7-3778-4c16-9bde-5d0b38b4bb61', '0', 'combodatamodel', '认证模式', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('d1bbb871-65d8-417d-ac80-dda7e4237e28', '0', 'modifierid', '修改人ID', null, null, 'd08bf8be-62d0-498d-931b-0d80e49022fb', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:38', '0');
INSERT INTO `md_property` VALUES ('d1c99f13-0e46-458e-94c9-65451b55724e', '0', 'shortname', '简称', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('d29f3254-56dc-47cf-81a4-513c9923bb1e', '0', 'levelid', '用户级别ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '1', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '17', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('d32cc17b-f415-415a-923f-0764443eb102', '0', 'code', 'code', null, null, '6c8722b9-911a-489b-8d0d-18bd3734fcf6', null, null, null, 'N', null, '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, null, 'N', null, 'N', null, null, null, null, 'Y', null, 'N', 'Y', 'N', null, '0', null, null, null, '2017-04-01 10:45:00', '0');
INSERT INTO `md_property` VALUES ('d5d9c875-0578-4c85-a1cd-c0c2b7f7de90', '0', 'userpassword', '登录密码', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '64', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:05', '0');
INSERT INTO `md_property` VALUES ('d7d799c4-4c78-494a-bcb9-71a3a1b73622', '0', 'sex', '性别', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, '90c3c346-8efe-4e48-b892-23e7b2d5f096', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('dba22392-42c5-4cd8-a203-6eaa3bd9d292', '0', 'tel', '电话', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '100', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('dbcb31c7-fb04-41d9-ae97-0e100dc3a6c4', '0', 'email', '邮箱', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('de3cb9bb-064c-4efb-b7a1-00aab49828a0', '0', 'pk_user_dept', '主键', null, null, 'a4166dcd-c7f7-4f82-a5cb-6b398f61fa49', null, null, null, 'N', '36', null, 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '0', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:44', '0');
INSERT INTO `md_property` VALUES ('de44d0af-7538-41dd-8efd-a5b11940ba25', '0', 'parentid', '上级ID', null, null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', null, null, null, 'N', '36', null, '8254a6a2-5933-422e-b4bb-f13d1d22108a', '305', 'Y', 'N', 'N', 'N', '0', null, '6', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:17:55', '0');
INSERT INTO `md_property` VALUES ('dee7230d-4d8f-4c0d-9c83-25ebc7bc8272', '0', 'rolename', '角色名称', null, null, 'f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_property` VALUES ('e0035917-bff5-4ab9-a277-89b2f4ed589a', '0', 'roletype', '角色类型', null, null, 'f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_property` VALUES ('e328a0a7-5d12-4b9c-a322-687f60b875d2', '0', 'rolecode', '角色编码', null, null, 'f1e4ed45-c6b7-4bd4-a8ee-847b152124c6', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 22:19:08', '0');
INSERT INTO `md_property` VALUES ('e45cb75f-a4f8-4b8e-a64e-15dc61333510', '0', 'certificatename', '证件类型名称', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '16', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '11', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('e4f79765-f9b9-45c2-b3cc-420d67d16687', '0', 'username', '用户名称', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '24', '0', 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('e62f95a0-0b1e-4438-8a65-64b965bac29c', '0', 'sex', '性别', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '50', null, '90c3c346-8efe-4e48-b892-23e7b2d5f096', '300', 'Y', 'N', 'N', 'N', '0', null, '5', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('eae1d63c-46e4-4823-af45-81e75002e245', '0', 'modifierid', '修改人ID', null, null, 'af352b2f-4281-4f55-92e5-fdd095bbdff5', null, null, null, 'N', '40', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '26', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('ec5951cc-4b3e-41d3-a357-fb0a1070d3f7', '0', 'defitem4', '自定义项4', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '16', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('ed15eb8c-e36d-437d-a0e8-6423ee303076', '0', 'defitem2', '自定义项2', null, null, '1d0864c9-241a-4fc2-940d-2a80e474cb33', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '14', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:44', '0');
INSERT INTO `md_property` VALUES ('ef571efd-9627-48c9-b603-a53f022e4fac', '0', 'shortname', '简称', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '50', null, '4ba9039a-1f79-4d3f-a0e4-3af7a047fcb5', '300', 'Y', 'N', 'N', 'N', '0', null, '7', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('f1b5fae8-796c-4c5e-a834-0aca9f5f6fe8', '0', 'peoname', '名称', null, null, '4bdf8034-83f4-48d4-8e2c-04aca3693586', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'N', 'N', 'N', 'N', '0', null, '1', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:55', '0');
INSERT INTO `md_property` VALUES ('f1c3dfb6-2d26-4f85-8173-efa3a1a412be', '0', 'pksystem', '主键', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '36', '0', 'BS000010000100001051', '300', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('f23af737-d7fa-4e57-bbce-88273ee6a01f', '0', 'radiodatacontroller', '需要授权', null, null, '4392297d-3430-4433-ba48-55266005bcc2', null, null, null, 'N', '50', '0', 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '4', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:48:57', '0');
INSERT INTO `md_property` VALUES ('f3af0453-4899-43de-8f12-a22d64d2dd64', '0', 'deptname', '名称', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '50', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('f462f724-4591-45a5-9a38-6394b565be21', '0', 'creator', '创建人', null, null, '17ffb644-c70c-48de-a47f-c5b53f75460f', null, null, null, 'N', '20', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '8', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:45:48', '0');
INSERT INTO `md_property` VALUES ('f564d08b-04d2-49d2-8c44-dafa11ec758b', '0', 'deptid', '部门ID', null, null, 'e37eed0f-507c-4c84-92f5-7c83644844f8', null, null, null, 'N', '36', '0', '17ffb644-c70c-48de-a47f-c5b53f75460f', '305', 'N', 'N', 'N', 'N', '0', null, '2', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2016-12-15 09:49:06', '0');
INSERT INTO `md_property` VALUES ('f5b4da25-a7ed-40bb-84a5-caecc57de577', '0', 'wholename', '全称', null, null, '08ffeabe-e01d-4072-a4c3-025345386ebb', null, null, null, 'N', '200', null, 'BS000010000100001001', '300', 'Y', 'N', 'N', 'N', '0', null, '3', 'N', null, 'Y', null, null, null, null, 'Y', null, 'N', 'N', 'N', null, '0', null, null, null, '2017-04-01 10:44:33', '0');

-- ----------------------------
-- Table structure for md_sysmoduleconfig
-- ----------------------------
DROP TABLE IF EXISTS `md_sysmoduleconfig`;
CREATE TABLE `md_sysmoduleconfig` (
  `tablename` varchar(50) default NULL,
  `codefield` varchar(50) default NULL,
  `namefield` varchar(50) default NULL,
  `resmodulefield` varchar(50) default NULL,
  `resmodulevalue` varchar(50) default NULL,
  `residfield` varchar(50) default NULL,
  `tenantid` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_sysmoduleconfig
-- ----------------------------
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');
INSERT INTO `md_sysmoduleconfig` VALUES ('dap_dapsystem', 'moduleid', 'systypename', null, 'funcode', 'resid', null, '2013-01-16 10:36:58', '0');

-- ----------------------------
-- Table structure for md_table
-- ----------------------------
DROP TABLE IF EXISTS `md_table`;
CREATE TABLE `md_table` (
  `id` varchar(50) NOT NULL,
  `versiontype` smallint(6) NOT NULL,
  `displayname` varchar(90) default NULL,
  `name` varchar(50) NOT NULL,
  `databaseid` varchar(50) default NULL,
  `description` varchar(512) default NULL,
  `help` varchar(1024) default NULL,
  `isactive` char(1) default NULL,
  `creator` varchar(30) default NULL,
  `modifier` varchar(30) default NULL,
  `createtime` char(19) default NULL,
  `modifytime` char(19) default NULL,
  `resid` varchar(90) default NULL,
  `parenttable` varchar(50) default NULL,
  `isextendtable` char(1) default NULL,
  `fromsourcebmf` char(1) default NULL,
  `industry` varchar(50) default NULL,
  `tenantid` varchar(50) default NULL,
  `resmodule` varchar(50) default NULL,
  `ts` char(19) default NULL,
  `dr` decimal(10,0) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of md_table
-- ----------------------------
INSERT INTO `md_table` VALUES ('bd_countryzone', '0', '国家地区', 'bd_countryzone', null, null, null, null, null, null, '2016-11-16 11:11:17', '2016-12-13 14:58:33', null, null, 'N', 'Y', '0', null, 'countryzone', '2017-04-01 10:44:34', '0');
INSERT INTO `md_table` VALUES ('cardTableMeta', '0', '卡片列表', 'cardTableMeta', null, null, null, null, null, null, '2016-12-12 15:03:23', '2016-12-13 14:58:29', null, null, null, 'Y', '0', null, 'cardtable', '2016-12-15 09:48:57', '0');
INSERT INTO `md_table` VALUES ('dept', '0', '部门', 'dept', null, null, null, null, null, null, '2016-11-16 10:53:23', '2016-12-13 11:20:46', null, null, 'N', 'Y', '0', null, 'dept', '2017-04-01 10:45:48', '0');
INSERT INTO `md_table` VALUES ('instit', '0', '机构', 'instit', null, null, null, null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', null, null, 'N', 'Y', '0', null, 'address', '2017-04-01 10:44:55', '0');
INSERT INTO `md_table` VALUES ('org', '0', '组织', 'org', null, null, null, null, null, null, '2016-11-07 13:30:47', '2016-12-13 11:15:38', null, null, 'N', 'Y', '0', null, 'org', '2017-04-01 22:17:55', '0');
INSERT INTO `md_table` VALUES ('role', '0', '角色', 'role', null, null, null, null, null, null, '2017-03-31 14:55:24', '2017-03-31 14:57:43', null, null, 'N', 'Y', '0', null, 'role', '2017-04-01 22:19:08', '0');
INSERT INTO `md_table` VALUES ('sys_dict_type_meta', '0', '档案', 'sys_dict_type_meta', null, null, null, null, null, null, '2016-12-12 15:28:29', '2016-12-13 11:10:33', null, null, null, 'Y', '0', null, 'sys_dict_type', '2016-12-15 09:48:38', '0');
INSERT INTO `md_table` VALUES ('sys_user', '0', '用户管理表', 'sys_user', null, null, null, null, null, null, '2016-11-08 09:18:08', '2016-12-14 14:15:14', null, null, null, 'Y', '0', null, 'userManagement', '2016-12-15 09:49:06', '0');
INSERT INTO `md_table` VALUES ('sys_user_job', '0', '用户任职表', 'sys_user_job', null, null, null, null, null, null, '2016-11-08 09:33:28', '2016-12-14 14:15:14', null, null, null, 'Y', '0', null, 'userManagement', '2016-12-15 09:49:06', '0');
INSERT INTO `md_table` VALUES ('telbook', '0', '通讯录', 'telbook', null, null, null, null, null, null, '2016-12-13 13:12:28', '2016-12-14 09:59:14', null, null, 'N', 'Y', '0', null, 'address', '2017-04-01 10:44:55', '0');
INSERT INTO `md_table` VALUES ('userpsn', '0', '人员信息', 'userpsn', null, null, null, null, null, null, '2017-03-31 13:28:54', '2017-04-01 10:44:28', null, null, 'N', 'Y', '0', null, 'userpsn', '2017-04-01 10:44:45', '0');
INSERT INTO `md_table` VALUES ('user_dept', '0', '管辖部门', 'user_dept', null, null, null, null, null, null, '2017-03-31 16:21:39', '2017-03-31 20:39:13', null, null, 'N', 'Y', '0', null, 'user_dept', '2017-04-01 10:45:44', '0');
INSERT INTO `md_table` VALUES ('user_role', '0', '所属角色', 'user_role', null, null, null, null, null, null, '2017-03-31 15:12:25', '2017-04-01 10:44:28', null, null, 'N', 'Y', '0', null, 'userpsn', '2017-04-01 10:44:45', '0');

-- ----------------------------
-- Table structure for mgr_user
-- ----------------------------
DROP TABLE IF EXISTS `mgr_user`;
CREATE TABLE `mgr_user` (
  `id` bigint(20) NOT NULL default '0',
  `login_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mgr_user
-- ----------------------------
INSERT INTO `mgr_user` VALUES ('1', 'admin', 'Admin', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'admin', '2012-06-04 01:00:00');
INSERT INTO `mgr_user` VALUES ('2', 'user', 'Calvin', '2488aa0c31c624687bd9928e0a5d29e7d1ed520b', '6d65d24122c30500', 'user', '2012-06-04 02:00:00');
INSERT INTO `mgr_user` VALUES ('5', 'yy', '用友', '2488aa0c31c624687bd9928e0a5d29e7d1ed520b', '6d65d24122c30500', 'admin,user', '2016-03-24 14:58:35');
INSERT INTO `mgr_user` VALUES ('6', 'liujmc', '刘建民', 'e286dd520c1ac7daf2c2d6240f9f328c4d6d280c', '076b3c44bf24fee0', 'user', '2015-02-03 14:49:41');
INSERT INTO `mgr_user` VALUES ('24', 'zhukai', 'zhukai', '810592d961d665ee8f61edee655cd1488d0f2dc0', '78a29e3e2e11508e', 'admin', '2015-02-05 18:45:36');
INSERT INTO `mgr_user` VALUES ('31', 'liujmc@yonyou.com', '买家小刘', 'a0ae63c89d9d3d64f486aa52819fe2bd15381c5c', 'f1d8a7198f0dba72', 'buyers', '2015-02-12 14:59:36');
INSERT INTO `mgr_user` VALUES ('32', 'taomk', 'taomk', '392ecf9a2177e8c76e4f0c46dba2b287974383b5', 'ec759e16e26ec058', 'user', '2016-03-24 14:26:30');
INSERT INTO `mgr_user` VALUES ('34', 'abc', 'abc', 'acb3b99dad5cd54643f03add82bf449f243fa8ab', 'a87deaf08afa2a70', 'user,admin', '2016-03-28 09:51:21');

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `parent_id` varchar(36) default NULL,
  `org_name` varchar(200) NOT NULL,
  `email` varchar(50) default NULL,
  `short_name` varchar(50) default NULL,
  `creator` varchar(20) default NULL,
  `org_type` varchar(10) default NULL,
  `org_code` varchar(200) NOT NULL,
  `creationtime` datetime default NULL,
  `org_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES (null, '用友集团', null, '集团', 'Admin', null, '100', '2016-09-22 09:56:57', '3f362161-e32b-4e59-b703-df11d871244e', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络能源部', null, '用友能源', 'Admin', null, '1212', null, '40acd2f1-bb94-47ca-8854-0487f20b9697', '2016-12-13 15:41:16', '0');
INSERT INTO `org` VALUES ('3f362161-e32b-4e59-b703-df11d871244e', '用友网络科技股份有限公司', null, '用友网络', 'Admin', null, '200', '2016-09-22 10:02:35', '761dc79a-69ac-490b-8868-4e1e4f42d039', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络大客户事业部', null, '用友大客户', 'Admin', null, '408', null, '857cc73f-1a08-4053-b717-09404168f081', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友创新投资中心', null, '用友创新', 'Admin', null, '401', '2016-09-22 10:06:23', 'a559822e-23a0-44b8-b64e-6a75f4d47848', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '用友云采', null, '云彩', 'Admin', null, '221', null, 'aa39e858-06ca-4dfa-89aa-e2fac2ead2b3', '2016-12-13 16:07:44', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友汽车', null, '用友汽车', 'Admin', null, '404', '2016-09-22 10:13:07', 'b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络建筑业务部', null, '用友建筑', 'Admin', null, '405', '2016-09-22 10:21:22', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友新道科技公司', null, '用友新道', 'Admin', null, '406', '2016-09-22 10:22:24', 'b96107c0-db63-4220-b8a2-4ba22846fb33', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络上海分公司', null, '用友上分', 'Admin', null, '402', '2016-09-22 10:07:37', 'c367c969-c676-4a6e-9254-23ff9444c3d4', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('761dc79a-69ac-490b-8868-4e1e4f42d039', '用友网络金融部', null, '用友金融', 'Admin', null, '300', '2016-09-22 10:04:18', 'f158a95d-59d3-4a19-8007-a13d10ee7705', '2016-12-12 10:05:28', '0');
INSERT INTO `org` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '用友网络北京分公司', null, '用友北分', 'Admin', null, '407', '2016-09-22 10:23:16', 'f7ff9099-3230-4a13-83a9-a494e1e2c11b', '2016-12-12 10:05:28', '0');

-- ----------------------------
-- Table structure for pub_filesystem
-- ----------------------------
DROP TABLE IF EXISTS `pub_filesystem`;
CREATE TABLE `pub_filesystem` (
  `id` varchar(36) NOT NULL,
  `pkfile` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filepath` varchar(100) NOT NULL,
  `filesize` varchar(100) NOT NULL,
  `groupname` varchar(100) NOT NULL,
  `permission` varchar(20) NOT NULL,
  `uploader` varchar(36) default NULL,
  `uploadtime` varchar(100) default NULL,
  `sysid` varchar(100) default NULL,
  `tenant` varchar(100) default NULL,
  `modular` varchar(100) default NULL,
  `url` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_filesystem
-- ----------------------------
INSERT INTO `pub_filesystem` VALUES ('0gbrnuyhYmdkruLoYyD', 'publictenant/17cb5ead-8733-457d-9dd0-51737609dd84_页面控件问题.jpg', '页面控件问题.jpg', 'iuaptcrm10000000mq0z', '33217', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-1-10 19:58:18', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/17cb5ead-8733-457d-9dd0-51737609dd84_页面控件问题.jpg');
INSERT INTO `pub_filesystem` VALUES ('2qLtF3W7MJA6FNnqUY2', '6f60b95e-c717-4dd7-9510-74d280572c5c_单据编号前缀确认.txt', '单据编号前缀确认.txt', 'null', '635', 'PROJECT', 'read', 'admin', '2016-12-7 15:58:40', 'iuaptraincrm', '', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/6f60b95e-c717-4dd7-9510-74d280572c5c_单据编号前缀确认.txt');
INSERT INTO `pub_filesystem` VALUES ('2svEPelU9BWx1V5C7iy', 'test_tenant_id/8f54870f-75f9-42cc-abff-bb35f02a17e5_3.jpg', '3.jpg', '86e01359-6793-4c43-9f15-359c29bbd74e', '70296', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-4-5 21:22:54', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/8f54870f-75f9-42cc-abff-bb35f02a17e5_3.jpg');
INSERT INTO `pub_filesystem` VALUES ('3ptdG0DPmBpfEUqc1dP', 'test_tenant_id/a76cc878-b5f9-46bb-96d7-b4921580bcc4_03b125bc50e22759cb6d9728c610b56a (1).jpg', '03b125bc50e22759cb6d9728c610b56a (1).jpg', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', '65551', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-4-4 17:02:13', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/a76cc878-b5f9-46bb-96d7-b4921580bcc4_03b125bc50e22759cb6d9728c610b56a (1).jpg');
INSERT INTO `pub_filesystem` VALUES ('68VjIkKtvkEqtTL97ow', 'publictenant/00ce69cc-37de-4898-985c-d7ee3c802be3_页面控件问题.jpg', '页面控件问题.jpg', 'iuaptcrm10000000mq13', '33217', 'CUSTOMERINFO', 'private', 'admin', '2017-1-10 20:37:02', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/00ce69cc-37de-4898-985c-d7ee3c802be3_%E9%A1%B5%E9%9D%A2%E6%8E%A7%E4%BB%B6%E9%97%AE%E9%A2%98.jpg?Expires=1484051942&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=n%2BWUYOLyV84KHV%2BL3cmxxAtsZQg%3D');
INSERT INTO `pub_filesystem` VALUES ('6JG9hcqvnN8vS6jcPB8', 'publictenant/f0392a85-e699-4067-a5bc-0f3f8eac9190_ieop_role_position.sql', 'ieop_role_position.sql', 'iuaptcrm10000000iv3b', '1322', 'COUNTRYYEAREND', 'read', 'admin', '2017-1-9 15:34:52', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/f0392a85-e699-4067-a5bc-0f3f8eac9190_ieop_role_position.sql');
INSERT INTO `pub_filesystem` VALUES ('8OgdGZi9G4zXMwMh2Wb', 'publictenant/f3bdad9a-9668-4441-b4fa-5f108fd7d2ab_生产进度部分字段属性不对.PNG', '生产进度部分字段属性不对.PNG', 'iuaptcrm10000000iv1y', '14984', 'CONTRACT', 'read', 'admin', '2017-1-9 10:00:40', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/f3bdad9a-9668-4441-b4fa-5f108fd7d2ab_生产进度部分字段属性不对.PNG');
INSERT INTO `pub_filesystem` VALUES ('aJaIlCAksITyv4breLl', 'publictenant/35044244-5065-48b2-9c89-dcf5a3854230_111111.png', '111111.png', 'iuaptcrm10000000ekpd', '346155', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-1-10 14:50:27', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/35044244-5065-48b2-9c89-dcf5a3854230_111111.png');
INSERT INTO `pub_filesystem` VALUES ('bFf0Ot2mAZZHTohnSqZ', 'publictenant/81fd5c74-5902-4f38-94cd-82f3999665de_tm_alert.sql', 'tm_alert.sql', 'iuaptcrm10000000iv3c', '1075', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-1-9 15:35:22', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/81fd5c74-5902-4f38-94cd-82f3999665de_tm_alert.sql');
INSERT INTO `pub_filesystem` VALUES ('bhi0BsotAkbC3dcJz6X', 'publictenant/3d49aa16-371a-4b86-8e33-8ec911ed7ab9_页面控件问题.jpg', '页面控件问题.jpg', 'iuaptcrm10000000dptt', '33217', 'TRACKINFO', 'private', 'admin', '2017-1-10 20:05:25', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/3d49aa16-371a-4b86-8e33-8ec911ed7ab9_%E9%A1%B5%E9%9D%A2%E6%8E%A7%E4%BB%B6%E9%97%AE%E9%A2%98.jpg?Expires=1484050045&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=yIG7xP81/xsB4RWqbw/gM/XHXw0%3D');
INSERT INTO `pub_filesystem` VALUES ('bpjnS7dJtWCIN1CQ1L0', 'publictenant/53ffc2ea-f055-4cd5-aa79-455ef257f5b1_K8 45度角.jpg', 'K8 45度角.jpg', 'iuaptcrm10000000q1ow', '267054', 'tmseries-out', 'read', 'admin', '2017-1-13 11:07:52', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/53ffc2ea-f055-4cd5-aa79-455ef257f5b1_K8 45度角.jpg');
INSERT INTO `pub_filesystem` VALUES ('bsum0PymA7RikA4YdfV', 'publictenant/7b6c7500-5951-4f81-a69e-37943045a1c8_销售目标导入模板.xls', '销售目标导入模板.xls', 'iuaptcrm100000009jd8', '18432', 'TRACKINFO', 'private', null, '2017-1-17 11:46:14', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/7b6c7500-5951-4f81-a69e-37943045a1c8_%E9%94%80%E5%94%AE%E7%9B%AE%E6%A0%87%E5%AF%BC%E5%85%A5%E6%A8%A1%E6%9D%BF.xls?Expires=1484624895&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=bpMIZz/aXfC/4CEPdktvNCOKV8o%3D');
INSERT INTO `pub_filesystem` VALUES ('cB8Jf6TICEF3i4moYYp', 'publictenant/a5efe0c7-661d-4057-98b2-0ae64870160e_ieop_function.sql', 'ieop_function.sql', 'iuaptcrm10000000iv3d', '22642', 'COUNTRYYEAREND', 'read', 'admin', '2017-1-9 15:35:52', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/a5efe0c7-661d-4057-98b2-0ae64870160e_ieop_function.sql');
INSERT INTO `pub_filesystem` VALUES ('ck9oSNXOugzfPtst2bX', 'cfc9ab06-548f-4f91-9cd5-15d851a283d1_iexplore.exe', 'iexplore.exe', 'iuaptcrm100000007xhw', '673040', 'PROJECT', 'read', 'admin', '2016-12-7 16:11:27', 'iuaptraincrm', '', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/cfc9ab06-548f-4f91-9cd5-15d851a283d1_iexplore.exe');
INSERT INTO `pub_filesystem` VALUES ('cM6ifizHFitnqnTfn5Y', 'publictenant/a01ab81f-6296-4e0c-8ab7-bcbbbd345101_城市信息列表页面展示问题.PNG', '城市信息列表页面展示问题.PNG', 'iuaptcrm10000000nomj', '25201', 'TRACKINFO', 'private', 'admin', '2017-1-11 8:44:17', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/a01ab81f-6296-4e0c-8ab7-bcbbbd345101_%E5%9F%8E%E5%B8%82%E4%BF%A1%E6%81%AF%E5%88%97%E8%A1%A8%E9%A1%B5%E9%9D%A2%E5%B1%95%E7%A4%BA%E9%97%AE%E9%A2%98.PNG?Expires=1484095578&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=R%2BHnizNMR%2BFIb38geJ6/S7/jtsc%3D');
INSERT INTO `pub_filesystem` VALUES ('csnTpLIr5d1i0yi4G16', 'publictenant/394e38c9-5a0d-4b46-8221-927cde7144c4_有问题的功能菜单.jpg', '有问题的功能菜单.jpg', 'null', '11303', 'POORDER', 'private', null, '2017-1-18 11:11:28', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/394e38c9-5a0d-4b46-8221-927cde7144c4_%E6%9C%89%E9%97%AE%E9%A2%98%E7%9A%84%E5%8A%9F%E8%83%BD%E8%8F%9C%E5%8D%95.jpg?Expires=1484709208&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=eODoYSwI/n7ceL6J886xL/u1C%2BU%3D');
INSERT INTO `pub_filesystem` VALUES ('cV3wrVFcUNTbzhcLGYn', '12b128fa-cac9-438f-aa32-c135994ff047_AxureRP.exe', 'AxureRP.exe', 'iuaptcrm10000000iv2u', '99672', 'TRACKINFO', 'private', 'admin', '2017-1-10 16:30:54', 'iuaptraincrm', '', 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/12b128fa-cac9-438f-aa32-c135994ff047_AxureRP.exe?Expires=1484037175&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=r4ARACobw6aXfCcV40uOjuNpY7g%3D');
INSERT INTO `pub_filesystem` VALUES ('CX28plYmrCMhLS5LZxd', 'publictenant/4535ae54-305c-4c01-a6df-d93f671c498b_ieop_role_position.sql', 'ieop_role_position.sql', 'iuaptcrm10000000iv3a', '1322', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-1-9 15:34:35', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/4535ae54-305c-4c01-a6df-d93f671c498b_ieop_role_position.sql');
INSERT INTO `pub_filesystem` VALUES ('CyKD4Qgu5gtQen2L81t', 'publictenant/17eeded6-1b8e-4617-9893-79873fea766a_配置价格-K8.xls', '配置价格-K8.xls', 'iuaptcrm10000000t5dt', '40448', 'POLICY', 'read', null, '2017-1-17 16:11:11', '', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/17eeded6-1b8e-4617-9893-79873fea766a_配置价格-K8.xls');
INSERT INTO `pub_filesystem` VALUES ('CzM8LKEjAUrFcVOr0hT', 'publictenant/a8c93b79-4d7d-4a62-b6e8-2becfe3f2927_2222.png', '2222.png', 'iuaptcrm10000000griy', '231860', 'tmseries-in', 'read', 'admin', '2017-1-16 19:55:49', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/a8c93b79-4d7d-4a62-b6e8-2becfe3f2927_2222.png');
INSERT INTO `pub_filesystem` VALUES ('Czp1kcFMbigomLo9eHs', 'publictenant/f16bcb19-1627-4019-9714-826a78fd0d2c_国补申报车辆回款信息.xls', '国补申报车辆回款信息.xls', 'iuaptcrm10000000zoq4', '24576', 'ADVANCEFUNDBACK', 'private', null, '2017-1-19 14:51:19', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/f16bcb19-1627-4019-9714-826a78fd0d2c_%E5%9B%BD%E8%A1%A5%E7%94%B3%E6%8A%A5%E8%BD%A6%E8%BE%86%E5%9B%9E%E6%AC%BE%E4%BF%A1%E6%81%AF.xls?Expires=1484808800&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=8/wCRvhHgl2XdHe9bJfBd7EOOgE%3D');
INSERT INTO `pub_filesystem` VALUES ('duR7BNFIcEyMUTKp01Q', 'publictenant/bf909db5-6383-48b1-a1d1-5f149dcf7010_预拨回款申报车辆回款信息 (6).xls', '预拨回款申报车辆回款信息 (6).xls', 'iuaptcrm10000000ufoh', '25600', 'ADVANCEFUNDBACK', 'private', 'admin', '2017-1-16 14:25:14', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/bf909db5-6383-48b1-a1d1-5f149dcf7010_%E9%A2%84%E6%8B%A8%E5%9B%9E%E6%AC%BE%E7%94%B3%E6%8A%A5%E8%BD%A6%E8%BE%86%E5%9B%9E%E6%AC%BE%E4%BF%A1%E6%81%AF%20%286%29.xls?Expires=1484548034&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=PfiTOCGNTATL59zCcrsmLiG/amY%3D');
INSERT INTO `pub_filesystem` VALUES ('dwgLI34RbffmbEvWKdv', 'publictenant/bfbba131-da22-4d8c-9d3c-d820818485c4_国补年终清算回款导入模板.xls', '国补年终清算回款导入模板.xls', 'iuaptcrm10000000wkux', '17408', 'TRACKINFO', 'private', null, '2017-1-17 11:47:07', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/bfbba131-da22-4d8c-9d3c-d820818485c4_%E5%9B%BD%E8%A1%A5%E5%B9%B4%E7%BB%88%E6%B8%85%E7%AE%97%E5%9B%9E%E6%AC%BE%E5%AF%BC%E5%85%A5%E6%A8%A1%E6%9D%BF.xls?Expires=1484624947&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=7ADxrmmUNtRWeJSX/ZOSSi06Jmc%3D');
INSERT INTO `pub_filesystem` VALUES ('eZgG7xGb3WhlHfoLfpU', 'publictenant/2d21d781-b43c-4cbb-ac58-8920b8340608_111.jpg', '111.jpg', 'iuaptcrm10000000i409', '109480', 'PROJECT', 'read', 'admin', '2017-1-7 14:10:53', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/2d21d781-b43c-4cbb-ac58-8920b8340608_111.jpg');
INSERT INTO `pub_filesystem` VALUES ('fXliRkgAme3olaEu0Ml', '8bdb7f8f-3719-4dfe-9091-b3ba28db1df0_maven命令.txt', 'maven命令.txt', 'iuaptcrm100000007xhw', '161', 'PROJECT', 'read', 'admin', '2016-12-7 16:09:50', 'iuaptraincrm', '', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/8bdb7f8f-3719-4dfe-9091-b3ba28db1df0_maven命令.txt');
INSERT INTO `pub_filesystem` VALUES ('hlPaFRc8JdseiYrSgQJ', 'publictenant/03807dd7-f73a-45a1-94ce-889a49422bf4_bydcrm.sql', 'crm.sql', 'iuaptcrm10000000iv3d', '940189', 'COUNTRYYEAREND', 'read', 'admin', '2017-1-9 15:35:59', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/03807dd7-f73a-45a1-94ce-889a49422bf4_crm.sql');
INSERT INTO `pub_filesystem` VALUES ('hNIezFFsmV6Vtd4kECi', 'publictenant/3ae1e733-4650-4830-ab76-e89f85858b7b_城市信息中政策支持链接报错2.PNG', '城市信息中政策支持链接报错2.PNG', 'undefined', '41655', 'tmmodel-in', 'read', 'admin', '2017-1-13 8:57:05', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/3ae1e733-4650-4830-ab76-e89f85858b7b_城市信息中政策支持链接报错2.PNG');
INSERT INTO `pub_filesystem` VALUES ('hYDeNcVOrH08rFGkYG7', 'publictenant/3d1e4b16-0ece-415e-9d07-d65bc88c8e12_线索创建时-创建时间应不允许编辑.PNG', '线索创建时-创建时间应不允许编辑.PNG', 'null', '66843', 'POORDER', 'read', 'admin', '2017-1-7 9:01:09', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/3d1e4b16-0ece-415e-9d07-d65bc88c8e12_线索创建时-创建时间应不允许编辑.PNG');
INSERT INTO `pub_filesystem` VALUES ('IdMyhA5r2lhLb4r13xx', 'test_tenant_id/fcce5400-84d0-4a69-b5e9-a5d51aec9fa7_服务架构.jpg', '服务架构.jpg', '86e01359-6793-4c43-9f15-359c29bbd74e', '70296', 'INFOCOUNTRYSUBSIDY', 'read', 'admin', '2017-4-5 21:20:52', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/fcce5400-84d0-4a69-b5e9-a5d51aec9fa7_服务架构.jpg');
INSERT INTO `pub_filesystem` VALUES ('IPEcD0qmFHhNXwkWKME', 'test_tenant_id/da210d10-9e38-4869-bc61-15f13707e899_2.jpg', '2.jpg', '86e01359-6793-4c43-9f15-359c29bbd74e', '70296', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-4-5 21:22:46', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/da210d10-9e38-4869-bc61-15f13707e899_2.jpg');
INSERT INTO `pub_filesystem` VALUES ('JEoyZ0Sh3QSs45oT6A9', 'publictenant/a39c50f3-db47-48e2-86f7-b630c1ac67c4_销售目标维护数量不显示问题.jpg', '销售目标维护数量不显示问题.jpg', 'iuaptcrm10000000mq12', '66894', 'TRACKINFO', 'private', 'admin', '2017-1-10 19:59:50', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/a39c50f3-db47-48e2-86f7-b630c1ac67c4_%E9%94%80%E5%94%AE%E7%9B%AE%E6%A0%87%E7%BB%B4%E6%8A%A4%E6%95%B0%E9%87%8F%E4%B8%8D%E6%98%BE%E7%A4%BA%E9%97%AE%E9%A2%98.jpg?Expires=1484049710&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=03VhOlYP57EES7yHGn8jHQDHVP4%3D');
INSERT INTO `pub_filesystem` VALUES ('jo9w4oXouowR3LQPXIA', 'publictenant/ac12f5d1-244c-4a47-ba15-6439d9d43b9d_1111.png', '1111.png', 'null', '126673', 'POORDER', 'private', null, '2017-1-18 14:04:04', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/ac12f5d1-244c-4a47-ba15-6439d9d43b9d_1111.png?Expires=1484719564&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=0p0q3I9EGZeCldt8L3Rwcx4aDZI%3D');
INSERT INTO `pub_filesystem` VALUES ('JpnhAb89ASumTAtnyz8', 'publictenant/17bdad4c-bdf9-4dfa-bc9d-3e6250808753_车型配置维护-产品目录.PNG', '车型配置维护-产品目录.PNG', 'undefined', '34203', 'tmmodel-out', 'private', 'admin', '2017-1-13 8:56:54', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/17bdad4c-bdf9-4dfa-bc9d-3e6250808753_%E8%BD%A6%E5%9E%8B%E9%85%8D%E7%BD%AE%E7%BB%B4%E6%8A%A4-%E4%BA%A7%E5%93%81%E7%9B%AE%E5%BD%95.PNG?Expires=1484269135&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=poODsypjX5PBVxKXRVRrue/tQYs%3D');
INSERT INTO `pub_filesystem` VALUES ('KpMIr4cjQbDuFAl19e1', 'publictenant/84a8aa6a-d141-42fe-ad6d-58d1945000fa_有问题的功能菜单.jpg', '有问题的功能菜单.jpg', 'undefined', '11303', 'POLICY', 'read', null, '2017-1-18 11:51:31', '', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/84a8aa6a-d141-42fe-ad6d-58d1945000fa_有问题的功能菜单.jpg');
INSERT INTO `pub_filesystem` VALUES ('llPSH8CDpufxXqvEvXH', 'test_tenant_id/21f46ea9-590d-43c4-bccc-a8c0483ce6b6_服务架构.jpg', '服务架构.jpg', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', '70296', 'INFOCOUNTRYSUBSIDY', 'read', 'admin', '2017-4-6 16:28:48', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/21f46ea9-590d-43c4-bccc-a8c0483ce6b6_服务架构.jpg');
INSERT INTO `pub_filesystem` VALUES ('MaNEiJizb07rGtrbyGv', 'publictenant/790b998e-c1c7-453b-9106-2d1be5090019_商用车上牌信息.xls', '商用车上牌信息.xls', 'iuaptcrm10000000wkuv', '18944', 'TRACKINFO', 'private', null, '2017-1-17 11:37:23', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/790b998e-c1c7-453b-9106-2d1be5090019_%E5%95%86%E7%94%A8%E8%BD%A6%E4%B8%8A%E7%89%8C%E4%BF%A1%E6%81%AF.xls?Expires=1484624363&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=848CVQagcBRvlA7Vy4FOeqw/e8U%3D');
INSERT INTO `pub_filesystem` VALUES ('mApp9fe2HcZWAPBzSo3', 'publictenant/db005052-d6f2-45ad-a732-f166e4b92eb0_K8缩略图 .jpg', 'K8缩略图 .jpg', 'iuaptcrm10000000q1ow', '17412', 'tmseries-in', 'read', 'admin', '2017-1-13 11:08:44', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/db005052-d6f2-45ad-a732-f166e4b92eb0_K8缩略图 .jpg');
INSERT INTO `pub_filesystem` VALUES ('MuexDHcv9VeqTajNlr2', 'publictenant/13df3f20-aa5f-4e84-b8f4-fbc38507c42b_interface_error11.jpg', 'interface_error11.jpg', 'iuaptcrm10000000i409', '110676', 'PROJECT', 'read', 'admin', '2017-1-7 14:14:06', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/13df3f20-aa5f-4e84-b8f4-fbc38507c42b_interface_error11.jpg');
INSERT INTO `pub_filesystem` VALUES ('nYjbeYijUetzmfz21Mx', 'publictenant/f2d2a8fc-e76a-424d-9fd1-eb69682ca570_城市信息列表页面展示问题.PNG', '城市信息列表页面展示问题.PNG', 'undefined', '25201', 'POLICY', 'read', null, '2017-1-19 15:06:00', '', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/f2d2a8fc-e76a-424d-9fd1-eb69682ca570_城市信息列表页面展示问题.PNG');
INSERT INTO `pub_filesystem` VALUES ('oI3brgesLbPQ4gDt88n', 'publictenant/d3a73c7e-400f-4933-9b57-3bbe8539fe19_bug.PNG', 'bug.PNG', 'null', '38807', 'CIYTINFO', 'read', 'admin', '2017-1-6 14:48:53', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/d3a73c7e-400f-4933-9b57-3bbe8539fe19_bug.PNG');
INSERT INTO `pub_filesystem` VALUES ('OMMoI3KlXM5u8b05miA', 'publictenant/37bf10eb-38cb-4770-b301-e4540676fbd4_有问题的功能菜单.jpg', '有问题的功能菜单.jpg', 'iuaptcrm10000000wl1z', '11303', 'TRACKINFO', 'private', null, '2017-1-18 10:11:08', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/37bf10eb-38cb-4770-b301-e4540676fbd4_%E6%9C%89%E9%97%AE%E9%A2%98%E7%9A%84%E5%8A%9F%E8%83%BD%E8%8F%9C%E5%8D%95.jpg?Expires=1484705588&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=1wgLqDStrWBIFNdn4nBX0pDxCsU%3D');
INSERT INTO `pub_filesystem` VALUES ('qtknauhdlMP60pFhyjl', 'publictenant/5d8255fb-fa8d-47c7-99cb-04c7eda54b2e_11111.png', '11111.png', 'iuaptcrm10000000griy', '179107', 'tmseries-out', 'read', 'admin', '2017-1-16 19:55:41', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/5d8255fb-fa8d-47c7-99cb-04c7eda54b2e_11111.png');
INSERT INTO `pub_filesystem` VALUES ('rD4DoYzJdXLjn2cht0h', 'publictenant/3c880ec2-988a-4d1b-a685-5df221b6cb0b_80RW_5CR)EH]S0HH(]5)FB3.png', '80RW_5CR)EH]S0HH(]5)FB3.png', 'iuaptcrm10000000mq14', '80507', 'TRACKINFO', 'private', 'admin', '2017-1-10 21:04:01', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/3c880ec2-988a-4d1b-a685-5df221b6cb0b_80RW_5CR%29EH%5DS0HH%28%5D5%29FB3.png?Expires=1484053561&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=GYQUaxMlJvGGgVOZsD%2B%2BVJVDn28%3D');
INSERT INTO `pub_filesystem` VALUES ('RyNyWyOPnWP1YZ2uVrd', 'publictenant/fa7dc14d-3ad9-455f-9516-a48127f6794e_城市信息新建等待时间过长.PNG', '城市信息新建等待时间过长.PNG', 'null', '101806', 'SAMPLEBORROW', 'read', 'admin', '2017-1-16 9:43:51', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/fa7dc14d-3ad9-455f-9516-a48127f6794e_城市信息新建等待时间过长.PNG');
INSERT INTO `pub_filesystem` VALUES ('sJy2P9Hkl7yNeBYOoqr', 'test_tenant_id/a230ab8a-85f8-4f7f-9000-431f80be3a1a_03b125bc50e22759cb6d9728c610b56a (1).jpg', '03b125bc50e22759cb6d9728c610b56a (1).jpg', 'eb831d9c-6684-425c-a7d8-d2e0f757e61e', '65551', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-4-4 17:40:07', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/a230ab8a-85f8-4f7f-9000-431f80be3a1a_03b125bc50e22759cb6d9728c610b56a (1).jpg');
INSERT INTO `pub_filesystem` VALUES ('tYy8jIa5N3imb8UN5ah', 'test_tenant_id/7d1df84e-3a9e-4ee3-8ad9-1a1f394e9c70_03b125bc50e22759cb6d9728c610b56a.jpg', '03b125bc50e22759cb6d9728c610b56a.jpg', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', '65551', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-4-4 17:06:42', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/7d1df84e-3a9e-4ee3-8ad9-1a1f394e9c70_03b125bc50e22759cb6d9728c610b56a.jpg');
INSERT INTO `pub_filesystem` VALUES ('UBMZAzUzNoR2A7kkkGA', 'test_tenant_id/8906700b-75a4-40e9-b36f-8fd22bd0346a_IMG_0414.PNG', 'IMG_0414.PNG', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', '1257654', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-4-4 17:09:40', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/8906700b-75a4-40e9-b36f-8fd22bd0346a_IMG_0414.PNG');
INSERT INTO `pub_filesystem` VALUES ('uZX6kpXlLblQbwc6eA5', 'publictenant/ff32d0a2-2fe4-442a-9928-29af0581e627_2222.jpg', '2222.jpg', 'null', '19742', 'POORDER', 'private', null, '2017-1-18 15:29:46', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/ff32d0a2-2fe4-442a-9928-29af0581e627_2222.jpg?Expires=1484724706&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=TJM996I%2BqgMpkueNqnvMS8%2BMpbU%3D');
INSERT INTO `pub_filesystem` VALUES ('V37akNNX2LKJs4j1N80', 'publictenant/e89227b9-6c1b-408b-a333-794afb2aa223_Tulips.jpg', 'Tulips.jpg', 'iuaptcrm100000010ng3', '620888', 'COUNTRYSUBSIDY', 'read', null, '2017-1-19 21:14:34', '', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/e89227b9-6c1b-408b-a333-794afb2aa223_Tulips.jpg');
INSERT INTO `pub_filesystem` VALUES ('wFb1GoqBCDK48LE0JKZ', 'test_tenant_id/9b2bb21c-87b0-442e-a41a-8b55c26117d2_03b125bc50e22759cb6d9728c610b56a (1).jpg', '03b125bc50e22759cb6d9728c610b56a (1).jpg', '85b57ac6-a407-431a-b12a-238d00f668e8', '65551', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-4-4 17:06:03', 'bydcrm', 'test_tenant_id', 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/test_tenant_id/9b2bb21c-87b0-442e-a41a-8b55c26117d2_03b125bc50e22759cb6d9728c610b56a (1).jpg');
INSERT INTO `pub_filesystem` VALUES ('wQhR0BzWCkAlqPVNtlE', 'publictenant/5245dd29-de5a-4404-ae04-c0fa9b29725a_新建文本文档.txt', '新建文本文档.txt', 'iuaptcrm10000000xv6g', '6100', 'CHARGESTATION', 'read', null, '2017-1-19 17:38:46', '', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/5245dd29-de5a-4404-ae04-c0fa9b29725a_新建文本文档.txt');
INSERT INTO `pub_filesystem` VALUES ('wrC6xpGUf8Z9kzHepfC', 'publictenant/ca6eb0b3-14b2-4b5f-9964-8833f0b29045_AxureRP.exe', 'AxureRP.exe', 'undefined', '99672', 'tmmodel-out', 'read', 'admin', '2017-1-7 14:14:36', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/ca6eb0b3-14b2-4b5f-9964-8833f0b29045_AxureRP.exe');
INSERT INTO `pub_filesystem` VALUES ('wreSe8AAG5hwTSuoA6w', 'publictenant/8f18cafc-03d8-49c6-a1e3-6d4df9a666ca_AxureRP.exe', 'AxureRP.exe', 'iuaptcrm10000000wkv1', '99672', 'TRACKINFO', 'private', null, '2017-1-17 13:34:56', '', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/8f18cafc-03d8-49c6-a1e3-6d4df9a666ca_AxureRP.exe?Expires=1484631416&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=Kz0bPj2C5UgRGapHB4qpcwFT5eo%3D');
INSERT INTO `pub_filesystem` VALUES ('y7cgrZLZOmOBBRBxsYl', 'publictenant/e5703bff-f6c9-4d23-9184-7c208890a366_页面控件问题.jpg', '页面控件问题.jpg', 'iuaptcrm10000000iv2u', '33217', 'TRACKINFO', 'private', 'admin', '2017-1-10 19:59:34', 'iuaptraincrm', null, 'iuap', 'http://iuapkfzc2.oss-cn-shanghai.aliyuncs.com/e5703bff-f6c9-4d23-9184-7c208890a366_%E9%A1%B5%E9%9D%A2%E6%8E%A7%E4%BB%B6%E9%97%AE%E9%A2%98.jpg?Expires=1484049694&OSSAccessKeyId=yVNEf2DNo7IT0Opa&Signature=tbd5gOYf1XY7yv/3gVmkUAtv%2Bos%3D');
INSERT INTO `pub_filesystem` VALUES ('ZQaykTQLqm881U1gv3y', 'publictenant/d923db06-c578-47f7-9e73-2dc8a32fd6bc_ieop_role_position.sql', 'ieop_role_position.sql', 'iuaptcrm10000000iv3c', '1322', 'COUNTRYSUBSIDY', 'read', 'admin', '2017-1-9 15:35:15', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/d923db06-c578-47f7-9e73-2dc8a32fd6bc_ieop_role_position.sql');
INSERT INTO `pub_filesystem` VALUES ('zxZJzrFiPDEWqIHMeK9', 'publictenant/ef1a1232-3d08-438e-a208-cc74f6d3ac07_bydcrm.sql', 'crm.sql', 'iuaptcrm10000000iv3b', '940189', 'COUNTRYYEAREND', 'read', 'admin', '2017-1-9 15:34:59', 'iuaptraincrm', null, 'iuap', 'iuapkfzc2.oss-cn-shanghai.aliyuncs.com/ef1a1232-3d08-438e-a208-cc74f6d3ac07_crm.sql');

-- ----------------------------
-- Table structure for pub_multilang
-- ----------------------------
DROP TABLE IF EXISTS `pub_multilang`;
CREATE TABLE `pub_multilang` (
  `CHARSETNAME` varchar(50) default NULL,
  `DISLPAYNAME` char(75) default NULL,
  `dr` decimal(10,0) default '0',
  `LANGCODE` varchar(50) default NULL,
  `LANGDIRPATH` varchar(50) default NULL,
  `LANGSEQ` decimal(10,0) default NULL,
  `LOCALCOUNTRY` varchar(50) default NULL,
  `LOCALLANG` varchar(50) default NULL,
  `PK_MULTILANG` varchar(50) NOT NULL,
  `TRANSCLASSNAME` varchar(50) default NULL,
  `ts` char(19) default NULL,
  PRIMARY KEY  (`PK_MULTILANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pub_multilang
-- ----------------------------
INSERT INTO `pub_multilang` VALUES (null, 'English', '0', 'english', null, '2', null, 'EN', 'enGB0000000000000000', null, '2016-01-10 23:07:56');
INSERT INTO `pub_multilang` VALUES (null, '简体中文', '0', 'simpchn', null, '3', null, 'ZH', 'zhCN0000000000000000', null, '2016-01-10 23:07:56');
INSERT INTO `pub_multilang` VALUES (null, '繁體中文', '0', 'tradchn', null, '1', null, 'ZF', 'zhTW0000000000000000', null, '2016-01-10 23:07:56');

-- ----------------------------
-- Table structure for ref_refinfo
-- ----------------------------
DROP TABLE IF EXISTS `ref_refinfo`;
CREATE TABLE `ref_refinfo` (
  `pk_ref` varchar(200) NOT NULL,
  `refname` varchar(300) default NULL,
  `refcode` varchar(300) default NULL,
  `refclass` varchar(300) default NULL,
  `refurl` varchar(300) default NULL,
  `md_entitypk` varchar(300) default NULL,
  `producttype` varchar(300) default NULL,
  PRIMARY KEY  (`pk_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ref_refinfo
-- ----------------------------
INSERT INTO `ref_refinfo` VALUES ('01', '公司', 'corpref', 'none', '/tepoc/ref/corpref/', '123456', 'tepoc');
INSERT INTO `ref_refinfo` VALUES ('02', '角色', 'roleref', 'none', '/tepoc/ref/roleref/', '123456', 'tepoc');
INSERT INTO `ref_refinfo` VALUES ('03', '部门', 'deptref', 'none', '/tepoc/ref/deptref/', '123456', 'tepoc');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rolecode` varchar(50) default NULL,
  `roletype` varchar(50) default NULL,
  `rolename` varchar(50) default NULL,
  `pk_role` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`pk_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('admin', 'admin', '管理员', '1', null, '0');
INSERT INTO `role` VALUES ('user', 'user', '用户', '2', null, '0');
INSERT INTO `role` VALUES ('salemanager', 'salemanager', '销售主管', '3', null, '0');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` varchar(40) NOT NULL,
  `dict_type_code` varchar(100) NOT NULL,
  `dict_type_name` varchar(100) NOT NULL,
  `is_fixed` char(1) NOT NULL default 'N',
  `remark` varchar(512) default NULL,
  `creator_id` varchar(40) NOT NULL,
  `creator` varchar(20) NOT NULL,
  `create_time` date NOT NULL,
  `modifier_id` varchar(40) default NULL,
  `modifier` varchar(20) default NULL,
  `modify_time` date default NULL,
  `Dr` char(1) NOT NULL default '0',
  PRIMARY KEY  (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('0b827953-96ca-46a1-80dd-d8fbb58282f1', '0x00C', '表外科目', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('1890045e-480d-4148-8002-750d1a880dc6', '0x00E', '结算方式', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('23374bb5-6c84-4114-8972-7ec0288275f9', '0x00B', '科目', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('3da4826b-e012-44ed-bee3-63fd5789e68f', '0x00D', '现金流量', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('51e97a33-7a14-4a73-ac66-0aa547b1fc20', '0x00A', '科目方案', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('5944d266-1356-408c-b2ce-97062c8ed3d4', '0x001', '公司目录', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('661d2f57-4d57-4792-b197-a14f5ee1a203', '0x007', '会计主体账簿', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('dea61165-2f79-44d5-83ca-9e672a6ec8d6', '0x009', '科目类型', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('e3014bf0-7a71-4001-93a2-cc3f8581a78d', '0x008', '常用摘要', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('e8c486ed-fdbc-4b0c-ae0d-d1643f82ee50', '0x004', '币种', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('e9059b2a-cf48-480a-9e44-4e9aba803f8c', '0x003', '行政区划', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('ecf4562d-12f4-4f13-9b7f-b661f0b72634', '0x002', '联系人', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('f5aad43c-b347-43fe-8996-ec5973624c55', '0x006', '核算账簿', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('fafd6667-dad6-460f-b94a-35043b98cbf7', '0x005', '会计主体', 'N', '', 'test', 'admin', '2016-12-21', null, null, null, '0');

-- ----------------------------
-- Table structure for sys_dict_type_meta
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type_meta`;
CREATE TABLE `sys_dict_type_meta` (
  `dict_type_code` varchar(100) default NULL,
  `creator_id` varchar(40) default NULL,
  `is_fixed` varchar(50) default NULL,
  `modifier` varchar(20) default NULL,
  `remark` varchar(512) default NULL,
  `creator` varchar(20) default NULL,
  `modifier_id` varchar(40) default NULL,
  `dict_type_name` varchar(100) default NULL,
  `create_time` datetime default NULL,
  `modify_time` datetime default NULL,
  `dict_id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict_type_meta
-- ----------------------------
INSERT INTO `sys_dict_type_meta` VALUES ('0x00C', 'test', 'N', null, '', 'admin', null, '表外科目', '2016-12-21 00:00:00', null, '0b827953-96ca-46a1-80dd-d8fbb58282f1', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00E', 'test', 'N', null, '', 'admin', null, '结算方式', '2016-12-21 00:00:00', null, '1890045e-480d-4148-8002-750d1a880dc6', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00B', 'test', 'N', null, '', 'admin', null, '科目', '2016-12-21 00:00:00', null, '23374bb5-6c84-4114-8972-7ec0288275f9', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00D', 'test', 'N', null, '', 'admin', null, '现金流量', '2016-12-21 00:00:00', null, '3da4826b-e012-44ed-bee3-63fd5789e68f', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x00A', 'test', 'N', null, '', 'admin', null, '科目方案', '2016-12-21 00:00:00', null, '51e97a33-7a14-4a73-ac66-0aa547b1fc20', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x001', 'test', 'N', null, '', 'admin', null, '公司目录', '2016-12-21 00:00:00', null, '5944d266-1356-408c-b2ce-97062c8ed3d4', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x007', 'test', 'N', null, '', 'admin', null, '会计主体账簿', '2016-12-21 00:00:00', null, '661d2f57-4d57-4792-b197-a14f5ee1a203', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x009', 'test', 'N', null, '', 'admin', null, '科目类型', '2016-12-21 00:00:00', null, 'dea61165-2f79-44d5-83ca-9e672a6ec8d6', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x008', 'test', 'N', null, '', 'admin', null, '常用摘要', '2016-12-21 00:00:00', null, 'e3014bf0-7a71-4001-93a2-cc3f8581a78d', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x004', 'test', 'N', null, '', 'admin', null, '币种', '2016-12-21 00:00:00', null, 'e8c486ed-fdbc-4b0c-ae0d-d1643f82ee50', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x003', 'test', 'N', null, '', 'admin', null, '行政区划', '2016-12-21 00:00:00', null, 'e9059b2a-cf48-480a-9e44-4e9aba803f8c', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x002', 'test', 'N', null, '', 'admin', null, '联系人', '2016-12-21 00:00:00', null, 'ecf4562d-12f4-4f13-9b7f-b661f0b72634', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x006', 'test', 'N', null, '', 'admin', null, '核算账簿', '2016-12-21 00:00:00', null, 'f5aad43c-b347-43fe-8996-ec5973624c55', null, '0');
INSERT INTO `sys_dict_type_meta` VALUES ('0x005', 'test', 'N', null, '', 'admin', null, '会计主体', '2016-12-21 00:00:00', null, 'fafd6667-dad6-460f-b94a-35043b98cbf7', null, '0');

-- ----------------------------
-- Table structure for sys_prompt
-- ----------------------------
DROP TABLE IF EXISTS `sys_prompt`;
CREATE TABLE `sys_prompt` (
  `moudle` varchar(32) NOT NULL,
  `error_code` varchar(32) NOT NULL,
  `error_version` varchar(32) NOT NULL,
  `error_desc` varchar(32) default NULL,
  `error_cause` varchar(255) default NULL,
  `error_solution` varchar(255) default NULL,
  `locale` varchar(32) default NULL,
  PRIMARY KEY  (`moudle`,`error_code`,`error_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_prompt
-- ----------------------------
INSERT INTO `sys_prompt` VALUES ('dict', '100001', '0', '字典异常', '异常测试', '请删除异常测试代码', 'zh_CN');
INSERT INTO `sys_prompt` VALUES ('test', '100001', '0', '异常测试描述', '在{0,date,yyyy-MM-dd HH:mm:ss}发生了{1}个异常,造成损失{2,number,currency}元。', '异常测试解决方法如下：...', 'zh_CN');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `org_id` char(36) NOT NULL,
  `sex_id` varchar(50) default NULL,
  `modifier` varchar(20) default NULL,
  `remark` varchar(512) default NULL,
  `platform_id` varchar(1) default NULL,
  `login_name` varchar(64) default NULL,
  `creator` varchar(20) default NULL,
  `platform_name` varchar(16) default NULL,
  `modifier_id` varchar(40) default NULL,
  `status_id` varchar(1) default NULL,
  `certificate_name` varchar(16) default NULL,
  `user_mobile` varchar(16) default NULL,
  `level_name` varchar(16) default NULL,
  `user_code` varchar(32) default NULL,
  `user_password` varchar(64) default NULL,
  `certificate_code` varchar(32) default NULL,
  `image_url` varchar(64) default NULL,
  `certificate_id` varchar(1) default NULL,
  `level_id` varchar(1) default NULL,
  `org_name` varchar(64) default NULL,
  `status_name` varchar(16) default NULL,
  `user_email` varchar(64) default NULL,
  `user_name` varchar(20) default NULL,
  `creator_id` varchar(40) default NULL,
  `birthdate` datetime default NULL,
  `register_date` datetime default NULL,
  `modify_time` datetime default NULL,
  `create_time` datetime default NULL,
  `id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('a559822e-23a0-44b8-b64e-6a75f4d47848', '0', null, null, null, 'jl', 'Admin', null, null, '1', '身份证', '13121966697', '运营用户', '122404', '000', '370702197901020065', null, '1', '1', '用友创新投资中心', '正常', 'sj@163.com', '松江', '123', '2016-11-22 00:00:00', '2016-11-22 09:22:35', null, '2016-11-22 09:22:35', '17dd5627-f0c8-45b3-add3-bee0c3672975', '2016-12-21 14:37:09', '0');
INSERT INTO `sys_user` VALUES ('032', '0', 'admin', null, '1', 'cdzh', 'admin', '运营', '', '1', '身份证', '15501003788', '金融用户', '001233', '44a8a7d56b422e5658ebce6d3b2cc6ce67f90a10', '371102198901250566', null, '1', '2', '黑龙江投资中心', '正常', 'CDZhen@xiangyu.cn', '陈代臻', 'e23d708d-7767-449a-941a-86d6d31601e9', '2016-11-17 10:54:20', '2016-11-17 10:53:39', '2016-11-17 10:59:08', '2016-11-17 10:54:22', '1cdc7067-a293-4b6d-8db0-ba59235601cc', '2016-12-21 14:29:45', '0');
INSERT INTO `sys_user` VALUES ('761dc79a-69ac-490b-8868-4e1e4f42d039', '0', null, null, null, 'kangx', 'Admin', null, null, '1', '身份证', '15801259625', '运营用户', '122104', null, '652323198402141755', null, '1', '1', '用友网络科技股份有限公司', '正常', '23w3@163.com', '康星', 'test', null, '2016-12-12 16:18:55', null, '2016-12-12 16:18:55', '30de0199-e8c7-445e-b957-056de6773b40', '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user` VALUES ('a559822e-23a0-44b8-b64e-6a75f4d47848', '1', null, null, null, 'szj', 'Admin', null, null, '1', '身份证', '15801350172 ', '运营用户', '121201', null, '220000197501201250', null, '1', '1', '用友创新投资中心', '正常', 'li@163.com', '宋仲基', 'test', '2016-12-12 00:00:00', '2016-12-12 00:00:00', null, '2016-12-12 15:50:26', '400013ed-91b2-481b-ad6d-591092c8f157', '2016-12-21 14:27:07', '0');
INSERT INTO `sys_user` VALUES ('a559822e-23a0-44b8-b64e-6a75f4d47848', '1', null, null, null, 'pyq', 'Admin', null, null, '1', '身份证', '15901170256', '运营用户', '122101', null, '130183189092349099', null, '1', '1', '用友创新投资中心', '正常', 'abc@sina.com', '裴元庆', 'test', '2016-11-27 00:00:00', '2016-12-15 00:00:00', null, '2016-12-15 10:09:12', '5b512ac5-fe2e-4bac-bd00-7f45af7a3bb6', '2016-12-21 14:23:27', '0');
INSERT INTO `sys_user` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '0', null, null, null, 'yqi', 'Admin', null, null, '1', '身份证', '13121956780', '运营用户', '112404', null, null, null, '1', '1', '用友网络金融部', '正常', 'yqy@163.com', '玉麒麟', '123', '2016-11-24 00:00:00', '2016-11-24 10:10:24', null, '2016-11-24 10:10:24', '78844170-717d-4282-a690-a4adc26e60ce', '2016-12-21 14:27:41', '0');
INSERT INTO `sys_user` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '1', null, null, null, 'ljy', 'Admin', null, null, '1', '身份证', '13845344567', '运营用户', '112403', null, null, null, '1', '1', '黑龙江投资管理中心', '正常', 'lju@163.com', '卢俊义', null, '2016-11-24 00:00:00', '2016-11-24 10:09:32', null, '2016-11-24 10:09:32', '90aaaf78-9f8e-496d-a125-e69c6eef6648', '2016-12-08 13:21:26', '0');
INSERT INTO `sys_user` VALUES ('b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '1', null, null, null, 'fanrj', 'Admin', null, null, '1', '身份证', '15801351327', '运营用户', '122103', null, '42108319830528155X', null, '1', '1', '用友汽车', '正常', 'frj@163.com', '樊汝钰', 'test', '2016-12-13 00:00:00', '2016-12-13 00:00:00', null, '2016-12-13 13:50:55', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user` VALUES ('031', '0', 'admin', null, '1', 'liufj', 'admin', '运营', null, '1', '身份证', '15501002866', '金融用户', '000192', '83b944b3e9bbde533886f2ef1eb32b56cf165fce', '421224197811178789', null, '1', '2', '黑龙江投资中心', '正常', 'lfjia@xiangyu.cn', '刘馥嘉', 'e23d708d-7767-449a-941a-86d6d31601e9', '2016-11-17 11:06:17', '2016-11-17 11:06:21', '2016-11-17 11:06:29', '2016-11-17 11:06:27', 'a82dd979-a300-44a2-bcc9-f701a0a60b59', '2016-12-21 14:37:32', '0');
INSERT INTO `sys_user` VALUES ('1cdc7067-a293-4b6d-8db0-ba59235601cc', '1', null, null, null, 'lzs', 'Admin', null, null, '1', '身份证', '13121966609', '运营用户', '112402', null, null, null, '1', '1', '黑龙江投资管理中心', '正常', 'fakeemail@yonyou.com', '鲁智花', '123', '2016-11-24 00:00:00', '2016-11-24 10:07:38', null, '2016-11-24 10:07:38', 'bcaed99d-e04e-45af-9f0d-dd07199a0c15', '2016-12-21 14:27:53', '0');
INSERT INTO `sys_user` VALUES ('031', '0', 'admin', null, '1', 'ludl', 'admin', '运营', '', '2', '身份证', '13554543244', '商户用户', '000212', '44a8a7d56b422e5658ebce6d3b2cc6ce67f90a10', null, null, '1', '3', '黑龙江投资中心', '冻结', 'fakeemail@yonyou.com', '鲁达林', 'e23d708d-7767-449a-941a-86d6d31601e9', '2016-11-17 10:54:20', '2016-11-17 10:53:39', '2016-11-17 10:59:08', '2016-11-17 10:54:22', 'c7385f57-44fb-4d75-ac50-b27269458f26', '2016-12-21 14:37:25', '0');
INSERT INTO `sys_user` VALUES ('f7ff9099-3230-4a13-83a9-a494e1e2c11b', '1', null, null, null, 'qsb', 'Admin', null, null, '1', '身份证', '13434545678', '运营用户', '122102', null, '371626198804152868', null, '1', '1', '用友网络北京分公司', '正常', 'qsb@163.com', '秦叔宝', 'test', '2016-12-13 00:00:00', '2016-12-13 00:00:00', null, '2016-12-13 16:43:50', 'f1da0f87-dc51-470a-9d72-acbe75010ec5', '2016-12-21 14:24:48', '0');
INSERT INTO `sys_user` VALUES ('f158a95d-59d3-4a19-8007-a13d10ee7705', '1', null, null, null, 'bzt', 'Admin', null, null, '1', '身份证', '13456787653', '运营用户', '112401', null, null, null, '1', '1', '黑龙江投资管理中心', '正常', 'lc@163.com', '林冲从', '123', '2016-11-24 00:00:00', '2016-11-24 10:06:54', null, '2016-11-24 10:06:54', 'f3d0cd37-f6ac-4c95-97bb-29a70b81c24d', null, '0');

-- ----------------------------
-- Table structure for sys_user_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_job`;
CREATE TABLE `sys_user_job` (
  `dept_id` char(36) NOT NULL,
  `org_id` char(36) NOT NULL,
  `user_job_note` varchar(256) default NULL,
  `user_id` varchar(40) NOT NULL,
  `creator` varchar(20) NOT NULL,
  `creator_id` varchar(40) NOT NULL,
  `is_default` varchar(50) NOT NULL,
  `is_active` varchar(50) default NULL,
  `modifier` varchar(20) default NULL,
  `modifier_id` varchar(40) default NULL,
  `user_name` varchar(24) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime default NULL,
  `id` char(36) NOT NULL,
  `fk_id_sys_user_job` char(36) default NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`id`),
  KEY `fk__job__job557408` (`fk_id_sys_user_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_job
-- ----------------------------
INSERT INTO `sys_user_job` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', 'f158a95d-59d3-4a19-8007-a13d10ee7705', null, '400013ed-91b2-481b-ad6d-591092c8f157', 'admin', 'test', 'Y', 'Y', '宋仲基', '400013ed-91b2-481b-ad6d-591092c8f157', '宋仲基', '2016-12-12 16:22:23', '2016-12-21 14:27:07', '032babe8-de59-4faa-9682-c0cc859292d7', null, '2016-12-21 14:27:07', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fbf7b09a-e347-4a0c-9670-ec0b6152b985', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', '王志鹏', '2016-11-17 11:11:43', '2016-11-17 11:11:40', '04b6fc6a-7568-48c8-8cb2-636900af3fe7', null, '2016-11-17 11:11:37', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', '40acd2f1-bb94-47ca-8854-0487f20b9697', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '168fafad-e129-4888-a7bc-f870888c7b90', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', 'f7ff9099-3230-4a13-83a9-a494e1e2c11b', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'Y', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '1f592da6-8254-473e-a225-8cd224ee8cd1', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', '857cc73f-1a08-4053-b717-09404168f081', null, '879bc53f-1ed8-40d2-9c2f-745c54bf3549', 'Admin', '123', 'Y', 'Y', null, null, '易中天', '2016-11-24 10:13:58', null, '26266297-360f-4761-a51b-44d2ef24e625', null, '2016-12-02 09:20:42', '0');
INSERT INTO `sys_user_job` VALUES ('ead53046-cf02-44ac-8ed1-23cee26f6159', '857cc73f-1a08-4053-b717-09404168f081', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '3b8abcab-6946-492d-9ee2-5ebfe028d4b3', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', 'a559822e-23a0-44b8-b64e-6a75f4d47848', null, '2a1a2d3c-d3a1-4a60-a44a-ffea251281bb', 'admin', 'e23d708d-7767-449a-941a-86d6d31601e9', 'Y', 'Y', null, null, '肖亚军', '2016-11-17 11:02:59', null, '3e2c7742-a277-483d-922d-340ce48150fe', null, null, '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', 'f7ff9099-3230-4a13-83a9-a494e1e2c11b', null, '30de0199-e8c7-445e-b957-056de6773b40', 'Admin', 'test', 'N', 'Y', '康星', '30de0199-e8c7-445e-b957-056de6773b40', '康星', '2016-12-21 14:38:29', '2016-12-21 14:42:27', '42583a7e-ad55-45e8-847c-7c6407e70fb6', '30de0199-e8c7-445e-b957-056de6773b40', '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user_job` VALUES ('研发', 'a559822e-23a0-44b8-b64e-6a75f4d47848', null, '17dd5627-f0c8-45b3-add3-bee0c3672975', 'Admin', '123', 'Y', 'Y', '松江', '17dd5627-f0c8-45b3-add3-bee0c3672975', '松江', '2016-11-22 09:22:35', '2016-12-21 14:37:09', '495b6e35-b205-4cb6-8146-cbcb60c5d957', null, '2016-12-21 14:37:09', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', '857cc73f-1a08-4053-b717-09404168f081', null, '17dd5627-f0c8-45b3-add3-bee0c3672975', 'Admin', '123', 'Y', 'Y', '松江', '17dd5627-f0c8-45b3-add3-bee0c3672975', '松江', '2016-11-22 09:22:35', '2016-12-21 14:37:09', '4fc0688b-e501-4b69-9fad-bf6b55014e1c', null, '2016-12-21 14:37:09', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', '502972cc-56a6-4938-8b90-056bef71b5a4', null, '2016-12-13 17:08:38', '0');
INSERT INTO `sys_user_job` VALUES ('aa38692e-7398-436a-b2b8-a1440821774c', 'b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', null, null, '樊汝钰', '2016-12-21 14:40:37', null, '536ebbd4-8f56-4b43-9139-f4b3afa843c2', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:40:37', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '761dc79a-69ac-490b-8868-4e1e4f42d039', null, 'f1da0f87-dc51-470a-9d72-acbe75010ec5', 'admin', 'test', 'Y', 'Y', '秦叔宝', 'f1da0f87-dc51-470a-9d72-acbe75010ec5', 'weaa', '2016-12-13 16:43:50', '2016-12-21 14:24:48', '5fe73a3d-f0eb-461a-9cc1-1dbb2b66bc32', null, '2016-12-21 14:24:49', '0');
INSERT INTO `sys_user_job` VALUES ('b34a3c95-2511-418c-afa5-cbd800c3283c', 'ba9a7efe-1dc3-4670-a42e-89451afe4117', null, '119eb1bc-b412-41c3-907e-3ef44f8dc3f4', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', null, '付佳丽', '2016-11-17 11:13:19', '2016-11-17 11:13:16', '601256d2-9583-4944-96a4-942c8d6a6ac6', null, '2016-11-17 11:13:14', '0');
INSERT INTO `sys_user_job` VALUES ('b676078b-a786-4c76-ab80-f5a9b7418e98', 'b96107c0-db63-4220-b8a2-4ba22846fb33', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', '6648490d-2b48-4bf5-9c15-57ba5e97ebcc', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', 'f158a95d-59d3-4a19-8007-a13d10ee7705', null, '30de0199-e8c7-445e-b957-056de6773b40', 'Admin', 'test', 'N', 'Y', '康星', '30de0199-e8c7-445e-b957-056de6773b40', '康星', '2016-12-21 14:38:29', '2016-12-21 14:42:27', '7ad7f3dd-e062-45c7-ad48-4a184d7ec923', '30de0199-e8c7-445e-b957-056de6773b40', '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', '93769ac8-f98e-448b-bd58-3c2f6d266d92', null, '2016-12-12 16:17:47', '0');
INSERT INTO `sys_user_job` VALUES ('29b6597a-5727-405f-b9c6-c72c381d8d8f', '761dc79a-69ac-490b-8868-4e1e4f42d039', null, 'd2b68cba-0e0b-4ae8-af4f-f17ce25c90ce', 'admin', 'e23d708d-7767-449a-941a-86d6d31601e9', 'N', 'Y', '周双印', 'd2b68cba-0e0b-4ae8-af4f-f17ce25c90ce', '周双印', '2016-11-17 11:04:36', '2016-12-08 13:29:22', 'a68cda4d-10cc-49ab-8518-9af49eafdf9a', null, '2016-12-08 13:29:22', '0');
INSERT INTO `sys_user_job` VALUES ('b676078b-a786-4c76-ab80-f5a9b7418e98', '857cc73f-1a08-4053-b717-09404168f081', 'sss', '2f661043-8858-4b44-a984-403e0e42853a', 'admin', 'test', 'Y', 'Y', 'zxs', '2f661043-8858-4b44-a984-403e0e42853a', 'zxs', '2016-12-05 09:33:54', '2016-12-05 09:34:11', 'ac203b15-4ec2-4867-9cbc-bbf3b12705a3', null, '2016-12-05 09:34:11', '0');
INSERT INTO `sys_user_job` VALUES ('56b5e6e8-2656-46f8-b1a8-f42a42140c88', 'b5e399f5-6c08-4d81-a3a3-b39e73d7cdd8', null, '30de0199-e8c7-445e-b957-056de6773b40', 'admin', 'test', 'Y', 'Y', '康星', '30de0199-e8c7-445e-b957-056de6773b40', '111', '2016-12-12 16:18:55', '2016-12-21 14:42:27', 'b851ddf5-e215-4ec7-ae9e-b46982b7d70a', null, '2016-12-21 14:42:27', '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', 'bb6a1fde-5055-4331-88e5-b177c1576f7c', null, '2016-12-13 16:52:38', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '总体设计师', '2257adbf-d509-4509-8a66-b57aac7008c0', 'admin', 'e23d708d-7767-449a-941a-86d6d31601e9', 'Y', 'Y', null, null, '严伟', '2016-11-17 11:05:32', null, 'cff19f3d-1bbc-4b9a-a39b-2994436f2f29', null, null, '0');
INSERT INTO `sys_user_job` VALUES ('576168c5-f6d9-4deb-8562-00ed23aca38a', '339a0ed4-f3f5-4789-960b-7308c730fe7f', null, 'fakejobUserId@yonyou.com', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'Y', 'Y', 'admin', '76461f9e-7cb3-41e6-ad7c-7bbaade109fa', 'fakesavejobusrname', '2016-11-17 11:11:43', '2016-11-17 11:11:40', 'd52f4345-1cd1-405c-84f6-894312509e21', null, '2016-12-13 15:59:01', '0');
INSERT INTO `sys_user_job` VALUES ('383a50d4-5a78-4004-8fa0-932945cc0949', 'b8728e89-b9f3-4a3b-9dac-7e5c9393f4cc', '本职岗位', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', 'Admin', 'test', 'N', 'Y', '樊汝钰', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '樊汝钰', '2016-12-21 14:40:37', '2016-12-21 14:42:18', 'f3cc4211-dbd3-4595-9d16-7526c3a7e480', 'a58fe7eb-97c3-4ae4-926f-5a4869b06851', '2016-12-21 14:42:18', '0');

-- ----------------------------
-- Table structure for telbook
-- ----------------------------
DROP TABLE IF EXISTS `telbook`;
CREATE TABLE `telbook` (
  `countryzone` varchar(36) default NULL,
  `institid` char(36) default NULL,
  `sex` varchar(50) default NULL,
  `tel` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `worktel` varchar(100) default NULL,
  `office` varchar(100) default NULL,
  `peoname` varchar(50) NOT NULL,
  `peocode` varchar(100) NOT NULL,
  `id` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`id`),
  KEY `fk_book_itid39472` (`institid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of telbook
-- ----------------------------
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'liujm@yonyou.com', '18627394713', null, '刘建民', '014', '05053283-3c2b-4890-954a-86107a2692be', '2016-12-21 14:36:00', '0');
INSERT INTO `telbook` VALUES (null, '46c6129e-05f0-43f3-997f-bc672aebec7c', null, null, 'sunxf@yonyou.com', '18678765436', null, '孙旭峰', '010', '0e2490aa-d7d9-462e-bc45-9aa8c6577d29', '2016-12-15 10:28:32', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'zhangyang@yonyou.com', '18678765436', null, '张洋', '001', '0f7de08e-817f-442f-9697-fff299ec1b98', '2016-12-15 10:25:23', '0');
INSERT INTO `telbook` VALUES (null, '98d0c98d-24f3-49e3-9343-df6c4d2b6cd5', null, null, 'yangxj@yonyou.com', '18636641735', null, '杨晓军', '009', '0fd23204-f5cb-43f9-9f12-333b275b83f3', '2016-12-21 14:16:46', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'guyz@yonyou.com', '18645362185', null, '谷艳召', '015', '8287a3f8-9aba-4caa-9dc3-8b3d1663fc69', '2016-12-21 14:36:25', '0');
INSERT INTO `telbook` VALUES (null, '98d0c98d-24f3-49e3-9343-df6c4d2b6cd5', null, null, 'liumg@yonyou.com', '18725371084', null, '刘铭刚', '011', '896e1777-ce0f-403e-9860-470519fb08b3', '2016-12-21 14:17:34', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'wangqj@yonyou.com', '18678765436', null, '王庆江', '003', '90884c41-a23b-41f8-8977-c827f89b9775', '2016-12-15 10:26:01', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'zhukai@yonou.com', '18652438765', null, '朱恺', '0012', 'ae691b6c-1175-4812-a52d-bb6928e3ff64', '2016-12-21 14:37:29', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'dingqm@yonyou.com', '18678765436', null, '丁其明', '005', 'c2b0c07e-9de8-4a91-bc2e-aa06308c9114', '2016-12-15 10:26:20', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'zengxs@yonyou.com', '18635479864', null, '曾宪盛', '013', 'ca8b804e-c3ee-495c-8bf3-e83cd4a25a4c', '2016-12-21 14:32:28', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'wuxj@yonyou.com', '18678765436', null, '吴学军', '007', 'e086dcd3-c7e7-4c83-8ee1-866f3047c3ab', '2016-12-15 10:27:39', '0');
INSERT INTO `telbook` VALUES (null, '3f362161-e32b-4e59-b703-df11d871244e', null, null, 'lihao@yonyou.com', '18678765436', null, '李浩', '002', 'e558850a-f159-44bb-93a4-f04fdf89e143', '2016-12-15 10:25:39', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'zhengkai@yonyou.com', '18678765436', null, '郑凯', '008', 'e6c821fc-d310-4069-813d-c14894464079', '2016-12-15 10:28:02', '0');
INSERT INTO `telbook` VALUES (null, '761dc79a-69ac-490b-8868-4e1e4f42d039', null, null, 'denghx@yonyou.com', '18678765436', null, '邓红霞', '006', 'f6c57f28-efd9-4278-bbde-3dd79340d1d1', '2016-12-15 10:26:53', '0');

-- ----------------------------
-- Table structure for userpsn
-- ----------------------------
DROP TABLE IF EXISTS `userpsn`;
CREATE TABLE `userpsn` (
  `pk_dept` varchar(36) default NULL,
  `pk_corp` varchar(36) default NULL,
  `sex` varchar(50) default NULL,
  `photo` varchar(50) default NULL,
  `defitem3` varchar(50) default NULL,
  `major` varchar(50) default NULL,
  `telphone` varchar(50) default NULL,
  `defitem5` varchar(50) default NULL,
  `defitem2` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `defitem4` varchar(50) default NULL,
  `defitem1` varchar(50) default NULL,
  `idcard` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `edution` varchar(50) default NULL,
  `work_date` datetime default NULL,
  `brithdate` datetime default NULL,
  `pk_user` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`pk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userpsn
-- ----------------------------
INSERT INTO `userpsn` VALUES ('~', '~', '0', null, null, '01', null, null, null, 'aaa', null, null, '111111111111111111', null, '01', null, '2017-04-05 00:00:00', '5257a17a-ace9-4c4c-85e6-4a173ece0104', '2017-04-06 17:13:07', '0');
INSERT INTO `userpsn` VALUES ('~', '~', '0', null, null, null, null, null, null, '测试用户', null, null, '111111111111111', 'fanchuanjun2008@163.com', '大学', null, '2017-04-06 00:00:00', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', '2017-04-06 14:41:54', '0');
INSERT INTO `userpsn` VALUES (null, null, '0', null, null, null, null, null, null, '测试用户', null, null, 'xxxxxxxxxxxxxxxxxxxxx', 'fanchuanjun2008@163.com', '大学', null, null, 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', '2017-04-01 12:00:10', '0');

-- ----------------------------
-- Table structure for user_dept
-- ----------------------------
DROP TABLE IF EXISTS `user_dept`;
CREATE TABLE `user_dept` (
  `pk_dept` varchar(36) default NULL,
  `deptcode` varchar(50) default NULL,
  `fk_id_userdept` varchar(36) default NULL,
  `deptname` varchar(50) default NULL,
  `pk_user_dept` char(36) NOT NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`pk_user_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_dept
-- ----------------------------
INSERT INTO `user_dept` VALUES ('~', 'dept2', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', 'test2', '1cec4a5e-173e-4bca-a70d-41fd4b380d87', '2017-04-05 22:09:40', '0');
INSERT INTO `user_dept` VALUES ('~', 'dept0', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', 'test0', '28eab73f-cf9f-4842-bf88-b1fc5417eeaa', '2017-04-05 22:09:40', '0');
INSERT INTO `user_dept` VALUES ('~', '40509', '5257a17a-ace9-4c4c-85e6-4a173ece0104', '北京高管', '2ae3b2e7-8f25-4ce3-87af-5c084e94ab6e', '2017-04-06 17:13:07', '0');
INSERT INTO `user_dept` VALUES ('~', '40505', '5257a17a-ace9-4c4c-85e6-4a173ece0104', '上海区域组', '62149f38-4472-4f7b-9d23-95be017a7894', '2017-04-06 17:13:07', '0');
INSERT INTO `user_dept` VALUES ('dept00000', 'test00000', '~', 'dept00000', '9cbec5e7-30fa-48de-a63d-e6d8715569f4', '2017-04-06 14:41:54', '0');
INSERT INTO `user_dept` VALUES ('~', '40506', '5257a17a-ace9-4c4c-85e6-4a173ece0104', '北京区域组', '9e9f2568-74a6-4a2c-969e-ab724534e842', '2017-04-06 17:13:07', '0');
INSERT INTO `user_dept` VALUES ('~', '40502', '5257a17a-ace9-4c4c-85e6-4a173ece0104', '风险管理部', 'a2e8914b-aef4-461a-8cfe-537d233a0a92', '2017-04-06 17:13:07', '0');
INSERT INTO `user_dept` VALUES ('~', 'dept3', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', 'test3', 'afc7450c-8f82-44ea-bbfb-6538a746a428', '2017-04-05 22:09:40', '0');
INSERT INTO `user_dept` VALUES ('~', '40503', '5257a17a-ace9-4c4c-85e6-4a173ece0104', 'IUAP平台部', 'b9e676bf-f02b-458d-811b-bbfce3775724', '2017-04-06 17:13:07', '0');
INSERT INTO `user_dept` VALUES ('~', 'dept4', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', 'test4', 'bbbb0b3c-7666-4d0c-b0eb-bde10155f1c4', '2017-04-05 22:09:40', '0');
INSERT INTO `user_dept` VALUES ('~', 'dept3', 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', 'test3', 'bec1ceea-f29f-4e21-96b1-ee134e6ea0d6', '2017-04-06 14:41:54', '0');
INSERT INTO `user_dept` VALUES ('~', 'dept1', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', 'test1', 'dcf8cdd1-f976-4eb8-890f-3d6c6ff7085e', '2017-04-05 22:09:40', '0');
INSERT INTO `user_dept` VALUES ('~', '40504', '5257a17a-ace9-4c4c-85e6-4a173ece0104', '单证部', 'dfb26a5d-942e-4bb3-b7aa-20175d4af035', '2017-04-06 17:13:07', '0');
INSERT INTO `user_dept` VALUES ('~', 'dept1', 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', 'test1', 'e6b5169e-6fcd-4b2a-836c-47ab0c092e73', '2017-04-06 14:41:54', '0');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `roletype` varchar(50) default NULL,
  `rolecode` varchar(50) default NULL,
  `rolename` varchar(50) default NULL,
  `pk_user_role` char(36) NOT NULL,
  `fk_id_userrole` char(36) default NULL,
  `pk_role` varchar(36) default NULL,
  `ts` datetime default NULL,
  `dr` smallint(6) default '0',
  PRIMARY KEY  (`pk_user_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('admin', 'admin', '管理员', '04319e9e-f414-451c-a92b-cf8995134a59', '5257a17a-ace9-4c4c-85e6-4a173ece0104', '~', '2017-04-06 17:13:07', '0');
INSERT INTO `user_role` VALUES ('user', 'user', '用户', '22b05de2-1300-4926-a9f9-0ce7bbdc41e5', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', '~', '2017-04-06 14:41:54', '0');
INSERT INTO `user_role` VALUES ('admin', 'admin', '管理员', '37299754-2e32-4f82-80a5-bdb266fc8941', '6bc2b7ed-ce71-4a19-8451-051dd6db9b7d', '~', '2017-04-06 14:41:54', '0');
INSERT INTO `user_role` VALUES ('测试', 'role0', 'test0', '3be08b31-d3ea-4b7c-a89e-3d3d9d25f326', 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', '~', '2017-04-01 11:29:29', '0');
INSERT INTO `user_role` VALUES (null, 'test00000', 'dept00000', '944b6460-15df-4e08-befa-c539d84e8c2c', null, '~', '2017-04-04 19:11:50', '0');
INSERT INTO `user_role` VALUES ('测试', 'role3', 'test3', 'e5057fc2-351c-4fe8-92cb-c31afaa958c7', 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', '~', '2017-04-01 11:29:29', '0');
INSERT INTO `user_role` VALUES ('测试', 'role1', 'test1', 'ea3ef042-ca15-4840-b5c2-f69827437932', 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', '~', '2017-04-01 11:29:29', '0');
INSERT INTO `user_role` VALUES ('测试', 'role4', 'test4', 'ead37aaa-4409-4dc1-acc5-352ef7c55498', 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', '~', '2017-04-01 11:29:29', '0');
INSERT INTO `user_role` VALUES ('测试', 'role2', 'test2', 'ee694ad1-a3fc-493a-82c5-5b18c49b1ea7', 'ed631e6d-921e-46dc-ab3b-6970a3f2a06a', '~', '2017-04-01 11:29:29', '0');
