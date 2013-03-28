
--修改日期：2012.11.09
--修改人：蒲勇军
--修改内容：中远,融资计划
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'FBS_FINANC_PLAN';
   IF VN_COUNT < 1 THEN   
  VC_STR := VC_STR || 'create table FBS_FINANC_PLAN ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   ID                   NUMBER(10) PRIMARY KEY , ';
  VC_STR := VC_STR || '   PLAN_CODE            VARCHAR2(50), ';
  VC_STR := VC_STR || '   PLAN_NAME            VARCHAR2(200), ';
  VC_STR := VC_STR || '   PLAN_YEAR            VARCHAR2(4), ';
  VC_STR := VC_STR || '   PLAN_TYPE            VARCHAR2(4), ';
  VC_STR := VC_STR || '   PLAN_STATUS          NUMBER(2), ';
  VC_STR := VC_STR || '   GATHER_ID            NUMBER(10), ';
  VC_STR := VC_STR || '   IS_GATHER            NUMBER(2), ';
  VC_STR := VC_STR || '   CORP_CODE            VARCHAR2(4), ';
  VC_STR := VC_STR || '   UNIT                 VARCHAR2(4) ';
  VC_STR := VC_STR || ') ';
  EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column FBS_FINANC_PLAN.PLAN_CODE is '报表编码';
comment on column FBS_FINANC_PLAN.PLAN_NAME is '报表名称';
comment on column FBS_FINANC_PLAN.PLAN_YEAR is '年份数据';
comment on column FBS_FINANC_PLAN.PLAN_TYPE is '报表类别';
comment on column FBS_FINANC_PLAN.PLAN_STATUS is '报表状态';
comment on column FBS_FINANC_PLAN.GATHER_ID is '汇总ID';
comment on column FBS_FINANC_PLAN.IS_GATHER is '汇总ID:1表示汇总,0或者空表示不是汇总';
comment on column FBS_FINANC_PLAN.UNIT is '金额单位 1千元 0 元';


DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'FBS_FINANC_PLAN_DETAIL';
   IF VN_COUNT < 1 THEN   
  VC_STR := VC_STR || 'create table FBS_FINANC_PLAN_DETAIL  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   ID                   NUMBER  PRIMARY KEY , ';
  VC_STR := VC_STR || '   PROJECT_NAME         VARCHAR2(200), ';
  VC_STR := VC_STR || '   PROJECT_CODE         VARCHAR2(500), ';
  VC_STR := VC_STR || '   CUR_CODE             VARCHAR2(4), ';
  VC_STR := VC_STR || '   BORROWER             VARCHAR2(200), ';
  VC_STR := VC_STR || '   CONSIGNER            VARCHAR2(200), ';
  VC_STR := VC_STR || '   USURER               VARCHAR2(200), ';
  VC_STR := VC_STR || '   CONTRACT_NO          VARCHAR2(50), ';
  VC_STR := VC_STR || '   RATE                 NUMBER(10,6), ';
  VC_STR := VC_STR || '   START_DATE           DATE, ';
  VC_STR := VC_STR || '   END_DATE             DATE, ';
  VC_STR := VC_STR || '   LOAN_NATURE          VARCHAR2(50), ';
  VC_STR := VC_STR || '   CONTRACT_AMT         NUMBER(15,2), ';
  VC_STR := VC_STR || '   START_AMT            NUMBER(15,2), ';
  VC_STR := VC_STR || '   DRAWING_AMT          NUMBER(15,2), ';
  VC_STR := VC_STR || '   REVERT_AMT           NUMBER(15,2), ';
  VC_STR := VC_STR || '   END_AMT              NUMBER(15,2), ';
  VC_STR := VC_STR || '   RMK                  VARCHAR2(200), ';
  VC_STR := VC_STR || '   ORDER_NO             NUMBER(3), ';
  VC_STR := VC_STR || '   FFP_ID               NUMBER(10), ';
  VC_STR := VC_STR || '   USURER_INOUT         VARCHAR2(50), ';
  VC_STR := VC_STR || '   HEAD_BANK            VARCHAR2(200), ';
  VC_STR := VC_STR || '   SUB_BANK             VARCHAR2(200), ';
  VC_STR := VC_STR || '   GUARANTOR            VARCHAR2(200), ';
  VC_STR := VC_STR || '   GUARANT_CONTRACT     VARCHAR2(50), ';
  VC_STR := VC_STR || '   BELONG_SUB_COP       VARCHAR2(200), ';
  VC_STR := VC_STR || '   TF_TYPE              VARCHAR2(50), ';
  VC_STR := VC_STR || '   TF_DETAIL            VARCHAR2(50) ';
  VC_STR := VC_STR || ') ';
  EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column FBS_FINANC_PLAN_DETAIL.ID is 'ID';
