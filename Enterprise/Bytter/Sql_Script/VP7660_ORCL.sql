-- 修改日期：20130222
-- 修改人：梁铭利
--修改内容：云南白药加票据录入打印功能

create table BIS_EXC_INPUT
(
  VOUCHER_NO          CHAR(10) not null,
  CBS_BILL_NO         VARCHAR2(20),
  COUNTER_ACC         VARCHAR2(50),
  REQ_DATE            DATE,
  BIF_CODE            CHAR(4),
  PAYER_ACC_NO        VARCHAR2(30),
  PAYER_BANK_NAME     VARCHAR2(140),
  PAYER_ACC_NAME      VARCHAR2(140),
  PAYER_PROV          VARCHAR2(20),
  PAYER_CITY          VARCHAR2(20),
  AMT                 NUMBER(15,2),
  CUR                 CHAR(2),
  PAYEE_ACC_NO        VARCHAR2(30),
  PAYEE_BANK          VARCHAR2(140),
  PAYEE_NAME          VARCHAR2(140),
  ABS                 VARCHAR2(140),
  POSTSCRIPT          VARCHAR2(140),
  CORP_ID             CHAR(4),
  PAYEE_PROV          VARCHAR2(20),
  PAYEE_CITY          VARCHAR2(20),
  TRANS_MODE          CHAR(1),
  URGENCY_FLAG        CHAR(1) not null,
  TRANS_TIME          DATE,
  DIF_BANK            CHAR(1),
  AREA_SIGN           CHAR(1),
  USER_NAME           VARCHAR2(20),
  RETURN_TIME         DATE,
  VOUCHER_STAT        CHAR(1),
  RETURN_MSG          VARCHAR2(150),
  APPROVE_SIGN        CHAR(1),
  CUR_CHECK_LEVEL     NUMBER(5),
  APPROVE_RULE_CODE   CHAR(4),
  VERIFY_STR          LONG RAW,
  PRINT_TIMES         NUMBER(5),
  VOUCHER_TYPE        CHAR(2),
  HAVA_LOOK           VARCHAR2(200),
  REVERSE1            VARCHAR2(300),
  REVERSE2            VARCHAR2(300),
  REVERSE3            VARCHAR2(300),
  REVERSE4            VARCHAR2(300),
  REVERSE5            VARCHAR2(300),
  REVERSE6            NUMBER(15,2),
  REVERSE7            NUMBER(15,2),
  REVERSE8            NUMBER(15,2),
  REVERSE9            NUMBER(15,2),
  REVERSE10           NUMBER(15,2),
  ORDER_NO            CHAR(18),
  TALLY_SIGN          CHAR(1),
  TALLY_DATE          DATE,
  TALLIER_CODE        CHAR(8),
  DIRECT_PAY_FLAG     CHAR(1),
  ERP_STATUS          NUMBER default 0,
  ERP_VOUCHER_NO      VARCHAR2(50),
  MID_PAYER_ACC_NO    VARCHAR2(50),
  MID_PAYER_ACC_NAME  VARCHAR2(140),
  MID_PAYER_BANK_NAME VARCHAR2(140),
  BUS_ORI_TYPE        NUMBER(2),
  RESUME_REASON       VARCHAR2(100),
  BUS_GLOBAL_ID       VARCHAR2(32),
  CMD_TYPE            CHAR(1),
  VERSION             NUMBER default 0,
  IS_IMPORT           CHAR(1),
  FAIL_AMT            NUMBER(15,2),
  POLICY_CODE         CHAR(4),
  PROMOTERS_CORP_CODE CHAR(4),
  VOUCHER_FROM        NUMBER(2),
  DATA_SOURCES_CODE   CHAR(1),
  SERIAL_ID           CHAR(32),
  NEXTCHECKER         VARCHAR2(20),
  APPROVES            VARCHAR2(150),
  STATUS              NUMBER(4)
);
alter table BIS_EXC_INPUT
  add constraint PK_BIS_EXC_INPUT primary key (VOUCHER_NO)
  using index ;


declare 
 max_id_cs20130218 number;
 max_id_cs20130218_id number;
 max_id_cs20130218_1 number;
 begin
    select count(*) into max_id_cs20130218 from bt_function where FUNCTION_IDEN='w_payer_input_print';
    if max_id_cs20130218=0 then
      select FUNCTION_ID into max_id_cs20130218_id from bt_function where function_name='票据打印' and upper_function_id<>0;
      
      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, 'w_payer_input_print', '付款录入打印', '', '', '', 'Mnu', max_id_cs20130218_id, 3, '', '1', 'bill_print', '付款录入打印', '1');
      
      select max(function_id) into max_id_cs20130218_id from BT_FUNCTION;
      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '查询', 'bmp\query.bmp', 'ue_query', '', 'Btn', max_id_cs20130218_id, 1, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '增加', 'bmp\new.bmp', 'ue_add', '', 'Btn', max_id_cs20130218_id, 2, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '作废', 'bmp\del.bmp', 'ue_delete', '', 'Btn', max_id_cs20130218_id, 3, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '保存', 'bmp\save.bmp', 'ue_save', '', 'Btn', max_id_cs20130218_id, 4, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '第一张', 'bmp\first.bmp', 'ue_first', '', 'Btn', max_id_cs20130218_id, 5, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '上一张', 'bmp\prior.bmp', 'ue_prior', '', 'Btn', max_id_cs20130218_id, 6, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '下一张', 'bmp\next.bmp', 'ue_next', '', 'Btn', max_id_cs20130218_id, 7, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '最后张', 'bmp\last.bmp', 'ue_last', '', 'Btn', max_id_cs20130218_id, 8, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '打印', 'bmp\print.bmp', 'ue_print', '', 'Btn', max_id_cs20130218_id, 9, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '打印进账单', 'bmp\print.bmp', 'ue_print_income', '', 'Btn', max_id_cs20130218_id, 10, 'L', '1', 'bill_print', '', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '打印设置', 'bmp\preview.bmp', 'ue_printpreview', '', 'Btn', max_id_cs20130218_id, 11, 'L', '1', 'bill_print', '', '1');
  
 
      select FUNCTION_ID into max_id_cs20130218_id from bt_function where function_name='票据管理' and upper_function_id<>0;
      
      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, 'w_query_payer_input_bill', '查询付款录入明细', '', '', '', 'Mnu', max_id_cs20130218_id, 5, '', '1', 'bill_print', '查询付款录入明细', '1');
      
      select max(function_id) into max_id_cs20130218_id from BT_FUNCTION;
      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '查询', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', max_id_cs20130218_id, 1, '', '1', 'bill_print', '查询记录', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', max_id_cs20130218_id, 2, '', '1', 'bill_print', '打印', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', max_id_cs20130218_id, 3, '', '1', 'bill_print', '打印预览', '1');

      select max(function_id)+1 into max_id_cs20130218_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130218_1, '', '另存', 'bmp\saveas.bmp', 'ue_save', 'A', 'Btn', max_id_cs20130218_id, 4, '', '1', 'bill_print', '另存为', '1');
      commit;
    end if;
     
end;
/