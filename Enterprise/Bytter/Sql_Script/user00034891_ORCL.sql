
--
--add by lishc 2012 11 19
----修改字段允许为空  如果已经设置就不设置了


alter table CMS_LOAN_INFO modify REPAY_TYPE null;
alter table CMS_LOAN_INFO modify LOAN_CLASS null;

commit;

