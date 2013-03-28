--修改日期：20130111
--修改人：胡浩军
--修改内容：增加日志历史表缺少字段
if not exists (select * from syscolumns t,sysobjects s where t.id=s.id and s.name ='bt_log_his' and t.name='billno')
begin
ALTER TABLE bt_log_his ADD billno  VARCHAR(50) ;
end ;
if not exists (select * from syscolumns t,sysobjects s where t.id=s.id and s.name ='bt_log_his' and t.name='id')
begin
ALTER TABLE bt_log_his ADD id  int ;
end ;
if not exists (select * from syscolumns t,sysobjects s where t.id=s.id and s.name ='bt_log_his' and t.name='BUSINESSCODE')
begin
ALTER TABLE bt_log_his ADD BUSINESSCODE  VARCHAR(20) ;
end ;
if not exists (select * from syscolumns t,sysobjects s where t.id=s.id and s.name ='bt_log_his' and t.name='NORMAL_FLAG')
begin
ALTER TABLE bt_log_his ADD NORMAL_FLAG  char(1);
end ;
