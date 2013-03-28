--修改日期 2012-11-14
--修改人 田进
--修改内容 把GSFZYS表的ZWFZYS_JE字段类型由float(8)改成number(15,2)
update GSFZYS set ZWFZYS_JE=NULL;
alter table GSFZYS modify ZWFZYS_JE number(15,2);
commit;



