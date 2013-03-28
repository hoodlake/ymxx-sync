--修改日期：2013.01.10
--修改人：刘之三
--修改内容：重置预警策略，策略明细，明细账号表运行状态
--修改内容：重置预警策略，策略明细，明细账号表运行状态

--存储余额连续下降明细
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_STRATEGY_ACC')
                  AND   TYPE = 'U')
create table BT_WARNING_STRATEGY_ACC(
  ID                    NUMERIC(10) not null primary key,
  DETAIL_ID             NUMERIC(10),
  BANK_ACC              VARCHAR(50),
  LAST_RUN_STATE        CHAR(1),
  LAST_RUN_TIME         DATETIME
)
GO

UPDATE BT_WARNING_STRATEGY SET LAST_RUN_STATE='2'; 
GO

UPDATE BT_WARNING_STRATEGY_DETAIL SET LAST_RUN_STATE='2'; 
GO

UPDATE BT_WARNING_STRATEGY_ACC SET LAST_RUN_STATE='2';  
GO
