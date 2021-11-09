-- ----------------------------
-- 在 DBSqlScriptUtils.java
-- 方法 ： prepareSqlStatementWithStringFormat 中
-- 将sql放入下面语句
-- String sql = "";
-- ----------------------------

alter table %s ADD COLUMN created_time DATETIME COMMENT '创建时间', ADD COLUMN created_by VARCHAR(32) DEFAULT NULL COMMENT '创建人', ADD COLUMN updated_time DATETIME COMMENT '修改时间', ADD COLUMN updated_by VARCHAR(32) DEFAULT NULL COMMENT '修改人', ADD COLUMN version DECIMAL(4) DEFAULT 1 COMMENT '修改版本'