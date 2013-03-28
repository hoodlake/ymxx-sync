

--修改人:蒲勇军
--修改时间:2012-10-9
--修改内容:如果字段不存在则添加字段

if not exists(select * from syscolumns where id=object_id('ab_operation') and name='attachment')  
alter table ab_operation add attachment VARCHAR(200); 
go
