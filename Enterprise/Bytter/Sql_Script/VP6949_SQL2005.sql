

--  add by lishc 2012/11/22
----vp6949
-- Add/modify columns 
alter table CMS_REPAY_LOAN add voucher_no varchar(20);
go
-- Add/modify columns 
alter table CMS_PAYMENT_RECORDS add VOUCHER_NO varchar(20);
go

ALTER VIEW V_CMS_PAYMENT_RECORD AS
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
       CPR.CPR_STATUS
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
          CPR.CPR_STATUS;
go



ALTER VIEW V_CMS_REPAY_VIEW AS
SELECT CRL.CRL_ID,  --还款单号
       CLB.CLB_NO, --贷款单号
       CLB.CLB_ID, --台账id
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_NAME AS BB_CORP_NAME,
       ROUND(ISNULL(CRL.CRL_MONEY,0), 2) AS CRL_MONEY, --本金
       ROUND(ISNULL(CRL.CRL_FIXED_MONEY, 0), 2) AS CRL_FIXED_MONEY, --固定占用费
       ROUND(ISNULL(CRL.CRL_AGREEMENT_MONEY,0), 2) AS CRL_AGREEMENT_MONEY,  -- 协定占用费
       ROUND(ISNULL(CLB.CLB_LOAN_MONEY,0), 2) AS CLB_LOAN_MONEY,  --贷款本金
       ROUND(ISNULL(CLB.CLB_BALANCE,0), 2) AS CLB_BALANCE,   --当前余额
       ROUND(ISNULL(CRL.CRL_MONEY,0)+ISNULL(CRL.CRL_FIXED_MONEY, 0)+ISNULL(CRL.CRL_AGREEMENT_MONEY,0), 2) REPAYMONEY,
       CRL.CRL_DATE,
       CRL.CRL_DESC,
       CRL.CRL_STATUS,
       CRL.CRL_NO,
       CRL.Voucher_No,
       CRL.USER_ID,
       CRL.NEXTCHECKER
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
          CRL.NEXTCHECKER;
          
 go         
          