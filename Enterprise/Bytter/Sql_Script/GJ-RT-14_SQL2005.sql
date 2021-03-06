if exists(select 1 from syscolumns where object_id('CMS_LOAN_BILL')=id and name='BIS_EAR_MONEY')
  alter table CMS_LOAN_BILL drop column BIS_EAR_MONEY;
alter table CMS_LOAN_BILL add BIS_EAR_MONEY char;

IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_CMS_LOAN_BOOK')
DROP VIEW V_CMS_LOAN_BOOK;
GO
CREATE  VIEW V_CMS_LOAN_BOOK AS
SELECT CLB.CLB_ID,
       CLB.CLB_NO,
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_CODE AS BL_CORP_CODE,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_CODE AS BB_CORP_CODE,
       BB.CORP_NAME AS BB_CORP_NAME,
       ROUND(CLB.CLB_LOAN_MONEY, 2) AS CLB_LOAN_MONEY,
       (SELECT isnull(SUM(CLA.CLA_MONEY), 0) FROM CMS_LOAN_ABATE CLA WHERE CLB.CLB_ID = CLA.CLB_ID) AS CLA_MONEY,
       ROUND(isnull(CLB.CLB_BALANCE, 0), 2) AS CLB_BALANCE,
       ROUND(isnull(CLB.CLB_FIXED_RATE, 0), 6) AS CLB_FIXED_RATE,
       ROUND(isnull(CLB.CLB_AGREEMENT_RATE, 0), 6) AS CLB_AGREEMENT_RATE,
       (SELECT isnull(SUM(CRL.CRL_MONEY), 0) FROM CMS_REPAY_LOAN CRL WHERE CLB.CLB_ID = CRL.CLB_ID) AS CRL_MONEY,
       (SELECT isnull(SUM(CBI.FIX_FEE_REAL), 0) FROM CMS_BILLING CBI WHERE CLB.CLB_ID = CBI.CLB_ID) AS FIX_FEE_REAL,
       (SELECT isnull(SUM(CBI.AGREEMENT_FEE_REAL), 0) FROM CMS_BILLING CBI WHERE CLB.CLB_ID = CBI.CLB_ID) AS AGREEMENT_FEE_REAL,
       (SELECT isnull(SUM(CRL.CRL_FIXED_MONEY), 0) FROM CMS_REPAY_LOAN CRL WHERE CLB.CLB_ID = CRL.CLB_ID) AS CRL_FIXED_MONEY,
       (SELECT isnull(SUM(CRL.CRL_AGREEMENT_MONEY), 0) FROM CMS_REPAY_LOAN CRL WHERE CLB.CLB_ID = CRL.CLB_ID) AS CRL_AGREEMENT_MONEY,
       (SELECT isnull(SUM(CPR.CPR_FIXED_MONEY), 0) FROM CMS_PAYMENT_RECORDS CPR WHERE CLB.CLB_ID = CPR.CLB_ID) AS CPR_FIXED_MONEY,
       (SELECT isnull(SUM(CPR.CPR_AGREEMENT_MONEY), 0) FROM CMS_PAYMENT_RECORDS CPR WHERE CLB.CLB_ID = CPR.CLB_ID) AS CPR_AGREEMENT_MONEY,
       CLB.CLB_START_DATE,
       CLB.CLB_END_DATE,
       CLB.CLB_STATUS,
       CLB.USER_ID,
       CLB.APPROVES,
        case CLB.bis_ear_money
		when 1 then '是'
		when 0 then '否'
		end  as bis_ear_money
  FROM CMS_LOAN_BILL CLB
 INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
 INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID;
 go
 --更新还款视图     
 IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_CMS_REPAY_VIEW')
