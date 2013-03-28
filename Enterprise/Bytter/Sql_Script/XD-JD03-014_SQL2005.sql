--修改日期：20121228
--修改人：高枫
--修改内容：是否启用借贷关联
--参数设置：
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_PARAM
   WHERE CODE='brrowProvide_Like' AND SYS_CODE='cms';
  IF @VN_COUNT < 1 
   INSERT INTO BT_PARAM (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_TYPE, RMK, REVERSE1, REVERSE6,REVERSE7) 
   select 'brrowProvide_Like', 'cms', '启用借贷关联', '0', '0', 'VALUE = 0，否，VALUE = 1，是', '0,否;1,是', 1,
   (select max(b.reverse7)+1 from bt_param b where b.sys_code = 'cms' and b.reverse7 is not null);
END;
go

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('cms_provide_loan_send') AND NAME='occupyMoney')  
ALTER TABLE cms_provide_loan_send ADD occupyMoney numeric(15,2) default 0.00
GO


--增加借贷关联表
if exists (select * from sysobjects where id = object_id(N'[CMS_PROVIDE_LINK]')) 
drop table CMS_PROVIDE_LINK
GO
create table CMS_PROVIDE_LINK(
  id                       VARCHAR(20) PRIMARY KEY,
  bill_code                VARCHAR(13) not null,  --借款编码
  father_code              VARCHAR(13),           --借款编码父账号
  acc_code                 VARCHAR(50),           --借款账号
  lastmoney2               numeric(15,2),           --剩余金额
  send_date                datetime,                   --借款开始日
  deadline_date            datetime,                   --借款结束日
  float_way                VARCHAR(15),           --浮动方式
  REFERENCE_RATE_TYPE      VARCHAR(50),           --基准利率类型         
  REPAY_CYCLE              VARCHAR(50),           --贷款周期
  POINTS_PROPORTION_TEXT   numeric(15,2),            --浮动比列
  occupyMoney              numeric(15,2),           --占用金额
  releaseMoney             numeric(15,2),           --释放金额
  RATE_ENTRIES_EFFECT_DATE datetime,                   --利率调整生效日
  PL_RATE                  numeric(8,6),             --利率
  occupyStart_date         datetime,  --占用开始日期
  occupyEnd_date           datetime,  --占用结束日期
  status                   numeric,         --操作状态

  lbill_code VARCHAR(13) not null, --贷款编号
  lfather_code VARCHAR(13), --贷款编码父账号
  lacc_code  VARCHAR(50), --贷款账号
  sendMoney numeric(15,2),  --本次发放金额
  LOAN_SEND_OUT_DATE  datetime,--贷款开始日期
  repay_date datetime          --贷款结束日期
)
go 

CREATE  VIEW v_cms_provide_link as
select  p2.bill_code, 
               p2.contract_code, --借款合同编号
               p2.acc_code,
               p2.father_code,
               psmoney,          --本次借款发放金额
               bankname,         --银行
               (psmoney - lastMoney -occupymoney1) as lastmoney2,
               p2.send_date,
               p2.deadline_date,
               CASE p2.float_way 
                    WHEN '01' THEN '固定利率'
                    WHEN '02' THEN '即时浮动'
                    WHEN '03' THEN '按月浮动'
                    WHEN '04' THEN '按季浮动'
                    WHEN '05' THEN '按半年浮动' 
                    WHEN '06' THEN '按年浮动'
                    end 
                    as float_way,
               --p2.float_way,
               (select t.basetypename from tb_base_rate t where t.base_rate_id = p2.reference_rate_type) as reference_rate_type,
               (select tt.periodname from tb_credit_period tt where tt.credit_period_id = p2.repay_cycle) as repay_cycle,
               p2.points_proportion_text,
               p2.rate_entries_effect_date,
               p2.pl_rate,
               p2.corp_id,
               p2.cur_code
          from (select ps.money as psmoney,
                       (select Isnull(SUM(pr.repay_money), 0)
                          from cms_provide_loan_repay pr
                         where ps.bill_code = pr.send_code
                           and pr.status > = 11) as lastMoney,
                       Isnull(ps.occupymoney,0) as occupymoney1,
                       ps.*,
                       (select bank_name from (select info.bill_code, b.bank_name
                        from cms_provide_loan_info info, bt_bank b
                         where info.bank_code = b.bank_code) where bill_code = ps.father_code) as bankname
                  from cms_provide_loan_send ps
                 where (ps.status >= 102 and ps.status < 110)) p2
go

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('cms_loan_info') AND NAME='PloadCode')  
ALTER TABLE cms_loan_info ADD PloadCode VARCHAR(13)
GO

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('CMS_PROVIDE_LINK') AND NAME='CUR_CODE')  
ALTER TABLE CMS_PROVIDE_LINK ADD CUR_CODE CHAR(2)
GO

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('loan_send_out_info') AND NAME='CUR_CODE')  
ALTER TABLE loan_send_out_info ADD CUR_CODE CHAR(2)
GO

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('loan_send_out_info') AND NAME='PLOADCODE')  
ALTER TABLE loan_send_out_info ADD PLOADCODE  varchar(13)
GO

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('CMS_PROVIDE_LINK') AND NAME='CORP_ID')  
ALTER TABLE CMS_PROVIDE_LINK ADD CORP_ID numeric(10)
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='借贷关联兼容历史数据' AND t1.father_code=t2.res_code AND t2.res_name='贷款管理';
  IF @VN_COUNT < 1 
  BEGIN
   INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, 
   REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '借贷关联兼容历史数据', 'cms', RES_CODE, '/cms/LoanSendOutHisLinkList.jsp', '0', '1', '0', '0', 
   (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), 
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '贷款管理' AND T3.SYS_CODE = 'cms';
  END;
END;
GO

IF EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('LOAN_SEND_OUT_INFO') AND NAME='CLB_AGREEMENT_RATE')  
update info set info.clb_agreement_rate = 0.000000 from loan_send_out_info info   where info.clb_agreement_rate is null;
GO

IF EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('LOAN_SEND_OUT_INFO') AND NAME='CLB_FIXED_RATE')  
update info set info.clb_fixed_rate = 0.000000 from loan_send_out_info info where info.clb_fixed_rate is null;
GO

