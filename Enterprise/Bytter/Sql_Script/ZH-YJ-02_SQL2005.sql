--�޸����ڣ�2012.12.10
--�޸��ˣ��ܱ�
--�޸����ݣ��Զ�ɨ��Ԥ��
--�޸�ԭ���Զ�ɨ��Ԥ��


--����
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_BAL ADD BUSINESS_DATE DATETIME; 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_BAL ADD WARNING_REASON VARCHAR(400); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_BAL ADD BANK_ACC VARCHAR(50); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_BAL ADD STRAGE_DETAIL_ID numeric(10); 
GO


--��������½�
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='STRATEGY_DETAIL_STR')  
ALTER TABLE BT_WARNING_BAL ADD STRATEGY_DETAIL_STR VARCHAR(40); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_BAL ADD BUSINESS_DATE DATETIME; 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_BAL ADD WARNING_REASON VARCHAR(400); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_BAL ADD BANK_ACC VARCHAR(50); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_BAL ADD STRAGE_DETAIL_ID numeric(10); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='SCAN_DATE_START')  
ALTER TABLE BT_WARNING_BAL ADD SCAN_DATE_START DATETIME; 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_BAL') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_BAL ADD BANK_TYPE VARCHAR(10); 
GO

--����ֽ𳬱�Ԥ����Ϣ
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_CASH') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_CASH ADD BUSINESS_DATE DATETIME; 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_CASH') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_CASH ADD WARNING_REASON VARCHAR(400); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_CASH') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_CASH ADD BANK_ACC VARCHAR(50); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_CASH') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_CASH ADD STRAGE_DETAIL_ID numeric(10); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_CASH') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_CASH ADD BANK_TYPE VARCHAR(10); 
GO


--����˻�֧��
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DEZJZC') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_DEZJZC ADD BUSINESS_DATE DATETIME; 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DEZJZC') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_DEZJZC ADD WARNING_REASON VARCHAR(400); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DEZJZC') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_DEZJZC ADD BANK_ACC VARCHAR(50); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DEZJZC') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_DEZJZC ADD STRAGE_DETAIL_ID numeric(10); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DEZJZC') AND NAME='SCAN_DATE_START')  
ALTER TABLE BT_WARNING_DEZJZC ADD SCAN_DATE_START DATETIME; 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DEZJZC') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_DEZJZC ADD BANK_TYPE VARCHAR(10); 
GO

--ժҪԤ��
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DTLRMK') AND NAME='STRATEGY_DETAIL_STR')  
ALTER TABLE BT_WARNING_DTLRMK ADD STRATEGY_DETAIL_STR VARCHAR(40); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DTLRMK') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_DTLRMK ADD BUSINESS_DATE DATETIME; 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DTLRMK') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_DTLRMK ADD WARNING_REASON VARCHAR(400); 
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DTLRMK') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_DTLRMK ADD BANK_ACC VARCHAR(50);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DTLRMK') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_DTLRMK ADD STRAGE_DETAIL_ID  numeric(10);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DTLRMK') AND NAME='SCAN_DATE_START')  
ALTER TABLE BT_WARNING_DTLRMK ADD SCAN_DATE_START DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_DTLRMK') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_DTLRMK ADD BANK_TYPE VARCHAR(10);
GO

--����ֽ�֧��Ԥ����Ϣ
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_LARGEPAY') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_LARGEPAY ADD BUSINESS_DATE DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_LARGEPAY') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_LARGEPAY ADD WARNING_REASON VARCHAR(400);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_LARGEPAY') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_LARGEPAY ADD BANK_ACC VARCHAR(50);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_LARGEPAY') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_LARGEPAY ADD STRAGE_DETAIL_ID numeric(10);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_LARGEPAY') AND NAME='SCAN_DATE_START')  
ALTER TABLE BT_WARNING_LARGEPAY ADD SCAN_DATE_START DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_LARGEPAY') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_LARGEPAY ADD BANK_TYPE VARCHAR(10);
GO

