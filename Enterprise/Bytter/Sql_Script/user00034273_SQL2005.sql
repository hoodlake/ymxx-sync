--修改日期：20121207
--修改人：叶爱军
--修改内容：RAT_URATION_APPLY修改INTEREST_RATE的类型NUMERIC(6, 4)改为NUMERIC(8, 6)
--参数设置：
ALTER TABLE RAT_URATION_APPLY ALTER COLUMN INTEREST_RATE NUMERIC(8, 6);
GO


--修改时间：20121207
--修改人：叶爱军
--描述：RAT_URATION添加OPEN_MONEY字段
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'OPEN_MONEY' AND LTRIM(B.NAME) = 'RAT_URATION')
	ALTER TABLE RAT_URATION ADD OPEN_MONEY NUMERIC(18, 2)
GO


--日期：2012-10-19 
--修改人：张培
--修改内容：创建表
--授信额度 >> 银行授信额度综合品种单项及组合项
IF EXISTS (SELECT 1 FROM SYSOBJECTS WHERE ID = OBJECT_ID('RAT_COMPOSITIVE_DETAIL') AND TYPE = 'U')
   DROP TABLE RAT_COMPOSITIVE_DETAIL
GO
CREATE TABLE RAT_COMPOSITIVE_DETAIL(
    CODE        	VARCHAR(20) NOT NULL,
    REF_CODE    	VARCHAR(20),
    ITEM_CODE   	VARCHAR(500),
    MONEY       	NUMERIC(18,2),
    FLAG        	CHAR(1),
    REF_TYPE    	CHAR(1),
    PROCESS_MONEY 	NUMERIC(18,2),
    RELIEF_MONEY 	NUMERIC(18,2),
    BY_RELIEF_MONEY NUMERIC(18,2),
    FREEZE_MONEY 	NUMERIC(18,2),
    RAT_CODE 		VARCHAR(20),
    COMP_CODE 		VARCHAR(20)
)
GO

ALTER TABLE RAT_COMPOSITIVE_DETAIL
  ADD CONSTRAINT COMPOSITIVE_DETAIL_PK PRIMARY KEY (CODE);
GO

--修改时间2012-11-17
--修改人 李鹏飞
--修改内容  RAT_BKRATION_DIS和RAT_BKRATION_DIS_DETAIL添加字段 
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'DISTRIBUTE_WAY' AND LTRIM(B.NAME) = 'RAT_BKRATION_DIS')
	--分配方式
	ALTER TABLE RAT_BKRATION_DIS ADD DISTRIBUTE_WAY VARCHAR(10)
GO

IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'ISPASSED' AND LTRIM(B.NAME) = 'RAT_BKRATION_DIS')
	--一批单位或网点中是否已经有记录审批通过了
	ALTER TABLE RAT_BKRATION_DIS ADD ISPASSED VARCHAR(10)
GO

IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'ALL_COMP_CODES' AND LTRIM(B.NAME) = 'RAT_BKRATION_DIS')
	--保存一批分配的单位或网点编号 
	ALTER TABLE RAT_BKRATION_DIS ADD ALL_COMP_CODES VARCHAR(500);
GO

IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'VIRTUAL_URATION' AND LTRIM(B.NAME) = 'RAT_BKRATION_DIS_DETAIL')
	--全额共享时，保存本身不占用的金额
	ALTER TABLE RAT_BKRATION_DIS_DETAIL ADD VIRTUAL_URATION NUMERIC(15,2) DEFAULT 0;
GO

IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'VIRTUAL_RELIEF_MONEY' AND LTRIM(B.NAME) = 'RAT_BKRATION_DIS_DETAIL')
	--虚拟调剂金额
	ALTER TABLE RAT_BKRATION_DIS_DETAIL ADD VIRTUAL_RELIEF_MONEY NUMERIC(15,2) DEFAULT 0;
GO