  -- 修改日期：2012-12-06
  -- 修改人：刘勇
  --修改内容：广州建筑 	核算占用费利息清单
  --增加菜单 “核算占用费(单位)”
DECLARE
  VN_COUNT    NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO VN_COUNT
      FROM bt_sys_res
      WHERE RES_NAME ='核算占用费(单位)';
      IF VN_COUNT = 0 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values ((select max(res_code) + 1 from bt_sys_res), '核算占用费(单位)', 'cms', (select res_code from bt_sys_res  where res_name='资金占用费' and SYS_CODE='cms' and res_level=2), '/cms/accountingFee.do?method=toList'||chr(38)||'sys_flag=corp', '0', '1', '0', '0', 1, '证劵资金账号维护', '', '', '', '', '', null, null, null, null, null, 3, '');
end if;
end;
/

--增加菜单 “”
DECLARE
  VN_COUNT    NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO VN_COUNT
      FROM bt_sys_res
      WHERE RES_NAME ='费用清单';
      IF VN_COUNT = 0 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values ((select max(res_code) + 1 from bt_sys_res), '费用清单', 'cms', (select res_code from bt_sys_res  where res_name='资金占用费' and SYS_CODE='cms' and res_level=2), '/cms/accountingFee.do?method=moneyList', '0', '1', '0', '0', 1, '证劵资金账号维护', '', '', '', '', '', null, null, null, null, null, 3, '');
end if;
end;
/


  --修改视图
  CREATE OR REPLACE VIEW V_CMS_BILLING AS
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
         CLB.CLB_START_DATE,
         CLB.CLB_END_DATE,
         CLB.CLB_LAST_BILLING_DATE,
          --修改人：刘勇 
         (select trunc(NVL(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO) AS COMP_RATE_DAYS ,
         ROUND(CLB.CLB_FIXED_RATE/360, 4) AS DAY_RATE,
         ROUND(CLB.CLB_AGREEMENT_RATE/360, 4) AS DAY_RATE_OF_AGREEMENT,
         (ROUND(CLB.CLB_BALANCE, 2))*(select trunc(NVL(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO) AS JI_SHU,
         ROUND((ROUND(CLB.CLB_FIXED_RATE/360, 4))*(ROUND(CLB.CLB_BALANCE, 2))*(select trunc(NVL(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO),2) AS RATE_S,
         ROUND((ROUND(CLB.CLB_AGREEMENT_RATE/360, 4))*(ROUND(CLB.CLB_BALANCE, 2))*(select trunc(NVL(CLB_END_DATE,CLB_LAST_BILLING_DATE)-CLB_START_DATE) from CMS_LOAN_BILL where CLB_NO=CLB.CLB_NO),2) AS RATE_SI
  FROM CMS_LOAN_BILL CLB
  LEFT JOIN CMS_LOAN_ABATE CLA ON CLB.CLB_ID = CLA.CLB_ID
  INNER JOIN BT_CORP BL ON CLB.CLB_LOAN_CORP_ID = BL.ID
  INNER JOIN BT_CORP BB ON CLB.CLB_BORROW_CORP_ID = BB.ID
  WHERE CLB.CLB_STATUS=95
  GROUP BY CLB.CLB_NO,CLB.CLB_LOAN_CORP_ID,BL.CORP_CODE,
          BL.CORP_NAME,CLB.CLB_BORROW_CORP_ID,BB.CORP_CODE,BB.CORP_NAME,
          CLB.CLB_LOAN_MONEY,CLB.CLB_BALANCE,CLB.CLB_FIXED_RATE,CLB.CLB_LAST_BILLING_DATE,
          CLB.CLB_AGREEMENT_RATE,CLB.CLB_START_DATE,CLB.CLB_END_DATE,CLB.CLB_ID;
commit;
