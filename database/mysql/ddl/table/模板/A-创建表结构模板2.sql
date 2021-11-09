set @exist_check := (
	select count(*) from information_schema.tables
	where table_name='t_bu_organization_budgetitems'
	and table_schema= database()
);
set @sqlstmt := if(@exist_check < 1,
'create table `t_bu_organization_budgetitems` (
         `urid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''URID'',
         `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''组织'',
         `budgetitemid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''计划项目id'',
         `createdon` datetime not null  comment ''创建时间'',
         `createdby` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''创建人'',
         `lastmodifiedon` datetime not null  comment ''修改时间'',
         `lastmodifiedby` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''修改人'',
         `rowversion` int(22) not null  comment ''修改版本'',
         `tenantid` int(22) not null  comment ''租户ID'',
        PRIMARY KEY (URID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='' 计划组织-计划项目关联关系表''', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;