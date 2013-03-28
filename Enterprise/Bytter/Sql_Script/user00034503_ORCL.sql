--修改时间2012-11-15
--修改人 andy.huang
--修改内容  开户申请完善

--离线账号表新增字段“省”
alter table bt_bankacc_app add prov varchar2(20);
--离线账号表新增字段“市”
alter table bt_bankacc_app add city varchar2(20);
--离线账号表新增字段“扫户对象”  0，否     1，是
alter table bt_bankacc_app add is_householdobject char(1);