--ϵͳ�⸶��Ԥ����Ϣ
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_OUTPAY') AND NAME='STRATEGY_DETAIL_STR')  
ALTER TABLE BT_WARNING_OUTPAY ADD STRATEGY_DETAIL_STR VARCHAR(40);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_OUTPAY') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_OUTPAY ADD BUSINESS_DATE DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_OUTPAY') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_OUTPAY ADD WARNING_REASON VARCHAR(400);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_OUTPAY') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_OUTPAY ADD BANK_ACC VARCHAR(50);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_OUTPAY') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_OUTPAY ADD STRAGE_DETAIL_ID numeric(10);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_OUTPAY') AND NAME='SCAN_DATE_START')  
ALTER TABLE BT_WARNING_OUTPAY ADD SCAN_DATE_START DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_OUTPAY') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_OUTPAY ADD BANK_TYPE VARCHAR(10);
GO

--��ͬ��˾����
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_PAYEE') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_PAYEE ADD BUSINESS_DATE DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_PAYEE') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_PAYEE ADD WARNING_REASON VARCHAR(400);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_PAYEE') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_PAYEE ADD BANK_ACC VARCHAR(50);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_PAYEE') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_PAYEE ADD STRAGE_DETAIL_ID numeric(10);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_PAYEE') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_PAYEE ADD BANK_TYPE VARCHAR(10);
GO

--ʮ��Ԫ������
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_SWYZSB') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_SWYZSB ADD BUSINESS_DATE DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_SWYZSB') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_SWYZSB ADD WARNING_REASON VARCHAR(400);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_SWYZSB') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_SWYZSB ADD BANK_ACC VARCHAR(50);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_SWYZSB') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_SWYZSB ADD STRAGE_DETAIL_ID numeric(10);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_SWYZSB') AND NAME='SCAN_DATE_START')  
ALTER TABLE BT_WARNING_SWYZSB ADD SCAN_DATE_START DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_SWYZSB') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_SWYZSB ADD BANK_TYPE VARCHAR(10);
GO

--֧��������
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_ZCHLR') AND NAME='STRATEGY_DETAIL_STR')  
ALTER TABLE BT_WARNING_ZCHLR ADD STRATEGY_DETAIL_STR VARCHAR(40);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_ZCHLR') AND NAME='BUSINESS_DATE')  
ALTER TABLE BT_WARNING_ZCHLR ADD BUSINESS_DATE DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_ZCHLR') AND NAME='WARNING_REASON')  
ALTER TABLE BT_WARNING_ZCHLR ADD WARNING_REASON VARCHAR(400);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_ZCHLR') AND NAME='BANK_ACC')  
ALTER TABLE BT_WARNING_ZCHLR ADD BANK_ACC VARCHAR(50);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_ZCHLR') AND NAME='STRAGE_DETAIL_ID')  
ALTER TABLE BT_WARNING_ZCHLR ADD STRAGE_DETAIL_ID numeric(10);
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_ZCHLR') AND NAME='SCAN_DATE_START')  
ALTER TABLE BT_WARNING_ZCHLR ADD SCAN_DATE_START DATETIME;
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_ZCHLR') AND NAME='BANK_TYPE')  
ALTER TABLE BT_WARNING_ZCHLR ADD BANK_TYPE VARCHAR(10);
GO


--�洢��ϸ��¼
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_RESULT_DETAIL')
                  AND   TYPE = 'U')
create table BT_WARNING_RESULT_DETAIL(
  ID                    NUMERIC(10) not null primary key,
  STRAGEGY_ID           NUMERIC(10),
  STRAGEGY_DETAIL_ID    NUMERIC(10),
  RESULT_ID             NUMERIC(10),
  CORP_CODE             VARCHAR(12),
  BANK_ACC              VARCHAR(50),
  ACC_NAME              VARCHAR(140),
  BANK_NAME             VARCHAR(140),
  CUR                   VARCHAR(2),
  AMT                   NUMERIC(15,2),
  BANK_BAL              NUMERIC(15,2), 
  CD_SIGN               CHAR(1), 
  TRANS_TIME            DATETIME, 
  OPP_ACC_NO            VARCHAR(50), 
  OPP_ACC_NAME          VARCHAR(120), 
  OPP_BANK_NAME         VARCHAR(120), 
  ABS                   VARCHAR(140) 
)
GO

--�洢����¼
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_RESULT_BAL')
                  AND   TYPE = 'U')
create table BT_WARNING_RESULT_BAL(
  ID                    NUMERIC(10) not null primary key,
  STRAGEGY_ID           NUMERIC(10), 
  STRAGEGY_DETAIL_ID    NUMERIC(10), 
  RESULT_ID             NUMERIC(10), 
  BANK_ACC              VARCHAR(50), 
  BANK_NAME             VARCHAR(120), 
  ACC_NAME              VARCHAR(120), 
  BANK_BAL              NUMERIC(15,2), 
  CUR                   VARCHAR(2), 
  BANK_BAL_DATE         DATETIME, 
  CORP_CODE             VARCHAR(12) 
)
GO


  

