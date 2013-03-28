



--修改日期：2012.11.09
--修改人：蒲勇军
--修改内容：中远,融资计划

IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FBS_FINANC_PLAN')
                  AND   TYPE = 'U')
create table FBS_FINANC_PLAN 
(
   ID                   DECIMAL(10) PRIMARY KEY ,
   PLAN_CODE            VARCHAR(50),
   PLAN_NAME            VARCHAR(200),
   PLAN_YEAR            VARCHAR(4),
   PLAN_TYPE            VARCHAR(4),
   PLAN_STATUS          DECIMAL(2),
   GATHER_ID            DECIMAL(10),
   IS_GATHER            DECIMAL(2),
   CORP_CODE            VARCHAR(4),
   UNIT                 VARCHAR(4)
)
GO

IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FBS_FINANC_PLAN_DETAIL')
                  AND   TYPE = 'U')
create table FBS_FINANC_PLAN_DETAIL 
(
   ID                   DECIMAL,
   PROJECT_NAME         VARCHAR(200),
   PROJECT_CODE         VARCHAR(500),
   CUR_CODE             VARCHAR(4),
   BORROWER             VARCHAR(200),
   CONSIGNER            VARCHAR(200),
   USURER               VARCHAR(200),
   CONTRACT_NO          VARCHAR(50),
   RATE                 DECIMAL(10,6),
   START_DATE           DATETIME,
   END_DATE             DATETIME,
   LOAN_NATURE          VARCHAR(50),
   CONTRACT_AMT         DECIMAL(15,2),
   START_AMT            DECIMAL(15,2),
   DRAWING_AMT          DECIMAL(15,2),
   REVERT_AMT           DECIMAL(15,2),
   END_AMT              DECIMAL(15,2),
   RMK                  VARCHAR(200),
   ORDER_NO             DECIMAL(3),
   FFP_ID               DECIMAL(10),
   USURER_INOUT         VARCHAR(50),
   HEAD_BANK            VARCHAR(200),
   SUB_BANK             VARCHAR(200),
   GUARANTOR            VARCHAR(200),
   GUARANT_CONTRACT     VARCHAR(50),
   BELONG_SUB_COP       VARCHAR(200),
   TF_TYPE              VARCHAR(50),
   TF_DETAIL            VARCHAR(50)
)
GO


---菜单列表 
declare 
@exist_num  decimal(2) ;
begin 
  select @exist_num = count(*)  from  bt_sys_res where res_name = '融资计划编制' and sys_code = 'fbs'  ; 
  if(@exist_num < 1) 
    begin  
		insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
		select ((select max(res_code) + 1 from bt_sys_res )), '融资计划编制', 'fbs', (select res_code from bt_sys_res  where res_name = '预算上报' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toFillInList', '0', '1', '0', '0', 10, '融资计划编制', '', '', '', '', '', null, null, null, null, null, 2, '';
    end ;
end ;
go 

declare 
@exist_num  decimal(2) ;
begin 
  select @exist_num = count(*)  from  bt_sys_res where res_name = '融资计划上报' and sys_code = 'fbs'  ; 
  if(@exist_num < 1) 
    begin  
		insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
		select ((select max(res_code) + 1 from bt_sys_res )), '融资计划上报', 'fbs', (select res_code from bt_sys_res  where res_name = '预算上报' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toReportToLeaderList', '0', '1', '0', '0', 11, '融资计划上报', '', '', '', '', '', null, null, null, null, null, 2, '';
    end ;
end ;
go 

declare 
@exist_num  decimal(2) ;
begin 
  select @exist_num = count(*)  from  bt_sys_res where res_name = '融资计划汇总' and sys_code = 'fbs'  ; 
  if(@exist_num < 1) 
    begin  
		insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
		select ((select max(res_code) + 1 from bt_sys_res )), '融资计划汇总', 'fbs', (select res_code from bt_sys_res  where res_name = '预算上报' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toGatherList', '0', '1', '0', '0', 12, '融资计划汇总', '', '', '', '', '', null, null, null, null, null, 2, '';
    end ;
end ;
go 

alter table FBS_FINANC_PLAN_DETAIL ALTER COLUMN RMK VARCHAR(400);