comment on column FBS_FINANC_PLAN_DETAIL.PROJECT_NAME is '项目名称';
comment on column FBS_FINANC_PLAN_DETAIL.PROJECT_CODE is '项目名称';
comment on column FBS_FINANC_PLAN_DETAIL.CUR_CODE is '币别';
comment on column FBS_FINANC_PLAN_DETAIL.BORROWER is '借款人';
comment on column FBS_FINANC_PLAN_DETAIL.CONSIGNER is '委托人';
comment on column FBS_FINANC_PLAN_DETAIL.USURER is '贷款行(机构)';
comment on column FBS_FINANC_PLAN_DETAIL.CONTRACT_NO is '借款合同号';
comment on column FBS_FINANC_PLAN_DETAIL.RATE is '年利率';
comment on column FBS_FINANC_PLAN_DETAIL.START_DATE is '起始日';
comment on column FBS_FINANC_PLAN_DETAIL.END_DATE is '到期日';
comment on column FBS_FINANC_PLAN_DETAIL.LOAN_NATURE is '借款性质';
comment on column FBS_FINANC_PLAN_DETAIL.CONTRACT_AMT is '合同金额';
comment on column FBS_FINANC_PLAN_DETAIL.START_AMT is '期初金额';
comment on column FBS_FINANC_PLAN_DETAIL.DRAWING_AMT is '提用金额';
comment on column FBS_FINANC_PLAN_DETAIL.REVERT_AMT is '归还金额';
comment on column FBS_FINANC_PLAN_DETAIL.END_AMT is '期末余额';
comment on column FBS_FINANC_PLAN_DETAIL.RMK is '备注';
comment on column FBS_FINANC_PLAN_DETAIL.ORDER_NO is '顺序号';
comment on column FBS_FINANC_PLAN_DETAIL.USURER_INOUT is '贷款机构境内外';
comment on column FBS_FINANC_PLAN_DETAIL.HEAD_BANK is '总行';
comment on column FBS_FINANC_PLAN_DETAIL.SUB_BANK is '支行';
comment on column FBS_FINANC_PLAN_DETAIL.GUARANTOR is '抵押担保人';
comment on column FBS_FINANC_PLAN_DETAIL.GUARANT_CONTRACT is '担保合同';
comment on column FBS_FINANC_PLAN_DETAIL.BELONG_SUB_COP is '所属二级公司';
comment on column FBS_FINANC_PLAN_DETAIL.TF_TYPE is '贸易融资品种';
comment on column FBS_FINANC_PLAN_DETAIL.TF_DETAIL is '贸易融资明细';



---菜单列表 
declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '融资计划编制' and sys_code = 'fbs'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '融资计划编制', 'fbs', (select res_code from bt_sys_res  where res_name = '预算上报' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toFillInList', '0', '1', '0', '0', 10, '融资计划编制', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '融资计划上报' and sys_code = 'fbs'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '融资计划上报', 'fbs', (select res_code from bt_sys_res  where res_name = '预算上报' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toReportToLeaderList', '0', '1', '0', '0', 11, '融资计划上报', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '融资计划汇总' and sys_code = 'fbs'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '融资计划汇总', 'fbs', (select res_code from bt_sys_res  where res_name = '预算上报' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toGatherList', '0', '1', '0', '0', 12, '融资计划汇总', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/


commit;


alter table FBS_FINANC_PLAN_DETAIL modify RMK VARCHAR2(400);





