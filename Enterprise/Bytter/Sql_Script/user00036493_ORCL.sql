declare
 v_count number;
begin
  select count(*) into v_count from user_tables where table_name = 'BT_SYS_OPERATION';
  if v_count > 0 then
    -- 更新预警策略维护录入
    update bt_sys_operation set type_name = '预警策略维护录入' where type_name = '录入' and op_type = 1 and sys_code='fwg';
    -- 插入数据
    select count(*) into v_count from bt_sys_operation where type_name = '一级预警处理' and op_type = 3 and sys_code='fwg';
    if v_count < 1 then
      insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 3, '一级预警处理');
    end if;
    select count(*) into v_count from bt_sys_operation where type_name = '二级预警处理' and op_type = 4 and sys_code='fwg';
    if v_count < 1 then
      insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 4, '二级预警处理');
    end if;
    select count(*) into v_count from bt_sys_operation where type_name = '三级预警处理' and op_type = 5 and sys_code='fwg';
    if v_count < 1 then
      insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 5, '三级预警处理');
    end if;
  end if;
end;
/