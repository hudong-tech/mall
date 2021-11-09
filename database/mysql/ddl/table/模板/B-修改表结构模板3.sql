set @exist_Check := (
    select count(*) from information_schema.columns
    where TABLE_NAME='T_BU_BUDGETSTANDINGBOOKMAPDTL'
    and COLUMN_NAME='REMARK'
		and is_nullable='NO'
    and TABLE_SCHEMA=database()
) ;
set @sqlstmt := if(@exist_Check=1,' alter table `T_BU_BUDGETSTANDINGBOOKMAPDTL` modify COLUMN `REMARK`  varchar(32) null COMMENT ''备注'';
', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;
