declare
 v_count number;
begin
  select count(*) into v_count from user_tables where table_name = 'BT_WARNING_DICTIONARY';
  if v_count > 0 then
    update bt_warning_dictionary set rmk = '交易明细摘要' where class_id = '01' and code='11' and code_name = '支出户流入';
  end if;
end;
/