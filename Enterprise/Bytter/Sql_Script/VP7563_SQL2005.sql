
--�޸����ڣ�20130121
--�޸��ˣ����ƾ�
--�޸����ݣ����������˺ź����л����ֶ�
if not exists (select * from syscolumns t,sysobjects s where t.id=s.id and s.name ='fc_bill' and t.name='bank_acc')
begin
alter table fc_bill  add bank_acc VARCHAR(30) ;
end ;

go