--�洢�����¼
--�洢����¼
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_RESULT_OVERFLOW')
                  AND   TYPE = 'U')
create table BT_WARNING_RESULT_OVERFLOW(
  ID                    NUMERIC(10) not null primary key,
  STRAGEGY_ID           NUMERIC(10), 
  STRAGEGY_DETAIL_ID    NUMERIC(10), 
  RESULT_ID             NUMERIC(10), 
  CUR                   VARCHAR(2), 
  CORP_CODE             VARCHAR(15), 
  BANK_ACC              VARCHAR(50), 
  ACC_NAME              VARCHAR(120), 
  BANK_NAME             VARCHAR(120), 
  BEGIN_AMT             NUMERIC(15,2), 
  IN_FLOW_AMT           NUMERIC(15,2), 
  OUT_FLOW_AMT          NUMERIC(15,2), 
  NET_FLOW_AMT          NUMERIC(15,2), 
  FINAL_AMT             NUMERIC(15,2), 
  MONTH                 NUMERIC(2) 
)
GO




--�洢��������½���¼
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_RESULT_BAL_DOWN')
                  AND   TYPE = 'U')
create table BT_WARNING_RESULT_BAL_DOWN(
  ID                    NUMERIC(10) not null primary key,
  STRAGEGY_ID           NUMERIC(10), 
  STRAGEGY_DETAIL_ID    NUMERIC(10), 
  RESULT_ID             NUMERIC(10),
  BANK_ACC              VARCHAR(50), 
  ACC_NAME              VARCHAR(120), 
  BANK_NAME             VARCHAR(120), 
  CUR                   VARCHAR(2), 
  CORP_CODE             VARCHAR(15)
)
GO


--�洢��������½���ϸ
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_RESULT_DOWN_DETAIL')
                  AND   TYPE = 'U')
create table BT_WARNING_RESULT_DOWN_DETAIL(
  ID                    NUMERIC(10) not null primary key,
  BT_WARNING_RESULT_BAL_DOWN_ID              NUMERIC(10),
   MONTH_NO             NUMERIC(2),
   BANKBAL_AVG          NUMERIC(15,2),
   BANKBAL_END          NUMERIC(15,2)
)
GO





--Ԥ����Ϣ��
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_DETAIL')
                  AND   TYPE = 'U')
create table BT_WARNING_DETAIL(
  ID                   NUMERIC(10) not null primary key,
  STRAGEGY_ID          NUMERIC(10),
  STRAGE_DETAIL_ID     NUMERIC(10),
  RESULT_D             NUMERIC(10),
  NATURE_CODE          VARCHAR(20),
  CORP_CODE            VARCHAR(12),
  BANK_TYPE            VARCHAR(4),
  RUN_TIME             DATETIME,
  CREATE_TIME          DATETIME,
  STATE                CHAR(1), 
  REMARK               VARCHAR(200),
  BUSINESS_DATE        DATETIME,
  BANK_ACC             VARCHAR(50),
  WARNING_REASON       VARCHAR(400)
)
GO




--��������½���ϸ��
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_DETAIL')
                  AND   TYPE = 'U')
create table BT_WARNING_DETAIL(
  ID                   NUMERIC(10) not null primary key,
  BALANCE_DOWN_ID      NUMERIC(10),
  MONTH_NO             NUMERIC(2),
  BANKBAL_END          NUMERIC(15,2),
  BANKBAL_AVG          NUMERIC(15,2)
)
GO




---������ϸ������
IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_STRATEGY_DETAIL') AND NAME='LAST_RUN_STATE')  
ALTER TABLE BT_WARNING_STRATEGY_DETAIL ADD LAST_RUN_STATE CHAR(1); 
GO


IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_STRATEGY_DETAIL') AND NAME='LAST_RUN_TIME')  
ALTER TABLE BT_WARNING_STRATEGY_DETAIL ADD LAST_RUN_TIME DATETIME; 
GO


IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BT_WARNING_STRATEGY_DETAIL') AND NAME='NATURE_CODE')  
ALTER TABLE BT_WARNING_STRATEGY_DETAIL ADD NATURE_CODE VARCHAR(20); 
GO


