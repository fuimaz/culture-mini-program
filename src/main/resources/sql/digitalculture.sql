/*
 Navicat MySQL Data Transfer

 Source Server         : 美兰两馆
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : 172.16.104.45:3306
 Source Schema         : digitalculture

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 07/04/2020 15:07:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activityName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `activityDesc` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动介绍',
  `activityType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类别',
  `responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动负责人',
  `isVerify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过审核',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `stratTime` datetime(0) NULL DEFAULT NULL COMMENT '活动开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '活动结束时间',
  `depot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `orders` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人数',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动主办单位',
  `asstCompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动协办单位',
  `responsiblePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `funds` decimal(10, 0) NULL DEFAULT NULL COMMENT '经费',
  `oneCost` decimal(10, 0) NULL DEFAULT NULL COMMENT '单人费用',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划状态',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动图片',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动视频',
  `authMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `booked` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已预约人数',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for actteam
-- ----------------------------
DROP TABLE IF EXISTS `actteam`;
CREATE TABLE `actteam`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teamName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文艺团名称',
  `responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文艺团负责人',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文艺团编号',
  `responsiblePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文艺团负责人电话',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人电话',
  `dateTime` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  `depot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约地点',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约类型  包括场地、场馆、活动',
  `process` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `memberTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人的TID',
  `bookTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约记录的TID',
  `way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约方式  PC或手机',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `Tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `lastModifyTime` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `numberType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码类型',
  `oldName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原名',
  `years` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年代',
  `concreteYears` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体年代',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文物类别',
  `quality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质地',
  `qualityOne` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质地一',
  `qualityTwo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质地二',
  `count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `length` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长',
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高',
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宽',
  `concreteSize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体尺寸',
  `massRang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质量范围',
  `mass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体质量',
  `massType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质量单位',
  `degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文物等级',
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `complete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完缺程度',
  `completeDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完缺状况',
  `conditionString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存状态',
  `inYear` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入藏时间范围',
  `concreteInYear` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体入藏时间',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  `cunjuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存卷',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存状态',
  `useState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本身状态',
  `middleCount` int(255) NULL DEFAULT NULL COMMENT '中间数字',
  `inorout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进出状态',
  `responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `storeRoom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '储藏室',
  `init` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `imageTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ecpCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'epc编码',
  `ecpTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'epcTid',
  `ecpQRCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'epc二维码',
  `imageCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depreciation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折旧率',
  `scrapcondition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报废条件',
  PRIMARY KEY (`Tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for collection_life
-- ----------------------------
DROP TABLE IF EXISTS `collection_life`;
CREATE TABLE `collection_life`  (
  `Tid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ecpCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'epc编号',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastMidifyTime` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `operationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `operationPerson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operationDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作详情',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作后的状态',
  `useState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作后的保存状态',
  `toPlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeRoom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '储存地点',
  PRIMARY KEY (`Tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for corporation
-- ----------------------------
DROP TABLE IF EXISTS `corporation`;
CREATE TABLE `corporation`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cursor
-- ----------------------------
DROP TABLE IF EXISTS `cursor`;
CREATE TABLE `cursor`  (
  `tid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monuments_tid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deviceCoding` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dateresource
-- ----------------------------
DROP TABLE IF EXISTS `dateresource`;
CREATE TABLE `dateresource`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约资源库',
  `dateTime` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  `resourceName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `resourceTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源TID',
  `resourceDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源详情',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `TID` int(36) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastModifyBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lastModifyTime` datetime(0) NULL DEFAULT NULL,
  `oprateTime` datetime(0) NULL DEFAULT NULL,
  `oprateServiceTime` datetime(0) NULL DEFAULT NULL,
  `productState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oprateType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depot_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `getDate` datetime(0) NULL DEFAULT NULL,
  `ecpCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkPrice` double NULL DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ownDep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typeForSearch` int(11) NULL DEFAULT NULL,
  `depotTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oldCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for live
-- ----------------------------
DROP TABLE IF EXISTS `live`;
CREATE TABLE `live`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '直播表',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直播名称',
  `startTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsiblePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直播类型',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员表',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `QRString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` double NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for membercounttable
-- ----------------------------
DROP TABLE IF EXISTS `membercounttable`;
CREATE TABLE `membercounttable`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `memberTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `change` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for onlinecollection
-- ----------------------------
DROP TABLE IF EXISTS `onlinecollection`;
CREATE TABLE `onlinecollection`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `onlineName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `insertTime` datetime(0) NULL DEFAULT NULL,
  `insertPerson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `onlineshowTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for onlineshow
-- ----------------------------
DROP TABLE IF EXISTS `onlineshow`;
CREATE TABLE `onlineshow`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `insertTime` datetime(0) NULL DEFAULT NULL,
  `showName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `process` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `readCount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for opuscollecte
-- ----------------------------
DROP TABLE IF EXISTS `opuscollecte`;
CREATE TABLE `opuscollecte`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `writer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `insertTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for placeresource
-- ----------------------------
DROP TABLE IF EXISTS `placeresource`;
CREATE TABLE `placeresource`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `insertTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for proces
-- ----------------------------
DROP TABLE IF EXISTS `proces`;
CREATE TABLE `proces`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `startOperator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程适用开始职位',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程开始的部门',
  `forOldTID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改前的TID 防止修改后找不到对应的TID',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `lastModifyTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for processall
-- ----------------------------
DROP TABLE IF EXISTS `processall`;
CREATE TABLE `processall`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `startMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开始人',
  `processGroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对应那条流程模范',
  `startTime` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程当前状态',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程部门',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程标题',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '流程结束时间',
  `lastOperator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后的审核人',
  `lastApproval` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后的审核级别',
  `forOldTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改前的TID 防止修改后找不到对应的TID',
  `projectTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for processlife
-- ----------------------------
DROP TABLE IF EXISTS `processlife`;
CREATE TABLE `processlife`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `processGroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对应的流程模板',
  `fromPerson` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上一层的级别',
  `toApproval` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前级别',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批结果',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程部门',
  `operateTime` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人',
  `startMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发起人',
  `allProcessTID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '对应的流程总概述TID',
  `lastOperator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上一步的审核人',
  `lastTID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上一步流程生命链的TID',
  `processlistTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对应的步骤模板TID',
  `sequence` int(11) NULL DEFAULT NULL COMMENT '实际一条审批流程的执行顺序  递增',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `toPerson` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `insertTime` datetime(0) NULL DEFAULT NULL,
  `lastOperateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for processlist
-- ----------------------------
DROP TABLE IF EXISTS `processlist`;
CREATE TABLE `processlist`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dep` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '使用这套流程的部门',
  `groupTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '一组流程的TID',
  `processIndex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否是开头或结尾  first,end,normal分别表示起始，结束，中间普通',
  `lastTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上一步的TID',
  `nextTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '下一步的TID',
  `approval` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人级别',
  `forOldTID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL COMMENT '流程顺序',
  `positionX` int(11) NULL DEFAULT NULL COMMENT 'X轴位置',
  `positionY` int(11) NULL DEFAULT NULL COMMENT 'Y轴位置',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for talent
-- ----------------------------
DROP TABLE IF EXISTS `talent`;
CREATE TABLE `talent`  (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文艺人才表',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `idNo` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birth` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `school` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `degree` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `workUnit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `phoneNo` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mobileNo` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `interest` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好特长',
  `experience` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工艺经历',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `auditing` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `img` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人才照片',
  `idImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证照片',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `state` int(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`TID`) USING BTREE,
  UNIQUE KEY `unique_idNo` (`idNo`) USING BTREE COMMENT '身份证号唯一'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for venues
-- ----------------------------
DROP TABLE IF EXISTS `venues`;
CREATE TABLE `venues`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆名',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆人数',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆地址',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  `startTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `allCount` int(11) NULL DEFAULT NULL COMMENT '全部花费',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆状态',
  `hourCost` decimal(10, 0) NULL DEFAULT NULL COMMENT '每小时花费',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆图片',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆视频',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场类型',
  `tel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆负责人电话',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for venuesbook
-- ----------------------------
DROP TABLE IF EXISTS `venuesbook`;
CREATE TABLE `venuesbook`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `venuesTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '场馆id',
  `booktime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `startTime` datetime(0) NULL DEFAULT NULL COMMENT '预约开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '预约结束时间',
  `activityTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约活动id',
  `activityName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约活动id',
  `venuesName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场馆名',
  `responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人',
  `responsiblePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约人电话',
  `hourCost` decimal(10, 0) NULL DEFAULT NULL COMMENT '每小时花费',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for volunteer
-- ----------------------------
DROP TABLE IF EXISTS `volunteer`;
CREATE TABLE `volunteer`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `joinTime` datetime(0) NULL DEFAULT NULL,
  `skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for volunteertask
-- ----------------------------
DROP TABLE IF EXISTS `volunteertask`;
CREATE TABLE `volunteertask`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taskName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `volunteerCount` int(11) NULL DEFAULT NULL,
  `depot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost` decimal(10, 0) NULL DEFAULT NULL,
  `responsible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsiblePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activityTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for volunteerwork
-- ----------------------------
DROP TABLE IF EXISTS `volunteerwork`;
CREATE TABLE `volunteerwork`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activityTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `volunteerTid` int(11) NULL DEFAULT NULL,
  `volunteerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `volunteerPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for votestore
-- ----------------------------
DROP TABLE IF EXISTS `votestore`;
CREATE TABLE `votestore`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `voteTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `startMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案类型 多选、单选、自由发挥',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for votetable
-- ----------------------------
DROP TABLE IF EXISTS `votetable`;
CREATE TABLE `votetable`  (
  `TID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionTid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userTid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞的类型',
  `targetTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞内容的Tid',
  `memberTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞的会员id',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`),
  UNIQUE KEY `unique_mTid_lTid` (`memberTid`,`targetTid`) USING BTREE COMMENT '会员Tid与点赞内容组成唯一索引'
) ENGINE=InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for myCollection
-- ----------------------------
DROP TABLE IF EXISTS `myCollection`;
CREATE TABLE `myCollection` (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏的类型',
  `targetTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏内容的Tid',
  `memberTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏的会员id',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`),
  UNIQUE KEY `unique_mTid_lTid` (`memberTid`,`targetTid`) USING BTREE COMMENT '会员Tid与收藏内容组成唯一索引'
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '内容',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `brief` text CHARACTER SET utf8mb4 COMMENT '简介',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `backgroundImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '背景图',
  `show` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展示',
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact COMMENT='新闻资讯表';

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标注点名',
  `detail` text CHARACTER SET utf8mb4 NOT NULL COMMENT '详情',
  `brief` text CHARACTER SET utf8mb4 COMMENT '简介',
  `auditing` tinyint(1) NOT NULL COMMENT '审核状态',
  `lng` decimal(10,6) NOT NULL COMMENT '经度',
  `lat` decimal(10,6) NOT NULL COMMENT '纬度',
  `authMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `img` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '背景图',
  `show` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展示',
  `sort` int(10) unsigned zerofill NOT NULL COMMENT '排序',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact COMMENT='标注点表';


-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路线名',
  `detail` text CHARACTER SET utf8mb4 NOT NULL COMMENT '描述',
  `brief` text CHARACTER SET utf8mb4 COMMENT '简介',
  `auditing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `authMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `img` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '背景图',
  `show` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展示',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact COMMENT='路线图表';


-- ----------------------------
-- Table structure for route_relate
-- ----------------------------
DROP TABLE IF EXISTS `route_relate`;
CREATE TABLE `route_relate` (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `routeTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路线名',
  `siteTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `order` int(10) NOT NULL COMMENT '顺序',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`),
  UNIQUE KEY `unique_rTid_sTid` (`routeTid`,`siteTid`) USING BTREE COMMENT '路线id与标注点唯一'
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact COMMENT='路线标注点关联表';


-- ----------------------------
-- Table structure for site_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `site_evaluation`;
CREATE TABLE `site_evaluation` (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `siteTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `memberTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员id',
  `auditing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `authMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '内容',
  `show` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展示',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`),
  UNIQUE KEY `unique_rTid_sTid` (`siteTid`, `memberTid`) USING BTREE COMMENT '会员id与标注点唯一'
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact COMMENT='标注点评价表';

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '内容',
  `relateTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '需要发送消息的记录id',
  `memberTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员id',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '手机号',
  `state` int(10) NOT NULL COMMENT '状态',
  `notifyTime` datetime DEFAULT NULL COMMENT '通知时间',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`) USING BTREE,
  UNIQUE KEY `unique_mTid_rTid_type` (`memberTid`, `relateTid`, `type`) USING BTREE COMMENT '关联id与会员id唯一',
  KEY `idx_type_create` (`type`,`createTime`) USING BTREE COMMENT '类型与创建时间索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for literary_team
-- ----------------------------
DROP TABLE IF EXISTS `literary_team`;
CREATE TABLE `literary_team`  (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队名',
  `applicant` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `companyType` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经济类型',
  `capital` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资本',
  `authority` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记注册机关',
  `bizScope` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营范围',
  `regNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册号',
  `representative` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代表人',
  `repMobileNo` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代表人手机号',
  `repPhone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代表人固定电话',
  `repId` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代表人身份证号',
  `leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `leaderMobileNo` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人手机号',
  `leaderPhone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人固定电话',
  `leaderId` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人身份证号',
  `zipCode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住所邮编',
  `residence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住所',
  `faxPhone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住所传真电话',
  `bizAddr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营地址',
  `bizZipCode` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营地址邮编',
  `bizFaxPhone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营地址传真',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `auditing` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `regImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册登记表照片',
  `bizLicImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业执照照片',
  `constitutionImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '章程照片',
  `repIdImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法定代表人照片',
  `equipmentImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备清单照片',
  `addressImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '住所使用证明照片',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `state` int(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`TID`) USING BTREE,
  UNIQUE KEY `unique_idNo` (`repId`) USING BTREE COMMENT '注册号唯一'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact COMMENT='文艺团队服务表';

-- ----------------------------
-- Table structure for lit_team_member
-- ----------------------------
DROP TABLE IF EXISTS `lit_team_member`;
CREATE TABLE `lit_team_member`  (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `teamTID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `major` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `idNo` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `degree` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历或职称',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `auditing` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `img` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人才照片',
  `idImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证照片',
  `abilityImg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '能力证明照片',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `state` int(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`TID`) USING BTREE,
  UNIQUE KEY `unique_team_idNo` (`teamTID`, `idNo`) USING BTREE COMMENT '队伍成员唯一'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact COMMENT='文艺团队成员表';

-- ----------------------------
-- Table structure for common_comment
-- ----------------------------
DROP TABLE IF EXISTS `common_comment`;
CREATE TABLE `common_comment`  (
  `TID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论表',
  `targetTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论对象id',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论对象类型',
  `star` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '星级',
  `userTid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`TID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


SET FOREIGN_KEY_CHECKS = 1;
