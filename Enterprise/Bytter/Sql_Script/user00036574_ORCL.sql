declare
 v_count number;
begin
  select count(*) into v_count from user_tables where table_name = 'BT_WARNING_DICTIONARY';
  if v_count > 0 then
    update bt_warning_dictionary set rmk = '������ϸժҪ' where class_id = '01' and code='11' and code_name = '֧��������';
  end if;
end;
/