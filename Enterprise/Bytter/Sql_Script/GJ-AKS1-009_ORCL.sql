--修改日期：2012.11.29
--修改人：蔡瑾钊
--修改内容：国际贸易融资还款相关功能


--------贸易融资放款还款信息表 ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FINANC_LOAN_REPAY表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_LOAN_REPAY';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_LOAN_REPAY 
				(
				   GUID                 varchar2(36)                   not null,
				   BILL_CODE            varchar2(14)                   not null,    --还款单号
				   ISSUE_ID             varchar2(36)                   not null,    --发放单id
				   LOAN_BILL_CODE       varchar2(20)                   not null,    --发放单编号
				   FIN_BILL_CODE        varchar2(14)                   not null,    --融资单编号
				   CORP_ID              number(10)                     not null,    --单位id
				   REPAY_MONEY          number(18,2),    --还款金额
				   REPAY_DATE           date,    --还款日期
				   REPAY_ACCRUAL        number(6,4),                  --融资利息
				   ENTER_DATE           date                           not null,    --录入时间
				   ACT_COLLECT_MONEY    number(18,2),                  --实际收款金额
				   BALANCE              number(18,2),                  --余额
				   NEXT_CHECKER         varchar2(150),                  --下个审批人
				   OP                   varchar2(8)                    not null,    --录入人
				   VOUCHER_NO           varchar2(15),                  --记账凭证号
				   APPROVES             varchar2(200),									--审核人
				   RMK                  varchar2(400),									--备注
				   REJECT_REASON        varchar2(400),									--打回原因
				   STATUS               number                         not null,		--状态
				   REPAYMENT_SCHEDULE_ID	number(10),								--还款计划ID
				   FLAG					number(1),									--国际国内单据标记,1为国内,2为国际
				   constraint PK_FINANC_LOAN_REPAY primary key (GUID)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--添加菜单
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资还款申请' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资还款申请', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repayadd', '0', '0', '0', '0', 17, '', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE res_name='国际贸易融资还款修改' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资还款修改', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repaysave', '0', '0', '0', '0', 18, '', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE res_name='国际贸易融资还款打回' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资还款打回', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repaycallback', '0', '0', '0', '0', 19, '', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE res_name='国际贸易融资还款补录' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资还款补录', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repayrecord', '0', '0', '0', '0', 20, '', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE BUSINESS_CODE='lcs_interfin2';
  IF VN_COUNT < 1 THEN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interfin2', 'lcs', '国际贸易融资还款', 'A,B,C', 'financ_loan_repay', 'repay_money',  'next_checker', 'bill_code', '../interfinance/InterFinancRepayShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancRepayForm');
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
   WHERE TABLENAME='FINANC_LOAN_REPAY' and KEYALISENAME='InterFinancRepayCode';
  IF VN_COUNT < 1 THEN
	INSERT INTO BT_KEY_GENERATOR (ID, TABLENAME, KEYALISENAME, CUSTGENCLASS, GENSTRATE)
	VALUES (NVL((SELECT MAX(ID) FROM BT_KEY_GENERATOR), 0) + 1, 'FINANC_LOAN_REPAY', 'InterFinancRepayCode', 'com.byttersoft.intersettle.service.InterFinancRepayKeyGenerator', 'cu');
  END IF;
  COMMIT; 
END;
/