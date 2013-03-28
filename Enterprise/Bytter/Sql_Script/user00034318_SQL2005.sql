--修改日期：20121102
--修改人：叶爱军
--需求编号：SX-AKS1-002 财务费用-币别
--参数设置：
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'CUR_CODE' AND LTRIM(B.NAME) = 'RAT_URATION')
	ALTER TABLE RAT_URATION ADD CUR_CODE VARCHAR(2)
GO
UPDATE RAT_URATION SET CUR_CODE = (SELECT BC.CUR_CODE FROM BT_CURRENCY BC WHERE BC.CUR_NAME = '人民币' AND BC.VALID_SIGN = '1' AND BC.STATUS = '1')
GO