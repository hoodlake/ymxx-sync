-- 修改日期：20121205
-- 修改人：胡浩军
--修改内容：科目余额汇总表

declare 
 max_id_cs20121204 number;
 max_id_cs20121204_id number;
 max_id_cs20121204_1 number;
 begin
    select count(*) into max_id_cs20121204 from bt_function where FUNCTION_IDEN='w_query_subject_balance_collect';
    if max_id_cs20121204=0 then
      select function_id into max_id_cs20121204_id from bt_function where FUNCTION_NAME = '余额';
      select max(function_id)+1 into max_id_cs20121204_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121204_1, 'w_query_subject_balance_collect', '科目余额汇总表', '', '', '', 'Mnu', max_id_cs20121204_id, 9, '', '1', 'counter', '', '1');

      
      select FUNCTION_ID into max_id_cs20121204 from bt_function where FUNCTION_IDEN='w_query_subject_balance_collect';
      ----------------科目余额汇总表
      select max(function_id)+1 into max_id_cs20121204_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121204_1, '', '另存', 'bmp\saveas.bmp', 'ue_save', 'A', 'Btn', max_id_cs20121204, 4, '', '1', 'counter', '另存为', '1');
      
      select max(function_id)+1 into max_id_cs20121204_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121204_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', max_id_cs20121204, 3, '', '1', 'counter', '打印预览', '1');
      
      select max(function_id)+1 into max_id_cs20121204_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121204_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', max_id_cs20121204, 2, '', '1', 'counter', '打印', '1');
      
      select max(function_id)+1 into max_id_cs20121204_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121204_1, '', '查询', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', max_id_cs20121204, 1, '', '1', 'counter', '查询记录', '1'); end if;
    
      commit; 
end;
/