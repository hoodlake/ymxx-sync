-- �޸����ڣ�20121213
-- �޸��ˣ����ƾ�
--�޸����ݣ���ҵ��Ϣ�����ѯ

declare 
 max_id_cs20121213 number;
 max_id_cs20121213_id number;
 max_id_cs20121213_1 number;
 begin
    select count(*) into max_id_cs20121213 from bt_function where FUNCTION_IDEN='w_query_interest_out';
    if max_id_cs20121213=0 then
      select function_id into max_id_cs20121213_id from bt_function where  function_name = '��ѯ' and fun_type='Mod' and sys_code='counter';
      select max(function_id)+1 into max_id_cs20121213_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121213_1, 'w_query_interest_out', '��ҵ��Ϣ�����ѯ', '', '', '', 'Mnu', max_id_cs20121213_id, 50, '', '1', 'counter', '', '1');

      
      select FUNCTION_ID into max_id_cs20121213 from bt_function where FUNCTION_IDEN='w_query_interest_out';
      ----------------��ҵ��Ϣ�����ѯ
      select max(function_id)+1 into max_id_cs20121213_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121213_1, '', '���', 'bmp\saveas.bmp', 'ue_save', 'A', 'Btn', max_id_cs20121213, 4, '', '1', 'counter', '���Ϊ', '1');
      
      select max(function_id)+1 into max_id_cs20121213_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121213_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', max_id_cs20121213, 3, '', '1', 'counter', '��ӡԤ��', '1');
      
      select max(function_id)+1 into max_id_cs20121213_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121213_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', max_id_cs20121213, 2, '', '1', 'counter', '��ӡ', '1');
      
      select max(function_id)+1 into max_id_cs20121213_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20121213_1, '', '��ѯ', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', max_id_cs20121213, 1, '', '1', 'counter', '��ѯ��¼', '1'); 
      end if;
    commit; 
end;
/
