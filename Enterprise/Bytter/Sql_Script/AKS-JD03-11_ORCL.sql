-- 修改日期：20120910
-- 修改人：吴生火
--修改内容：奥克斯网上银行修改

declare 
 max_id_cs20120910 number;
 max_id_cs20120910_id number;
 max_id_cs20120910_1 number;
 begin
    select FUNCTION_ID into max_id_cs20120910 from bt_function where FUNCTION_IDEN='w_net_chalk';
    select count(*) into max_id_cs20120910_id from bt_function where UPPER_FUNCTION_ID=max_id_cs20120910 AND USER_EVENT='ue_check_bat';
    if max_id_cs20120910_id=0 then
       -- update bt_function set seq_no=4 where upper_function_id=max_id_cs20120910 and user_event='ue_delete';
        update bt_function set seq_no=seq_no + 6 where upper_function_id=max_id_cs20120910 and seq_no>=6;
        select max(function_id)+1 into max_id_cs20120910_1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (max_id_cs20120910_1, '', '批量打回', 'bmp\check.bmp', 'ue_delete_bat', 'N', 'Btn', max_id_cs20120910, 6, '', '1', 'interacc', '批量打回', '1');

        select max(function_id)+1 into max_id_cs20120910_1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (max_id_cs20120910_1, '', '全选', 'bmp\selectall.bmp', 'ue_selectall', 'A', 'Btn', max_id_cs20120910, 8, '', '1', 'interacc', '全选', '1');

        select max(function_id)+1 into max_id_cs20120910_1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (max_id_cs20120910_1, '', '反选', 'bmp\disselect.bmp', 'ue_disselect', 'I', 'Btn', max_id_cs20120910, 10, '', '1', 'interacc', '反选', '1');

     end if;
   end ;

/
   
  
   
  
