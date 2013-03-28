--修改人 田进
--修改时间 2012-11-29
--修改内容 增加ERP发送时间
ALTER TABLE bis_exc ADD(erp_send_date varchar(300));
comment on column BIS_EXC.ERP_SEND_DATE
  is 'erp发送时间';

--增加用户表外系统主键
ALTER TABLE bt_user ADD(external_sys_pk varchar(100));
comment on column BT_USER.EXTERNAL_SYS_PK
  is '外部系统主键（中烟二期用）';

--增加账户表外系统主键
ALTER TABLE bt_bank_acc ADD(external_sys_pk varchar(100));
comment on column bt_bank_acc.EXTERNAL_SYS_PK
  is '外部系统主键（中烟二期用）';

--增加历史明细外系统主键
ALTER TABLE bis_acc_his_dtl ADD(external_sys_pk varchar(100));
comment on column bis_acc_his_dtl.EXTERNAL_SYS_PK
  is '外部系统主键（中烟二期用）';

  --增加历史明细批次号字段
  ALTER TABLE bis_acc_his_dtl add(batchId varchar(100));
  comment on column bis_acc_his_dtl.batchId
  is '批次号（中烟二期用）';

--增加当日明细外系统主键
ALTER TABLE bis_acc_dtl ADD(external_sys_pk varchar(100));
comment on column bis_acc_dtl.EXTERNAL_SYS_PK
  is '外部系统主键（中烟二期用）';

--增加预算科目外系统主键
ALTER TABLE fbs_item ADD(external_sys_pk varchar(100));
comment on column fbs_item.EXTERNAL_SYS_PK
  is '外部系统主键（中烟二期用）';

--增加预算关系表
create table fbs_relation
(
       external_sys_pk varchar(100) primary key,
       cw_id varchar(100),
       bt_id varchar(100)
);
comment on column FBS_RELATION.EXTERNAL_SYS_PK
  is '系统内码（外系统主键）';
comment on column FBS_RELATION.CW_ID
  is 'NC业务预算指标';
comment on column FBS_RELATION.BT_ID
  is '资金管理预算指标';





  --初始化扩展字段属性表的单位表bt_user扩展字段：reverse11
insert into BT_Ext_Field_Property (Id,ext_Table_Code,ext_Field_Code,component_Label,default_Value,ext_Type,ext_Values,is_Required,is_Readonly,view_Sort,is_Enabled)
values ((select gen_value+1 from tb_generator where gen_name='BT_EXT_FIELD_PROPERTY_ID'), 'BT_USER', 'external_sys_pk', '外系统主键', null, '1', null, 1, 0, '01', 1);
--同步更新种子表的主键值
update tb_generator set gen_value= gen_value+1 where gen_name='BT_EXT_FIELD_PROPERTY_ID';
commit;


--是否使用拜特银企接口 在bt_bank_acc 表 字段名 为 is_bankerp(0为走银企，1为走监管系统)
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='BT_BANK_ACC' AND COLUMN_NAME='IS_BANKERP';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table bt_bank_acc add is_bankerp varchar2(1) default 1';
  COMMIT;
 END IF; 
END;
/

--创建资金调拨需要发送到监管系统的数据视图
create or replace view v_fjzh_bis_exc as
select
bis.voucher_no,--票据号码(内部转账ID)
bis.user_name,--申请人
bis.req_date,--内部转账请求时间(申请时间)
bis.amt,--付款金额（转账金额）
bis.corp_id,--付方单位编号
bis.payer_bank_name,--付款方开户行（转出行）
bis.payer_acc_no,--付款方账号(转出账户的账号)
bis.payer_acc_name,--付款方户名(转出账户名称)
opp_bt.corp_code,--收方单位编码(收款单位编码)
bis.payee_bank,--收方开户行(转入行)
bis.payee_acc_no,--收方账号(转入账户的账号)
bis.payee_name,--收方户名(转入账户名称)
bis.abs,--摘要(用途)
bis.postscript --附言(备注)
from bis_exc bis
inner join bt_bank_acc bt on bis.payer_acc_no= bt.bank_acc 
left join bt_bank_acc opp_bt on bis.payee_acc_no=opp_bt.bank_acc 
where  bis.voucher_stat='3' and bt.is_bankerp='1';

--创创反馈银行交易明细（请求）需要发送到监管系统的数据视图
create or replace view v_erp_bis_query_cmd_bankacc as
select 
bis.serial_id,
bis.bank_acc,
bis.bif_code,
bis.start_time,
bis.end_time
from bis_query_cmd bis,bt_bank_acc bt 
where bis.trans_id in('900020','900030') and bis.bank_acc=bt.bank_acc and bt.is_bankerp='1' and bis.finish_sign='3';

--创建账额查询需要发送到监管系统的数据视图
create or replace view v_erp_bis_query_cmd_bal as
select 
bis.serial_id,
bis.trans_id,
bis.bank_acc,
bis.bif_code,
bis.start_time,
bis.end_time
from bis_query_cmd bis,bt_bank_acc bt 
where bis.trans_id in('900010','900040') and bis.bank_acc=bt.bank_acc and bt.is_bankerp='1' and bis.finish_sign='3';