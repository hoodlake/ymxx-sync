-- �޸����ڣ�20130114
-- �޸��ˣ����ƾ�
--�޸����ݣ�����Ʊ������

declare 
 max_id_cs20130114 number;
 max_id_cs20130114_id number;
 max_id_cs20130114_1 number;
 begin
    select count(*) into max_id_cs20130114 from bt_function where FUNCTION_IDEN='w_bill_print_approve';
    if max_id_cs20130114=0 then
      select function_id into max_id_cs20130114_id from bt_function where FUNCTION_NAME = 'Ʊ�ݴ�ӡ' and UPPER_FUNCTION_ID<>0;
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, 'w_bill_print_approve', 'Ʊ������', '', '', '', 'Mnu', max_id_cs20130114_id, 4, '', '1', 'bill_print', '', '1');

      select FUNCTION_ID into max_id_cs20130114 from bt_function where FUNCTION_IDEN='w_bill_print_approve';
      ----------------Ʊ������
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, '', '��ѯ', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', max_id_cs20130114, 1, '', '1', 'bill_print', '��ѯ', '1');
      
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, '', 'ͨ��', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', max_id_cs20130114, 2, '', '1', 'bill_print', '��ӡԤ��', '1');
      
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, '', '���', 'bmp\stop.bmp', 'ue_delete', 'S', 'Btn', max_id_cs20130114, 2, '', '1', 'bill_print', '��ӡԤ��', '1');
      
      
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, '', '��һ��', 'bmp\first.bmp', 'ue_first', 'F', 'Btn', max_id_cs20130114, 3, '', '1', 'bill_print', '��ӡ', '1');
      
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, '', '��һ��', 'bmp\prior.bmp', 'ue_prior', 'P', 'Btn', max_id_cs20130114, 4, '', '1', 'bill_print', '��ѯ��¼', '1'); 
     
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, '', '��һ��', 'bmp\next.bmp', 'ue_next', 'N', 'Btn', max_id_cs20130114, 4, '', '1', 'bill_print', '��ѯ��¼', '1');  
      
      select max(function_id)+1 into max_id_cs20130114_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130114_1, '', '�����', 'bmp\last.bmp', 'ue_last', 'L', 'Btn', max_id_cs20130114, 4, '', '1', 'bill_print', '��ѯ��¼', '1'); end if;
   commit;  
end;
/
--�޸����ڣ�20130114
--�޸��ˣ����ƾ�
--�޸����ݣ�����PROMOTERS_CORP_CODE�ֶ�
declare 
 cnt number;
begin
  select count(*)    into cnt    from user_tab_columns t
   where t.TABLE_NAME = 'FC_COUNTER_EXC'
     and t.COLUMN_NAME = 'PROMOTERS_CORP_CODE';
  if cnt = 0 then
    execute immediate 'alter table fc_counter_exc  add PROMOTERS_CORP_CODE CHAR(4)';
  end if;
  commit;
end;
/
