-- �޸����ڣ�20120910
-- �޸��ˣ�������
--�޸����ݣ��¿�˹���������޸�

declare  @max_id_cs20120910 int
declare  @max_id_cs20120910_id int
 declare @max_id_cs20120910_1 int
   select   @max_id_cs20120910 = FUNCTION_ID from bt_function where FUNCTION_IDEN='w_net_chalk'
    select   @max_id_cs20120910_id = count(*) from bt_function where UPPER_FUNCTION_ID=@max_id_cs20120910 AND USER_EVENT='ue_check_bat'
	if @max_id_cs20120910_id=0 
       begin
       -- update bt_function set seq_no=4 where upper_function_id=@max_id_cs20120910 and user_event='ue_delete'
        update bt_function set seq_no=seq_no + 6 where upper_function_id=@max_id_cs20120910 and seq_no>=6
        select  @max_id_cs20120910_1 = max(function_id)+1 from BT_FUNCTION
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120910_1, '', '�������', 'bmp\check.bmp', 'ue_delete_bat', 'N', 'Btn', @max_id_cs20120910, 6, '', '1', 'interacc', '�������', '1')

        select  @max_id_cs20120910_1 = max(function_id)+1  from BT_FUNCTION
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120910_1, '', 'ȫѡ', 'bmp\selectall.bmp', 'ue_selectall', 'A', 'Btn', @max_id_cs20120910, 8, '', '1', 'interacc', 'ȫѡ', '1')

        select   @max_id_cs20120910_1 = max(function_id)+1 from BT_FUNCTION
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120910_1, '', '��ѡ', 'bmp\disselect.bmp', 'ue_disselect', 'I', 'Btn', @max_id_cs20120910, 10, '', '1', 'interacc', '��ѡ', '1')
      end
   
   
   
  
   
  
