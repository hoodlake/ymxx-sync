--新建表 CMS_PRECATIVE_LOAN_CCAL 借款发放表
--andy.huang
-- Create table
create table CMS_PROVIDE_LOAN_SEND
(
  bill_code                VARCHAR(13) not null,
  father_code              VARCHAR(13),
  contract_code            VARCHAR(50),
  money                    numeric(15,2) not null,
  send_date                DATETIME not null,
  deadline_date            DATETIME not null,
  repay_type               CHAR(2) not null,
  surety_explain           VARCHAR(200),
  repair_op                VARCHAR(8),
  op                       VARCHAR(8) not null,
  pl_rate                  numeric(8,6),
  deferred_rate            numeric(8,6),
  overdue_rate             numeric(8,6),
  nextchecker              VARCHAR(150),
  approves                 VARCHAR(200),
  status                   numeric,
  enter_date               DATETIME,
  acc_code                 VARCHAR(50),
  voucher_no               CHAR(15),
  rmk                      VARCHAR(400),
  order_no                 CHAR(18),
  tallier_code             VARCHAR(8),
  float_way                VARCHAR(15),
  rate_entries_effect_date DATETIME,
  interest_way             VARCHAR(15),
  reference_rate_type      VARCHAR(50),
  repay_cycle              VARCHAR(50),
  points_proportion_select VARCHAR(50),
  points_proportion_text   numeric(15,2),
  corp_id                  numeric(15),
  pl_term                  numeric default 0 not null,
  cur_code                 CHAR(2),
  loan_send_out_type       VARCHAR(1),
  is_skip_process          VARCHAR(1),
  send_times               numeric default 0
);


-- Create/Recreate primary, unique and foreign key constraints 
alter table CMS_PROVIDE_LOAN_SEND
  add constraint PK_CMS_PROVIDE_LOAN_SEND primary key (BILL_CODE);
  
-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add loan_send_out_type VARCHAR(1);

 -- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add is_skip_process VARCHAR(1);

  
  
  


declare
@VN_COUNT decimal

begin 
select @VN_COUNT = count(*) from bt_approve_business where BUSINESS_CODE = 'proloansend';
if (@VN_COUNT = 0 ) 
begin  
   insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
      select 'proloansend', 'cms', '借款发放', 'A,B,C', 'CMS_PROVIDE_LOAN_SEND', '', 'money', '', 'nextchecker', 'bill_code', '../cms/provideloansendcheck.jsp', '', '', '', '', 'com.byttersoft.cms.form.ProvideLoanSendForm', '', '', '', '', '', null, null, null, null, null, ''
end;
end;

go 

declare
@VN_COUNT decimal,
@v_parent_code decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where RES_NAME = '借款发放' and SYS_CODE='cms' and res_level=2;

if (@VN_COUNT = 0 ) 
begin  
	select @v_parent_code = RES_CODE from bt_sys_res where RES_NAME = '借款管理' and SYS_CODE='cms' and res_level=1;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      select (select max(RES_CODE)+1 from bt_sys_res), '借款发放', 'cms', @v_parent_code, '/cms/provideLoanSend.do?method=toCorpList', '0', '0', null, '0', 4, null, null, null, null, null, null, null, null, null, null, null, 2, null
end;
end;

go 

-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_REPAY add send_code VARCHAR(20);