--修改内容:新增系统模块－考核利率
--修改人:吴结兵
--修改时间:2012-12-03

alter table cms_check_rate modify check_rate NUMERIC(9,6);
go