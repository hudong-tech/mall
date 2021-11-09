set @exist_check := (
	select count(*) from information_schema.tables
	where table_name='t_bu_preoccupydetail'
	and table_schema= database()
);
set @sqlstmt := if(@exist_check < 1,
'create table `t_bu_preoccupydetail` (
         `urid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''urid'',
         `budgetitemid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''计划项目ID'',
         `orgid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''组织ID'',
         `applyorgid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''申请组织ID'',
         `deptid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''部门ID'',
         `projectitemid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''工程项目ID'',
         `currencyid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''币种ID'',
         `dealtype` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin   comment ''支付类型'',
         `paytypeid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''交易类型'',
         `settlementmodeid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''结算方式ID'',
         `counterpartyid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''交易对手ID'',
         `amount` float not null  comment ''交易金额'',
         `sendapprovedate` datetime not null  comment ''送审日期'',
         `paydate` datetime not null  comment ''应付日期'',
         `moneyway` CHAR(1) not null  comment ''交易方向|1-支出2-收入'',
         `preoccupyoptstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''预占操作状态:1-预占2-预占撤销 3-预占已撤销4-预占迁出5-预占迁出撤销6-预占迁出已撤销'',
         `oldurid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''原来的预占明细ID'',
         `noteobject` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''单据对象'',
         `sourcenotecode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  comment ''来源单据号'',
         `sourceid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''来源ID'',
         `sourcedetailid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   comment ''来源明细ID'',
         `createdon` datetime not null   default CURRENT_TIMESTAMP   comment ''创建时间'',
         `createdby` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''创建人'',
         `lastmodifiedon` datetime not null   default CURRENT_TIMESTAMP   comment ''修改时间'',
         `lastmodifiedby` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''修改人'',
         `rowversion` int(22) not null   default 1   comment ''版本号'',
         `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin   comment ''描述'',
         `tenantid` int(22) not null   default 10001   comment ''租户ID'',
         `paysenddate` datetime   comment ''指令发送日期'',
         `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin not null  comment ''key'',
         PRIMARY KEY (URID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT=''预占明细表''', 'select ''''') ;
prepare stmt from @sqlstmt ;
execute stmt ;