ALTER TABLE BT_WARNING_STRATEGY_DETAIL ALTER COLUMN BANK_TYPE varchar(60) NOT NULL; 
GO

--��λ���������˻�������ͼ
IF EXISTS (SELECT * FROM sysobjects WHERE /*����Ƿ����*/  
                         name = 'V_CORP_BANKTYPE_NATURE')  
     DROP VIEW V_CORP_BANKTYPE_NATURE /*ɾ����ͼ*/  
GO  
CREATE VIEW V_CORP_BANKTYPE_NATURE AS 
select c.corp_code , c.corp_name ,  b.bank_type, b.type_name as bank_name , a.acc_type as nature_code , a.property as nature_name 
from bt_corp c ,bt_bank_type b , bis_acc_type a 
where exists (
      select acc_all.BANK_ACC  from v_bank_acc_all acc_all 
      where acc_all.ACC_TYPE = a.acc_type and acc_all.CORP_CODE = c.corp_code and acc_all.bank_type = b.bank_type 
)
GO

--�˻���ʷ�����ͼ������������,�˻�����, �Ƿ�����ֶ�
IF EXISTS (SELECT * FROM sysobjects WHERE /*����Ƿ����*/  
                         name = 'v_bis_acc_his_bal')  
     DROP VIEW v_bis_acc_his_bal /*ɾ����ͼ*/  
GO  
create view v_bis_acc_his_bal as
Select Bal.Bank_Acc, Bal.Bal_Date,Bal.Bank_Bal,Acc.Corp_Code,Bank.Bank_Type,
       Atype.Acc_Type,Atype.Property,Acc.Cur,acc.bank_name,acc.acc_name, '1' Iscomplete
  From --�����˺ŵ�
       --�����˺ŵ���ʷ���
        Bis_Acc_His_Bal Bal,
       Bt_Bank_Acc     Acc,
       Bis_Acc_List    Bis,
       Bt_Bank         Bank,
       Bis_Acc_Type    Atype
 Where Bal.Bank_Acc = Acc.Bank_Acc
   And Bis.Bank_Acc = Acc.Bank_Acc
   And Bank.Bank_Code = Bis.Bank_Code
   And Atype.Acc_Type = Bis.Acc_Type
   And Bal.Acc_No Is Null
   And Acc.Valid_Sign = '1'
Union
--�����˺�
Select Bal.Bank_Acc,Bal.Bal_Date,Bal.Bank_Bal,
       App.Corp_Code,Btype.Bank_Type,
       Atype.Acc_Type, Atype.Property,
       App.Cur,bank.bank_name,app.acc_name,BAL.ISCOMPLETE
  From Bis_Acc_His_Bal Bal,
       Bt_Bankacc_App  App,
       Bt_Bank_Type    Btype,
       Bis_Acc_Type    Atype,
       bt_bank         bank
 Where Bal.Bank_Acc = App.Bankacc
   And Btype.Bank_Type = App.Bank_Type
   And Atype.Acc_Type = App.Acc_Attribute
   and bank.bank_code = app.bank_code
   And App.Status = '95'
   And Bal.Status = 95
   And Bal.Acc_No Is Not Null; 
GO   
   
  --��ʷ��ϸ��ͼ�������������ֶ�
IF EXISTS (SELECT * FROM sysobjects WHERE /*����Ƿ����*/  
                         name = 'v_all_bis_acc_his_dtl')  
     DROP VIEW v_all_bis_acc_his_dtl /*ɾ����ͼ*/  
GO  
create view v_all_bis_acc_his_dtl as
Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       Acc.Corp_Code,
       Acc.Acc_Type,
       acc.bank_type ,
       bank_type.type_name ,
       dtl.bal as bank_bal
  From Bis_Acc_His_Dtl Dtl, v_Acc_List Acc , bt_bank_type bank_type 
 Where Dtl.Bank_Acc = Acc.Bank_Acc and acc.bank_type = bank_type.bank_type 
   And Id Is Null
--������ϸ
Union All
Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       App.Corp_Code,
       App.Acc_Attribute,
       app.bank_type ,
       bank_type.type_name,
       dtl.bal as bank_bal
  From Bis_Acc_His_Dtl Dtl, Bt_Bankacc_App App, bt_bank_type bank_type 
 Where Dtl.Bank_Acc = App.Bankacc and bank_type.bank_type = app.bank_type
   And App.Status = 95
   And Id Is Not Null;
