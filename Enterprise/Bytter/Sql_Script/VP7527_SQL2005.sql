--修改人:王丰
--修改时间:2013-01-09
--修改内容:VP7503-7504新增“凭证调拨”，功能
--新增：数据交换---数据管理---凭证调拨  菜单
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE SYS_CODE= 'exchange'
   and RES_NAME = '凭证调拨'
   and RES_URL = '/dataExchange/erpZxbAction.do?method=queryList';
  IF VN_COUNT < 1 THEN
  
  insert into bt_sys_res 
  (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, 
  REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select  (select max(RES_CODE) + 1 from bt_sys_res), '凭证调拨', 'exchange', 9137, '/dataExchange/erpZxbAction.do?method=queryList', 
        '0', '1', '0', '0', 2, '凭证调拨', '', '', '', '', '', null, null, null, null, null, 2, ''
 from bt_sys_res
   where res_code=9137;
     
  END IF;
  COMMIT; 
END;
/

--修改人:王丰
--修改时间:2013-01-09
--修改内容:--新增：数据交换---数据管理---凭证调拨信息表

create table ERP_ZXB_ZFIS
(
  SEQNO         VARCHAR(32) not null,
  BUKRS_IN      NUMERIC(4),
  BANKNUM_IN    VARCHAR(25),
  WAERS_IN      VARCHAR(5),
  DMBTR_IN      NUMERIC(17,2),
  ZZHLB_IN      VARCHAR(5),
  BUKRS_OUT     VARCHAR(4),
  BANKNUM_OUT   VARCHAR(25),
  WAERS_OUT     VARCHAR(5),
  DMBTR_OUT     NUMERIC(17,2),
  ZZHLB_OUT     VARCHAR(5),
  DEAL_DATE     DATETIME,
  STATUS        CHAR(1),
  ZSTATUS       CHAR(1),
  LOG_DESC      VARCHAR(200),
  REC_DOC_IN    VARCHAR(20),
  REC_DOC_OUT   VARCHAR(20),
  REC_DATE      VARCHAR(20),
  AC_BUDAT      VARCHAR(20),
  AC_DOC_NO_IN  VARCHAR(20),
  AC_DOC_NO_OUT VARCHAR(20),
  AC_PERSON     VARCHAR(50),
  CREATE_DATE   DATETIME,
  UPDATE_DATE   DATETIME
)
;
-- Add comments to the columns 
comment on column ERP_ZXB_ZFIS.SEQNO
  is '流水号';
comment on column ERP_ZXB_ZFIS.BUKRS_IN
  is '调入公司代码';
comment on column ERP_ZXB_ZFIS.BANKNUM_IN
  is '调入公司账号';
comment on column ERP_ZXB_ZFIS.WAERS_IN
  is '调入币种';
comment on column ERP_ZXB_ZFIS.DMBTR_IN
  is '调入金额
';
comment on column ERP_ZXB_ZFIS.ZZHLB_IN
  is '调入账户类型';
comment on column ERP_ZXB_ZFIS.BUKRS_OUT
  is '调出公司代码';
comment on column ERP_ZXB_ZFIS.BANKNUM_OUT
  is '调出公司账号';
comment on column ERP_ZXB_ZFIS.WAERS_OUT
  is '调出币种';
comment on column ERP_ZXB_ZFIS.DMBTR_OUT
  is '调出金额';
comment on column ERP_ZXB_ZFIS.ZZHLB_OUT
  is '调出账户类型';
comment on column ERP_ZXB_ZFIS.DEAL_DATE
  is '交易日期
';
comment on column ERP_ZXB_ZFIS.STATUS
  is '是否导入成功标识	:Y表成功，X表失败';
comment on column ERP_ZXB_ZFIS.ZSTATUS
  is '处理状态（空未处理;1生成前置凭证;2前置凭证审核通过;3前置凭证审核不通过;4生成会计凭证;5无效退回;凭证生成失败）';
comment on column ERP_ZXB_ZFIS.LOG_DESC
  is '日志描述';
comment on column ERP_ZXB_ZFIS.REC_DOC_IN
  is '前置凭证号
';
comment on column ERP_ZXB_ZFIS.REC_DOC_OUT
  is '前置凭证号';
comment on column ERP_ZXB_ZFIS.REC_DATE
  is '前置凭证生成日期';
comment on column ERP_ZXB_ZFIS.AC_BUDAT
  is '过账日期
';
comment on column ERP_ZXB_ZFIS.AC_DOC_NO_IN
  is '过账凭证号';
comment on column ERP_ZXB_ZFIS.AC_DOC_NO_OUT
  is '过账凭证号';
comment on column ERP_ZXB_ZFIS.AC_PERSON
  is '过账人
';
