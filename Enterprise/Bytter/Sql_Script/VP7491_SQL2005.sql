--修改日期：2012.12.28
--修改人：刘之三
--修改内容：修改策略明细的bank_type为可为null
--修改原因：修改策略明细的bank_type为可为null


ALTER TABLE BT_WARNING_STRATEGY_DETAIL ALTER COLUMN BANK_TYPE varchar(60) NULL; 
GO