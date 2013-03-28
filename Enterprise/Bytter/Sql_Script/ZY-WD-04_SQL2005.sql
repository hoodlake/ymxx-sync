
--新建表 CMS_PRECATIVE_LOAN_CCAL 委托贷款试算信息
--刘建武
-- Create table
create table CMS_PRECATIVE_LOAN_CCAL
(
  BILL_CODE       VARCHAR(20) not null,
  CALCUALTE_DATE  DATETime not null,
  PRECATIVE_ID    int,
  APP_CODE        VARCHAR(20),
  MONEY           NUMeric(15,2),
  FUNDING_GAP     NUMeric(15,2),
  CURRENCY        CHAR(2),
  TERM            int,
  CORP_ID         int,
  R_MONEY         NUMeric(15,2),
  REDUNDANCY_ID   int,
  REDUNDANCY_DATE DATEtime,
  PERIOD          int,
  CAPITAL_COST    NUMeric(8,2),
  ID              int not null,
  BATCH_CODE      VARCHAR(30),
  constraint PK_CMS_PRECATIVE_LOAN_CCAL primary key (ID)
);
create index INDEX_CMS_PRECATIVE_LOAN_CCAL on CMS_PRECATIVE_LOAN_CCAL (BILL_CODE, APP_CODE);
go

--新建视图
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='v_valid_bt_redundancy_money')
DROP VIEW v_valid_bt_redundancy_money
GO

create  view v_valid_bt_redundancy_money as
select money.ID,
       money.CORP_ID,
       money.R_MONEY,
       money.CUR_CODE,
       money.PERIOD,
       money.CAPITAL_COST,
       money.EFFECTIVI_DATE,
       money.OP_DATE,
       money.OP_NAME,
       money.OP_CODE,
       money.APPROVES,
       money.STATUS,
       money.NEXTCHECKER,
       money.UPDATE_TIME,
       money.UPDATE_NAME,
       money.UPDATE_CODE,
       money.RMK,
       money.ACC_NO,
       money.BILL_MONEY,
       corp.corp_code,
       corp.corp_name,
       cur.cur_name
--有效冗余资金
  from BT_REDUNDANCY_MONEY money, bt_corp corp, bt_currency cur
 where money.corp_id = corp.id
   and cur.cur_code = money.cur_code
   and money.id in (select max(id)
                      from BT_REDUNDANCY_MONEY
                     where status = 97
                     group by corp_id, cur_code);
go


IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='v_cms_precative_loan_ccal')
DROP VIEW v_cms_precative_loan_ccal
GO
create  view v_cms_precative_loan_ccal as
select cms.BILL_CODE,
       cms.CALCUALTE_DATE,
       cms.PRECATIVE_ID,
       cms.APP_CODE,
       cms.MONEY,
       cms.FUNDING_GAP,
       cms.CURRENCY,
       cms.TERM,
       cms.CORP_ID,
       cms.R_MONEY,
       cms.REDUNDANCY_ID,
       cms.REDUNDANCY_DATE,
       cms.PERIOD,
       cms.CAPITAL_COST,
       cms.ID,
       cms.BATCH_CODE,
       corp.corp_name precative_corp_name,
       cur.cur_name
  from cms_precative_loan_ccal cms, bt_corp corp, bt_currency cur
 where cms.precative_id = corp.id
   and cms.currency = cur.cur_code;
go


IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='v_distinct_precative_loan_ccal')
DROP VIEW v_distinct_precative_loan_ccal
GO

create  view v_distinct_precative_loan_ccal as
select distinct cms.bill_code,
                cms.app_code,
                cms.funding_gap finding_gap,
                corp.id corp_id,
                cur.cur_code,
                corp.corp_code,
                corp.corp_name,
                cur.cur_name
  from cms_precative_loan_ccal cms, bt_corp corp, bt_currency cur
 where cms.corp_id = corp.id
   and cms.currency = cur.cur_code;
go



--菜单  信贷管理>>委托贷款>>成本方案试算

DECLARE
  @VN_COUNT    int;
BEGIN
  SELECT @VN_COUNT =COUNT(*)
    FROM bt_sys_res t1 WHERE t1.sys_code='cms' AND t1.res_name='成本方案试算' AND t1.res_url='/cms/cmsPrecativeLoanCcalAction.do?method=goPrecativeLoanCcal';
  IF @VN_COUNT < 1 
	begin
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  select  (select max(res_code)+1 from bt_sys_res) , '成本方案试算', 'cms', (select res_code from bt_sys_res where sys_code='cms' and res_name='委托贷款' and father_code=0), '/cms/cmsPrecativeLoanCcalAction.do?method=goPrecativeLoanCcal', '0', '0', '0', '0', 9, '中远', 2
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms' and father_code=0;
    END ;
END;
go


--主键生成器
DECLARE	
		@VN_count int,
		@intid    int;
begin 
 select @VN_count= count(*) 
 from bt_key_generator where keyalisename='CMS_PRECATIVE_LOAN_CCAL' and genstrate='cu';
 if @VN_count<1 
  begin 
	select @intid=max(id)+1 from  bt_key_generator;
    insert into bt_key_generator(id,keyalisename,custgenclass,genstrate)
    values(@intid,'CMS_PRECATIVE_LOAN_CCAL','com.byttersoft.keyservice.usrdefgenerator.CmsPrecativeLoanCcalKeyGenerator','cu')
  end;
end; 

go
