
--修改人:吴生火
--修改时间:2012-11-17
--修改内容:和氏璧网上银行接口需求_实现方式及记账差别

alter table bt_net_chalk
add IS_ERP char(1);
comment on column bt_net_chalk.IS_ERP
is '是否来自ERP接口,1是,0否';
alter table bt_net_chalk
add IS_Success_MatchPer char(1);
comment on column bt_net_chalk.IS_Success_MatchPer
is '比例匹配是否成功,1是,0否';

-- Create table
create table BT_NET_CHALK_ERP_DTL
(
  BIF_SERIAL      VARCHAR2(50) not null,
  LINE_NO         NUMBER(5) not null,
  CORP_CODE       CHAR(4),
  CORP_NAME       VARCHAR2(80) ,
  MONEY           NUMBER(14,2)
)
;
-- Add comments to the columns 
comment on column BT_NET_CHALK_ERP_DTL.BIF_SERIAL
  is '接口流水号,与bt_net_chalk.bif_serial对应';
comment on column BT_NET_CHALK_ERP_DTL.LINE_NO
  is '行号,根据设置的比较顺序产生';
comment on column BT_NET_CHALK_ERP_DTL.CORP_CODE
  is '单位代码';
comment on column BT_NET_CHALK_ERP_DTL.CORP_NAME
  is '单位名称';
comment on column BT_NET_CHALK_ERP_DTL.MONEY
  is '分配金额';
-- Create/Recreate primary, unique and foreign key constraints 
alter table BT_NET_CHALK_ERP_DTL
  add constraint PK_BT_NET_CHALK_ERP_DTL primary key (BIF_SERIAL,LINE_NO)
;

commit;