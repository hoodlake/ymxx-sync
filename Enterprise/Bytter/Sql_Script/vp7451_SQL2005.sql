--修改日期：20130107
--修改人：祁继鸿
--修改内容：vp7451 增加ERP转移过来的历史金额
--修改内容：ERP_HIS_MONEY 增加字段 ERP历史金额
--参数设置：
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'ERP_HIS_MONEY' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
  ALTER TABLE NIS_BILLHEAD ADD ERP_HIS_MONEY numeric(15,2);
GO

--修改字段长度
alter table nis_billhead alter column billnumber varchar(500);
--修改付款账号、操作员字段可以为空
ALTER TABLE nis_billhead alter column payer_acc varchar(30);
ALTER TABLE nis_billhead alter column op varchar(20);

go

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
