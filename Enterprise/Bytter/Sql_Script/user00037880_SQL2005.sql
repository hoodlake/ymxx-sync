--修改日期：20130107
--修改人：祁继鸿
--修改内容：vp7451 增加自开票据 与 付款单相关联的bill_no
--修改内容：AB_EMIT 增加字段 付款单编号 BILL_NO
--参数设置：
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'BILL_NO' AND LTRIM(B.NAME) = 'AB_EMIT')
  ALTER TABLE AB_EMIT ADD BILL_NO varchar(20);
GO

--修改日期：20130107
--修改人：祁继鸿
--修改内容：vp7451 增加库存票据 与 付款单相关联的bill_no
--修改内容：AB_RECEIVE 增加字段 付款单编号 BILL_NO
--参数设置：
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'BILL_NO' AND LTRIM(B.NAME) = 'AB_RECEIVE')
  ALTER TABLE AB_RECEIVE ADD BILL_NO varchar(20);
GO

--修改日期：20130108
--修改人：李德成
--修改内容：背书增加后手单位编码
--修改内容  AB_RECEIVE 增加字段 付款单编号NEXT_VENDOR_NUM
--参数设置：
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'NEXT_VENDOR_NUM' AND LTRIM(B.NAME) = 'AB_RECEIVE')
  ALTER TABLE AB_RECEIVE ADD NEXT_VENDOR_NUM VARCHAR2(31);
GO
