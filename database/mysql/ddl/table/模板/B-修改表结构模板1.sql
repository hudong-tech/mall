set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='t_bu_budgetfillreportdetail'
                      and COLUMN_NAME='landinfo'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=0,'ALTER TABLE t_bu_budgetfillreportdetail add COLUMN `landinfo` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin   comment ''土地信息'' ;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;