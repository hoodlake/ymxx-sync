--修改日期：2012.7.12
--修改人：黄茜
--修改内容：中信保_新增付款汇总支付需求
--修改原因：中信保_新增付款汇总支付需求

--汇总标志：1，汇总数据，空，正常数据
alter table nis_billhead add collect_flag char(1);

--是否来自erp：1，是，空，否
alter table nis_expense_detail add isfromerp char(1);

--erp单据编号
alter table nis_expense_detail add pay_info_id number;


--修改日期：2012.7.12
--修改人：张新宝
--修改内容：中信保_新增付款汇总支付需求
--修改原因：中信保_新增付款汇总支付需求

--通知单号
alter table erp_pay_info add  FEENOTICENO VARCHAR2(15);

--条形码
alter table erp_pay_info add  BARCODE VARCHAR2(30);

--期望支付日期（为空取当前日期）
alter table erp_pay_info add  WISH_PAYDAY         DATE;

--发送批次号
alter table erp_pay_info add  SEND_BATCH          VARCHAR2(10);

--单据状态( 银行交易后，退回单据；来自bis_voucher_stat 中的 stat)
alter table erp_pay_info add  ZFLAG_YQ            CHAR(1);

--0、空为对公，1对私 （基于外付网银）
alter table erp_pay_info add  ISFORINDIVIDUAL     CHAR(1);

--ERP退单原因
alter table erp_pay_info add  ZFLAG_RESON         VARCHAR2(240);

--ERP退单类型
alter table erp_pay_info add  ZFLAG_TYPE          CHAR(2);

--父SERIAL_NO_ERP
alter table erp_pay_info add  SUMMAY_ID           VARCHAR2(100);

--1父，0子节点 ，空 正常数据
alter table erp_pay_info add   IS_PARENT           CHAR(1);

--erp发送日期
alter table erp_pay_info add  SEND_DATE           DATE;


--修改日期：2012.7.12
--修改人：张均锋
--修改内容：新增菜单“退单类型维护”
--修改原因：中信保_新增付款汇总支付需求

--新增退单类型表
create table BT_CHARGEBACKTYPE  (
   ID                   number,        
   TYPE_CODE            VARCHAR2(2)                     not null,   --退单编号
   TYPE_NAME            VARCHAR2(100),                              --退单名称
   IS_DEFAULT           CHAR(1),                                    --是否默认
   REMARK               VARCHAR2(100),                              --备注
   IS_VALID             CHAR(1),                                    --是否有效
   constraint PK_BT_CHARGEBACKTYPE primary key (ID)
);

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
values
  ((select max(RES_CODE) + 1 from bt_sys_res),
   '退单类型维护',
   'adm',
   (select RES_CODE
      from bt_sys_res
     where sys_code = 'adm'
       and RES_NAME = '基础数据维护'),
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
   2);

commit;
