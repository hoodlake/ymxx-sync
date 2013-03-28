
--修改日期：20130111
--修改人：胡浩军
--修改内容：增加日志历史表缺少字段
declare
  cnt number;
begin
  select count(*)
    into cnt
    from user_tab_columns t
   where t.TABLE_NAME = 'BT_LOG_HIS'
     and t.COLUMN_NAME = 'BILLNO';
  if cnt = 0 then
    execute immediate 'alter table BT_LOG_HIS add BILLNO VARCHAR2(50)';
  end if;
  select count(*)
    into cnt
    from user_tab_columns t
   where t.TABLE_NAME = 'BT_LOG_HIS'
     and t.COLUMN_NAME = 'ID';
  if cnt = 0 then
    execute immediate 'alter table BT_LOG_HIS add  ID            NUMBER';
  end if;
  select count(*)
    into cnt
    from user_tab_columns t
   where t.TABLE_NAME = 'BT_LOG_HIS'
     and t.COLUMN_NAME = 'BUSINESSCODE';
  if cnt = 0 then
    execute immediate 'alter table BT_LOG_HIS add  BUSINESSCODE  VARCHAR2(20)';
  end if;
  select count(*)
    into cnt
    from user_tab_columns t
   where t.TABLE_NAME = 'BT_LOG_HIS'
     and t.COLUMN_NAME = 'NORMAL_FLAG';
  if cnt = 0 then
    execute immediate 'alter table BT_LOG_HIS add  NORMAL_FLAG   CHAR(1)';
  end if;
end;
/