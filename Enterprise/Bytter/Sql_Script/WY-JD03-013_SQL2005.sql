--修改日期：2012.7.12
--修改人：黄茜
--修改内容：中信保_新增付款汇总支付需求
--修改原因：中信保_新增付款汇总支付需求

--汇总标志：1，汇总数据，空，正常数据
alter table nis_billhead add collect_flag char(1)
go
--是否来自erp：1，是，空，否
alter table nis_expense_detail add isfromerp char(1)
go
--erp单据编号
alter table nis_expense_detail add pay_info_id int

go

--修改日期：2012.7.12
--修改人：张新宝
--修改内容：中信保_新增付款汇总支付需求
--修改原因：中信保_新增付款汇总支付需求

--通知单号
alter table erp_pay_info add  FEENOTICENO         VARCHAR(15)
go
--条形码
alter table erp_pay_info add  BARCODE             VARCHAR(30)
go
--期望支付日期（为空取当前日期）
alter table erp_pay_info add  WISH_PAYDAY         DATETIME
go
--发送批次号
alter table erp_pay_info add  SEND_BATCH          VARCHAR(10)
go
--单据状态( 银行交易后，退回单据；来自bis_voucher_stat 中的 stat)
alter table erp_pay_info add  ZFLAG_YQ            CHAR(1)
go
--0、空为对公，1对私 （基于外付网银）
alter table erp_pay_info add  ISFORINDIVIDUAL     CHAR(1)
go
--ERP退单原因
alter table erp_pay_info add  ZFLAG_RESON         VARCHAR(240)
go
--ERP退单类型
alter table erp_pay_info add  ZFLAG_TYPE          CHAR(2)
go
--父SERIAL_NO_ERP
alter table erp_pay_info add  SUMMAY_ID           VARCHAR(100)
go
--1父，0子节点 ，空 正常数据
alter table erp_pay_info add   IS_PARENT           CHAR(1)
go
--erp发送日期
alter table erp_pay_info add  SEND_DATE           DATETIME

go


--修改日期：2012.7.12
--修改人：张均锋
--修改内容：新增菜单“退单类型维护”

--新增退单类型表
create table BT_CHARGEBACKTYPE  (
   ID                   INT,        
   TYPE_CODE            VARCHAR(2)                     not null,   --退单编号
   TYPE_NAME            VARCHAR(100),                              --退单名称
   IS_DEFAULT           CHAR(1),                                    --是否默认
   REMARK               VARCHAR(100),                              --备注
   IS_VALID             CHAR(1),                                    --是否有效
   constraint PK_BT_CHARGEBACKTYPE primary key (ID)
)
go
--修改原因：中信保_新增付款汇总支付需求
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL)
select (select max(RES_CODE) + 1 from bt_sys_res),
   '退单类型维护',
   'adm',
   RES_CODE,
   '/admin/btChargebacktype.do?method=toList',
   '0',
   '1',
   '0',
   '0',
   10,
   '退单类型维护',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2 from bt_sys_res where sys_code = 'adm' and RES_NAME = '基础数据维护'

go
