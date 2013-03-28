
-- 修改日期：20130115
-- 修改人：吴生火
--修改内容：增加菜单 “手续费计提账号维护”

declare 
 max_id_cs20130115 number;
 max_id_cs20130115_id number;
 max_id_cs20130115_1 number;
 begin
    select count(*) into max_id_cs20130115 from bt_function where FUNCTION_IDEN='w_handle_charge_cd_acc';
    if max_id_cs20130115=0 then
      select FUNCTION_ID into max_id_cs20130115_id from bt_function where function_name='基础数据维护'and sys_code = 'counter';        
      select max(function_id)+1 into max_id_cs20130115 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130115, 'w_handle_charge_cd_acc', '手续费计提账号维护', '', '', '', 'Mnu', max_id_cs20130115_id, 10, 'L', '1', 'counter', '手续费计提账号维护', '1');
      
       select max(function_id)+1 into max_id_cs20130115_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130115_1, '', '查询', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', max_id_cs20130115, 1, '', '1', 'counter', '查询记录', '1');

      select max(function_id)+1 into max_id_cs20130115_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130115_1, '', '保存', 'bmp\save.bmp', 'ue_save', 'S', 'Btn', max_id_cs20130115, 2, '', '1', 'counter', '保存修改', '1');
    end if;
   commit;
 end;
/


--修改内容：增加“是否收取手续费”标志
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='FC_ACC' AND COLUMN_NAME='HANDLE_CHARGE';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table fc_acc add handle_charge char(1)  default 1 ';
    
  COMMIT;
 END IF; 
END;
/
