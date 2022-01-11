/*
 Navicat Premium Data Transfer

 Source Server         : Everest_M
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Schema         : mall_pms

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/11/2021 00:32:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pms_attr
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr`;
CREATE TABLE `pms_attr`  (
  `attr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性名',
  `search_type` tinyint(4) NULL DEFAULT NULL COMMENT '是否需要检索[0-不需要，1-需要]',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性图标',
  `value_select` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '可选值列表[用分号分隔]',
  `attr_type` tinyint(4) NULL DEFAULT NULL COMMENT '属性类型[0-销售属性，1-基本属性',
  `enable` bigint(20) NULL DEFAULT NULL COMMENT '启用状态[0 - 禁用，1 - 启用]',
  `catelog_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分类',
  `show_desc` tinyint(4) NULL DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`attr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_attr
-- ----------------------------
INSERT INTO `pms_attr` VALUES (1, '入网参数', 1, 'xxx', '4G;5G', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (2, '上市年份', 1, 'xxx', '2019;2020;2021', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (3, '颜色', 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/1.jpg', '极光蓝;钛空银;霓影紫;流光幻镜', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (4, '颜色', 0, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/1.jpg', '极光蓝;钛空银;霓影紫;流光幻镜', 0, 1, 225, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (5, '内存', 0, 'xxx', '4G;6G;8G;12G', 0, 1, 225, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (6, '套餐', 0, 'xxx', '套餐一;套餐二;套餐三', 0, 1, 225, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (7, 'CPU型号', 1, 'xxx', '麒麟990;麒麟820', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (8, 'CPU工艺', 1, 'xxx', '7nm;5nm;3nm', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (9, '电池容量', 1, 'xxx', '3500mAh;4000mAh;5000mAh', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (10, '机身长度(mm)', 1, 'xxx', '168;155;172', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (11, '版本', 0, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_%E5%9B%BE%E9%9B%861.jpg', '8GB+128GB;8GB+256GB;12GB+256GB', 0, 1, 225, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr` VALUES (12, 'CPU品牌', 1, 'xxx', '海思(Hisilicon);高通(Qualcomm)', 1, 1, 225, 1, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_attr_attrgroup_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_attrgroup_relation`;
CREATE TABLE `pms_attr_attrgroup_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_id` bigint(20) NULL DEFAULT NULL COMMENT '属性id',
  `attr_group_id` bigint(20) NULL DEFAULT NULL COMMENT '属性分组id',
  `attr_sort` int(11) NULL DEFAULT NULL COMMENT '属性组内排序',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '属性&属性分组关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_attr_attrgroup_relation
-- ----------------------------
INSERT INTO `pms_attr_attrgroup_relation` VALUES (6, 3, 1, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_attrgroup_relation` VALUES (7, 2, 1, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_attrgroup_relation` VALUES (8, 1, 2, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_attrgroup_relation` VALUES (9, 7, 4, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_attrgroup_relation` VALUES (10, 8, 4, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_attrgroup_relation` VALUES (11, 9, 2, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_attrgroup_relation` VALUES (12, 10, 2, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_attrgroup_relation` VALUES (13, 12, 4, 0, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_attr_group
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_group`;
CREATE TABLE `pms_attr_group`  (
  `attr_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `attr_group_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组名',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `descript` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组图标',
  `catelog_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分类id',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`attr_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '属性分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_attr_group
-- ----------------------------
INSERT INTO `pms_attr_group` VALUES (1, '信息', 0, '荣耀', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/1.jpg', 225, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_group` VALUES (2, '基本信息', 0, '华为', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/1.jpg', 225, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_group` VALUES (3, '香奈儿', 0, 'fire', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/1.jpg', 637, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_attr_group` VALUES (4, '芯片', 0, 'CPU型号', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/1.jpg', 225, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌名',
  `logo` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌logo地址',
  `descript` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '介绍',
  `show_status` tinyint(4) NULL DEFAULT NULL COMMENT '显示状态[0-不显示；1-显示]',
  `first_letter` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '检索首字母',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '品牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '荣耀', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/08/71024f89-f89e-46f2-8d81-5c1f9bf49318_honor.png', '荣耀', 1, 'r', 23, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (2, '华为', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/08/3ffc4621-278d-4ba7-87fe-2679dc1d79b9_huawei.png', '华为', 1, 'h', 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (3, '小米', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/08/c3d06b19-cfec-452f-85dd-84adb4e344c3_xiaomi.png', '小米', 1, 'm', 3, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (4, 'oppo', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/08/4a1e8fe2-6cac-4a52-88e2-0869d3f8b849_oppo.png', 'oppo', 1, 'o', 2, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (5, 'vivo', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/08/6735e0da-f1a3-455b-8f62-68a2b7128a7f_vivo.png', 'vivo', 1, 'v', 2, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (6, '小熊', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/01/37231ebe-f975-4848-83e6-472c2d14a37c_1.jpg', '基压标', 0, 'x', 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (7, '三星', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/08/bef62a38-2692-42ba-8ffc-12f40577188e_samsung.png', '三星', 1, 'S', 2, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (13, 'apple', 'https://gulimail-dong.oss-cn-hangzhou.aliyuncs.com/2021/11/08/cae588a6-754a-423d-8094-c3b804c1575d_apple.png', 'apple', 1, 'A', 1, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_category`;
CREATE TABLE `pms_category`  (
  `cat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `parent_cid` bigint(20) NULL DEFAULT NULL COMMENT '父分类id',
  `cat_level` int(11) NULL DEFAULT NULL COMMENT '层级',
  `show_status` tinyint(4) NULL DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标地址',
  `product_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计量单位',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`cat_id`) USING BTREE,
  INDEX `parent_cid`(`parent_cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1437 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品三级分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_category
-- ----------------------------
INSERT INTO `pms_category` VALUES (1, '图书、音像、电子书刊', 0, 1, 1, 1, NULL, NULL, 0, '#1', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (2, '手机', 0, 1, 1, 0, NULL, NULL, 0, '#2', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (3, '家用电器', 0, 1, 1, 2, NULL, NULL, 0, '#3', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (4, '数码', 0, 1, 1, 3, NULL, NULL, 0, '#4', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (5, '家居家装', 0, 1, 1, 4, NULL, NULL, 0, '#5', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (6, '电脑办公', 0, 1, 1, 5, NULL, NULL, 0, '#6', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (7, '厨具', 0, 1, 1, 6, NULL, NULL, 0, '#7', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (8, '个护化妆', 0, 1, 1, 7, NULL, NULL, 0, '#8', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (9, '服饰内衣', 0, 1, 1, 8, NULL, NULL, 0, '#9', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (10, '钟表', 0, 1, 1, 9, NULL, NULL, 0, '#10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (11, '鞋靴', 0, 1, 1, 10, NULL, NULL, 0, '#11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (12, '母婴', 0, 1, 1, 11, NULL, NULL, 0, '#12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (13, '礼品箱包', 0, 1, 1, 12, NULL, NULL, 0, '#13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (14, '食品饮料、保健食品', 0, 1, 1, 13, NULL, NULL, 0, '#14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (15, '珠宝', 0, 1, 1, 14, NULL, NULL, 0, '#15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (16, '汽车用品', 0, 1, 1, 15, NULL, NULL, 0, '#16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (17, '运动健康', 0, 1, 1, 16, NULL, NULL, 0, '#17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (18, '玩具乐器', 0, 1, 1, 17, NULL, NULL, 0, '#18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (19, '彩票、旅行、充值、票务', 0, 1, 1, 18, NULL, NULL, 0, '#19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (20, '生鲜', 0, 1, 1, 19, NULL, NULL, 0, '#20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (21, '整车', 0, 1, 1, 20, NULL, NULL, 0, '#21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (22, '电子书刊', 1, 2, 1, 0, NULL, NULL, 0, '#1#22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (23, '音像', 1, 2, 1, 0, NULL, NULL, 0, '#1#23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (24, '英文原版', 1, 2, 1, 0, NULL, NULL, 0, '#1#24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (25, '文艺', 1, 2, 1, 0, NULL, NULL, 0, '#1#25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (26, '少儿', 1, 2, 1, 0, NULL, NULL, 0, '#1#26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (27, '人文社科', 1, 2, 1, 0, NULL, NULL, 0, '#1#27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (28, '经管励志', 1, 2, 1, 0, NULL, NULL, 0, '#1#28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (29, '生活', 1, 2, 1, 0, NULL, NULL, 0, '#1#29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (30, '科技', 1, 2, 1, 0, NULL, NULL, 0, '#1#30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (31, '教育', 1, 2, 1, 0, NULL, NULL, 0, '#1#31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (32, '港台图书', 1, 2, 1, 0, NULL, NULL, 0, '#1#32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (33, '其他', 1, 2, 1, 0, NULL, NULL, 0, '#1#33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (34, '手机通讯', 2, 2, 1, 0, NULL, NULL, 0, '#2#34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (35, '运营商', 2, 2, 1, 0, NULL, NULL, 0, '#2#35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (36, '手机配件', 2, 2, 1, 0, NULL, NULL, 0, '#2#36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (37, '大 家 电', 3, 2, 1, 0, NULL, NULL, 0, '#3#37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (38, '厨卫大电', 3, 2, 1, 0, NULL, NULL, 0, '#3#38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (39, '厨房小电', 3, 2, 1, 0, NULL, NULL, 0, '#3#39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (40, '生活电器', 3, 2, 1, 0, NULL, NULL, 0, '#3#40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (41, '个护健康', 3, 2, 1, 0, NULL, NULL, 0, '#3#41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (42, '五金家装', 3, 2, 1, 0, NULL, NULL, 0, '#3#42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (43, '摄影摄像', 4, 2, 1, 0, NULL, NULL, 0, '#4#43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (44, '数码配件', 4, 2, 1, 0, NULL, NULL, 0, '#4#44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (45, '智能设备', 4, 2, 1, 0, NULL, NULL, 0, '#4#45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (46, '影音娱乐', 4, 2, 1, 0, NULL, NULL, 0, '#4#46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (47, '电子教育', 4, 2, 1, 0, NULL, NULL, 0, '#4#47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (48, '虚拟商品', 4, 2, 1, 0, NULL, NULL, 0, '#4#48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (49, '家纺', 5, 2, 1, 0, NULL, NULL, 0, '#5#49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (50, '灯具', 5, 2, 1, 0, NULL, NULL, 0, '#5#50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (51, '生活日用', 5, 2, 1, 0, NULL, NULL, 0, '#5#51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (52, '家装软饰', 5, 2, 1, 0, NULL, NULL, 0, '#5#52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (53, '宠物生活', 5, 2, 1, 0, NULL, NULL, 0, '#5#53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (54, '电脑整机', 6, 2, 1, 0, NULL, NULL, 0, '#6#54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (55, '电脑配件', 6, 2, 1, 0, NULL, NULL, 0, '#6#55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (56, '外设产品', 6, 2, 1, 0, NULL, NULL, 0, '#6#56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (57, '游戏设备', 6, 2, 1, 0, NULL, NULL, 0, '#6#57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (58, '网络产品', 6, 2, 1, 0, NULL, NULL, 0, '#6#58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (59, '办公设备', 6, 2, 1, 0, NULL, NULL, 0, '#6#59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (60, '文具/耗材', 6, 2, 1, 0, NULL, NULL, 0, '#6#60', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (61, '服务产品', 6, 2, 1, 0, NULL, NULL, 0, '#6#61', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (62, '烹饪锅具', 7, 2, 1, 0, NULL, NULL, 0, '#7#62', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (63, '刀剪菜板', 7, 2, 1, 0, NULL, NULL, 0, '#7#63', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (64, '厨房配件', 7, 2, 1, 0, NULL, NULL, 0, '#7#64', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (65, '水具酒具', 7, 2, 1, 0, NULL, NULL, 0, '#7#65', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (66, '餐具', 7, 2, 1, 0, NULL, NULL, 0, '#7#66', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (67, '酒店用品', 7, 2, 1, 0, NULL, NULL, 0, '#7#67', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (68, '茶具/咖啡具', 7, 2, 1, 0, NULL, NULL, 0, '#7#68', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (69, '清洁用品', 8, 2, 1, 0, NULL, NULL, 0, '#8#69', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (70, '面部护肤', 8, 2, 1, 0, NULL, NULL, 0, '#8#70', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (71, '身体护理', 8, 2, 1, 0, NULL, NULL, 0, '#8#71', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (72, '口腔护理', 8, 2, 1, 0, NULL, NULL, 0, '#8#72', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (73, '女性护理', 8, 2, 1, 0, NULL, NULL, 0, '#8#73', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (74, '洗发护发', 8, 2, 1, 0, NULL, NULL, 0, '#8#74', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (75, '香水彩妆', 8, 2, 1, 0, NULL, NULL, 0, '#8#75', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (76, '女装', 9, 2, 1, 0, NULL, NULL, 0, '#9#76', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (77, '男装', 9, 2, 1, 0, NULL, NULL, 0, '#9#77', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (78, '内衣', 9, 2, 1, 0, NULL, NULL, 0, '#9#78', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (79, '洗衣服务', 9, 2, 1, 0, NULL, NULL, 0, '#9#79', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (80, '服饰配件', 9, 2, 1, 0, NULL, NULL, 0, '#9#80', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (81, '钟表', 10, 2, 1, 0, NULL, NULL, 0, '#10#81', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (82, '流行男鞋', 11, 2, 1, 0, NULL, NULL, 0, '#11#82', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (83, '时尚女鞋', 11, 2, 1, 0, NULL, NULL, 0, '#11#83', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (84, '奶粉', 12, 2, 1, 0, NULL, NULL, 0, '#12#84', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (85, '营养辅食', 12, 2, 1, 0, NULL, NULL, 0, '#12#85', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (86, '尿裤湿巾', 12, 2, 1, 0, NULL, NULL, 0, '#12#86', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (87, '喂养用品', 12, 2, 1, 0, NULL, NULL, 0, '#12#87', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (88, '洗护用品', 12, 2, 1, 0, NULL, NULL, 0, '#12#88', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (89, '童车童床', 12, 2, 1, 0, NULL, NULL, 0, '#12#89', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (90, '寝居服饰', 12, 2, 1, 0, NULL, NULL, 0, '#12#90', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (91, '妈妈专区', 12, 2, 1, 0, NULL, NULL, 0, '#12#91', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (92, '童装童鞋', 12, 2, 1, 0, NULL, NULL, 0, '#12#92', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (93, '安全座椅', 12, 2, 1, 0, NULL, NULL, 0, '#12#93', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (94, '潮流女包', 13, 2, 1, 0, NULL, NULL, 0, '#13#94', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (95, '精品男包', 13, 2, 1, 0, NULL, NULL, 0, '#13#95', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (96, '功能箱包', 13, 2, 1, 0, NULL, NULL, 0, '#13#96', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (97, '礼品', 13, 2, 1, 0, NULL, NULL, 0, '#13#97', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (98, '奢侈品', 13, 2, 1, 0, NULL, NULL, 0, '#13#98', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (99, '婚庆', 13, 2, 1, 0, NULL, NULL, 0, '#13#99', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (100, '进口食品', 14, 2, 1, 0, NULL, NULL, 0, '#14#100', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (101, '地方特产', 14, 2, 1, 0, NULL, NULL, 0, '#14#101', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (102, '休闲食品', 14, 2, 1, 0, NULL, NULL, 0, '#14#102', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (103, '粮油调味', 14, 2, 1, 0, NULL, NULL, 0, '#14#103', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (104, '饮料冲调', 14, 2, 1, 0, NULL, NULL, 0, '#14#104', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (105, '食品礼券', 14, 2, 1, 0, NULL, NULL, 0, '#14#105', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (106, '茗茶', 14, 2, 1, 0, NULL, NULL, 0, '#14#106', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (107, '时尚饰品', 15, 2, 1, 0, NULL, NULL, 0, '#15#107', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (108, '黄金', 15, 2, 1, 0, NULL, NULL, 0, '#15#108', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (109, 'K金饰品', 15, 2, 1, 0, NULL, NULL, 0, '#15#109', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (110, '金银投资', 15, 2, 1, 0, NULL, NULL, 0, '#15#110', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (111, '银饰', 15, 2, 1, 0, NULL, NULL, 0, '#15#111', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (112, '钻石', 15, 2, 1, 0, NULL, NULL, 0, '#15#112', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (113, '翡翠玉石', 15, 2, 1, 0, NULL, NULL, 0, '#15#113', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (114, '水晶玛瑙', 15, 2, 1, 0, NULL, NULL, 0, '#15#114', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (115, '彩宝', 15, 2, 1, 0, NULL, NULL, 0, '#15#115', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (116, '铂金', 15, 2, 1, 0, NULL, NULL, 0, '#15#116', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (117, '木手串/把件', 15, 2, 1, 0, NULL, NULL, 0, '#15#117', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (118, '珍珠', 15, 2, 1, 0, NULL, NULL, 0, '#15#118', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (119, '维修保养', 16, 2, 1, 0, NULL, NULL, 0, '#16#119', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (120, '车载电器', 16, 2, 1, 0, NULL, NULL, 0, '#16#120', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (121, '美容清洗', 16, 2, 1, 0, NULL, NULL, 0, '#16#121', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (122, '汽车装饰', 16, 2, 1, 0, NULL, NULL, 0, '#16#122', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (123, '安全自驾', 16, 2, 1, 0, NULL, NULL, 0, '#16#123', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (124, '汽车服务', 16, 2, 1, 0, NULL, NULL, 0, '#16#124', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (125, '赛事改装', 16, 2, 1, 0, NULL, NULL, 0, '#16#125', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (126, '运动鞋包', 17, 2, 1, 0, NULL, NULL, 0, '#17#126', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (127, '运动服饰', 17, 2, 1, 0, NULL, NULL, 0, '#17#127', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (128, '骑行运动', 17, 2, 1, 0, NULL, NULL, 0, '#17#128', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (129, '垂钓用品', 17, 2, 1, 0, NULL, NULL, 0, '#17#129', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (130, '游泳用品', 17, 2, 1, 0, NULL, NULL, 0, '#17#130', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (131, '户外鞋服', 17, 2, 1, 0, NULL, NULL, 0, '#17#131', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (132, '户外装备', 17, 2, 1, 0, NULL, NULL, 0, '#17#132', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (133, '健身训练', 17, 2, 1, 0, NULL, NULL, 0, '#17#133', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (134, '体育用品', 17, 2, 1, 0, NULL, NULL, 0, '#17#134', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (135, '适用年龄', 18, 2, 1, 0, NULL, NULL, 0, '#18#135', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (136, '遥控/电动', 18, 2, 1, 0, NULL, NULL, 0, '#18#136', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (137, '毛绒布艺', 18, 2, 1, 0, NULL, NULL, 0, '#18#137', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (138, '娃娃玩具', 18, 2, 1, 0, NULL, NULL, 0, '#18#138', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (139, '模型玩具', 18, 2, 1, 0, NULL, NULL, 0, '#18#139', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (140, '健身玩具', 18, 2, 1, 0, NULL, NULL, 0, '#18#140', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (141, '动漫玩具', 18, 2, 1, 0, NULL, NULL, 0, '#18#141', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (142, '益智玩具', 18, 2, 1, 0, NULL, NULL, 0, '#18#142', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (143, '积木拼插', 18, 2, 1, 0, NULL, NULL, 0, '#18#143', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (144, 'DIY玩具', 18, 2, 1, 0, NULL, NULL, 0, '#18#144', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (145, '创意减压', 18, 2, 1, 0, NULL, NULL, 0, '#18#145', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (146, '乐器', 18, 2, 1, 0, NULL, NULL, 0, '#18#146', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (147, '彩票', 19, 2, 1, 0, NULL, NULL, 0, '#19#147', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (148, '机票', 19, 2, 1, 0, NULL, NULL, 0, '#19#148', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (149, '酒店', 19, 2, 1, 0, NULL, NULL, 0, '#19#149', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (150, '旅行', 19, 2, 1, 0, NULL, NULL, 0, '#19#150', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (151, '充值', 19, 2, 1, 0, NULL, NULL, 0, '#19#151', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (152, '游戏', 19, 2, 1, 0, NULL, NULL, 0, '#19#152', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (153, '票务', 19, 2, 1, 0, NULL, NULL, 0, '#19#153', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (154, '产地直供', 20, 2, 1, 0, NULL, NULL, 0, '#20#154', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (155, '水果', 20, 2, 1, 0, NULL, NULL, 0, '#20#155', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (156, '猪牛羊肉', 20, 2, 1, 0, NULL, NULL, 0, '#20#156', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (157, '海鲜水产', 20, 2, 1, 0, NULL, NULL, 0, '#20#157', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (158, '禽肉蛋品', 20, 2, 1, 0, NULL, NULL, 0, '#20#158', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (159, '冷冻食品', 20, 2, 1, 0, NULL, NULL, 0, '#20#159', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (160, '熟食腊味', 20, 2, 1, 0, NULL, NULL, 0, '#20#160', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (161, '饮品甜品', 20, 2, 1, 0, NULL, NULL, 0, '#20#161', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (162, '蔬菜', 20, 2, 1, 0, NULL, NULL, 0, '#20#162', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (163, '全新整车', 21, 2, 1, 0, NULL, NULL, 0, '#21#163', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (164, '二手车', 21, 2, 1, 0, NULL, NULL, 0, '#21#164', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (165, '电子书', 22, 3, 1, 0, NULL, NULL, 0, '#1#22#165', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (166, '网络原创', 22, 3, 1, 0, NULL, NULL, 0, '#1#22#166', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (167, '数字杂志', 22, 3, 1, 0, NULL, NULL, 0, '#1#22#167', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (168, '多媒体图书', 22, 3, 1, 0, NULL, NULL, 0, '#1#22#168', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (169, '音乐', 23, 3, 1, 0, NULL, NULL, 0, '#1#23#169', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (170, '影视', 23, 3, 1, 0, NULL, NULL, 0, '#1#23#170', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (171, '教育音像', 23, 3, 1, 0, NULL, NULL, 0, '#1#23#171', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (172, '少儿', 24, 3, 1, 0, NULL, NULL, 0, '#1#24#172', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (173, '商务投资', 24, 3, 1, 0, NULL, NULL, 0, '#1#24#173', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (174, '英语学习与考试', 24, 3, 1, 0, NULL, NULL, 0, '#1#24#174', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (175, '文学', 24, 3, 1, 0, NULL, NULL, 0, '#1#24#175', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (176, '传记', 24, 3, 1, 0, NULL, NULL, 0, '#1#24#176', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (177, '励志', 24, 3, 1, 0, NULL, NULL, 0, '#1#24#177', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (178, '小说', 25, 3, 1, 0, NULL, NULL, 0, '#1#25#178', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (179, '文学', 25, 3, 1, 0, NULL, NULL, 0, '#1#25#179', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (180, '青春文学', 25, 3, 1, 0, NULL, NULL, 0, '#1#25#180', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (181, '传记', 25, 3, 1, 0, NULL, NULL, 0, '#1#25#181', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (182, '艺术', 25, 3, 1, 0, NULL, NULL, 0, '#1#25#182', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (183, '少儿', 26, 3, 1, 0, NULL, NULL, 0, '#1#26#183', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (184, '0-2岁', 26, 3, 1, 0, NULL, NULL, 0, '#1#26#184', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (185, '3-6岁', 26, 3, 1, 0, NULL, NULL, 0, '#1#26#185', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (186, '7-10岁', 26, 3, 1, 0, NULL, NULL, 0, '#1#26#186', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (187, '11-14岁', 26, 3, 1, 0, NULL, NULL, 0, '#1#26#187', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (188, '历史', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#188', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (189, '哲学', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#189', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (190, '国学', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#190', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (191, '政治/军事', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#191', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (192, '法律', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#192', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (193, '人文社科', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#193', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (194, '心理学', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#194', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (195, '文化', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#195', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (196, '社会科学', 27, 3, 1, 0, NULL, NULL, 0, '#1#27#196', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (197, '经济', 28, 3, 1, 0, NULL, NULL, 0, '#1#28#197', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (198, '金融与投资', 28, 3, 1, 0, NULL, NULL, 0, '#1#28#198', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (199, '管理', 28, 3, 1, 0, NULL, NULL, 0, '#1#28#199', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (200, '励志与成功', 28, 3, 1, 0, NULL, NULL, 0, '#1#28#200', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (201, '生活', 29, 3, 1, 0, NULL, NULL, 0, '#1#29#201', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (202, '健身与保健', 29, 3, 1, 0, NULL, NULL, 0, '#1#29#202', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (203, '家庭与育儿', 29, 3, 1, 0, NULL, NULL, 0, '#1#29#203', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (204, '旅游', 29, 3, 1, 0, NULL, NULL, 0, '#1#29#204', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (205, '烹饪美食', 29, 3, 1, 0, NULL, NULL, 0, '#1#29#205', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (206, '工业技术', 30, 3, 1, 0, NULL, NULL, 0, '#1#30#206', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (207, '科普读物', 30, 3, 1, 0, NULL, NULL, 0, '#1#30#207', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (208, '建筑', 30, 3, 1, 0, NULL, NULL, 0, '#1#30#208', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (209, '医学', 30, 3, 1, 0, NULL, NULL, 0, '#1#30#209', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (210, '科学与自然', 30, 3, 1, 0, NULL, NULL, 0, '#1#30#210', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (211, '计算机与互联网', 30, 3, 1, 0, NULL, NULL, 0, '#1#30#211', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (212, '电子通信', 30, 3, 1, 0, NULL, NULL, 0, '#1#30#212', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (213, '中小学教辅', 31, 3, 1, 0, NULL, NULL, 0, '#1#31#213', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (214, '教育与考试', 31, 3, 1, 0, NULL, NULL, 0, '#1#31#214', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (215, '外语学习', 31, 3, 1, 0, NULL, NULL, 0, '#1#31#215', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (216, '大中专教材', 31, 3, 1, 0, NULL, NULL, 0, '#1#31#216', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (217, '字典词典', 31, 3, 1, 0, NULL, NULL, 0, '#1#31#217', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (218, '艺术/设计/收藏', 32, 3, 1, 0, NULL, NULL, 0, '#1#32#218', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (219, '经济管理', 32, 3, 1, 0, NULL, NULL, 0, '#1#32#219', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (220, '文化/学术', 32, 3, 1, 0, NULL, NULL, 0, '#1#32#220', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (221, '少儿', 32, 3, 1, 0, NULL, NULL, 0, '#1#32#221', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (222, '工具书', 33, 3, 1, 0, NULL, NULL, 0, '#1#33#222', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (223, '杂志/期刊', 33, 3, 1, 0, NULL, NULL, 0, '#1#33#223', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (224, '套装书', 33, 3, 1, 0, NULL, NULL, 0, '#1#33#224', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (225, '手机', 34, 3, 1, 0, '', NULL, 0, '#2#34#225', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (226, '对讲机', 34, 3, 1, 0, NULL, NULL, 0, '#2#34#226', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (227, '合约机', 35, 3, 1, 0, NULL, NULL, 0, '#2#35#227', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (228, '选号中心', 35, 3, 1, 0, NULL, NULL, 0, '#2#35#228', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (229, '装宽带', 35, 3, 1, 0, NULL, NULL, 0, '#2#35#229', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (230, '办套餐', 35, 3, 1, 0, NULL, NULL, 0, '#2#35#230', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (231, '移动电源', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#231', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (232, '电池/移动电源', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#232', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (233, '蓝牙耳机', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#233', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (234, '充电器/数据线', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#234', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (235, '苹果周边', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#235', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (236, '手机耳机', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#236', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (237, '手机贴膜', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#237', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (238, '手机存储卡', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#238', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (239, '充电器', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#239', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (240, '数据线', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#240', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (241, '手机保护套', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#241', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (242, '车载配件', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#242', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (243, 'iPhone 配件', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#243', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (244, '手机电池', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#244', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (245, '创意配件', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#245', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (246, '便携/无线音响', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#246', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (247, '手机饰品', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#247', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (248, '拍照配件', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#248', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (249, '手机支架', 36, 3, 1, 0, NULL, NULL, 0, '#2#36#249', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (250, '平板电视', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#250', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (251, '空调', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#251', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (252, '冰箱', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#252', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (253, '洗衣机', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#253', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (254, '家庭影院', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#254', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (255, 'DVD/电视盒子', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#255', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (256, '迷你音响', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#256', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (257, '冷柜/冰吧', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#257', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (258, '家电配件', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#258', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (259, '功放', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#259', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (260, '回音壁/Soundbar', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#260', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (261, 'Hi-Fi专区', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#261', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (262, '电视盒子', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#262', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (263, '酒柜', 37, 3, 1, 0, NULL, NULL, 0, '#3#37#263', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (264, '燃气灶', 38, 3, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (265, '油烟机', 38, 3, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (266, '热水器', 38, 3, 1, 0, NULL, NULL, 0, '#3#38#266', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (267, '消毒柜', 38, 3, 1, 0, NULL, NULL, 0, '#3#38#267', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (268, '洗碗机', 38, 3, 1, 0, NULL, NULL, 0, '#3#38#268', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (269, '料理机', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#269', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (270, '榨汁机', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#270', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (271, '电饭煲', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#271', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (272, '电压力锅', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#272', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (273, '豆浆机', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#273', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (274, '咖啡机', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#274', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (275, '微波炉', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#275', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (276, '电烤箱', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#276', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (277, '电磁炉', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#277', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (278, '面包机', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#278', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (279, '煮蛋器', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#279', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (280, '酸奶机', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#280', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (281, '电炖锅', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#281', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (282, '电水壶/热水瓶', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#282', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (283, '电饼铛', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#283', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (284, '多用途锅', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#284', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (285, '电烧烤炉', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#285', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (286, '果蔬解毒机', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#286', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (287, '其它厨房电器', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#287', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (288, '养生壶/煎药壶', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#288', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (289, '电热饭盒', 39, 3, 1, 0, NULL, NULL, 0, '#3#39#289', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (290, '取暖电器', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#290', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (291, '净化器', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#291', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (292, '加湿器', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#292', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (293, '扫地机器人', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#293', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (294, '吸尘器', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#294', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (295, '挂烫机/熨斗', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#295', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (296, '插座', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#296', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (297, '电话机', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#297', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (298, '清洁机', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#298', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (299, '除湿机', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#299', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (300, '干衣机', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#300', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (301, '收录/音机', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#301', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (302, '电风扇', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#302', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (303, '冷风扇', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#303', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (304, '其它生活电器', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#304', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (305, '生活电器配件', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#305', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (306, '净水器', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#306', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (307, '饮水机', 40, 3, 1, 0, NULL, NULL, 0, '#3#40#307', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (308, '剃须刀', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#308', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (309, '剃/脱毛器', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#309', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (310, '口腔护理', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#310', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (311, '电吹风', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#311', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (312, '美容器', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#312', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (313, '理发器', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#313', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (314, '卷/直发器', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#314', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (315, '按摩椅', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#315', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (316, '按摩器', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#316', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (317, '足浴盆', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#317', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (318, '血压计', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#318', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (319, '电子秤/厨房秤', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#319', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (320, '血糖仪', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#320', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (321, '体温计', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#321', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (322, '其它健康电器', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#322', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (323, '计步器/脂肪检测仪', 41, 3, 1, 0, NULL, NULL, 0, '#3#41#323', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (324, '电动工具', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#324', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (325, '手动工具', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#325', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (326, '仪器仪表', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#326', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (327, '浴霸/排气扇', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#327', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (328, '灯具', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#328', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (329, 'LED灯', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#329', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (330, '洁身器', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#330', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (331, '水槽', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#331', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (332, '龙头', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#332', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (333, '淋浴花洒', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#333', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (334, '厨卫五金', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#334', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (335, '家具五金', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#335', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (336, '门铃', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#336', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (337, '电气开关', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#337', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (338, '插座', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#338', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (339, '电工电料', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#339', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (340, '监控安防', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#340', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (341, '电线/线缆', 42, 3, 1, 0, NULL, NULL, 0, '#3#42#341', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (342, '数码相机', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#342', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (343, '单电/微单相机', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#343', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (344, '单反相机', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#344', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (345, '摄像机', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#345', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (346, '拍立得', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#346', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (347, '运动相机', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#347', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (348, '镜头', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#348', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (349, '户外器材', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#349', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (350, '影棚器材', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#350', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (351, '冲印服务', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#351', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (352, '数码相框', 43, 3, 1, 0, NULL, NULL, 0, '#4#43#352', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (353, '存储卡', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#353', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (354, '读卡器', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#354', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (355, '滤镜', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#355', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (356, '闪光灯/手柄', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#356', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (357, '相机包', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#357', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (358, '三脚架/云台', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#358', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (359, '相机清洁/贴膜', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#359', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (360, '机身附件', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#360', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (361, '镜头附件', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#361', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (362, '电池/充电器', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#362', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (363, '移动电源', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#363', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (364, '数码支架', 44, 3, 1, 0, NULL, NULL, 0, '#4#44#364', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (365, '智能手环', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#365', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (366, '智能手表', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#366', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (367, '智能眼镜', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#367', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (368, '运动跟踪器', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#368', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (369, '健康监测', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#369', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (370, '智能配饰', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#370', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (371, '智能家居', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#371', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (372, '体感车', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#372', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (373, '其他配件', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#373', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (374, '智能机器人', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#374', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (375, '无人机', 45, 3, 1, 0, NULL, NULL, 0, '#4#45#375', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (376, 'MP3/MP4', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#376', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (377, '智能设备', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#377', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (378, '耳机/耳麦', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#378', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (379, '便携/无线音箱', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#379', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (380, '音箱/音响', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#380', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (381, '高清播放器', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#381', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (382, '收音机', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#382', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (383, 'MP3/MP4配件', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#383', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (384, '麦克风', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#384', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (385, '专业音频', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#385', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (386, '苹果配件', 46, 3, 1, 0, NULL, NULL, 0, '#4#46#386', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (387, '学生平板', 47, 3, 1, 0, NULL, NULL, 0, '#4#47#387', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (388, '点读机/笔', 47, 3, 1, 0, NULL, NULL, 0, '#4#47#388', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (389, '早教益智', 47, 3, 1, 0, NULL, NULL, 0, '#4#47#389', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (390, '录音笔', 47, 3, 1, 0, NULL, NULL, 0, '#4#47#390', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (391, '电纸书', 47, 3, 1, 0, NULL, NULL, 0, '#4#47#391', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (392, '电子词典', 47, 3, 1, 0, NULL, NULL, 0, '#4#47#392', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (393, '复读机', 47, 3, 1, 0, NULL, NULL, 0, '#4#47#393', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (394, '延保服务', 48, 3, 1, 0, NULL, NULL, 0, '#4#48#394', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (395, '杀毒软件', 48, 3, 1, 0, NULL, NULL, 0, '#4#48#395', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (396, '积分商品', 48, 3, 1, 0, NULL, NULL, 0, '#4#48#396', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (397, '桌布/罩件', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#397', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (398, '地毯地垫', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#398', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (399, '沙发垫套/椅垫', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#399', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (400, '床品套件', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#400', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (401, '被子', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#401', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (402, '枕芯', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#402', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (403, '床单被罩', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#403', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (404, '毯子', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#404', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (405, '床垫/床褥', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#405', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (406, '蚊帐', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#406', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (407, '抱枕靠垫', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#407', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (408, '毛巾浴巾', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#408', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (409, '电热毯', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#409', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (410, '窗帘/窗纱', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#410', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (411, '布艺软饰', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#411', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (412, '凉席', 49, 3, 1, 0, NULL, NULL, 0, '#5#49#412', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (413, '台灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#413', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (414, '节能灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#414', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (415, '装饰灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#415', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (416, '落地灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#416', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (417, '应急灯/手电', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#417', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (418, 'LED灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#418', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (419, '吸顶灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#419', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (420, '五金电器', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#420', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (421, '筒灯射灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#421', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (422, '吊灯', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#422', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (423, '氛围照明', 50, 3, 1, 0, NULL, NULL, 0, '#5#50#423', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (424, '保暖防护', 51, 3, 1, 0, NULL, NULL, 0, '#5#51#424', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (425, '收纳用品', 51, 3, 1, 0, NULL, NULL, 0, '#5#51#425', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (426, '雨伞雨具', 51, 3, 1, 0, NULL, NULL, 0, '#5#51#426', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (427, '浴室用品', 51, 3, 1, 0, NULL, NULL, 0, '#5#51#427', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (428, '缝纫/针织用品', 51, 3, 1, 0, NULL, NULL, 0, '#5#51#428', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (429, '洗晒/熨烫', 51, 3, 1, 0, NULL, NULL, 0, '#5#51#429', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (430, '净化除味', 51, 3, 1, 0, NULL, NULL, 0, '#5#51#430', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (431, '相框/照片墙', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#431', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (432, '装饰字画', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#432', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (433, '节庆饰品', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#433', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (434, '手工/十字绣', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#434', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (435, '装饰摆件', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#435', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (436, '帘艺隔断', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#436', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (437, '墙贴/装饰贴', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#437', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (438, '钟饰', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#438', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (439, '花瓶花艺', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#439', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (440, '香薰蜡烛', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#440', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (441, '创意家居', 52, 3, 1, 0, NULL, NULL, 0, '#5#52#441', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (442, '宠物主粮', 53, 3, 1, 0, NULL, NULL, 0, '#5#53#442', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (443, '宠物零食', 53, 3, 1, 0, NULL, NULL, 0, '#5#53#443', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (444, '医疗保健', 53, 3, 1, 0, NULL, NULL, 0, '#5#53#444', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (445, '家居日用', 53, 3, 1, 0, NULL, NULL, 0, '#5#53#445', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (446, '宠物玩具', 53, 3, 1, 0, NULL, NULL, 0, '#5#53#446', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (447, '出行装备', 53, 3, 1, 0, NULL, NULL, 0, '#5#53#447', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (448, '洗护美容', 53, 3, 1, 0, NULL, NULL, 0, '#5#53#448', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (449, '笔记本', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#449', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (450, '超极本', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#450', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (451, '游戏本', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#451', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (452, '平板电脑', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#452', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (453, '平板电脑配件', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#453', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (454, '台式机', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#454', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (455, '服务器/工作站', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#455', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (456, '笔记本配件', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#456', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (457, '一体机', 54, 3, 1, 0, NULL, NULL, 0, '#6#54#457', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (458, 'CPU', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#458', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (459, '主板', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#459', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (460, '显卡', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#460', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (461, '硬盘', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#461', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (462, 'SSD固态硬盘', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#462', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (463, '内存', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#463', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (464, '机箱', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#464', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (465, '电源', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#465', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (466, '显示器', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#466', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (467, '刻录机/光驱', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#467', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (468, '散热器', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#468', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (469, '声卡/扩展卡', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#469', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (470, '装机配件', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#470', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (471, '组装电脑', 55, 3, 1, 0, NULL, NULL, 0, '#6#55#471', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (472, '移动硬盘', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#472', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (473, 'U盘', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#473', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (474, '鼠标', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#474', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (475, '键盘', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#475', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (476, '鼠标垫', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#476', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (477, '摄像头', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#477', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (478, '手写板', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#478', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (479, '硬盘盒', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#479', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (480, '插座', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#480', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (481, '线缆', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#481', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (482, 'UPS电源', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#482', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (483, '电脑工具', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#483', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (484, '游戏设备', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#484', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (485, '电玩', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#485', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (486, '电脑清洁', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#486', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (487, '网络仪表仪器', 56, 3, 1, 0, NULL, NULL, 0, '#6#56#487', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (488, '游戏机', 57, 3, 1, 0, NULL, NULL, 0, '#6#57#488', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (489, '游戏耳机', 57, 3, 1, 0, NULL, NULL, 0, '#6#57#489', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (490, '手柄/方向盘', 57, 3, 1, 0, NULL, NULL, 0, '#6#57#490', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (491, '游戏软件', 57, 3, 1, 0, NULL, NULL, 0, '#6#57#491', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (492, '游戏周边', 57, 3, 1, 0, NULL, NULL, 0, '#6#57#492', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (493, '路由器', 58, 3, 1, 0, NULL, NULL, 0, '#6#58#493', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (494, '网卡', 58, 3, 1, 0, NULL, NULL, 0, '#6#58#494', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (495, '交换机', 58, 3, 1, 0, NULL, NULL, 0, '#6#58#495', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (496, '网络存储', 58, 3, 1, 0, NULL, NULL, 0, '#6#58#496', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (497, '4G/3G上网', 58, 3, 1, 0, NULL, NULL, 0, '#6#58#497', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (498, '网络盒子', 58, 3, 1, 0, NULL, NULL, 0, '#6#58#498', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (499, '网络配件', 58, 3, 1, 0, NULL, NULL, 0, '#6#58#499', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (500, '投影机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#500', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (501, '投影配件', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#501', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (502, '多功能一体机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#502', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (503, '打印机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#503', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (504, '传真设备', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#504', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (505, '验钞/点钞机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#505', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (506, '扫描设备', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#506', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (507, '复合机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#507', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (508, '碎纸机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#508', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (509, '考勤机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#509', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (510, '收款/POS机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#510', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (511, '会议音频视频', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#511', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (512, '保险柜', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#512', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (513, '装订/封装机', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#513', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (514, '安防监控', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#514', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (515, '办公家具', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#515', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (516, '白板', 59, 3, 1, 0, NULL, NULL, 0, '#6#59#516', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (517, '硒鼓/墨粉', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#517', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (518, '墨盒', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#518', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (519, '色带', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#519', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (520, '纸类', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#520', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (521, '办公文具', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#521', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (522, '学生文具', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#522', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (523, '财会用品', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#523', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (524, '文件管理', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#524', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (525, '本册/便签', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#525', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (526, '计算器', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#526', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (527, '笔类', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#527', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (528, '画具画材', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#528', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (529, '刻录碟片/附件', 60, 3, 1, 0, NULL, NULL, 0, '#6#60#529', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (530, '上门安装', 61, 3, 1, 0, NULL, NULL, 0, '#6#61#530', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (531, '延保服务', 61, 3, 1, 0, NULL, NULL, 0, '#6#61#531', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (532, '维修保养', 61, 3, 1, 0, NULL, NULL, 0, '#6#61#532', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (533, '电脑软件', 61, 3, 1, 0, NULL, NULL, 0, '#6#61#533', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (534, '京东服务', 61, 3, 1, 0, NULL, NULL, 0, '#6#61#534', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (535, '炒锅', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#535', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (536, '煎锅', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#536', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (537, '压力锅', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#537', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (538, '蒸锅', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#538', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (539, '汤锅', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#539', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (540, '奶锅', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#540', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (541, '锅具套装', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#541', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (542, '煲类', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#542', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (543, '水壶', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#543', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (544, '火锅', 62, 3, 1, 0, NULL, NULL, 0, '#7#62#544', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (545, '菜刀', 63, 3, 1, 0, NULL, NULL, 0, '#7#63#545', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (546, '剪刀', 63, 3, 1, 0, NULL, NULL, 0, '#7#63#546', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (547, '刀具套装', 63, 3, 1, 0, NULL, NULL, 0, '#7#63#547', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (548, '砧板', 63, 3, 1, 0, NULL, NULL, 0, '#7#63#548', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (549, '瓜果刀/刨', 63, 3, 1, 0, NULL, NULL, 0, '#7#63#549', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (550, '多功能刀', 63, 3, 1, 0, NULL, NULL, 0, '#7#63#550', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (551, '保鲜盒', 64, 3, 1, 0, NULL, NULL, 0, '#7#64#551', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (552, '烘焙/烧烤', 64, 3, 1, 0, NULL, NULL, 0, '#7#64#552', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (553, '饭盒/提锅', 64, 3, 1, 0, NULL, NULL, 0, '#7#64#553', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (554, '储物/置物架', 64, 3, 1, 0, NULL, NULL, 0, '#7#64#554', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (555, '厨房DIY/小工具', 64, 3, 1, 0, NULL, NULL, 0, '#7#64#555', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (556, '塑料杯', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#556', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (557, '运动水壶', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#557', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (558, '玻璃杯', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#558', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (559, '陶瓷/马克杯', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#559', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (560, '保温杯', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#560', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (561, '保温壶', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#561', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (562, '酒杯/酒具', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#562', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (563, '杯具套装', 65, 3, 1, 0, NULL, NULL, 0, '#7#65#563', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (564, '餐具套装', 66, 3, 1, 0, NULL, NULL, 0, '#7#66#564', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (565, '碗/碟/盘', 66, 3, 1, 0, NULL, NULL, 0, '#7#66#565', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (566, '筷勺/刀叉', 66, 3, 1, 0, NULL, NULL, 0, '#7#66#566', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (567, '一次性用品', 66, 3, 1, 0, NULL, NULL, 0, '#7#66#567', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (568, '果盘/果篮', 66, 3, 1, 0, NULL, NULL, 0, '#7#66#568', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (569, '自助餐炉', 67, 3, 1, 0, NULL, NULL, 0, '#7#67#569', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (570, '酒店餐具', 67, 3, 1, 0, NULL, NULL, 0, '#7#67#570', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (571, '酒店水具', 67, 3, 1, 0, NULL, NULL, 0, '#7#67#571', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (572, '整套茶具', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#572', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (573, '茶杯', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#573', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (574, '茶壶', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#574', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (575, '茶盘茶托', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#575', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (576, '茶叶罐', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#576', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (577, '茶具配件', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#577', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (578, '茶宠摆件', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#578', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (579, '咖啡具', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#579', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (580, '其他', 68, 3, 1, 0, NULL, NULL, 0, '#7#68#580', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (581, '纸品湿巾', 69, 3, 1, 0, NULL, NULL, 0, '#8#69#581', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (582, '衣物清洁', 69, 3, 1, 0, NULL, NULL, 0, '#8#69#582', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (583, '清洁工具', 69, 3, 1, 0, NULL, NULL, 0, '#8#69#583', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (584, '驱虫用品', 69, 3, 1, 0, NULL, NULL, 0, '#8#69#584', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (585, '家庭清洁', 69, 3, 1, 0, NULL, NULL, 0, '#8#69#585', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (586, '皮具护理', 69, 3, 1, 0, NULL, NULL, 0, '#8#69#586', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (587, '一次性用品', 69, 3, 1, 0, NULL, NULL, 0, '#8#69#587', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (588, '洁面', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#588', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (589, '乳液面霜', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#589', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (590, '面膜', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#590', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (591, '剃须', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#591', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (592, '套装', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#592', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (593, '精华', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#593', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (594, '眼霜', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#594', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (595, '卸妆', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#595', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (596, '防晒', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#596', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (597, '防晒隔离', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#597', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (598, 'T区护理', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#598', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (599, '眼部护理', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#599', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (600, '精华露', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#600', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (601, '爽肤水', 70, 3, 1, 0, NULL, NULL, 0, '#8#70#601', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (602, '沐浴', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#602', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (603, '润肤', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#603', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (604, '颈部', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#604', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (605, '手足', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#605', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (606, '纤体塑形', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#606', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (607, '美胸', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#607', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (608, '套装', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#608', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (609, '精油', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#609', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (610, '洗发护发', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#610', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (611, '染发/造型', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#611', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (612, '香薰精油', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#612', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (613, '磨砂/浴盐', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#613', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (614, '手工/香皂', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#614', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (615, '洗发', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#615', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (616, '护发', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#616', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (617, '染发', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#617', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (618, '磨砂膏', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#618', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (619, '香皂', 71, 3, 1, 0, NULL, NULL, 0, '#8#71#619', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (620, '牙膏/牙粉', 72, 3, 1, 0, NULL, NULL, 0, '#8#72#620', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (621, '牙刷/牙线', 72, 3, 1, 0, NULL, NULL, 0, '#8#72#621', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (622, '漱口水', 72, 3, 1, 0, NULL, NULL, 0, '#8#72#622', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (623, '套装', 72, 3, 1, 0, NULL, NULL, 0, '#8#72#623', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (624, '卫生巾', 73, 3, 1, 0, NULL, NULL, 0, '#8#73#624', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (625, '卫生护垫', 73, 3, 1, 0, NULL, NULL, 0, '#8#73#625', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (626, '私密护理', 73, 3, 1, 0, NULL, NULL, 0, '#8#73#626', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (627, '脱毛膏', 73, 3, 1, 0, NULL, NULL, 0, '#8#73#627', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (628, '其他', 73, 3, 1, 0, NULL, NULL, 0, '#8#73#628', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (629, '洗发', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#629', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (630, '护发', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#630', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (631, '染发', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#631', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (632, '造型', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#632', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (633, '假发', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#633', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (634, '套装', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#634', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (635, '美发工具', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#635', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (636, '脸部护理', 74, 3, 1, 0, NULL, NULL, 0, '#8#74#636', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (637, '香水', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#637', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (638, '底妆', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#638', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (639, '腮红', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#639', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (640, '眼影', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#640', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (641, '唇部', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#641', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (642, '美甲', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#642', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (643, '眼线', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#643', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (644, '美妆工具', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#644', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (645, '套装', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#645', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (646, '防晒隔离', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#646', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (647, '卸妆', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#647', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (648, '眉笔', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#648', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (649, '睫毛膏', 75, 3, 1, 0, NULL, NULL, 0, '#8#75#649', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (650, 'T恤', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#650', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (651, '衬衫', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#651', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (652, '针织衫', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#652', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (653, '雪纺衫', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#653', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (654, '卫衣', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#654', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (655, '马甲', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#655', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (656, '连衣裙', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#656', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (657, '半身裙', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#657', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (658, '牛仔裤', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#658', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (659, '休闲裤', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#659', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (660, '打底裤', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#660', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (661, '正装裤', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#661', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (662, '小西装', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#662', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (663, '短外套', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#663', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (664, '风衣', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#664', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (665, '毛呢大衣', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#665', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (666, '真皮皮衣', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#666', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (667, '棉服', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#667', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (668, '羽绒服', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#668', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (669, '大码女装', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#669', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (670, '中老年女装', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#670', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (671, '婚纱', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#671', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (672, '打底衫', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#672', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (673, '旗袍/唐装', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#673', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (674, '加绒裤', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#674', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (675, '吊带/背心', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#675', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (676, '羊绒衫', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#676', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (677, '短裤', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#677', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (678, '皮草', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#678', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (679, '礼服', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#679', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (680, '仿皮皮衣', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#680', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (681, '羊毛衫', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#681', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (682, '设计师/潮牌', 76, 3, 1, 0, NULL, NULL, 0, '#9#76#682', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (683, '衬衫', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#683', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (684, 'T恤', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#684', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (685, 'POLO衫', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#685', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (686, '针织衫', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#686', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (687, '羊绒衫', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#687', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (688, '卫衣', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#688', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (689, '马甲/背心', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#689', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (690, '夹克', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#690', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (691, '风衣', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#691', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (692, '毛呢大衣', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#692', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (693, '仿皮皮衣', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#693', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (694, '西服', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#694', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (695, '棉服', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#695', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (696, '羽绒服', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#696', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (697, '牛仔裤', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#697', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (698, '休闲裤', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#698', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (699, '西裤', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#699', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (700, '西服套装', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#700', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (701, '大码男装', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#701', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (702, '中老年男装', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#702', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (703, '唐装/中山装', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#703', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (704, '工装', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#704', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (705, '真皮皮衣', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#705', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (706, '加绒裤', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#706', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (707, '卫裤/运动裤', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#707', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (708, '短裤', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#708', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (709, '设计师/潮牌', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#709', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (710, '羊毛衫', 77, 3, 1, 0, NULL, NULL, 0, '#9#77#710', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (711, '文胸', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#711', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (712, '女式内裤', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#712', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (713, '男式内裤', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#713', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (714, '睡衣/家居服', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#714', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (715, '塑身美体', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#715', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (716, '泳衣', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#716', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (717, '吊带/背心', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#717', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (718, '抹胸', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#718', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (719, '连裤袜/丝袜', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#719', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (720, '美腿袜', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#720', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (721, '商务男袜', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#721', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (722, '保暖内衣', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#722', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (723, '情侣睡衣', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#723', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (724, '文胸套装', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#724', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (725, '少女文胸', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#725', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (726, '休闲棉袜', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#726', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (727, '大码内衣', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#727', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (728, '内衣配件', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#728', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (729, '打底裤袜', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#729', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (730, '打底衫', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#730', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (731, '秋衣秋裤', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#731', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (732, '情趣内衣', 78, 3, 1, 0, NULL, NULL, 0, '#9#78#732', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (733, '服装洗护', 79, 3, 1, 0, NULL, NULL, 0, '#9#79#733', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (734, '太阳镜', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#734', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (735, '光学镜架/镜片', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#735', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (736, '围巾/手套/帽子套装', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#736', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (737, '袖扣', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#737', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (738, '棒球帽', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#738', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (739, '毛线帽', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#739', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (740, '遮阳帽', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#740', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (741, '老花镜', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#741', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (742, '装饰眼镜', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#742', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (743, '防辐射眼镜', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#743', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (744, '游泳镜', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#744', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (745, '女士丝巾/围巾/披肩', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#745', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (746, '男士丝巾/围巾', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#746', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (747, '鸭舌帽', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#747', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (748, '贝雷帽', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#748', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (749, '礼帽', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#749', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (750, '真皮手套', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#750', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (751, '毛线手套', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#751', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (752, '防晒手套', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#752', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (753, '男士腰带/礼盒', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#753', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (754, '女士腰带/礼盒', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#754', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (755, '钥匙扣', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#755', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (756, '遮阳伞/雨伞', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#756', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (757, '口罩', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#757', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (758, '耳罩/耳包', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#758', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (759, '假领', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#759', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (760, '毛线/布面料', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#760', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (761, '领带/领结/领带夹', 80, 3, 1, 0, NULL, NULL, 0, '#9#80#761', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (762, '男表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#762', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (763, '瑞表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#763', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (764, '女表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#764', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (765, '国表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#765', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (766, '日韩表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#766', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (767, '欧美表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#767', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (768, '德表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#768', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (769, '儿童手表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#769', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (770, '智能手表', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#770', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (771, '闹钟', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#771', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (772, '座钟挂钟', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#772', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (773, '钟表配件', 81, 3, 1, 0, NULL, NULL, 0, '#10#81#773', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (774, '商务休闲鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#774', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (775, '正装鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#775', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (776, '休闲鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#776', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (777, '凉鞋/沙滩鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#777', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (778, '男靴', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#778', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (779, '功能鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#779', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (780, '拖鞋/人字拖', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#780', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (781, '雨鞋/雨靴', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#781', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (782, '传统布鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#782', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (783, '鞋配件', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#783', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (784, '帆布鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#784', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (785, '增高鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#785', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (786, '工装鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#786', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (787, '定制鞋', 82, 3, 1, 0, NULL, NULL, 0, '#11#82#787', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (788, '高跟鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#788', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (789, '单鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#789', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (790, '休闲鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#790', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (791, '凉鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#791', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (792, '女靴', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#792', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (793, '雪地靴', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#793', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (794, '拖鞋/人字拖', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#794', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (795, '踝靴', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#795', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (796, '筒靴', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#796', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (797, '帆布鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#797', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (798, '雨鞋/雨靴', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#798', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (799, '妈妈鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#799', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (800, '鞋配件', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#800', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (801, '特色鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#801', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (802, '鱼嘴鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#802', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (803, '布鞋/绣花鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#803', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (804, '马丁靴', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#804', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (805, '坡跟鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#805', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (806, '松糕鞋', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#806', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (807, '内增高', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#807', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (808, '防水台', 83, 3, 1, 0, NULL, NULL, 0, '#11#83#808', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (809, '婴幼奶粉', 84, 3, 1, 0, NULL, NULL, 0, '#12#84#809', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (810, '孕妈奶粉', 84, 3, 1, 0, NULL, NULL, 0, '#12#84#810', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (811, '益生菌/初乳', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#811', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (812, '米粉/菜粉', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#812', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (813, '果泥/果汁', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#813', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (814, 'DHA', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#814', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (815, '宝宝零食', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#815', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (816, '钙铁锌/维生素', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#816', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (817, '清火/开胃', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#817', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (818, '面条/粥', 85, 3, 1, 0, NULL, NULL, 0, '#12#85#818', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (819, '婴儿尿裤', 86, 3, 1, 0, NULL, NULL, 0, '#12#86#819', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (820, '拉拉裤', 86, 3, 1, 0, NULL, NULL, 0, '#12#86#820', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (821, '婴儿湿巾', 86, 3, 1, 0, NULL, NULL, 0, '#12#86#821', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (822, '成人尿裤', 86, 3, 1, 0, NULL, NULL, 0, '#12#86#822', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (823, '奶瓶奶嘴', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#823', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (824, '吸奶器', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#824', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (825, '暖奶消毒', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#825', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (826, '儿童餐具', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#826', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (827, '水壶/水杯', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#827', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (828, '牙胶安抚', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#828', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (829, '围兜/防溅衣', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#829', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (830, '辅食料理机', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#830', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (831, '食物存储', 87, 3, 1, 0, NULL, NULL, 0, '#12#87#831', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (832, '宝宝护肤', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#832', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (833, '洗发沐浴', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#833', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (834, '奶瓶清洗', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#834', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (835, '驱蚊防晒', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#835', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (836, '理发器', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#836', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (837, '洗澡用具', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#837', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (838, '婴儿口腔清洁', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#838', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (839, '洗衣液/皂', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#839', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (840, '日常护理', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#840', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (841, '座便器', 88, 3, 1, 0, NULL, NULL, 0, '#12#88#841', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (842, '婴儿推车', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#842', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (843, '餐椅摇椅', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#843', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (844, '婴儿床', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#844', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (845, '学步车', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#845', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (846, '三轮车', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#846', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (847, '自行车', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#847', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (848, '电动车', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#848', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (849, '扭扭车', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#849', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (850, '滑板车', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#850', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (851, '婴儿床垫', 89, 3, 1, 0, NULL, NULL, 0, '#12#89#851', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (852, '婴儿外出服', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#852', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (853, '婴儿内衣', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#853', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (854, '婴儿礼盒', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#854', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (855, '婴儿鞋帽袜', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#855', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (856, '安全防护', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#856', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (857, '家居床品', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#857', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (858, '睡袋/抱被', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#858', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (859, '爬行垫', 90, 3, 1, 0, NULL, NULL, 0, '#12#90#859', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (860, '妈咪包/背婴带', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#860', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (861, '产后塑身', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#861', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (862, '文胸/内裤', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#862', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (863, '防辐射服', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#863', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (864, '孕妈装', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#864', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (865, '孕期营养', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#865', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (866, '孕妇护肤', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#866', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (867, '待产护理', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#867', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (868, '月子装', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#868', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (869, '防溢乳垫', 91, 3, 1, 0, NULL, NULL, 0, '#12#91#869', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (870, '套装', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#870', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (871, '上衣', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#871', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (872, '裤子', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#872', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (873, '裙子', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#873', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (874, '内衣/家居服', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#874', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (875, '羽绒服/棉服', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#875', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (876, '亲子装', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#876', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (877, '儿童配饰', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#877', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (878, '礼服/演出服', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#878', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (879, '运动鞋', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#879', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (880, '皮鞋/帆布鞋', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#880', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (881, '靴子', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#881', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (882, '凉鞋', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#882', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (883, '功能鞋', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#883', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (884, '户外/运动服', 92, 3, 1, 0, NULL, NULL, 0, '#12#92#884', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (885, '提篮式', 93, 3, 1, 0, NULL, NULL, 0, '#12#93#885', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (886, '安全座椅', 93, 3, 1, 0, NULL, NULL, 0, '#12#93#886', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (887, '增高垫', 93, 3, 1, 0, NULL, NULL, 0, '#12#93#887', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (888, '钱包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#888', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (889, '手拿包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#889', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (890, '单肩包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#890', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (891, '双肩包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#891', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (892, '手提包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#892', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (893, '斜挎包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#893', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (894, '钥匙包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#894', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (895, '卡包/零钱包', 94, 3, 1, 0, NULL, NULL, 0, '#13#94#895', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (896, '男士钱包', 95, 3, 1, 0, NULL, NULL, 0, '#13#95#896', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (897, '男士手包', 95, 3, 1, 0, NULL, NULL, 0, '#13#95#897', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (898, '卡包名片夹', 95, 3, 1, 0, NULL, NULL, 0, '#13#95#898', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (899, '商务公文包', 95, 3, 1, 0, NULL, NULL, 0, '#13#95#899', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (900, '双肩包', 95, 3, 1, 0, NULL, NULL, 0, '#13#95#900', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (901, '单肩/斜挎包', 95, 3, 1, 0, NULL, NULL, 0, '#13#95#901', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (902, '钥匙包', 95, 3, 1, 0, NULL, NULL, 0, '#13#95#902', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (903, '电脑包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#903', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (904, '拉杆箱', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#904', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (905, '旅行包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#905', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (906, '旅行配件', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#906', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (907, '休闲运动包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#907', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (908, '拉杆包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#908', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (909, '登山包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#909', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (910, '妈咪包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#910', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (911, '书包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#911', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (912, '相机包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#912', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (913, '腰包/胸包', 96, 3, 1, 0, NULL, NULL, 0, '#13#96#913', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (914, '火机烟具', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#914', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (915, '礼品文具', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#915', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (916, '军刀军具', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#916', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (917, '收藏品', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#917', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (918, '工艺礼品', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#918', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (919, '创意礼品', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#919', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (920, '礼盒礼券', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#920', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (921, '鲜花绿植', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#921', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (922, '婚庆节庆', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#922', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (923, '京东卡', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#923', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (924, '美妆礼品', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#924', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (925, '礼品定制', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#925', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (926, '京东福卡', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#926', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (927, '古董文玩', 97, 3, 1, 0, NULL, NULL, 0, '#13#97#927', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (928, '箱包', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#928', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (929, '钱包', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#929', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (930, '服饰', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#930', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (931, '腰带', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#931', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (932, '太阳镜/眼镜框', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#932', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (933, '配件', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#933', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (934, '鞋靴', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#934', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (935, '饰品', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#935', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (936, '名品腕表', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#936', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (937, '高档化妆品', 98, 3, 1, 0, NULL, NULL, 0, '#13#98#937', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (938, '婚嫁首饰', 99, 3, 1, 0, NULL, NULL, 0, '#13#99#938', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (939, '婚纱摄影', 99, 3, 1, 0, NULL, NULL, 0, '#13#99#939', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (940, '婚纱礼服', 99, 3, 1, 0, NULL, NULL, 0, '#13#99#940', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (941, '婚庆服务', 99, 3, 1, 0, NULL, NULL, 0, '#13#99#941', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (942, '婚庆礼品/用品', 99, 3, 1, 0, NULL, NULL, 0, '#13#99#942', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (943, '婚宴', 99, 3, 1, 0, NULL, NULL, 0, '#13#99#943', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (944, '饼干蛋糕', 100, 3, 1, 0, NULL, NULL, 0, '#14#100#944', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (945, '糖果/巧克力', 100, 3, 1, 0, NULL, NULL, 0, '#14#100#945', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (946, '休闲零食', 100, 3, 1, 0, NULL, NULL, 0, '#14#100#946', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (947, '冲调饮品', 100, 3, 1, 0, NULL, NULL, 0, '#14#100#947', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (948, '粮油调味', 100, 3, 1, 0, NULL, NULL, 0, '#14#100#948', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (949, '牛奶', 100, 3, 1, 0, NULL, NULL, 0, '#14#100#949', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (950, '其他特产', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#950', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (951, '新疆', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#951', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (952, '北京', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#952', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (953, '山西', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#953', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (954, '内蒙古', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#954', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (955, '福建', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#955', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (956, '湖南', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#956', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (957, '四川', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#957', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (958, '云南', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#958', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (959, '东北', 101, 3, 1, 0, NULL, NULL, 0, '#14#101#959', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (960, '休闲零食', 102, 3, 1, 0, NULL, NULL, 0, '#14#102#960', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (961, '坚果炒货', 102, 3, 1, 0, NULL, NULL, 0, '#14#102#961', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (962, '肉干肉脯', 102, 3, 1, 0, NULL, NULL, 0, '#14#102#962', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (963, '蜜饯果干', 102, 3, 1, 0, NULL, NULL, 0, '#14#102#963', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (964, '糖果/巧克力', 102, 3, 1, 0, NULL, NULL, 0, '#14#102#964', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (965, '饼干蛋糕', 102, 3, 1, 0, NULL, NULL, 0, '#14#102#965', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (966, '无糖食品', 102, 3, 1, 0, NULL, NULL, 0, '#14#102#966', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (967, '米面杂粮', 103, 3, 1, 0, NULL, NULL, 0, '#14#103#967', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (968, '食用油', 103, 3, 1, 0, NULL, NULL, 0, '#14#103#968', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (969, '调味品', 103, 3, 1, 0, NULL, NULL, 0, '#14#103#969', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (970, '南北干货', 103, 3, 1, 0, NULL, NULL, 0, '#14#103#970', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (971, '方便食品', 103, 3, 1, 0, NULL, NULL, 0, '#14#103#971', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (972, '有机食品', 103, 3, 1, 0, NULL, NULL, 0, '#14#103#972', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (973, '饮用水', 104, 3, 1, 0, NULL, NULL, 0, '#14#104#973', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (974, '饮料', 104, 3, 1, 0, NULL, NULL, 0, '#14#104#974', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (975, '牛奶乳品', 104, 3, 1, 0, NULL, NULL, 0, '#14#104#975', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (976, '咖啡/奶茶', 104, 3, 1, 0, NULL, NULL, 0, '#14#104#976', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (977, '冲饮谷物', 104, 3, 1, 0, NULL, NULL, 0, '#14#104#977', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (978, '蜂蜜/柚子茶', 104, 3, 1, 0, NULL, NULL, 0, '#14#104#978', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (979, '成人奶粉', 104, 3, 1, 0, NULL, NULL, 0, '#14#104#979', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (980, '月饼', 105, 3, 1, 0, NULL, NULL, 0, '#14#105#980', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (981, '大闸蟹', 105, 3, 1, 0, NULL, NULL, 0, '#14#105#981', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (982, '粽子', 105, 3, 1, 0, NULL, NULL, 0, '#14#105#982', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (983, '卡券', 105, 3, 1, 0, NULL, NULL, 0, '#14#105#983', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (984, '铁观音', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#984', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (985, '普洱', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#985', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (986, '龙井', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#986', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (987, '绿茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#987', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (988, '红茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#988', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (989, '乌龙茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#989', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (990, '花草茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#990', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (991, '花果茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#991', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (992, '养生茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#992', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (993, '黑茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#993', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (994, '白茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#994', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (995, '其它茶', 106, 3, 1, 0, NULL, NULL, 0, '#14#106#995', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (996, '项链', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#996', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (997, '手链/脚链', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#997', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (998, '戒指', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#998', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (999, '耳饰', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#999', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1000, '毛衣链', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#1000', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1001, '发饰/发卡', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#1001', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1002, '胸针', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#1002', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1003, '饰品配件', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#1003', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1004, '婚庆饰品', 107, 3, 1, 0, NULL, NULL, 0, '#15#107#1004', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1005, '黄金吊坠', 108, 3, 1, 0, NULL, NULL, 0, '#15#108#1005', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1006, '黄金项链', 108, 3, 1, 0, NULL, NULL, 0, '#15#108#1006', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1007, '黄金转运珠', 108, 3, 1, 0, NULL, NULL, 0, '#15#108#1007', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1008, '黄金手镯/手链/脚链', 108, 3, 1, 0, NULL, NULL, 0, '#15#108#1008', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1009, '黄金耳饰', 108, 3, 1, 0, NULL, NULL, 0, '#15#108#1009', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1010, '黄金戒指', 108, 3, 1, 0, NULL, NULL, 0, '#15#108#1010', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1011, 'K金吊坠', 109, 3, 1, 0, NULL, NULL, 0, '#15#109#1011', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1012, 'K金项链', 109, 3, 1, 0, NULL, NULL, 0, '#15#109#1012', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1013, 'K金手镯/手链/脚链', 109, 3, 1, 0, NULL, NULL, 0, '#15#109#1013', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1014, 'K金戒指', 109, 3, 1, 0, NULL, NULL, 0, '#15#109#1014', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1015, 'K金耳饰', 109, 3, 1, 0, NULL, NULL, 0, '#15#109#1015', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1016, '投资金', 110, 3, 1, 0, NULL, NULL, 0, '#15#110#1016', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1017, '投资银', 110, 3, 1, 0, NULL, NULL, 0, '#15#110#1017', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1018, '投资收藏', 110, 3, 1, 0, NULL, NULL, 0, '#15#110#1018', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1019, '银吊坠/项链', 111, 3, 1, 0, NULL, NULL, 0, '#15#111#1019', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1020, '银手镯/手链/脚链', 111, 3, 1, 0, NULL, NULL, 0, '#15#111#1020', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1021, '银戒指', 111, 3, 1, 0, NULL, NULL, 0, '#15#111#1021', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1022, '银耳饰', 111, 3, 1, 0, NULL, NULL, 0, '#15#111#1022', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1023, '足银手镯', 111, 3, 1, 0, NULL, NULL, 0, '#15#111#1023', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1024, '宝宝银饰', 111, 3, 1, 0, NULL, NULL, 0, '#15#111#1024', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1025, '裸钻', 112, 3, 1, 0, NULL, NULL, 0, '#15#112#1025', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1026, '钻戒', 112, 3, 1, 0, NULL, NULL, 0, '#15#112#1026', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1027, '钻石项链/吊坠', 112, 3, 1, 0, NULL, NULL, 0, '#15#112#1027', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1028, '钻石耳饰', 112, 3, 1, 0, NULL, NULL, 0, '#15#112#1028', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1029, '钻石手镯/手链', 112, 3, 1, 0, NULL, NULL, 0, '#15#112#1029', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1030, '项链/吊坠', 113, 3, 1, 0, NULL, NULL, 0, '#15#113#1030', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1031, '手镯/手串', 113, 3, 1, 0, NULL, NULL, 0, '#15#113#1031', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1032, '戒指', 113, 3, 1, 0, NULL, NULL, 0, '#15#113#1032', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1033, '耳饰', 113, 3, 1, 0, NULL, NULL, 0, '#15#113#1033', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1034, '挂件/摆件/把件', 113, 3, 1, 0, NULL, NULL, 0, '#15#113#1034', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1035, '玉石孤品', 113, 3, 1, 0, NULL, NULL, 0, '#15#113#1035', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1036, '项链/吊坠', 114, 3, 1, 0, NULL, NULL, 0, '#15#114#1036', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1037, '耳饰', 114, 3, 1, 0, NULL, NULL, 0, '#15#114#1037', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1038, '手镯/手链/脚链', 114, 3, 1, 0, NULL, NULL, 0, '#15#114#1038', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1039, '戒指', 114, 3, 1, 0, NULL, NULL, 0, '#15#114#1039', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1040, '头饰/胸针', 114, 3, 1, 0, NULL, NULL, 0, '#15#114#1040', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1041, '摆件/挂件', 114, 3, 1, 0, NULL, NULL, 0, '#15#114#1041', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1042, '琥珀/蜜蜡', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1042', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1043, '碧玺', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1043', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1044, '红宝石/蓝宝石', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1044', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1045, '坦桑石', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1045', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1046, '珊瑚', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1046', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1047, '祖母绿', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1047', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1048, '葡萄石', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1048', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1049, '其他天然宝石', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1049', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1050, '项链/吊坠', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1050', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1051, '耳饰', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1051', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1052, '手镯/手链', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1052', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1053, '戒指', 115, 3, 1, 0, NULL, NULL, 0, '#15#115#1053', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1054, '铂金项链/吊坠', 116, 3, 1, 0, NULL, NULL, 0, '#15#116#1054', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1055, '铂金手镯/手链/脚链', 116, 3, 1, 0, NULL, NULL, 0, '#15#116#1055', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1056, '铂金戒指', 116, 3, 1, 0, NULL, NULL, 0, '#15#116#1056', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1057, '铂金耳饰', 116, 3, 1, 0, NULL, NULL, 0, '#15#116#1057', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1058, '小叶紫檀', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1058', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1059, '黄花梨', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1059', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1060, '沉香木', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1060', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1061, '金丝楠', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1061', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1062, '菩提', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1062', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1063, '其他', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1063', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1064, '橄榄核/核桃', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1064', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1065, '檀香', 117, 3, 1, 0, NULL, NULL, 0, '#15#117#1065', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1066, '珍珠项链', 118, 3, 1, 0, NULL, NULL, 0, '#15#118#1066', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1067, '珍珠吊坠', 118, 3, 1, 0, NULL, NULL, 0, '#15#118#1067', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1068, '珍珠耳饰', 118, 3, 1, 0, NULL, NULL, 0, '#15#118#1068', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1069, '珍珠手链', 118, 3, 1, 0, NULL, NULL, 0, '#15#118#1069', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1070, '珍珠戒指', 118, 3, 1, 0, NULL, NULL, 0, '#15#118#1070', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1071, '珍珠胸针', 118, 3, 1, 0, NULL, NULL, 0, '#15#118#1071', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1072, '机油', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1072', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1073, '正时皮带', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1073', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1074, '添加剂', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1074', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1075, '汽车喇叭', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1075', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1076, '防冻液', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1076', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1077, '汽车玻璃', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1077', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1078, '滤清器', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1078', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1079, '火花塞', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1079', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1080, '减震器', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1080', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1081, '柴机油/辅助油', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1081', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1082, '雨刷', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1082', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1083, '车灯', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1083', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1084, '后视镜', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1084', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1085, '轮胎', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1085', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1086, '轮毂', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1086', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1087, '刹车片/盘', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1087', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1088, '维修配件', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1088', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1089, '蓄电池', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1089', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1090, '底盘装甲/护板', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1090', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1091, '贴膜', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1091', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1092, '汽修工具', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1092', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1093, '改装配件', 119, 3, 1, 0, NULL, NULL, 0, '#16#119#1093', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1094, '导航仪', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1094', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1095, '安全预警仪', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1095', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1096, '行车记录仪', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1096', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1097, '倒车雷达', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1097', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1098, '蓝牙设备', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1098', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1099, '车载影音', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1099', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1100, '净化器', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1100', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1101, '电源', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1101', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1102, '智能驾驶', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1102', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1103, '车载电台', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1103', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1104, '车载电器配件', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1104', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1105, '吸尘器', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1105', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1106, '智能车机', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1106', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1107, '冰箱', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1107', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1108, '汽车音响', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1108', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1109, '车载生活电器', 120, 3, 1, 0, NULL, NULL, 0, '#16#120#1109', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1110, '车蜡', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1110', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1111, '补漆笔', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1111', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1112, '玻璃水', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1112', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1113, '清洁剂', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1113', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1114, '洗车工具', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1114', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1115, '镀晶镀膜', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1115', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1116, '打蜡机', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1116', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1117, '洗车配件', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1117', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1118, '洗车机', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1118', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1119, '洗车水枪', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1119', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1120, '毛巾掸子', 121, 3, 1, 0, NULL, NULL, 0, '#16#121#1120', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1121, '脚垫', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1121', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1122, '座垫', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1122', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1123, '座套', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1123', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1124, '后备箱垫', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1124', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1125, '头枕腰靠', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1125', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1126, '方向盘套', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1126', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1127, '香水', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1127', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1128, '空气净化', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1128', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1129, '挂件摆件', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1129', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1130, '功能小件', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1130', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1131, '车身装饰件', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1131', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1132, '车衣', 122, 3, 1, 0, NULL, NULL, 0, '#16#122#1132', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1133, '安全座椅', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1133', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1134, '胎压监测', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1134', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1135, '防盗设备', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1135', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1136, '应急救援', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1136', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1137, '保温箱', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1137', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1138, '地锁', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1138', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1139, '摩托车', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1139', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1140, '充气泵', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1140', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1141, '储物箱', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1141', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1142, '自驾野营', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1142', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1143, '摩托车装备', 123, 3, 1, 0, NULL, NULL, 0, '#16#123#1143', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1144, '清洗美容', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1144', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1145, '功能升级', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1145', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1146, '保养维修', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1146', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1147, '油卡充值', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1147', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1148, '车险', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1148', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1149, '加油卡', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1149', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1150, 'ETC', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1150', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1151, '驾驶培训', 124, 3, 1, 0, NULL, NULL, 0, '#16#124#1151', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1152, '赛事服装', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1152', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1153, '赛事用品', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1153', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1154, '制动系统', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1154', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1155, '悬挂系统', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1155', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1156, '进气系统', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1156', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1157, '排气系统', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1157', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1158, '电子管理', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1158', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1159, '车身强化', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1159', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1160, '赛事座椅', 125, 3, 1, 0, NULL, NULL, 0, '#16#125#1160', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1161, '跑步鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1161', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1162, '休闲鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1162', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1163, '篮球鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1163', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1164, '板鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1164', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1165, '帆布鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1165', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1166, '足球鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1166', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1167, '乒羽网鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1167', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1168, '专项运动鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1168', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1169, '训练鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1169', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1170, '拖鞋', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1170', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1171, '运动包', 126, 3, 1, 0, NULL, NULL, 0, '#17#126#1171', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1172, '羽绒服', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1172', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1173, '棉服', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1173', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1174, '运动裤', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1174', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1175, '夹克/风衣', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1175', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1176, '卫衣/套头衫', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1176', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1177, 'T恤', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1177', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1178, '套装', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1178', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1179, '乒羽网服', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1179', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1180, '健身服', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1180', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1181, '运动背心', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1181', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1182, '毛衫/线衫', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1182', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1183, '运动配饰', 127, 3, 1, 0, NULL, NULL, 0, '#17#127#1183', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1184, '折叠车', 128, 3, 1, 0, NULL, NULL, 0, '#17#128#1184', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1185, '山地车/公路车', 128, 3, 1, 0, NULL, NULL, 0, '#17#128#1185', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1186, '电动车', 128, 3, 1, 0, NULL, NULL, 0, '#17#128#1186', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1187, '其他整车', 128, 3, 1, 0, NULL, NULL, 0, '#17#128#1187', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1188, '骑行服', 128, 3, 1, 0, NULL, NULL, 0, '#17#128#1188', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1189, '骑行装备', 128, 3, 1, 0, NULL, NULL, 0, '#17#128#1189', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1190, '平衡车', 128, 3, 1, 0, NULL, NULL, 0, '#17#128#1190', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1191, '鱼竿鱼线', 129, 3, 1, 0, NULL, NULL, 0, '#17#129#1191', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1192, '浮漂鱼饵', 129, 3, 1, 0, NULL, NULL, 0, '#17#129#1192', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1193, '钓鱼桌椅', 129, 3, 1, 0, NULL, NULL, 0, '#17#129#1193', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1194, '钓鱼配件', 129, 3, 1, 0, NULL, NULL, 0, '#17#129#1194', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1195, '钓箱鱼包', 129, 3, 1, 0, NULL, NULL, 0, '#17#129#1195', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1196, '其它', 129, 3, 1, 0, NULL, NULL, 0, '#17#129#1196', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1197, '泳镜', 130, 3, 1, 0, NULL, NULL, 0, '#17#130#1197', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1198, '泳帽', 130, 3, 1, 0, NULL, NULL, 0, '#17#130#1198', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1199, '游泳包防水包', 130, 3, 1, 0, NULL, NULL, 0, '#17#130#1199', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1200, '女士泳衣', 130, 3, 1, 0, NULL, NULL, 0, '#17#130#1200', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1201, '男士泳衣', 130, 3, 1, 0, NULL, NULL, 0, '#17#130#1201', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1202, '比基尼', 130, 3, 1, 0, NULL, NULL, 0, '#17#130#1202', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1203, '其它', 130, 3, 1, 0, NULL, NULL, 0, '#17#130#1203', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1204, '冲锋衣裤', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1204', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1205, '速干衣裤', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1205', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1206, '滑雪服', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1206', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1207, '羽绒服/棉服', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1207', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1208, '休闲衣裤', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1208', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1209, '抓绒衣裤', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1209', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1210, '软壳衣裤', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1210', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1211, 'T恤', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1211', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1212, '户外风衣', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1212', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1213, '功能内衣', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1213', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1214, '军迷服饰', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1214', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1215, '登山鞋', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1215', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1216, '雪地靴', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1216', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1217, '徒步鞋', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1217', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1218, '越野跑鞋', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1218', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1219, '休闲鞋', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1219', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1220, '工装鞋', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1220', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1221, '溯溪鞋', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1221', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1222, '沙滩/凉拖', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1222', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1223, '户外袜', 131, 3, 1, 0, NULL, NULL, 0, '#17#131#1223', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1224, '帐篷/垫子', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1224', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1225, '睡袋/吊床', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1225', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1226, '登山攀岩', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1226', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1227, '户外配饰', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1227', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1228, '背包', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1228', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1229, '户外照明', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1229', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1230, '户外仪表', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1230', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1231, '户外工具', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1231', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1232, '望远镜', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1232', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1233, '旅游用品', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1233', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1234, '便携桌椅床', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1234', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1235, '野餐烧烤', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1235', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1236, '军迷用品', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1236', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1237, '救援装备', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1237', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1238, '滑雪装备', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1238', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1239, '极限户外', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1239', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1240, '冲浪潜水', 132, 3, 1, 0, NULL, NULL, 0, '#17#132#1240', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1241, '综合训练器', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1241', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1242, '其他大型器械', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1242', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1243, '哑铃', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1243', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1244, '仰卧板/收腹机', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1244', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1245, '其他中小型器材', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1245', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1246, '瑜伽舞蹈', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1246', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1247, '甩脂机', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1247', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1248, '踏步机', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1248', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1249, '武术搏击', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1249', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1250, '健身车/动感单车', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1250', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1251, '跑步机', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1251', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1252, '运动护具', 133, 3, 1, 0, NULL, NULL, 0, '#17#133#1252', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1253, '羽毛球', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1253', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1254, '乒乓球', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1254', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1255, '篮球', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1255', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1256, '足球', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1256', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1257, '网球', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1257', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1258, '排球', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1258', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1259, '高尔夫', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1259', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1260, '台球', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1260', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1261, '棋牌麻将', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1261', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1262, '轮滑滑板', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1262', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1263, '其他', 134, 3, 1, 0, NULL, NULL, 0, '#17#134#1263', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1264, '0-6个月', 135, 3, 1, 0, NULL, NULL, 0, '#18#135#1264', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1265, '6-12个月', 135, 3, 1, 0, NULL, NULL, 0, '#18#135#1265', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1266, '1-3岁', 135, 3, 1, 0, NULL, NULL, 0, '#18#135#1266', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1267, '3-6岁', 135, 3, 1, 0, NULL, NULL, 0, '#18#135#1267', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1268, '6-14岁', 135, 3, 1, 0, NULL, NULL, 0, '#18#135#1268', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1269, '14岁以上', 135, 3, 1, 0, NULL, NULL, 0, '#18#135#1269', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1270, '遥控车', 136, 3, 1, 0, NULL, NULL, 0, '#18#136#1270', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1271, '遥控飞机', 136, 3, 1, 0, NULL, NULL, 0, '#18#136#1271', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1272, '遥控船', 136, 3, 1, 0, NULL, NULL, 0, '#18#136#1272', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1273, '机器人', 136, 3, 1, 0, NULL, NULL, 0, '#18#136#1273', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1274, '轨道/助力', 136, 3, 1, 0, NULL, NULL, 0, '#18#136#1274', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1275, '毛绒/布艺', 137, 3, 1, 0, NULL, NULL, 0, '#18#137#1275', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1276, '靠垫/抱枕', 137, 3, 1, 0, NULL, NULL, 0, '#18#137#1276', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1277, '芭比娃娃', 138, 3, 1, 0, NULL, NULL, 0, '#18#138#1277', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1278, '卡通娃娃', 138, 3, 1, 0, NULL, NULL, 0, '#18#138#1278', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1279, '智能娃娃', 138, 3, 1, 0, NULL, NULL, 0, '#18#138#1279', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1280, '仿真模型', 139, 3, 1, 0, NULL, NULL, 0, '#18#139#1280', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1281, '拼插模型', 139, 3, 1, 0, NULL, NULL, 0, '#18#139#1281', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1282, '收藏爱好', 139, 3, 1, 0, NULL, NULL, 0, '#18#139#1282', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1283, '炫舞毯', 140, 3, 1, 0, NULL, NULL, 0, '#18#140#1283', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1284, '爬行垫/毯', 140, 3, 1, 0, NULL, NULL, 0, '#18#140#1284', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1285, '户外玩具', 140, 3, 1, 0, NULL, NULL, 0, '#18#140#1285', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1286, '戏水玩具', 140, 3, 1, 0, NULL, NULL, 0, '#18#140#1286', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1287, '电影周边', 141, 3, 1, 0, NULL, NULL, 0, '#18#141#1287', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1288, '卡通周边', 141, 3, 1, 0, NULL, NULL, 0, '#18#141#1288', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1289, '网游周边', 141, 3, 1, 0, NULL, NULL, 0, '#18#141#1289', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1290, '摇铃/床铃', 142, 3, 1, 0, NULL, NULL, 0, '#18#142#1290', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1291, '健身架', 142, 3, 1, 0, NULL, NULL, 0, '#18#142#1291', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1292, '早教启智', 142, 3, 1, 0, NULL, NULL, 0, '#18#142#1292', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1293, '拖拉玩具', 142, 3, 1, 0, NULL, NULL, 0, '#18#142#1293', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1294, '积木', 143, 3, 1, 0, NULL, NULL, 0, '#18#143#1294', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1295, '拼图', 143, 3, 1, 0, NULL, NULL, 0, '#18#143#1295', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1296, '磁力棒', 143, 3, 1, 0, NULL, NULL, 0, '#18#143#1296', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1297, '立体拼插', 143, 3, 1, 0, NULL, NULL, 0, '#18#143#1297', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1298, '手工彩泥', 144, 3, 1, 0, NULL, NULL, 0, '#18#144#1298', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1299, '绘画工具', 144, 3, 1, 0, NULL, NULL, 0, '#18#144#1299', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1300, '情景玩具', 144, 3, 1, 0, NULL, NULL, 0, '#18#144#1300', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1301, '减压玩具', 145, 3, 1, 0, NULL, NULL, 0, '#18#145#1301', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1302, '创意玩具', 145, 3, 1, 0, NULL, NULL, 0, '#18#145#1302', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1303, '钢琴', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1303', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1304, '电子琴/电钢琴', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1304', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1305, '吉他/尤克里里', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1305', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1306, '打击乐器', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1306', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1307, '西洋管弦', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1307', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1308, '民族管弦乐器', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1308', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1309, '乐器配件', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1309', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1310, '电脑音乐', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1310', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1311, '工艺礼品乐器', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1311', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1312, '口琴/口风琴/竖笛', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1312', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1313, '手风琴', 146, 3, 1, 0, NULL, NULL, 0, '#18#146#1313', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1314, '双色球', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1314', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1315, '大乐透', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1315', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1316, '福彩3D', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1316', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1317, '排列三', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1317', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1318, '排列五', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1318', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1319, '七星彩', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1319', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1320, '七乐彩', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1320', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1321, '竞彩足球', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1321', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1322, '竞彩篮球', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1322', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1323, '新时时彩', 147, 3, 1, 0, NULL, NULL, 0, '#19#147#1323', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1324, '国内机票', 148, 3, 1, 0, NULL, NULL, 0, '#19#148#1324', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1325, '国内酒店', 149, 3, 1, 0, NULL, NULL, 0, '#19#149#1325', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1326, '酒店团购', 149, 3, 1, 0, NULL, NULL, 0, '#19#149#1326', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1327, '度假', 150, 3, 1, 0, NULL, NULL, 0, '#19#150#1327', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1328, '景点', 150, 3, 1, 0, NULL, NULL, 0, '#19#150#1328', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1329, '租车', 150, 3, 1, 0, NULL, NULL, 0, '#19#150#1329', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1330, '火车票', 150, 3, 1, 0, NULL, NULL, 0, '#19#150#1330', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1331, '旅游团购', 150, 3, 1, 0, NULL, NULL, 0, '#19#150#1331', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1332, '手机充值', 151, 3, 1, 0, NULL, NULL, 0, '#19#151#1332', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1333, '游戏点卡', 152, 3, 1, 0, NULL, NULL, 0, '#19#152#1333', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1334, 'QQ充值', 152, 3, 1, 0, NULL, NULL, 0, '#19#152#1334', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1335, '电影票', 153, 3, 1, 0, NULL, NULL, 0, '#19#153#1335', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1336, '演唱会', 153, 3, 1, 0, NULL, NULL, 0, '#19#153#1336', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1337, '话剧歌剧', 153, 3, 1, 0, NULL, NULL, 0, '#19#153#1337', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1338, '音乐会', 153, 3, 1, 0, NULL, NULL, 0, '#19#153#1338', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1339, '体育赛事', 153, 3, 1, 0, NULL, NULL, 0, '#19#153#1339', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1340, '舞蹈芭蕾', 153, 3, 1, 0, NULL, NULL, 0, '#19#153#1340', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1341, '戏曲综艺', 153, 3, 1, 0, NULL, NULL, 0, '#19#153#1341', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1342, '东北', 154, 3, 1, 0, NULL, NULL, 0, '#20#154#1342', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1343, '华北', 154, 3, 1, 0, NULL, NULL, 0, '#20#154#1343', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1344, '西北', 154, 3, 1, 0, NULL, NULL, 0, '#20#154#1344', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1345, '华中', 154, 3, 1, 0, NULL, NULL, 0, '#20#154#1345', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1346, '华东', 154, 3, 1, 0, NULL, NULL, 0, '#20#154#1346', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1347, '华南', 154, 3, 1, 0, NULL, NULL, 0, '#20#154#1347', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1348, '西南', 154, 3, 1, 0, NULL, NULL, 0, '#20#154#1348', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1349, '苹果', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1349', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1350, '橙子', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1350', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1351, '奇异果/猕猴桃', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1351', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1352, '车厘子/樱桃', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1352', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1353, '芒果', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1353', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1354, '蓝莓', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1354', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1355, '火龙果', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1355', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1356, '葡萄/提子', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1356', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1357, '柚子', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1357', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1358, '香蕉', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1358', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1359, '牛油果', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1359', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1360, '梨', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1360', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1361, '菠萝/凤梨', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1361', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1362, '桔/橘', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1362', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1363, '柠檬', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1363', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1364, '草莓', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1364', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1365, '桃/李/杏', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1365', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1366, '更多水果', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1366', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1367, '水果礼盒/券', 155, 3, 1, 0, NULL, NULL, 0, '#20#155#1367', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1368, '牛肉', 156, 3, 1, 0, NULL, NULL, 0, '#20#156#1368', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1369, '羊肉', 156, 3, 1, 0, NULL, NULL, 0, '#20#156#1369', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1370, '猪肉', 156, 3, 1, 0, NULL, NULL, 0, '#20#156#1370', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1371, '内脏类', 156, 3, 1, 0, NULL, NULL, 0, '#20#156#1371', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1372, '鱼类', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1372', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1373, '虾类', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1373', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1374, '蟹类', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1374', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1375, '贝类', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1375', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1376, '海参', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1376', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1377, '海产干货', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1377', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1378, '其他水产', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1378', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1379, '海产礼盒', 157, 3, 1, 0, NULL, NULL, 0, '#20#157#1379', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1380, '鸡肉', 158, 3, 1, 0, NULL, NULL, 0, '#20#158#1380', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1381, '鸭肉', 158, 3, 1, 0, NULL, NULL, 0, '#20#158#1381', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1382, '蛋类', 158, 3, 1, 0, NULL, NULL, 0, '#20#158#1382', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1383, '其他禽类', 158, 3, 1, 0, NULL, NULL, 0, '#20#158#1383', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1384, '水饺/馄饨', 159, 3, 1, 0, NULL, NULL, 0, '#20#159#1384', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1385, '汤圆/元宵', 159, 3, 1, 0, NULL, NULL, 0, '#20#159#1385', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1386, '面点', 159, 3, 1, 0, NULL, NULL, 0, '#20#159#1386', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1387, '火锅丸串', 159, 3, 1, 0, NULL, NULL, 0, '#20#159#1387', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1388, '速冻半成品', 159, 3, 1, 0, NULL, NULL, 0, '#20#159#1388', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1389, '奶酪黄油', 159, 3, 1, 0, NULL, NULL, 0, '#20#159#1389', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1390, '熟食', 160, 3, 1, 0, NULL, NULL, 0, '#20#160#1390', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1391, '腊肠/腊肉', 160, 3, 1, 0, NULL, NULL, 0, '#20#160#1391', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1392, '火腿', 160, 3, 1, 0, NULL, NULL, 0, '#20#160#1392', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1393, '糕点', 160, 3, 1, 0, NULL, NULL, 0, '#20#160#1393', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1394, '礼品卡券', 160, 3, 1, 0, NULL, NULL, 0, '#20#160#1394', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1395, '冷藏果蔬汁', 161, 3, 1, 0, NULL, NULL, 0, '#20#161#1395', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1396, '冰激凌', 161, 3, 1, 0, NULL, NULL, 0, '#20#161#1396', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1397, '其他', 161, 3, 1, 0, NULL, NULL, 0, '#20#161#1397', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1398, '叶菜类', 162, 3, 1, 0, NULL, NULL, 0, '#20#162#1398', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1399, '茄果瓜类', 162, 3, 1, 0, NULL, NULL, 0, '#20#162#1399', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1400, '根茎类', 162, 3, 1, 0, NULL, NULL, 0, '#20#162#1400', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1401, '鲜菌菇', 162, 3, 1, 0, NULL, NULL, 0, '#20#162#1401', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1402, '葱姜蒜椒', 162, 3, 1, 0, NULL, NULL, 0, '#20#162#1402', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1403, '半加工蔬菜', 162, 3, 1, 0, NULL, NULL, 0, '#20#162#1403', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1404, '微型车', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1404', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1405, '小型车', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1405', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1406, '紧凑型车', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1406', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1407, '中型车', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1407', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1408, '中大型车', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1408', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1409, '豪华车', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1409', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1410, 'MPV', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1410', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1411, 'SUV', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1411', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1412, '跑车', 163, 3, 1, 0, NULL, NULL, 0, '#21#163#1412', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1413, '微型车（二手）', 164, 3, 1, 0, NULL, NULL, 0, '#21#164#1413', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1414, '小型车（二手）', 164, 3, 1, 0, NULL, NULL, 0, '#21#164#1414', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1415, '紧凑型车（二手）', 164, 3, 1, 0, NULL, NULL, 0, '#21#164#1415', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1416, '中型车（二手）', 164, 3, 1, 0, NULL, NULL, 0, '#21#164#1416', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1417, '中大型车（二手）', 164, 3, 1, 0, NULL, NULL, 0, '#21#164#1417', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1418, '豪华车（二手）', 164, 3, 1, 0, NULL, NULL, 0, '#21#164#1418', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1419, 'MPV（二手）', 164, 3, 1, 0, NULL, NULL, 0, '#21#164#1419', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1420, 'SUV（二手）', 164, 3, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1421, '跑车（二手）', 164, 3, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1422, '皮卡（二手）', 164, 3, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1423, '面包车（二手）', 164, 3, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1431, 'dsa323', 1, 2, 1, 0, NULL, NULL, NULL, '#1#1431', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1432, 'fdsffdsadddd大萨达', 1431, 3, 1, 0, NULL, NULL, NULL, '#1#1431#1432', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1434, 'test', 107, 3, 1, 0, '', NULL, NULL, '#15#107#1434', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1435, 'test', 107, 3, 1, 0, NULL, NULL, NULL, '#15#107#1435', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category` VALUES (1436, 'tesat', 107, 3, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_category_brand_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_brand_relation`;
CREATE TABLE `pms_category_brand_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联关系id',
  `brand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌id',
  `catelog_id` bigint(20) NULL DEFAULT NULL COMMENT '分类id',
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `catelog_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '品牌分类关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_category_brand_relation
-- ----------------------------
INSERT INTO `pms_category_brand_relation` VALUES (1, 2, 225, '华为', '手机', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category_brand_relation` VALUES (2, 1, 225, '荣耀', '手机', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category_brand_relation` VALUES (5, 1, 365, '荣耀', '智能手环', NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_category_brand_relation` VALUES (6, 1, 369, '荣耀', '健康监测', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `comment_id` bigint(20) NULL DEFAULT NULL COMMENT '评论id',
  `reply_id` bigint(20) NULL DEFAULT NULL COMMENT '回复id',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品评价回复关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pms_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attr_value`;
CREATE TABLE `pms_product_attr_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `attr_id` bigint(20) NULL DEFAULT NULL COMMENT '属性id',
  `attr_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性值',
  `attr_sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `quick_show` tinyint(4) NULL DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'spu属性值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attr_value
-- ----------------------------
INSERT INTO `pms_product_attr_value` VALUES (29, 3, 2, '上市年份', '2020', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_product_attr_value` VALUES (30, 3, 3, '颜色', '流光幻镜', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_product_attr_value` VALUES (31, 3, 1, '入网参数', '5G', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_product_attr_value` VALUES (32, 3, 9, '电池容量', '5000mAh', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_product_attr_value` VALUES (33, 3, 10, '机身长度(mm)', '168', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_product_attr_value` VALUES (34, 3, 7, 'CPU型号', '麒麟990', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_product_attr_value` VALUES (35, 3, 8, 'CPU工艺', '5nm', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_product_attr_value` VALUES (36, 3, 12, 'CPU品牌', '海思(Hisilicon)', 0, 1, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_sku_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_images`;
CREATE TABLE `pms_sku_images`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku_id',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `default_img` int(11) NULL DEFAULT NULL COMMENT '默认图[0 - 不是默认图，1 - 是默认图]',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'sku图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_images
-- ----------------------------
INSERT INTO `pms_sku_images` VALUES (1, 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (2, 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (3, 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (4, 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (5, 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (6, 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (7, 1, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (8, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (9, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (10, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (11, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (12, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (13, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (14, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (15, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (16, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (17, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (18, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (19, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (20, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (21, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (22, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (23, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (24, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (25, 3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (26, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (27, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (28, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (29, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (30, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (31, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (32, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (33, 4, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (34, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (35, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (36, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (37, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (38, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (39, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (40, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (41, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (42, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (43, 5, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (44, 6, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (45, 6, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (46, 6, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (47, 6, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (48, 6, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (49, 6, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (50, 6, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (51, 7, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (52, 7, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (53, 7, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (54, 7, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (55, 7, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (56, 7, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (57, 7, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (58, 8, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (59, 8, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (60, 8, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (61, 8, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (62, 8, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (63, 9, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (64, 9, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (65, 9, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (66, 9, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_images` VALUES (67, 9, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, 0, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_sku_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_info`;
CREATE TABLE `pms_sku_info`  (
  `sku_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'skuId',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spuId',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sku介绍描述',
  `catalog_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌id',
  `sku_default_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '默认图片',
  `sku_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `sku_subtitle` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '副标题',
  `price` decimal(18, 4) NULL DEFAULT NULL COMMENT '价格',
  `sale_count` bigint(20) NULL DEFAULT NULL COMMENT '销量',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'sku信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_info
-- ----------------------------
INSERT INTO `pms_sku_info` VALUES (1, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐二', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐二 麒麟990 5G SoC芯片 5000万超感知徕卡五摄 100倍双目变焦 全网通5G', '【6月6日10:08抢购】抢券享24期免息；5G手机至高享24期免息，低至5.1元/天》', 8888.0000, 2654, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (2, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐三', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐二 麒麟990 5G SoC芯片 5000万超感知徕卡五摄 100倍双目变焦 全网通5G', '【6月6日10:08抢购】抢券享24期免息；5G手机至高享24期免息，低至5.1元/天》', 8888.0000, 1454, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (3, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐一', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐二 麒麟990 5G SoC芯片 5000万超感知徕卡五摄 100倍双目变焦 全网通5G', '【品牌日限时享24期免息】5000万超感知徕卡四摄；50倍数字变焦；5G手机至高享24期免息，低至5.1元/天》', 5988.0000, 1673, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (4, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐二', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐二 麒麟990 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦  全网通5G手机', '【品牌日限时享24期免息】5000万超感知徕卡四摄；50倍数字变焦；5G手机至高享24期免息，低至5.1元/天》', 5988.0000, 3587, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (5, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐三', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐二 麒麟990 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦  全网通5G手机', '【品牌日限时享24期免息】5000万超感知徕卡四摄；50倍数字变焦；5G手机至高享24期免息，低至5.1元/天》', 5988.0000, 1235, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (6, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐一', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐二 麒麟990 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦  全网通5G手机', '【下单立减100/12期免息/咨询可省更多钱】赠原装碎屏险+华为原装无线充+华为智能手环+AI智能蓝牙音箱+硅胶保护壳+保护膜+晒单礼购买P40咨询客服享优惠', 5988.0000, 1456, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (7, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐二', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐二 【白条12期免息送碎屏险】华为 P40 Pro 5G手机 分期', '【下单立减100/12期免息/咨询可省更多钱】赠原装碎屏险+华为原装无线充+华为智能手环+AI智能蓝牙音箱+硅胶保护壳+保护膜+晒单礼购买P40咨询客服享优惠', 5988.0000, 2354, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (8, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐三', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐三 【白条12期免息送碎屏险】华为 P40 Pro 5G手机 分期', '【下单立减100/12期免息/咨询可省更多钱】赠原装碎屏险+华为原装无线充+华为智能手环+AI智能蓝牙音箱+硅胶保护壳+保护膜+晒单礼购买P40咨询客服享优惠', 5988.0000, 2546, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_info` VALUES (9, 3, '华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐一', NULL, 225, 2, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', '华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐一 【白条12期免息送碎屏险】华为 P40 Pro 5G手机 分期', '【保价618，下单立减200，未减咨询，至高可减400】赠原装碎屏险+华为原装智能手环+网红榨汁机+AI蓝牙音箱+硅胶保护壳+保护膜+晒单礼', 4188.0000, 957, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_sku_sale_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_sale_attr_value`;
CREATE TABLE `pms_sku_sale_attr_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku_id',
  `attr_id` bigint(20) NULL DEFAULT NULL COMMENT 'attr_id',
  `attr_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '销售属性名',
  `attr_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '销售属性值',
  `attr_sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'sku销售属性&值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_sale_attr_value
-- ----------------------------
INSERT INTO `pms_sku_sale_attr_value` VALUES (1, 1, 4, '颜色', '流光幻镜', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (2, 1, 6, '套餐', '套餐二', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (3, 2, 4, '颜色', '流光幻镜', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (4, 2, 6, '套餐', '套餐三', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (5, 3, 4, '颜色', '流光幻镜', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (6, 3, 6, '套餐', '套餐一', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (7, 4, 4, '颜色', '霓影紫', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (8, 4, 6, '套餐', '套餐二', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (9, 5, 4, '颜色', '霓影紫', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (10, 5, 6, '套餐', '套餐三', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (11, 6, 4, '颜色', '霓影紫', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (12, 6, 6, '套餐', '套餐一', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (13, 7, 4, '颜色', '钛空银', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (14, 7, 6, '套餐', '套餐二', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (15, 8, 4, '颜色', '钛空银', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (16, 8, 6, '套餐', '套餐三', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (17, 9, 4, '颜色', '钛空银', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_sku_sale_attr_value` VALUES (18, 9, 6, '套餐', '套餐一', 0, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_spu_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_comment`;
CREATE TABLE `pms_spu_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'sku_id',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名字',
  `member_nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `star` tinyint(1) NULL DEFAULT NULL COMMENT '星级',
  `member_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '会员ip',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `show_status` tinyint(1) NULL DEFAULT NULL COMMENT '显示状态[0-不显示，1-显示]',
  `spu_attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '购买时属性组合',
  `likes_count` int(11) NULL DEFAULT NULL COMMENT '点赞数',
  `reply_count` int(11) NULL DEFAULT NULL COMMENT '回复数',
  `resources` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论图片/视频[json数据；[{type:文件类型,url:资源路径}]]',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `member_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `comment_type` tinyint(4) NULL DEFAULT NULL COMMENT '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pms_spu_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_images`;
CREATE TABLE `pms_spu_images`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu_id',
  `img_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片名',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `default_img` tinyint(4) NULL DEFAULT NULL COMMENT '是否默认图',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'spu图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_spu_images
-- ----------------------------
INSERT INTO `pms_spu_images` VALUES (17, 3, '图集1.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/e5ba78ec-9cf5-4bbd-86a7-ad2f611e2512_图集1.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_spu_images` VALUES (18, 3, '图集2.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/9915d4a7-9f73-4c71-85cc-65c0b7f644dd_图集2.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_spu_images` VALUES (19, 3, '图集3.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/ceb40c90-cce6-44fb-83ca-0de9420e88ac_图集3.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_spu_images` VALUES (20, 3, '图集4.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/4d2ed8b5-5504-4bad-8620-75db9c29d3ea_图集4.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_spu_images` VALUES (21, 3, '图集5.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/72b3962b-6a79-4d16-8c83-2f3f61dba176_图集5.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_spu_images` VALUES (22, 3, '图集6.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/55871b9f-589b-4957-8eb3-9d2c8698406b_图集6.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_spu_images` VALUES (23, 3, '图集7.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/0bb896b8-fee8-4933-877c-2c4615c802d6_图集7.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `pms_spu_images` VALUES (24, 3, '图集8.jpg', 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/93b64468-46f1-4257-8b5f-58b8f8375081_图集8.jpg', 0, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_spu_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info`;
CREATE TABLE `pms_spu_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `spu_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spu_description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品描述',
  `catalog_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌id',
  `weight` decimal(18, 4) NULL DEFAULT NULL,
  `publish_status` tinyint(4) NULL DEFAULT NULL COMMENT '上架状态[0 - 下架，1 - 上架]',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'spu信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_spu_info
-- ----------------------------
INSERT INTO `pms_spu_info` VALUES (3, '华为 HUAWEI P40 Pro+ 麒麟990 5G ', '华为 HUAWEI P40 Pro+ 麒麟990 5G ', 225, 2, 0.5700, 1, '2020-06-06 10:40:25', '2020-06-15 02:39:01', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_spu_info_desc
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info_desc`;
CREATE TABLE `pms_spu_info_desc`  (
  `spu_id` bigint(20) NOT NULL COMMENT '商品id',
  `decript` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品介绍',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`spu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'spu信息介绍' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_spu_info_desc
-- ----------------------------
INSERT INTO `pms_spu_info_desc` VALUES (3, 'https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/5fcc807c-1a0c-431f-8635-ac75fe2b2a72_华为2.jpg,https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/5952be7a-bca4-4794-8a3f-8612b45bffb0_华为1.jpg,https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/fad57e61-8650-4d5c-87d1-064bfff90553_华为3.jpg,https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/344445d8-346b-4d04-8de1-4e31f6db4336_华为4.jpg,https://mall-fire.oss-cn-shenzhen.aliyuncs.com/2020-06-05/7d36cce9-94dc-49a4-8069-0ae66f57cdc3_华为5.jpg', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `version` decimal(4, 0) NULL DEFAULT 1 COMMENT '修改版本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
