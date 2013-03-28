--修改人：陈春燕
--修改日期：2012-07-30
--修改内容: 数据库ab_operation表新增一个字段
--修改原因:PJ-JD03-010,PJ-JD03-011（承兑自开和库存票据新增票据业务归属日，登记的验票新增业务记录）
--BILL_OP_VESTING_DATE:票据业务归属日期；NEED_BANKTRANSACT：改业务是否需要银行办理
alter table ab_operation add  BILL_OP_VESTING_DATE DATE;
alter table ab_operation add  NEED_BANKTRANSACT CHAR(1) default 1;
