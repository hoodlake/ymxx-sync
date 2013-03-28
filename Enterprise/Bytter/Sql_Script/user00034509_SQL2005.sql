--修改人：李程
--承兑汇票
--库存票据业务表新增“视同现汇”字段
--[VP6753]奥克斯ERP上划下拨接口开发
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_RECEIVE') AND NAME='AS_SPOT_EXCHANGE')  
alter table AB_RECEIVE add AS_SPOT_EXCHANGE char(1) default 0
GO
