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
	   CONVERT(MONEY, ROUND(CPR.CPR_MONEY, 2), 120) AS CPR_MONEY,
       CONVERT(MONEY, ROUND(CPR.CPR_FIXED_MONEY, 2), 120) AS CPR_FIXED_MONEY,
       CONVERT(MONEY, ROUND(CPR.CPR_AGREEMENT_MONEY, 2), 120) AS CPR_AGREEMENT_MONEY,
       CONVERT(MONEY, ROUND(CPR.CPR_MONEY + CPR.CPR_FIXED_MONEY + CPR.CPR_AGREEMENT_MONEY, 2), 120) AS CPR_TOTAL_MONEY,
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