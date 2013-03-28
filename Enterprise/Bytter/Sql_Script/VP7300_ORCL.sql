--修改人:陈春燕
--修改时间:2012-12-27
--修改内容:修改审批统计设计
--审批数字列统计说明：在 BT_APPROVE_BUSINESS 中根据sys_code business_code 确定要要设置统计的审批业务
--如果需要设置统计，根据现有审批业务的页面更改BT_APPROVE_BUSINESS 的total_set的数值，该值表示页面统计列的
--列标示（从0开始，如承兑的贴现设置为：5）
--承兑
update BT_APPROVE_BUSINESS set total_set=5 where business_code like 'ads_%';
commit;
----
update BT_APPROVE_BUSINESS set total_set=3 where business_code like 'cms_A1';
commit;

update BT_APPROVE_BUSINESS set total_set=4 where business_code = 'cms_A3';
commit;