GO   
 
   
   --����ϵͳ�⸶����ͼ
IF EXISTS (SELECT * FROM sysobjects WHERE /*����Ƿ����*/  
                         name = 'V_OUT_PAY_HIS_DTL')  
     DROP VIEW V_OUT_PAY_HIS_DTL /*ɾ����ͼ*/  
GO   
create view V_OUT_PAY_HIS_DTL  AS 
select  Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       dtl.Corp_Code,
       dtl.Acc_Type,
       dtl.bank_type ,
       dtl.type_name ,
       dtl.bank_bal
   from V_all_Bis_Acc_His_Dtl dtl 
  where not exists
  (select e.voucher_no from bis_exc e 
   where dtl.Bank_Acc = e.payer_acc_no  
     and dtl.Opp_Acc_No = e.payee_acc_no  and dtl.Cd_Sign = '1'
     and dtl.Amt = e.amt and CONVERT(varchar(12),dtl.Trans_Time,105) = CONVERT(varchar(12),e.trans_time,105)
 ); 
GO

--�޸���������ͼ
IF EXISTS (SELECT * FROM sysobjects WHERE /*����Ƿ����*/  
                         name = 'v_bis_acc_last_bal')  
     DROP VIEW v_bis_acc_last_bal /*ɾ����ͼ*/  
GO 
create view v_bis_acc_last_bal as
Select a.BANK_ACC,
       a.BAL_DATE,
       a.BANK_BAL,
       a.CORP_CODE,
       a.BANK_TYPE,
       a.ACC_TYPE,
       a.PROPERTY,
       a.CUR,
       a.ISCOMPLETE
  From v_Bis_Acc_His_Bal a, (Select Bank_Acc, Max(Bal_Date) Bal_Date
                                  From v_Bis_Acc_His_Bal
                                 Group By Bank_Acc ) b  --�����˺ŵ�������
 Where a.bank_acc = b.Bank_Acc and a.Bal_Date = b.bal_date;
GO 

select * from v_Bis_Acc_His_Bal
--��������½���ϸ��
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_DETAIL')
                  AND   TYPE = 'U')
create table BT_WARNING_DETAIL(
  ID                   NUMERIC(10) not null primary key,
  DETAIL_ID            NUMERIC(10),
  BANK_ACC             VARCHAR(50),
  LAST_RUN_TIME		   DATETIME,
  LAST_RUN_STATE       CHAR(1)
)
GO



--�ֶ�ɨ��˵�
declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '�ֶ�ɨ��' and sys_code = 'fwg';
if (@VN_COUNT = 0 ) 
begin  
insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'�ֶ�ɨ��','fwg',RES_CODE,'/fundwarning/manualScan.jsp','0','0','0','0',1,2,''
         		from bt_sys_res
         			where res_name = 'Ԥ��չʾ����' and sys_code='fwg';
end;
end;

go 

--�ʽ�Ԥ����ϸ
--1�����Ӳ˵�
declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '�ʽ�Ԥ����ϸ' and sys_code = 'fwg';
if (@VN_COUNT = 0 ) 
begin  
insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'�ʽ�Ԥ����ϸ','fwg',RES_CODE,'/fundwarning/queryFundwarningAction.do?method=queryFundWarningDetail','0','0','0','0',1,2,''
         		from bt_sys_res
         			where res_name = 'Ԥ��չʾ����' and sys_code='fwg';
end;
end;

go 


--��������ֹ�������ͼ
IF EXISTS (SELECT * FROM sysobjects WHERE /*����Ƿ����*/  
                         name = 'v_bis_acc_last_bal_iscomplete')  
     DROP VIEW v_bis_acc_last_bal_iscomplete /*ɾ����ͼ*/  
GO 
create view v_bis_acc_last_bal_iscomplete as
Select a.BANK_ACC,
       a.BAL_DATE,
       a.BANK_BAL,
       a.CORP_CODE,
       a.BANK_TYPE,
       a.ACC_TYPE,
       a.PROPERTY,
       a.CUR,
       a.ISCOMPLETE
  From v_Bis_Acc_His_Bal a, (Select Bank_Acc, Max(Bal_Date) Bal_Date
                                  From v_Bis_Acc_His_Bal where iscomplete ='1'
                                 Group By Bank_Acc ) b  --�����˺ŵ�������
 Where a.bank_acc = b.Bank_Acc and a.Bal_Date = b.bal_date;
GO 


      