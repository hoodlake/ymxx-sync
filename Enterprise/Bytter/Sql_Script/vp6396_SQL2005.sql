--修改日期 2012-11-14
--修改人 田进
--修改内容 把GSFZYS表的ZWFZYS_JE字段类型由float(8)改成decimal(10,2)
update GSFZYS set ZWFZYS_JE=NULL
alter table GSFZYS alter column ZWFZYS_JE decimal(10,2)




