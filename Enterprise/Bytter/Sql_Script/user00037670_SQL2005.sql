--�޸����ڣ�2013.01.10
--�޸��ˣ���֮��
--�޸����ݣ�����Ԥ�����ԣ�������ϸ����ϸ�˺ű�����״̬
--�޸����ݣ�����Ԥ�����ԣ�������ϸ����ϸ�˺ű�����״̬

--�洢��������½���ϸ
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
