-- 修改日期：20130222
-- 修改人：梁铭利
--修改内容：云南白药加票据录入打印功能


create table BIS_EXC_INPUT
(
  VOUCHER_NO          CHAR(10) not null,
  CBS_BILL_NO         VARCHAR(20),
  COUNTER_ACC         VARCHAR(50),
  REQ_DATE            DATETIME,
  BIF_CODE            CHAR(4),
  PAYER_ACC_NO        VARCHAR(30),
  PAYER_BANK_NAME     VARCHAR(140),
  PAYER_ACC_NAME      VARCHAR(140),
  PAYER_PROV          VARCHAR(20),
  PAYER_CITY          VARCHAR(20),
  AMT                 NUMERIC(15,2),
  CUR                 CHAR(2),
  PAYEE_ACC_NO        VARCHAR(30),
  PAYEE_BANK          VARCHAR(140),
  PAYEE_NAME          VARCHAR(140),
  ABS                 VARCHAR(140),
  POSTSCRIPT          VARCHAR(140),
  CORP_ID             CHAR(4),
  PAYEE_PROV          VARCHAR(20),
  PAYEE_CITY          VARCHAR(20),
  TRANS_MODE          CHAR(1),
  URGENCY_FLAG        CHAR(1) not null,
  TRANS_TIME          DATETIME,
  DIF_BANK            CHAR(1),
  AREA_SIGN           CHAR(1),
  USER_NAME           VARCHAR(20),
  RETURN_TIME         DATETIME,
  VOUCHER_STAT        CHAR(1),
  RETURN_MSG          VARCHAR(150),
  APPROVE_SIGN        CHAR(1),
  CUR_CHECK_LEVEL     NUMERIC(5,0),
  APPROVE_RULE_CODE   CHAR(4),
  VERIFY_STR          TEXT,
  PRINT_TIMES         INT,
  VOUCHER_TYPE        CHAR(2),
  HAVA_LOOK           VARCHAR(200),
  REVERSE1            VARCHAR(300),
  REVERSE2            VARCHAR(300),
  REVERSE3            VARCHAR(300),
  REVERSE4            VARCHAR(300),
  REVERSE5            VARCHAR(300),
  REVERSE6            NUMERIC(15,2),
  REVERSE7            NUMERIC(15,2),
  REVERSE8            NUMERIC(15,2),
  REVERSE9            NUMERIC(15,2),
  REVERSE10           NUMERIC(15,2),
  ORDER_NO            CHAR(18),
  TALLY_SIGN          CHAR(1),
  TALLY_DATE          DATETIME,
  TALLIER_CODE        CHAR(8),
  DIRECT_PAY_FLAG     CHAR(1),
  ERP_STATUS          NUMERIC(2,0) default 0,
  ERP_VOUCHER_NO      VARCHAR(50),
  MID_PAYER_ACC_NO    VARCHAR(50),
  MID_PAYER_ACC_NAME  VARCHAR(140),
  MID_PAYER_BANK_NAME VARCHAR(140),
  BUS_ORI_TYPE        NUMERIC(2,0),
  RESUME_REASON       VARCHAR(100),
  BUS_GLOBAL_ID       VARCHAR(32),
  CMD_TYPE            CHAR(1),
  VERSION             NUMERIC(2,0) default 0,
  IS_IMPORT           CHAR(1),
  FAIL_AMT            NUMERIC(15,2),
  POLICY_CODE         CHAR(4),
  PROMOTERS_CORP_CODE CHAR(4),
  VOUCHER_FROM        NUMERIC(2,0),
  DATA_SOURCES_CODE   CHAR(1),
  SERIAL_ID           CHAR(32),
  NEXTCHECKER         VARCHAR(20),
  APPROVES            VARCHAR(150),
  STATUS              NUMERIC(4,0)
);
go
ALTER TABLE BIS_EXC_INPUT WITH NOCHECK ADD 
	CONSTRAINT PK_BIS_EXC_INPUT PRIMARY KEY  CLUSTERED 
	(
		[VOUCHER_NO]
	)  ON [PRIMARY] 
GO


CREATE NONCLUSTERED INDEX IX_BIS_EXC_INPUT ON BIS_EXC_INPUT
	(
	VOUCHER_NO
	) ON [PRIMARY]
GO

declare   @max_id_cs20130218 int, @max_id_cs20130218_id int,  @max_id_cs20130218_1 int;
 begin
    select @max_id_cs20130218=count(*) from  bt_function where FUNCTION_IDEN='w_payer_input_print';
    if @max_id_cs20130218=0 
      begin
      select @max_id_cs20130218_id=FUNCTION_ID from bt_function where function_name='票据打印' and upper_function_id<>0;
      
      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, 'w_payer_input_print', '付款录入打印', '', '', '', 'Mnu', @max_id_cs20130218_id, 3, '', '1', 'bill_print', '付款录入打印', '1');
      
      select @max_id_cs20130218_id=max(function_id) from BT_FUNCTION;
      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '查询', 'bmp\query.bmp', 'ue_query', '', 'Btn', @max_id_cs20130218_id, 1, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '增加', 'bmp\new.bmp', 'ue_add', '', 'Btn', @max_id_cs20130218_id, 2, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '作废', 'bmp\del.bmp', 'ue_delete', '', 'Btn', @max_id_cs20130218_id, 3, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '保存', 'bmp\save.bmp', 'ue_save', '', 'Btn', @max_id_cs20130218_id, 4, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '第一张', 'bmp\first.bmp', 'ue_first', '', 'Btn', @max_id_cs20130218_id, 5, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '上一张', 'bmp\prior.bmp', 'ue_prior', '', 'Btn', @max_id_cs20130218_id, 6, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '下一张', 'bmp\next.bmp', 'ue_next', '', 'Btn', @max_id_cs20130218_id, 7, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '最后张', 'bmp\last.bmp', 'ue_last', '', 'Btn', @max_id_cs20130218_id, 8, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '打印', 'bmp\print.bmp', 'ue_print', '', 'Btn', @max_id_cs20130218_id, 9, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '打印进账单', 'bmp\print.bmp', 'ue_print_income', '', 'Btn', @max_id_cs20130218_id, 10, 'L', '1', 'bill_print', '', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '打印设置', 'bmp\preview.bmp', 'ue_printpreview', '', 'Btn', @max_id_cs20130218_id, 11, 'L', '1', 'bill_print', '', '1');
  
 
      select @max_id_cs20130218_id=FUNCTION_ID from bt_function where function_name='票据管理' and upper_function_id<>0;
      
      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, 'w_query_payer_input_bill', '查询付款录入明细', '', '', '', 'Mnu', @max_id_cs20130218_id, 5, '', '1', 'bill_print', '查询付款录入明细', '1');
      
      select @max_id_cs20130218_id=max(function_id) from BT_FUNCTION;
      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '查询', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', @max_id_cs20130218_id, 1, '', '1', 'bill_print', '查询记录', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20130218_id, 2, '', '1', 'bill_print', '打印', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20130218_id, 3, '', '1', 'bill_print', '打印预览', '1');

      select @max_id_cs20130218_1=max(function_id)+1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130218_1, '', '另存', 'bmp\saveas.bmp', 'ue_save', 'A', 'Btn', @max_id_cs20130218_id, 4, '', '1', 'bill_print', '另存为', '1');
      commit;
    end;
     
end;
GO