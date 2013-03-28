--修改时间2012-11-15
--修改人 andy.huang
--修改内容  开户申请完善

alter table bt_bankacc_app add prov varchar(20);
alter table bt_bankacc_app add city varchar(20);
alter table bt_bankacc_app add is_householdobject char(1);