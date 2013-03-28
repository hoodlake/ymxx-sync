--修改日期：2012.11.30
--修改人：祁继鸿
--修改内容：user00035243
--修改原因：对银行授信待审批列表，在当前位置地址多了“审批”二字需要去掉
update  bt_approve_business set business_name='银行额度申请占用' where business_name='银行额度申请占用审批';
update  bt_approve_business set business_name='银行额度录入' where business_name='银行额度录入审批';
update  bt_approve_business set business_name='银行额度分配' where business_name='银行额度分配审批';
update  bt_approve_business set business_name='银行额度调剂' where business_name='银行额度调剂审批';
update  bt_approve_business set business_name='内部额度录入' where business_name='内部额度录入审批';
update  bt_approve_business set business_name='内部额度申请占用' where business_name='内部额度申请占用审批';
update  bt_approve_business set business_name='内部额度追加' where business_name='内部额度追加审批';
go
