--修改日期：2013.01.10
--修改人：刘之三
--修改内容：重置预警策略，策略明细，明细账号表运行状态
--修改内容：重置预警策略，策略明细，明细账号表运行状态

UPDATE BT_WARNING_STRATEGY SET LAST_RUN_STATE='2'; 
UPDATE BT_WARNING_STRATEGY_DETAIL SET LAST_RUN_STATE='2'; 
UPDATE BT_WARNING_STRATEGY_ACC SET LAST_RUN_STATE='2';   
COMMIT;