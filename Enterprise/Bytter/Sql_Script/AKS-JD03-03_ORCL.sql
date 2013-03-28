--修改人：陈春燕
--修改日期：2012-09-03
--修改内容: 新增票据业务批量办理数据是否汇总系统参数；ab_operation 新增
--修改原因:需求：AKS-JD03-03
------新增票据业务批量办理数据是否汇总系统参数
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('BBTIS', 'ads', '票据业务批量办理数据是否汇总', '0', null, null, '0', '0 否;1 是(bill batch transact is summarizing)', '0,否;1,是', '', '', '', '', 1.00, null, null, null, null);
commit;
------新增记账凭证汇总业务组别ID
alter table ab_operation add( summary_business_group VARCHAR2(20));
commit; 
