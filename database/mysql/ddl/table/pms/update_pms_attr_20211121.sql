set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='pms_attr'
                      and COLUMN_NAME='value_type'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=0,'ALTER TABLE pms_attr add COLUMN `value_type` tinyint(4) NOT NULL DEFAULT 0  comment ''值类型 | 0-只能单个值 1-允许多个值'' ;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;