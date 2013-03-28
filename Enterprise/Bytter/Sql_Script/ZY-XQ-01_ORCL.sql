--修改时间2012-11-09
--修改人 andyhuang

--修改内容  账号管理-冗余资金上报
-- Create table
create table BT_REDUNDANCY_MONEY
(
  ID             NUMBER not null,
  CORP_ID        NUMBER,
  R_MONEY        NUMBER(18,2),
  CUR_CODE       CHAR(2) not null,
  PERIOD         NUMBER(10),
  CAPITAL_COST   NUMBER(8,2),
  EFFECTIVI_DATE DATE,
  OP_DATE        DATE,
  OP_NAME        VARCHAR2(40),
  OP_CODE        VARCHAR2(40),
  APPROVES       VARCHAR2(300),
  STATUS         NUMBER(10),
  NEXTCHECKER    VARCHAR2(40),
  UPDATE_TIME    VARCHAR2(20),
  UPDATE_NAME    VARCHAR2(40),
  UPDATE_CODE    VARCHAR2(40),
  RMK            VARCHAR2(500),
  ACC_NO         VARCHAR2(20),
  BILL_MONEY     NUMBER(18,2)
);
DECLARE
  V_COUNT NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_approve_business
    WHERE BUSINESS_CODE = 'redundancyapp';
    IF V_COUNT = 0 THEN
      insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('redundancyapp', 'bankacc', '冗余资金上报', 'A,B,C', 'BT_REDUNDANCY_MONEY', '', 'bill_money', '', 'nextchecker', 'acc_no', '../bankacc/redundancycheck.jsp', '', '', '', '', 'com.bettersoft.bankacc.form.RedundancyForm', '', '', '', '', '', null, null, null, null, null, '');
    END IF;
END;
/



DECLARE
  V_COUNT NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_sys_res
    WHERE res_name = '冗余资金管理' and sys_code = 'bankacc' and res_level = 1;
    IF V_COUNT = 0 THEN
      insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values (( select max(res_code)+1 from bt_sys_res ), '冗余资金管理', 'bankacc', 0, '/cms/PLoanRepayPreview.jsp?prview_type=6', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 1, '');
    END IF;
END;
/


DECLARE
  V_COUNT NUMBER;
  V_PARENT_CODE NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_sys_res
    WHERE res_name = '冗余资金上报' and sys_code = 'bankacc' and res_level = 2;
    IF V_COUNT = 0 THEN
       SELECT RES_CODE  INTO V_PARENT_CODE  FROM bt_sys_res  WHERE res_name = '冗余资金管理' and sys_code = 'bankacc' and res_level = 1;
      insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values (( select max(res_code)+1 from bt_sys_res ), '冗余资金上报', 'bankacc', V_PARENT_CODE, '/newBankacc/redundancyAction.do?method=search', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, '');
    END IF;
END;
/


DECLARE
  V_COUNT NUMBER;
  V_PARENT_CODE NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_sys_res
    WHERE res_name = '冗余资金成本补录' and sys_code = 'bankacc' and res_level = 2;
    IF V_COUNT = 0 THEN
       SELECT RES_CODE  INTO V_PARENT_CODE  FROM bt_sys_res  WHERE res_name = '冗余资金管理' and sys_code = 'bankacc' and res_level = 1;
      insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values (( select max(res_code)+1 from bt_sys_res ), '冗余资金成本补录', 'bankacc', V_PARENT_CODE, '/newBankacc/redundancyAction.do?method=redundancyClose', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, '');
    END IF;
END;
/

DECLARE
  V_COUNT NUMBER;
  V_PARENT_CODE NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_sys_res
    WHERE res_name = '冗余资金查询' and sys_code = 'bankacc' and res_level = 2;
    IF V_COUNT = 0 THEN
       SELECT RES_CODE  INTO V_PARENT_CODE  FROM bt_sys_res  WHERE res_name = '冗余资金管理' and sys_code = 'bankacc' and res_level = 1;
      insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values (( select max(res_code)+1 from bt_sys_res ), '冗余资金查询', 'bankacc', V_PARENT_CODE, '/newBankacc/redundancyAction.do?method=queryAllRedundancy', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, '');
    END IF;
END;
/