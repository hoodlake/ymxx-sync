
--�޸����ڣ�20130121
--�޸��ˣ����ƾ�
--�޸����ݣ����������˺��ֶ�
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