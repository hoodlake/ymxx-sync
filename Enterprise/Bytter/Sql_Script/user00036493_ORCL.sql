declare
 v_count number;
begin
  select count(*) into v_count from user_tables where table_name = 'BT_SYS_OPERATION';
  if v_count > 0 then
    -- ����Ԥ������ά��¼��
    update bt_sys_operation set type_name = 'Ԥ������ά��¼��' where type_name = '¼��' and op_type = 1 and sys_code='fwg';
    -- ��������
    select count(*) into v_count from bt_sys_operation where type_name = 'һ��Ԥ������' and op_type = 3 and sys_code='fwg';
    if v_count < 1 then
      insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 3, 'һ��Ԥ������');
    end if;
    select count(*) into v_count from bt_sys_operation where type_name = '����Ԥ������' and op_type = 4 and sys_code='fwg';
    if v_count < 1 then
      insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 4, '����Ԥ������');
    end if;
    select count(*) into v_count from bt_sys_operation where type_name = '����Ԥ������' and op_type = 5 and sys_code='fwg';
    if v_count < 1 then
      insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 5, '����Ԥ������');
    end if;
  end if;
end;
/