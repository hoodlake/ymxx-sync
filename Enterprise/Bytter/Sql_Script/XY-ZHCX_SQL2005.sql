--修改日期：20121219
--修改人：费滔
--需求编号：兴业账户信息查询
--修改内容：兴业账户信息查询，新增字段，用来接受接口扫回的数据
alter table BIS_ACC_HIS_BAL add CONTROL_MONEY numeric(15,2);
alter table BIS_ACC_HIS_BAL add FREEZE_MONEY numeric(15,2); 
go