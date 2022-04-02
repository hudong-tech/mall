/*
 * 初始化数据库后，将所有分类的显示状态置为1，用于初始化分类路径。
 * 执行路径：localhost:88/api/product/category/saveAllPath
 */
set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='pms_category'
                      and COLUMN_NAME='show_status'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=1,'UPDATE pms_category SET show_status = 1;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;