
-- �޸����ڣ�20130115
-- �޸��ˣ�������
--�޸����ݣ����Ӳ˵� �������Ѽ����˺�ά����

declare 
 max_id_cs20130115 number;
 max_id_cs20130115_id number;
 max_id_cs20130115_1 number;
 begin
    select count(*) into max_id_cs20130115 from bt_function where FUNCTION_IDEN='w_handle_charge_cd_acc';
    if max_id_cs20130115=0 then
      select FUNCTION_ID into max_id_cs20130115_id from bt_function where function_name='��������ά��'and sys_code = 'counter';        
      select max(function_id)+1 into max_id_cs20130115 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130115, 'w_handle_charge_cd_acc', '�����Ѽ����˺�ά��', '', '', '', 'Mnu', max_id_cs20130115_id, 10, 'L', '1', 'counter', '�����Ѽ����˺�ά��', '1');
      
       select max(function_id)+1 into max_id_cs20130115_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130115_1, '', '��ѯ', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', max_id_cs20130115, 1, '', '1', 'counter', '��ѯ��¼', '1');

      select max(function_id)+1 into max_id_cs20130115_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20130115_1, '', '����', 'bmp\save.bmp', 'ue_save', 'S', 'Btn', max_id_cs20130115, 2, '', '1', 'counter', '�����޸�', '1');
    end if;
   commit;
 end;
/


--�޸����ݣ����ӡ��Ƿ���ȡ�����ѡ���־
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