DROP VIEW V_CMS_REPAY_VIEW;
GO
CREATE  VIEW V_CMS_REPAY_VIEW AS
SELECT CRL.CRL_ID,  --还款单号
       CLB.CLB_NO, --贷款单号
       CLB.CLB_ID, --台账id
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_NAME AS BB_CORP_NAME,
       ROUND(isnull(CRL.CRL_MONEY,0), 2) AS CRL_MONEY, --本金
       ROUND(isnull(CRL.CRL_FIXED_MONEY, 0), 2) AS CRL_FIXED_MONEY, --固定占用费
       ROUND(isnull(CRL.CRL_AGREEMENT_MONEY,0), 2) AS CRL_AGREEMENT_MONEY,  -- 协定占用费
       ROUND(isnull(CLB.CLB_LOAN_MONEY,0), 2) AS CLB_LOAN_MONEY,  --贷款本金
       ROUND(isnull(CLB.CLB_BALANCE,0), 2) AS CLB_BALANCE,   --当前余额
       ROUND(isnull(CRL.CRL_MONEY,0)+isnull(CRL.CRL_FIXED_MONEY, 0)+isnull(CRL.CRL_AGREEMENT_MONEY,0), 2) REPAYMONEY,
       CRL.CRL_DATE,
       CRL.CRL_DESC,
       CRL.CRL_STATUS,
       CRL.CRL_NO,
       CRL.Voucher_No,
       CRL.USER_ID,
       CRL.NEXTCHECKER,
        case CLB.bis_ear_money
		when 1 then '是'
		when 0 then '否'
		end  as bis_ear_money
  FROM CMS_REPAY_LOAN CRL
 INNER JOIN CMS_LOAN_BILL CLB ON CLB.CLB_ID = CRL.CLB_ID
 INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
 INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
 GROUP BY CRL.CRL_ID,
          CLB.CLB_NO,
          CLB.CLB_ID,
          CLB.CLB_LOAN_CORP_ID,
          BL.CORP_NAME,
          CLB.CLB_BORROW_CORP_ID,
          BB.CORP_NAME,
          CRL.CRL_MONEY,
          CRL.CRL_FIXED_MONEY,
          CRL.CRL_AGREEMENT_MONEY,
          CLB.CLB_LOAN_MONEY,
          CLB.CLB_BALANCE,
          CRL.CRL_DATE,
          CRL.CRL_DESC,
          CRL.Voucher_No,
          CRL.CRL_STATUS,
          CRL.CRL_NO,
          CRL.USER_ID,
          CRL.NEXTCHECKER,
          CLB.bis_ear_money;
    go       
 --更新减免视图     
  IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_CMS_ABATE_VIEW')
DROP VIEW V_CMS_ABATE_VIEW;
GO
CREATE  VIEW V_CMS_ABATE_VIEW AS
SELECT CLA.CLA_ID,  --减免单号
       CLB.CLB_NO, --贷款单号
       CLB.CLB_ID, --台账id
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_NAME AS BB_CORP_NAME,
       ROUND(isnull(CLA.CLA_MONEY,0), 2) AS CLA_MONEY, --本金
       ROUND(isnull(CLA.CLA_FIXED_MONEY, 0), 2)AS CLA_FIXED_MONEY, --固定占用费
       ROUND(isnull(CLA.CLA_AGREEMENT_MONEY,0), 2) AS CLA_AGREEMENT_MONEY,  -- 协定占用费
       ROUND(isnull(CLB.CLB_LOAN_MONEY,0), 2) AS CLB_LOAN_MONEY,  --贷款本金
       ROUND(isnull(CLB.CLB_BALANCE,0), 2) AS CLB_BALANCE,   --当前余额
       ROUND(isnull(CLA.CLA_MONEY,0)*10000+isnull(CLA.CLA_FIXED_MONEY, 0)+isnull(CLA.CLA_AGREEMENT_MONEY,0), 2) ABATEMONEY,
       CLA.CLA_DATE,
       CLA.CLA_DESC,
       CLA.CLA_STATUS,
       CLA.CLA_NO,
       CLA.USER_ID,
       CLA.NEXTCHECKER,
        case CLB.bis_ear_money
		when 1 then '是'
		when 0 then '否'
		end  as bis_ear_money
  FROM CMS_LOAN_ABATE CLA
 INNER JOIN CMS_LOAN_BILL CLB ON CLB.CLB_ID = CLA.CLB_ID
 INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
 INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
 GROUP BY CLA.CLA_ID,
          CLB.CLB_NO,
          CLB.CLB_ID,
          CLB.CLB_LOAN_CORP_ID,
          BL.CORP_NAME,
          CLB.CLB_BORROW_CORP_ID,
          BB.CORP_NAME,
          CLA.CLA_MONEY,
          CLA.CLA_FIXED_MONEY,
          CLA.CLA_AGREEMENT_MONEY,
          CLB.CLB_LOAN_MONEY,
          CLB.CLB_BALANCE,
          CLA.CLA_DATE,
          CLA.CLA_DESC,
          CLA.CLA_STATUS,
          CLA.CLA_NO,
          CLA.USER_ID,
          CLA.NEXTCHECKER,
          CLB.bis_ear_money;
     go       
 --更新计费视图       
   IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_CMS_BILLING')
