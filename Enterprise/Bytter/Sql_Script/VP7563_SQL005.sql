
--修改日期：20130121
--修改人：胡浩军
--修改内容：增加银行账号和银行户名字段
if not exists (select * from syscolumns t,sysobjects s where t.id=s.id and s.name ='fc_bill' and t.name='bank_acc')
begin
alter table fc_bill  add bank_acc VARCHAR(30) ;
end ;