CREATE OR REPLACE VIEW V_CMS_LOAN_BOOK AS
SELECT CLB.CLB_ID,
       CLB.CLB_NO,
       CLB.CLB_LOAN_CORP_ID AS BL_CORP_ID,
       BL.CORP_CODE AS BL_CORP_CODE,
       BL.CORP_NAME AS BL_CORP_NAME,
       CLB.CLB_BORROW_CORP_ID AS BB_CORP_ID,
       BB.CORP_CODE AS BB_CORP_CODE,
       BB.CORP_NAME AS BB_CORP_NAME,
       ROUND(CLB.CLB_LOAN_MONEY, 2) AS CLB_LOAN_MONEY,
       ROUND(NVL(SUM(CLA.CLA_MONEY), 0), 2) AS CLA_MONEY,
       ROUND(CLB.CLB_BALANCE, 2) AS CLB_BALANCE,
       ROUND(CLB.CLB_FIXED_RATE, 6) AS CLB_FIXED_RATE,
       ROUND(CLB.CLB_AGREEMENT_RATE, 6) AS CLB_AGREEMENT_RATE,
       ROUND(NVL(SUM(CBI.FIX_FEE_REAL), 0), 2) AS FIX_FEE_REAL,
       ROUND(NVL(SUM(CBI.AGREEMENT_FEE_REAL), 0), 2) AS AGREEMENT_FEE_REAL,
       CLB.CLB_START_DATE,
       CLB.CLB_END_DATE,
       CLB.CLB_STATUS
  FROM CMS_LOAN_BILL CLB
  LEFT JOIN CMS_LOAN_ABATE CLA ON CLB.CLB_ID = CLA.CLB_ID
  LEFT JOIN CMS_BILLING CBI ON CLB.CLB_ID = CBI.CLB_ID
 INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
 INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
 GROUP BY CLB.CLB_ID,
          CLB.CLB_NO,
          CLA.CLA_ID,
          CLB.CLB_LOAN_CORP_ID,
          BL.CORP_CODE,
          BL.CORP_NAME,
          CLB.CLB_BORROW_CORP_ID,
          BB.CORP_CODE,
          BB.CORP_NAME,
          CLB.CLB_LOAN_MONEY,
          CLB.CLB_BALANCE,
          CLB.CLB_FIXED_RATE,
          CLB.CLB_AGREEMENT_RATE,
          CLB.CLB_START_DATE,
          CLB.CLB_END_DATE,
          CLA.CLA_DATE,
          CLB.CLB_STATUS;
          
CREATE OR REPLACE VIEW V_CMS_PAYMENT_RECORD AS
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
          CPR.CPR_STATUS;