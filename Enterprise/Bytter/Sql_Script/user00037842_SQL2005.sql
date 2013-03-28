--修改人:陈春燕
--修改时间:2013-01-14
--修改内容: AB_BILL_ALLOCATION_STOCK 新增票据编号；删除是删掉AB_BILL_ALLOCATION_STOCK里的记录
-------- add column BILL_ID

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_BILL_ALLOCATION_STOCK') AND NAME='BILL_ID')  
ALTER TABLE AB_BILL_ALLOCATION_STOCK ADD BILL_ID NUMERIC(28)
GO
