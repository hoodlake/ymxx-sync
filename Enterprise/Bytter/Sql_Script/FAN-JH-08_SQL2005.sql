--张少举 
--新增
--付款模版匹配


IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TEMPLATE_ID_1' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
	alter table NIS_BILLHEAD add TEMPLATE_ID_1 NUMERIC(10)
GO
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TEMPLATE_ID_2' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
	alter table NIS_BILLHEAD add TEMPLATE_ID_2 NUMERIC(10)
GO
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'COST_CENTER_CODE' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
	alter table NIS_BILLHEAD add COST_CENTER_CODE VARCHAR(10)
GO


/*==============================================================*/
/* 4.Table: ERP_TEMPLATE_DATADEFINE（模版主表）                 */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_STORE  (
   ID                   NUMERIC(10) not null,
   CORP_CODE            VARCHAR(4),
   REFER_CODE           VARCHAR(32),
   VOUCHER_PRE_TEXT     VARCHAR(60),
   REFER                VARCHAR(50),
   PAY_TYPE             VARCHAR(4),
   ITEM_CODE            VARCHAR(40),
   VOUCHER_TYPE_CODE    CHAR(2),
   TYPE_CODE            VARCHAR(32),
   TEMPLATE_NAME        VARCHAR(32),
   TEMPLATE_CODE        VARCHAR(32),
   ABS                  VARCHAR(100),
   PURPOSE              VARCHAR(100),
   RMK                  VARCHAR(100),
   REVERSE1             VARCHAR(100),
   REVERSE2             VARCHAR(100),
   constraint PK_ERP_TEMPLATE primary key (ID)
);

/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DATADEFINE（模版分录表）               */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DTL';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE_DTL cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_DTL_STORE  (
   ID                   NUMERIC(10)                      not null,
   TEMPLATE_ID          NUMERIC(10),
   ENTRY_CODE           VARCHAR(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR(60),
   SUBJECT_NAME         VARCHAR(100),
   SUBJECT_CLASS        VARCHAR(100),
   SUBJECT_TYPE         VARCHAR(100),
   COST_CENTER_CODE     VARCHAR(20),
   CASH_FLOW_CODE       VARCHAR(100),
   ACCOUNT_CODE         VARCHAR(50),
   ACCOUNT_TYPE         VARCHAR(100),
   PAYMENT_REASON_CODE  VARCHAR(50),
   LEDGER_SIGN          VARCHAR(50),
   TRANS_TYPE           VARCHAR(50),
   ASSIGN               VARCHAR(100),
   TRADE_PARTNER        VARCHAR(100),
   TAX_CODE             VARCHAR(50),
   DTL_ITEM_CODE        VARCHAR(50),
   DTL_REVERSE1         VARCHAR(100),
   DTL_REVERSE2         VARCHAR(100),
   DTL_ABS              VARCHAR(200),
   constraint PK_ERP_TEMPLATE_DTL primary key (ID)
);



DECLARE 
   @record_exists int;
BEGIN
   SELECT  @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatestoreid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatestoreid',
             '100'
      );    
   END;
END;
GO
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatedetailstoreid';
   IF @record_exists = 0
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatedetailstoreid',
             '100'
      );    
   END;
END;
GO
COMMIT;
