-- 修改日期：20130114
-- 修改人：胡浩军
--修改内容：增加票据审批

declare 
 @max_id_cs20130114 int,@max_id_cs20130114_id int,@max_id_cs20130114_1 int;
 begin
    select @max_id_cs20130114 = count(*) from bt_function where FUNCTION_IDEN='w_bill_print_approve';
    if @max_id_cs20130114=0 
      begin
      select @max_id_cs20130114_id =function_id   from bt_function where FUNCTION_NAME = '票据打印' and UPPER_FUNCTION_ID<>0;
      select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, 'w_bill_print_approve', '票据审批', '', '', '', 'Mnu', @max_id_cs20130114_id, 4, '', '1', 'bill_print', '', '1');

      select @max_id_cs20130114 =FUNCTION_ID   from bt_function where FUNCTION_IDEN='w_bill_print_approve';
      ----------------票据审批
     select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, '', '查询', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', @max_id_cs20130114, 1, '', '1', 'bill_print', '查询', '1');
      
      select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, '', '通过', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20130114, 2, '', '1', 'bill_print', '打印预览', '1');
      
     select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, '', '打回', 'bmp\stop.bmp', 'ue_delete', 'S', 'Btn', @max_id_cs20130114, 2, '', '1', 'bill_print', '打印预览', '1');
      
      
      select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, '', '第一条', 'bmp\first.bmp', 'ue_first', 'F', 'Btn', @max_id_cs20130114, 3, '', '1', 'bill_print', '打印', '1');
      
      select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, '', '上一条', 'bmp\prior.bmp', 'ue_prior', 'P', 'Btn', @max_id_cs20130114, 4, '', '1', 'bill_print', '查询记录', '1'); 
     
      select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, '', '下一条', 'bmp\next.bmp', 'ue_next', 'N', 'Btn', @max_id_cs20130114, 4, '', '1', 'bill_print', '查询记录', '1');  
      
      select @max_id_cs20130114_1 = max(function_id)+1  from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130114_1, '', '最后条', 'bmp\last.bmp', 'ue_last', 'L', 'Btn', @max_id_cs20130114, 4, '', '1', 'bill_print', '查询记录', '1');
      end;
end;
go


--修改日期：20130114
--修改人：胡浩军
--修改内容：增加PROMOTERS_CORP_CODE字段
if not exists (select * from syscolumns t,sysobjects s where t.id=s.id and s.name ='fc_counter_exc' and t.name='promoters_corp_code')
begin
alter table fc_counter_exc  add PROMOTERS_CORP_CODE CHAR(4) ;
end ;
go