DROP VIEW V_CMS_BILLING;
GO
CREATE  VIEW V_CMS_BILLING AS
SELECT CLB.CLB_ID,
         CLB.CLB_NO,
         CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
         BL.CORP_CODE AS BL_CORP_CODE,
         BL.CORP_NAME AS BL_CORP_NAME,
         CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
         BB.CORP_CODE AS BB_CORP_CODE,
         BB.CORP_NAME AS BB_CORP_NAME,
         ROUND(CLB.CLB_LOAN_MONEY, 2) AS CLB_LOAN_MONEY,
         ROUND(isnull(SUM(CLA.CLA_MONEY), 0), 2) AS CLA_MONEY,
         ROUND(CLB.CLB_BALANCE, 2) AS CLB_BALANCE,
         ROUND(CLB.CLB_FIXED_RATE, 6) AS CLB_FIXED_RATE,
         ROUND(CLB.CLB_AGREEMENT_RATE, 6) AS CLB_AGREEMENT_RATE,
         CLB.CLB_START_DATE,
         CLB.CLB_END_DATE,
         CLB.CLB_LAST_BILLING_DATE,
          --修改人：刘勇
         (select LTRIM(RTRIM(isnull(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE)) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO) AS COMP_RATE_DAYS ,
         ROUND(CLB.CLB_FIXED_RATE/360, 4) AS DAY_RATE,
         ROUND(CLB.CLB_AGREEMENT_RATE/360, 4) AS DAY_RATE_OF_AGREEMENT,
         (ROUND(CLB.CLB_BALANCE, 2))*(select LTRIM(RTRIM(isnull(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE)) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO) AS JI_SHU,
         ROUND((ROUND(CLB.CLB_FIXED_RATE/360, 4))*(ROUND(CLB.CLB_BALANCE, 2))*(select LTRIM(RTRIM(isnull(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE)) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO),2) AS RATE_S,
         ROUND((ROUND(CLB.CLB_AGREEMENT_RATE/360, 4))*(ROUND(CLB.CLB_BALANCE, 2))*(select LTRIM(RTRIM(isnull(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE)) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO),2) AS RATE_SI,
            case CLB.bis_ear_money
		when 1 then '是'
		when 0 then '否'
		end  as bis_ear_money
  FROM CMS_LOAN_BILL CLB
  LEFT JOIN CMS_LOAN_ABATE CLA ON CLB.CLB_ID = CLA.CLB_ID
  INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
  INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
  WHERE CLB.CLB_STATUS=95
  GROUP BY CLB.CLB_NO,CLB.CLB_LOAN_CORP_ID,BL.CORP_CODE,
          BL.CORP_NAME,CLB.CLB_BORROW_CORP_ID,BB.CORP_CODE,BB.CORP_NAME,
          CLB.CLB_LOAN_MONEY,CLB.CLB_BALANCE,CLB.CLB_FIXED_RATE,CLB.CLB_LAST_BILLING_DATE,
          CLB.CLB_AGREEMENT_RATE,CLB.CLB_START_DATE,CLB.CLB_END_DATE,CLB.CLB_ID,CLB.bis_ear_money;
     go      
 --更新核算占用费试图   
    IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_CMS_ACCOUNTINGFEE')
DROP VIEW V_CMS_ACCOUNTINGFEE;
GO  
CREATE VIEW V_CMS_ACCOUNTINGFEE AS
SELECT CLB.CLB_ID,
       CLB.CLB_NO,
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_CODE AS BL_CORP_CODE,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_CODE AS BB_CORP_CODE,
       BB.CORP_NAME AS BB_CORP_NAME,
       ROUND(CLB.CLB_LOAN_MONEY, 2) AS CLB_LOAN_MONEY,
       ROUND(isnull(SUM(CLA.CLA_MONEY), 0), 2) AS CLA_MONEY,
       ROUND(CB.CLB_BALANCE, 2) AS CLB_BALANCE,
       ROUND(CLB.CLB_FIXED_RATE, 6) AS CLB_FIXED_RATE,
       ROUND(CLB.CLB_AGREEMENT_RATE, 6) AS CLB_AGREEMENT_RATE,
       CLB.CLB_START_DATE,
       CLB.CLB_END_DATE,
       CB.Notice_Num,
       CB.FIX_FEE,
       CB.FIX_FEE_REAL,
       CB.AGREEMENT_FEE,
       CB.AGREEMENT_FEE_REAL,
       CB.BILLING_ID,
       CB.MAKER,
       CB.AUDITOR,
       BU.USER_NAME AS MAKER_NAME,
       BU2.USER_NAME AS AUDITOR_NAME,
       CB.STATUS,
        case CLB.bis_ear_money
		when 1 then '是'
		when 0 then '否'
		end  as bis_ear_money
FROM CMS_LOAN_BILL CLB
LEFT  JOIN CMS_LOAN_ABATE CLA ON CLB.CLB_ID = CLA.CLB_ID
INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
INNER JOIN CMS_BILLING CB ON CLB.CLB_ID = CB.CLB_ID
LEFT  JOIN BT_USER BU ON CB.MAKER=BU.USER_CODE
LEFT  JOIN BT_USER BU2 ON CB.AUDITOR=BU2.USER_CODE
WHERE CLB.CLB_STATUS=95 AND CB.STATUS <> -12
GROUP BY CLB.CLB_ID,
         CLB.CLB_NO,
         CLB.CLB_LOAN_CORP_ID,
         BL.CORP_CODE,
         BL.CORP_NAME,
         CLB.CLB_BORROW_CORP_ID,
         BB.CORP_CODE,
         BB.CORP_NAME,
         CLB.CLB_LOAN_MONEY,
         CB.CLB_BALANCE,
         CLB.CLB_FIXED_RATE,
         CLB.CLB_AGREEMENT_RATE,
         CLB.CLB_START_DATE,
         CLB.CLB_END_DATE,
         CB.Notice_Num,
         CB.FIX_FEE,
         CB.FIX_FEE_REAL,
         CB.AGREEMENT_FEE,
         CB.AGREEMENT_FEE_REAL,
         BU.USER_NAME,
         BU2.USER_NAME,
         CB.MAKER,
         CB.AUDITOR,
         CB.BILLING_ID,
         CB.STATUS,
         CLB.bis_ear_money;
   go       
--更新缴费记录试图   
    IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_CMS_PAYMENT_RECORD')
DROP VIEW V_CMS_PAYMENT_RECORD;
GO  
CREATE  VIEW V_CMS_PAYMENT_RECORD AS
SELECT CPR.CPR_ID,
       CPR.CPR_NO,
       CLB.CLB_ID,
       CLB.CLB_NO,
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_CODE AS BL_CORP_CODE,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_CODE AS BB_CORP_CODE,
       BB.CORP_NAME AS BB_CORP_NAME,
       ROUND(CPR.CPR_MONEY * 10000, 2) AS CPR_MONEY,
       ROUND(CPR.CPR_FIXED_MONEY, 2) AS CPR_FIXED_MONEY,
       ROUND(CPR.CPR_AGREEMENT_MONEY, 2) AS CPR_AGREEMENT_MONEY,
       ROUND(CPR.CPR_MONEY * 10000 + CPR.CPR_FIXED_MONEY + CPR.CPR_AGREEMENT_MONEY, 2) AS CPR_TOTAL_MONEY,
       CPR.CPR_PAYMENT_DATE,
       CPR.CPR_DESC,
       CPR.Voucher_No,
       CPR.CPR_STATUS,
         case CLB.bis_ear_money
		when 1 then '是'
		when 0 then '否'
		end  as bis_ear_money
  FROM CMS_PAYMENT_RECORDS CPR
 JOIN CMS_LOAN_BILL CLB ON CLB.CLB_ID = CPR.CLB_ID
 JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
 JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
 GROUP BY CPR.CPR_ID,
          CPR.CPR_NO,
          CLB.CLB_ID,
          CLB.CLB_NO,
          CLB.CLB_LOAN_CORP_ID,
          BL.CORP_CODE,
          BL.CORP_NAME,
          CLB.CLB_BORROW_CORP_ID,
          BB.CORP_CODE,
          BB.CORP_NAME,
          CPR.CPR_MONEY,
          CPR.CPR_FIXED_MONEY,
          CPR.CPR_AGREEMENT_MONEY,
          CLB.CLB_AGREEMENT_RATE,
          CPR.CPR_PAYMENT_DATE,
          CPR.CPR_DESC,
          CPR.Voucher_No,
          CPR.CPR_STATUS,
          CLB.bis_ear_money;