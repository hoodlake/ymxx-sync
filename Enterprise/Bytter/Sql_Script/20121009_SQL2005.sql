

--�޸���:���¾�
--�޸�ʱ��:2012-10-9
--�޸�����:����ֶβ�����������ֶ�

if not exists(select * from syscolumns where id=object_id('ab_operation') and name='attachment')  
alter table ab_operation add attachment VARCHAR(200); 
go
