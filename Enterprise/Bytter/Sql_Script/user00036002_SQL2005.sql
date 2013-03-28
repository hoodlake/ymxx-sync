--修改内容:抵质押物登记新增字段
--修改人:吴结兵
--修改时间:2012-12-07
--折旧率
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('GUA_MORTGAGE_INFO') AND NAME='DEPRECIATION_RATE')  
alter table gua_mortgage_info add depreciation_rate NUMERIC(8,6); 
GO

