-- 修改日期：2012.10.17
-- 修改人：费滔
-- 修改原因：新增客户需求，中烟
-- 修改内容：增加退款勾兑

alter table bis_acc_his_dtl add blend CHAR(1) default '0'; 
comment on column bis_acc_his_dtl.blend is '是否勾兑标识';

 
alter table bis_acc_his_dtl add blend_info VARCHAR(200);  
comment on column bis_acc_his_dtl.blend_info is '退款勾兑原因'; 
