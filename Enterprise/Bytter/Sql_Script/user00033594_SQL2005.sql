ALTER VIEW V_CMS_LOAN_BOOK AS
SELECT CLB.CLB_ID,
       CLB.CLB_NO,
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_CODE AS BL_CORP_CODE,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_CODE AS BB_CORP_CODE,
       BB.CORP_NAME AS BB_CORP_NAME,       
       (SELECT CONVERT(MONEY, ROUND(SUM(CLA.CLA_MONEY), 2), 120) FROM CMS_LOAN_ABATE CLA WHERE CLB.CLB_ID = CLA.CLB_ID) AS CLA_MONEY,
       CONVERT(MONEY, ROUND(CLB.CLB_BALANCE, 2), 120) AS CLB_BALANCE,
       CONVERT(MONEY, ROUND(CLB.CLB_FIXED_RATE, 2), 120) AS CLB_FIXED_RATE,
       CONVERT(MONEY, ROUND(CLB.CLB_AGREEMENT_RATE, 2), 120) AS CLB_AGREEMENT_RATE,
       (SELECT CONVERT(MONEY, ROUND(SUM(CRL.CRL_MONEY), 2), 120) FROM CMS_REPAY_LOAN CRL WHERE CLB.CLB_ID = CRL.CLB_ID) AS CRL_MONEY,
       (SELECT CONVERT(MONEY, ROUND(SUM(CBI.FIX_FEE_REAL), 2), 120) FROM CMS_BILLING CLA WHERE CLB.CLB_ID = CBI.CLB_ID) AS FIX_FEE_REAL,
       (SELECT CONVERT(MONEY, ROUND(SUM(CBI.AGREEMENT_FEE_REAL), 2), 120) FROM CMS_BILLING CLA WHERE CLB.CLB_ID = CBI.CLB_ID) AS AGREEMENT_FEE_REAL,
       (SELECT CONVERT(MONEY, ROUND(SUM(CRL.CRL_FIXED_MONEY), 2), 120) FROM CMS_REPAY_LOAN CRL WHERE CLB.CLB_ID = CRL.CLB_ID) AS CRL_FIXED_MONEY,
       (SELECT CONVERT(MONEY, ROUND(SUM(CRL.CRL_AGREEMENT_MONEY), 2), 120) FROM CMS_REPAY_LOAN CRL WHERE CLB.CLB_ID = CRL.CLB_ID) AS CRL_AGREEMENT_MONEY,
       (SELECT CONVERT(MONEY, ROUND(SUM(CPR.CPR_FIXED_MONEY), 2), 120) FROM CMS_PAYMENT_RECORDS CPR WHERE CLB.CLB_ID = CPR.CLB_ID) AS CPR_FIXED_MONEY,
       (SELECT CONVERT(MONEY, ROUND(SUM(CPR.CPR_AGREEMENT_MONEY), 2), 120) FROM CMS_PAYMENT_RECORDS CPR WHERE CLB.CLB_ID = CPR.CLB_ID) AS CPR_AGREEMENT_MONEY,
       CLB.CLB_START_DATE,
       CLB.CLB_END_DATE,
       CLB.CLB_STATUS
  FROM CMS_LOAN_BILL CLB
 INNER JOIN CMS_LOAN_ABATE CLA ON CLB.CLB_ID = CLA.CLB_ID
 INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
 INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
 

 
--修改日期：20121017
--修改人：叶爱军
--修改内容：CMS_LOAN_BILL 增加字段 应付固定费用 应付协定费用 已付固定费用 已付协定费用 减免固定费用 减免协定费用 待付固定费用 待付协定费用
--参数设置： 
ALTER TABLE CMS_LOAN_BILL ADD CLB_BIIL_FIX NUMERIC(15,2)
GO
ALTER TABLE CMS_LOAN_BILL ADD CLB_BILL_AGREEMENT NUMERIC(15,2)
GO
ALTER TABLE CMS_LOAN_BILL ADD CLB_PAY_FIX NUMERIC(15,2)
GO
ALTER TABLE CMS_LOAN_BILL ADD CLB_PAY_AGREEMENT NUMERIC(15,2)
GO
ALTER TABLE CMS_LOAN_BILL ADD CLB_ABATE_FIX NUMERIC(15,2)
GO
ALTER TABLE CMS_LOAN_BILL ADD CLB_ABATE_AGREEMENT NUMERIC(15,2)
GO
ALTER TABLE CMS_LOAN_BILL ADD CLB_UNPAY_FIX NUMERIC(15,2)
GO
ALTER TABLE CMS_LOAN_BILL ADD CLB_UNPAY_AGREEMENT NUMERIC(15,2)


UPDATE CMS_LOAN_BILL SET CLB_BIIL_FIX = 0 WHERE CLB_BIIL_FIX IS NULL;
GO
UPDATE CMS_LOAN_BILL SET CLB_BILL_AGREEMENT = 0 WHERE CLB_BILL_AGREEMENT IS NULL;
GO
UPDATE CMS_LOAN_BILL SET CLB_PAY_FIX = 0 WHERE CLB_PAY_FIX IS NULL;
GO
UPDATE CMS_LOAN_BILL SET CLB_PAY_AGREEMENT = 0 WHERE CLB_PAY_AGREEMENT IS NULL;
GO
UPDATE CMS_LOAN_BILL SET CLB_ABATE_FIX= 0 WHERE CLB_ABATE_FIX IS NULL;
GO
UPDATE CMS_LOAN_BILL SET CLB_ABATE_AGREEMENT = 0 WHERE CLB_ABATE_AGREEMENT IS NULL;
GO
UPDATE CMS_LOAN_BILL SET CLB_UNPAY_FIX = 0 WHERE CLB_UNPAY_FIX IS NULL;
GO
UPDATE CMS_LOAN_BILL SET CLB_UNPAY_AGREEMENT = 0 WHERE CLB_UNPAY_AGREEMENT IS NULL;