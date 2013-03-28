--修改日期：20130104
--修改人：feit
--修改内容：VP7062  奥克斯--对离线账户开户申请分账户类型设置多级审批流程
update bt_approve_business set table_field='acc_type,账户类型'   where table_name='bt_bankacc_app' and sys_code='bankacc'
go