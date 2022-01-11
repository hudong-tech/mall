/*
 Navicat Premium Data Transfer

 Source Server         : Everest_M
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/11/2021 00:38:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'mall-coupon.yml', 'dev', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_sms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-coupon\r\n\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\n\r\nserver:\r\n  port: 7000\r\n\r\ncoupon:\r\n  user: \r\n    name: zhangsan\r\n    age: 18\r\n\r\n', 'ea753e2a572cd819379f096329e6d8ed', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (2, 'mall-gateway.yml', 'dev', 'spring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n    gateway:\r\n      routes:\r\n        - id: test_route\r\n          uri: https://www.baidu.com\r\n          predicates:\r\n            - Query=url,baidu\r\n\r\n        - id: qq_route\r\n          uri: https://www.qq.com\r\n          predicates:\r\n            - Query=url,qq\r\n\r\n        - id: coupon_route\r\n          uri: lb://mall-coupon\r\n          predicates:\r\n            - Path=/api/coupon/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n      \r\n        - id: member_route\r\n          uri: lb://mall-member\r\n          predicates:\r\n            - Path=/api/member/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n              \r\n        - id: order_route\r\n          uri: lb://mall-order\r\n          predicates:\r\n            - Path=/api/order/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: product_route\r\n          uri: lb://mall-product\r\n          predicates:\r\n            - Path=/api/product/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: third_party_route\r\n          uri: lb://third-party\r\n          predicates:\r\n            - Path=/api/thirdparty/**\r\n          filters:\r\n            - RewritePath=/api/thirdparty/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: ware_route\r\n          uri: lb://mall-ware\r\n          predicates:\r\n            - Path=/api/ware/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: admin_route\r\n          uri: lb://renren-fast\r\n          predicates:\r\n            - Path=/api/**\r\n          filters: # 这段过滤器和验证码有关，api内容缓存了/renren-fast，还得注意/renren-fast也注册到nacos中\r\n            - RewritePath=/api/(?<segment>.*),/renren-fast/$\\{segment}\r\n  application:\r\n    name: mall-gateway\r\n\r\nserver:\r\n  port: 88', 'a627813e26c0b9dad4d95b00c100a8e2', '2021-10-18 16:17:16', '2021-10-26 18:12:24', NULL, '122.235.84.166', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (3, 'mall-product.yml', 'dev', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_pms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai&allowMultiQueries=true\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-product\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\n    logic-delete-value: 1\r\n    logic-not-delete-value: 0\r\nserver:\r\n  port: 10000\r\nlogging: \r\n  level: \r\n    com.tech.gulimall: debug', 'bf2e24c5eb4730936af0a947d345c3c1', '2021-10-18 16:17:16', '2021-11-06 14:22:35', NULL, '115.206.141.68', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (4, 'mall-ware.yml', 'dev', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_wms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-ware\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 11000', '2d01fc1ae058f20164c2ccd1a353db83', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (5, 'mall-order.yml', 'dev', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_oms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-order\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 9000', '1d910bdefc803ee429eb2c6aed7a2970', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (6, 'mall-member.yml', 'dev', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_ums?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-member\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 8000', 'c870346ec25bf3c563520882b2ece69e', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (7, 'renren-fast.yml', 'dev', '# Tomcat\r\nserver:\r\n  tomcat:\r\n    uri-encoding: UTF-8\r\n    max-threads: 1000\r\n    min-spare-threads: 30\r\n  port: 8080\r\n  connection-timeout: 5000ms\r\n  servlet:\r\n    context-path: /renren-fast\r\n\r\nspring:\r\n  # 环境 dev|test|prod\r\n  profiles:\r\n    active: dev\r\n  # jackson时间格式化\r\n  jackson:\r\n    time-zone: GMT+8\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n  servlet:\r\n    multipart:\r\n      max-file-size: 100MB\r\n      max-request-size: 100MB\r\n      enabled: true\r\n  redis:\r\n    open: false  # 是否开启redis缓存  true开启   false关闭\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password:    # 密码（默认为空）\r\n    timeout: 6000ms  # 连接超时时长（毫秒）\r\n    jedis:\r\n      pool:\r\n        max-active: 1000  # 连接池最大连接数（使用负值表示没有限制）\r\n        max-wait: -1ms      # 连接池最大阻塞等待时间（使用负值表示没有限制）\r\n        max-idle: 10      # 连接池中的最大空闲连接\r\n        min-idle: 5       # 连接池中的最小空闲连接\r\n  mvc:\r\n    throw-exception-if-no-handler-found: true\r\n  application:\r\n    name: renren-fast\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      url: jdbc:mysql://81.68.207.20:3306/mall_admin?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai\r\n      username: root\r\n      password: root\r\n      initial-size: 10\r\n      max-active: 100\r\n      min-idle: 10\r\n      max-wait: 60000\r\n      pool-prepared-statements: true\r\n      max-pool-prepared-statement-per-connection-size: 20\r\n      time-between-eviction-runs-millis: 60000\r\n      min-evictable-idle-time-millis: 300000\r\n      #Oracle需要打开注释\r\n      #validation-query: SELECT 1 FROM DUAL\r\n      test-while-idle: true\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          log-slow-sql: true\r\n          slow-sql-millis: 1000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n#  resources:\r\n#    add-mappings: false\r\n\r\n\r\n#mybatis\r\nmybatis-plus:\r\n  mapper-locations: classpath*:/mapper/**/*.xml\r\n  #实体扫描，多个package用逗号或者分号分隔\r\n  typeAliasesPackage: io.renren.modules.*.entity\r\n  global-config:\r\n    #数据库相关配置\r\n    db-config:\r\n      #主键类型  AUTO:\"数据库ID自增\", INPUT:\"用户输入ID\", ID_WORKER:\"全局唯一ID (数字类型唯一ID)\", UUID:\"全局唯一ID UUID\";\r\n      id-type: AUTO\r\n      logic-delete-value: -1\r\n      logic-not-delete-value: 0\r\n    banner: false\r\n  #原生配置\r\n  configuration:\r\n    map-underscore-to-camel-case: true\r\n    cache-enabled: false\r\n    call-setters-on-nulls: true\r\n    jdbc-type-for-null: \'null\'\r\n\r\n\r\nrenren:\r\n  redis:\r\n    open: false\r\n  shiro:\r\n    redis: false\r\n  # APP模块，是通过jwt认证的，如果要使用APP模块，则需要修改【加密秘钥】\r\n  jwt:\r\n    # 加密秘钥\r\n    secret: f4e2e52034348f86b67cde581c0f9eb5[www.renren.io]\r\n    # token有效时长，7天，单位秒\r\n    expire: 604800\r\n    header: token', '82d327f0821458ddfd7d32ce451b289a', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (8, 'oss.yml', 'dev', 'spring: \r\n  cloud: \r\n    alicloud: \r\n      access-key: LTAI5tHuTvGAvXn3UQipwMiP\r\n      secret-key: OlBp1ESzDdgFhv3tiyr0bpHwuIn5yW\r\n      oss: \r\n        endpoint: oss-cn-hangzhou.aliyuncs.com', 'bf3a5aefb797a102b4e8cef45667e1fb', '2021-10-26 16:31:12', '2021-10-27 14:45:30', NULL, '122.235.84.166', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (9, 'third-party.yml', 'dev', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_pms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: third-party\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 30000', '2219199dfb726501ebf84661a3257c08', '2021-10-26 17:18:27', '2021-10-26 17:18:27', NULL, '122.235.84.166', '', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', NULL, NULL, NULL, 'yaml', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'mall-coupon.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_sms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-coupon\r\n\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\n\r\nserver:\r\n  port: 7000\r\n\r\ncoupon:\r\n  user: \r\n    name: zhangsan\r\n    age: 18\r\n\r\n', 'ea753e2a572cd819379f096329e6d8ed', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 2, 'mall-gateway.yml', 'dev', '', 'spring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n    gateway:\r\n      routes:\r\n        - id: test_route\r\n          uri: https://www.baidu.com\r\n          predicates:\r\n            - Query=url,baidu\r\n\r\n        - id: qq_route\r\n          uri: https://www.qq.com\r\n          predicates:\r\n            - Query=url,qq\r\n\r\n        - id: coupon_route\r\n          uri: lb://mall-coupon\r\n          predicates:\r\n            - Path=/api/coupon/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n      \r\n        - id: member_route\r\n          uri: lb://mall-member\r\n          predicates:\r\n            - Path=/api/member/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n              \r\n        - id: order_route\r\n          uri: lb://mall-order\r\n          predicates:\r\n            - Path=/api/order/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: product_route\r\n          uri: lb://mall-product\r\n          predicates:\r\n            - Path=/api/product/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: third_party_route\r\n          uri: lb://mall-third-party\r\n          predicates:\r\n            - Path=/api/thirdparty/**\r\n          filters:\r\n            - RewritePath=/api/thirdparty/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: ware_route\r\n          uri: lb://mall-ware\r\n          predicates:\r\n            - Path=/api/ware/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: admin_route\r\n          uri: lb://renren-fast\r\n          predicates:\r\n            - Path=/api/**\r\n          filters: # 这段过滤器和验证码有关，api内容缓存了/renren-fast，还得注意/renren-fast也注册到nacos中\r\n            - RewritePath=/api/(?<segment>.*),/renren-fast/$\\{segment}\r\n  application:\r\n    name: mall-gateway\r\n\r\nserver:\r\n  port: 88', '5801e4b34a2952caa85affd6ea13f1bb', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 3, 'mall-product.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_pms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-product\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\n    logic-delete-value: 1\r\n    logic-not-delete-value: 0\r\nserver:\r\n  port: 10000\r\nlogging: \r\n  level: \r\n    com.tech.gulimall: debug', '8321b8eb375eee8723765d19d1939ced', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 4, 'mall-ware.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_wms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-ware\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 11000', '2d01fc1ae058f20164c2ccd1a353db83', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 5, 'mall-order.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_oms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-order\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 9000', '1d910bdefc803ee429eb2c6aed7a2970', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 6, 'mall-member.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_ums?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-member\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 8000', 'c870346ec25bf3c563520882b2ece69e', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 7, 'renren-fast.yml', 'dev', '', '# Tomcat\r\nserver:\r\n  tomcat:\r\n    uri-encoding: UTF-8\r\n    max-threads: 1000\r\n    min-spare-threads: 30\r\n  port: 8080\r\n  connection-timeout: 5000ms\r\n  servlet:\r\n    context-path: /renren-fast\r\n\r\nspring:\r\n  # 环境 dev|test|prod\r\n  profiles:\r\n    active: dev\r\n  # jackson时间格式化\r\n  jackson:\r\n    time-zone: GMT+8\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n  servlet:\r\n    multipart:\r\n      max-file-size: 100MB\r\n      max-request-size: 100MB\r\n      enabled: true\r\n  redis:\r\n    open: false  # 是否开启redis缓存  true开启   false关闭\r\n    database: 0\r\n    host: localhost\r\n    port: 6379\r\n    password:    # 密码（默认为空）\r\n    timeout: 6000ms  # 连接超时时长（毫秒）\r\n    jedis:\r\n      pool:\r\n        max-active: 1000  # 连接池最大连接数（使用负值表示没有限制）\r\n        max-wait: -1ms      # 连接池最大阻塞等待时间（使用负值表示没有限制）\r\n        max-idle: 10      # 连接池中的最大空闲连接\r\n        min-idle: 5       # 连接池中的最小空闲连接\r\n  mvc:\r\n    throw-exception-if-no-handler-found: true\r\n  application:\r\n    name: renren-fast\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    druid:\r\n      driver-class-name: com.mysql.cj.jdbc.Driver\r\n      url: jdbc:mysql://81.68.207.20:3306/mall_admin?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai\r\n      username: root\r\n      password: root\r\n      initial-size: 10\r\n      max-active: 100\r\n      min-idle: 10\r\n      max-wait: 60000\r\n      pool-prepared-statements: true\r\n      max-pool-prepared-statement-per-connection-size: 20\r\n      time-between-eviction-runs-millis: 60000\r\n      min-evictable-idle-time-millis: 300000\r\n      #Oracle需要打开注释\r\n      #validation-query: SELECT 1 FROM DUAL\r\n      test-while-idle: true\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n        #login-username: admin\r\n        #login-password: admin\r\n      filter:\r\n        stat:\r\n          log-slow-sql: true\r\n          slow-sql-millis: 1000\r\n          merge-sql: false\r\n        wall:\r\n          config:\r\n            multi-statement-allow: true\r\n\r\n#  resources:\r\n#    add-mappings: false\r\n\r\n\r\n#mybatis\r\nmybatis-plus:\r\n  mapper-locations: classpath*:/mapper/**/*.xml\r\n  #实体扫描，多个package用逗号或者分号分隔\r\n  typeAliasesPackage: io.renren.modules.*.entity\r\n  global-config:\r\n    #数据库相关配置\r\n    db-config:\r\n      #主键类型  AUTO:\"数据库ID自增\", INPUT:\"用户输入ID\", ID_WORKER:\"全局唯一ID (数字类型唯一ID)\", UUID:\"全局唯一ID UUID\";\r\n      id-type: AUTO\r\n      logic-delete-value: -1\r\n      logic-not-delete-value: 0\r\n    banner: false\r\n  #原生配置\r\n  configuration:\r\n    map-underscore-to-camel-case: true\r\n    cache-enabled: false\r\n    call-setters-on-nulls: true\r\n    jdbc-type-for-null: \'null\'\r\n\r\n\r\nrenren:\r\n  redis:\r\n    open: false\r\n  shiro:\r\n    redis: false\r\n  # APP模块，是通过jwt认证的，如果要使用APP模块，则需要修改【加密秘钥】\r\n  jwt:\r\n    # 加密秘钥\r\n    secret: f4e2e52034348f86b67cde581c0f9eb5[www.renren.io]\r\n    # token有效时长，7天，单位秒\r\n    expire: 604800\r\n    header: token', '82d327f0821458ddfd7d32ce451b289a', '2021-10-18 16:17:16', '2021-10-18 16:17:16', NULL, '58.100.170.96', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 8, 'oss.yml', 'dev', '', 'spring:\r\n  cloud:\r\n    alicloud:\r\n      access-key: LTAI5tMsf6dMKkrj3rhZxUzV\r\n      secret-key: T9s9CANCDPyWn333Vp4wn19uuNKgV1\r\n      oss:\r\n        endpoint: oss-cn-hangzhou.aliyuncs.com\r\n        bucket: gulimail-dong', '41319ef7e5672d46381743f3b83c3516', '2021-10-26 16:31:12', '2021-10-26 16:31:12', NULL, '122.235.84.166', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (0, 9, 'third-party.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_pms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: third-party\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\nserver:\r\n  port: 30000', '2219199dfb726501ebf84661a3257c08', '2021-10-26 17:18:27', '2021-10-26 17:18:27', NULL, '122.235.84.166', 'I', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (8, 10, 'oss.yml', 'dev', '', 'spring:\r\n  cloud:\r\n    alicloud:\r\n      access-key: LTAI5tMsf6dMKkrj3rhZxUzV\r\n      secret-key: T9s9CANCDPyWn333Vp4wn19uuNKgV1\r\n      oss:\r\n        endpoint: oss-cn-hangzhou.aliyuncs.com\r\n        bucket: gulimail-dong', '41319ef7e5672d46381743f3b83c3516', '2021-10-26 17:32:42', '2021-10-26 17:32:42', NULL, '122.235.84.166', 'U', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (8, 11, 'oss.yml', 'dev', '', 'spring: \r\n  cloud: \r\n    alicloud: \r\n      access-key: LTAI5tMsf6dMKkrj3rhZxUzV\r\n      secret-key: T9s9CANCDPyWn333Vp4wn19uuNKgV1\r\n      oss: \r\n        endpoint: oss-cn-hangzhou.aliyuncs.com\r\n        bucket: gulimail-dong', 'cf0e0d60291d9d4cea95e854c8af4dc0', '2021-10-26 17:34:36', '2021-10-26 17:34:36', NULL, '122.235.84.166', 'U', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (2, 12, 'mall-gateway.yml', 'dev', '', 'spring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n    gateway:\r\n      routes:\r\n        - id: test_route\r\n          uri: https://www.baidu.com\r\n          predicates:\r\n            - Query=url,baidu\r\n\r\n        - id: qq_route\r\n          uri: https://www.qq.com\r\n          predicates:\r\n            - Query=url,qq\r\n\r\n        - id: coupon_route\r\n          uri: lb://mall-coupon\r\n          predicates:\r\n            - Path=/api/coupon/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n      \r\n        - id: member_route\r\n          uri: lb://mall-member\r\n          predicates:\r\n            - Path=/api/member/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n              \r\n        - id: order_route\r\n          uri: lb://mall-order\r\n          predicates:\r\n            - Path=/api/order/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: product_route\r\n          uri: lb://mall-product\r\n          predicates:\r\n            - Path=/api/product/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: third_party_route\r\n          uri: lb://mall-third-party\r\n          predicates:\r\n            - Path=/api/thirdparty/**\r\n          filters:\r\n            - RewritePath=/api/thirdparty/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: ware_route\r\n          uri: lb://mall-ware\r\n          predicates:\r\n            - Path=/api/ware/**\r\n          filters:\r\n            - RewritePath=/api/(?<segment>.*),/$\\{segment}\r\n\r\n        - id: admin_route\r\n          uri: lb://renren-fast\r\n          predicates:\r\n            - Path=/api/**\r\n          filters: # 这段过滤器和验证码有关，api内容缓存了/renren-fast，还得注意/renren-fast也注册到nacos中\r\n            - RewritePath=/api/(?<segment>.*),/renren-fast/$\\{segment}\r\n  application:\r\n    name: mall-gateway\r\n\r\nserver:\r\n  port: 88', '5801e4b34a2952caa85affd6ea13f1bb', '2021-10-26 18:12:23', '2021-10-26 18:12:24', NULL, '122.235.84.166', 'U', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (8, 13, 'oss.yml', 'dev', '', 'spring: \r\n  cloud: \r\n    alicloud: \r\n      access-key: LTAI5tMsf6dMKkrj3rhZxUzV\r\n      secret-key: T9s9CANCDPyWn333Vp4wn19uuNKgV1\r\n      oss: \r\n        endpoint: oss-cn-hangzhou.aliyuncs.com', 'bfd6c4d498f877f5aa22f1990aac8301', '2021-10-27 14:45:30', '2021-10-27 14:45:30', NULL, '122.235.84.166', 'U', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');
INSERT INTO `his_config_info` VALUES (3, 14, 'mall-product.yml', 'dev', '', 'spring:\r\n  datasource:\r\n    username: root\r\n    password: root\r\n    url: jdbc:mysql://81.68.207.20:3306/mall_pms?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.jdbc.Driver\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: 81.68.207.20:8848\r\n  application:\r\n    name: mall-product\r\n# MapperScan\r\nmybatis-plus:\r\n  # sql映射文件位置\r\n  mapper-locations: classpath:/mapper/**/*.xml\r\n  global-config:\r\n    db-config:\r\n      # entity主键自增\r\n      id-type: auto\r\n    logic-delete-value: 1\r\n    logic-not-delete-value: 0\r\nserver:\r\n  port: 10000\r\nlogging: \r\n  level: \r\n    com.tech.gulimall: debug', '8321b8eb375eee8723765d19d1939ced', '2021-11-06 14:22:35', '2021-11-06 14:22:35', NULL, '115.206.141.68', 'U', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '5b92f1ba-a435-44f9-a2fc-42dbd7906a10', 'dev', '开发环境', 'nacos', 1634573731557, 1634573731557);
INSERT INTO `tenant_info` VALUES (2, '1', 'e1a52af0-e0b4-4adc-82d0-7120f8894968', 'sit', '测试环境', 'nacos', 1634573745820, 1634573745820);
INSERT INTO `tenant_info` VALUES (3, '1', '15790c8e-ad64-4fa6-a640-b2e632b0f8ae', 'uat', 'uat环境', 'nacos', 1634573754829, 1634573754829);
INSERT INTO `tenant_info` VALUES (5, '1', '78c67f0c-5e41-46a6-9499-356f670fd522', 'prod', '生产环境', 'nacos', 1634573789854, 1634573789854);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
