set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='t_bu_budgetfillrepor'
                      and COLUMN_NAME='cumulativereturned'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=0,'ALTER TABLE t_bu_budgetfillreportdetail add COLUMN `cumulativereturned` FLOAT DEFAULT 0 comment ''累计已归还'' ;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;

set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='t_bu_budgetfillreportdetail'
                      and COLUMN_NAME='collateral'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=0,'ALTER TABLE t_bu_budgetfillreportdetail add COLUMN `collateral` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''抵押物方'' ;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;

set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='t_bu_budgetfillreportdetail'
                      and COLUMN_NAME='guaranty'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=0,'ALTER TABLE t_bu_budgetfillreportdetail add COLUMN `guaranty` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''抵押物'' ;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;


set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='t_bu_budgetfillreportdetail'
                      and COLUMN_NAME='collateral'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=1,'ALTER TABLE t_bu_budgetfillreportdetail MODIFY `collateral` varchar(128) ;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;

set @exist_Check := (
                    select count(*) from information_schema.columns
                    where TABLE_NAME='t_bu_budgetfillreportdetail'
                      and COLUMN_NAME='guaranty'
                      and TABLE_SCHEMA=database()
                    ) ;
set @sqlstmt := if(@exist_Check=1,'ALTER TABLE t_bu_budgetfillreportdetail MODIFY `guaranty` varchar(128) ;
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;
