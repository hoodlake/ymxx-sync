--添加菜单
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='贸易融资还款申请' and sys_code='cms';
  IF VN_COUNT < 1 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资还款申请', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=repayadd', '0', '0', '0', '0', 17, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='贸易融资还款修改' and sys_code='cms';
  IF VN_COUNT < 1 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资还款修改', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=repaysave', '0', '0', '0', '0', 18, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='贸易融资还款打回' and sys_code='cms';
  IF VN_COUNT < 1 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资还款打回', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=repaycallback', '0', '0', '0', '0', 19, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='贸易融资还款补录' and sys_code='cms';
  IF VN_COUNT < 1 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资还款补录', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=repayrecord', '0', '0', '0', '0', 20, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
--添加审批流
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_approve_business
   WHERE BUSINESS_CODE='cms_tradefin3';
  IF VN_COUNT < 1 THEN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('cms_tradefin3', 'cms', '贸易融资还款', 'A,B,C', 'financ_loan_repay', 'repay_money',  'next_checker', 'bill_code', '../finance/TradeFinancingRepayShowInclude.jsp', 'com.byttersoft.cms.form.TradeFinancingRepayForm');
  END IF;
  COMMIT; 
END;
/
--添加编号生成
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_KEY_GENERATOR
   WHERE TABLENAME='FINANC_LOAN_REPAY' and KEYALISENAME='TradeFinancingRepayCode';
  IF VN_COUNT < 1 THEN
	INSERT INTO BT_KEY_GENERATOR (ID, TABLENAME, KEYALISENAME, CUSTGENCLASS, GENSTRATE)
	VALUES (NVL((SELECT MAX(ID) FROM BT_KEY_GENERATOR), 0) + 1, 'FINANC_LOAN_REPAY', 'TradeFinancingRepayCode', 'com.byttersoft.cms.service.TradeFinancingRepayKeyGenerator', 'cu');
  END IF;
  COMMIT; 
END;
/