-- 修改日期：20121213
-- 修改人：胡浩军
--修改内容：企业利息收入查询

declare 
 @max_id_cs20121213 int,
 @max_id_cs20121213_id int,
 @max_id_cs20121213_1 int;
 begin
    select @max_id_cs20121213 =count(*) from bt_function where FUNCTION_IDEN='w_query_interest_out';
    if @max_id_cs20121213=0 
      begin
      select  @max_id_cs20121213_id = function_id  from bt_function where  function_name = '查询' and fun_type='Mod' and sys_code='counter';
      select @max_id_cs20121213_1 = max(function_id)+1   from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20121213_1, 'w_query_interest_out', '企业利息收入查询', '', '', '', 'Mnu', @max_id_cs20121213_id, 50, '', '1', 'counter', '', '1');

      
      select @max_id_cs20121213 = FUNCTION_ID   from bt_function where FUNCTION_IDEN='w_query_interest_out';
      ----------------企业利息收入查询
       select @max_id_cs20121213_1 = max(function_id)+1   from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20121213_1, '', '另存', 'bmp\saveas.bmp', 'ue_save', 'A', 'Btn', @max_id_cs20121213, 4, '', '1', 'counter', '另存为', '1');
      
      select @max_id_cs20121213_1 = max(function_id)+1   from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20121213_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20121213, 3, '', '1', 'counter', '打印预览', '1');
      
      select @max_id_cs20121213_1 = max(function_id)+1   from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20121213_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20121213, 2, '', '1', 'counter', '打印', '1');
      
      select @max_id_cs20121213_1 = max(function_id)+1   from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20121213_1, '', '查询', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', @max_id_cs20121213, 1, '', '1', 'counter', '查询记录', '1'); 
     end ;
end;
go
