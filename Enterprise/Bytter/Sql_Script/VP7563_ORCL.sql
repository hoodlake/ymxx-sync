
--修改日期：20130121
--修改人：胡浩军
--修改内容：增加银行账号字段
declare
  cnt number;
begin
  select count(*)
    into cnt
    from user_tab_columns t
   where t.TABLE_NAME = 'FC_BILL'
     and t.COLUMN_NAME = 'BANK_ACC';
  if cnt = 0 then
    execute immediate 'alter table FC_BILL  add BANK_ACC VARCHAR2(30)';
  end if;
end;
/