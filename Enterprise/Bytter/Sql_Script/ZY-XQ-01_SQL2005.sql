
--�޸�ʱ��2012-11-09
--�޸��� andyhuang
--�޸�����  �˺Ź���-�����ʽ��ϱ�
-- Create table 
create table BT_REDUNDANCY_MONEY
(
  ID             numeric not null,
  CORP_ID        numeric,
  R_MONEY        numeric(18,2),
  CUR_CODE       CHAR(2) not null,
  PERIOD         numeric(10),
  CAPITAL_COST   numeric(8,2),
  EFFECTIVI_DATE DATETIME,
  OP_DATE        DATETIME,
  OP_NAME        VARCHAR(40),
  OP_CODE        VARCHAR(40),
  APPROVES       VARCHAR(300),
  STATUS         numeric(10),
  NEXTCHECKER    VARCHAR(40),
  UPDATE_TIME    VARCHAR(20),
  UPDATE_NAME    VARCHAR(40),
  UPDATE_CODE    VARCHAR(40),
  RMK            VARCHAR(500),
  ACC_NO         VARCHAR(20),
  BILL_MONEY     numeric(18,2)
);

declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_approve_business where BUSINESS_CODE = 'redundancyapp';
if (@VN_COUNT = 0 ) 
begin  
 insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
      select 'redundancyapp', 'bankacc', '�����ʽ��ϱ�', 'A,B,C', 'BT_REDUNDANCY_MONEY', '', 'bill_money', '', 'nextchecker', 'acc_no', '../bankacc/redundancycheck.jsp', '', '', '', '', 'com.bettersoft.bankacc.form.RedundancyForm', '', '', '', '', '', null, null, null, null, null, ''
end;
end;

go 

declare
@VN_COUNT decimal,
@VN_PARENT_CODE decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '�����ʽ����' and sys_code = 'bankacc';
if (@VN_COUNT = 0 ) 
begin  
 select @VN_PARENT_CODE=max(res_code)+1 from bt_sys_res;
 insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS,
 RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      select (@VN_PARENT_CODE), '�����ʽ����', 'bankacc', 0, '/cms/PLoanRepayPreview.jsp?prview_type=6', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 1, ''
end;
end;

go 


declare
@VN_COUNT decimal,
@VN_PARENT_CODE decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '�����ʽ��ϱ�' and sys_code = 'bankacc';
if (@VN_COUNT = 0 ) 
begin  
 select @VN_PARENT_CODE=RES_CODE from bt_sys_res where res_name = '�����ʽ����' and sys_code = 'bankacc' and res_level = 1;
 insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS,
 RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      select ( select max(res_code)+1 from bt_sys_res ), '�����ʽ��ϱ�', 'bankacc', @VN_PARENT_CODE, '/newBankacc/redundancyAction.do?method=search', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, ''
end;
end;

go 


declare
@VN_COUNT decimal,
@VN_PARENT_CODE decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '�����ʽ�ɱ���¼' and sys_code = 'bankacc';
if (@VN_COUNT = 0 ) 
begin  
 select @VN_PARENT_CODE=RES_CODE from bt_sys_res where res_name = '�����ʽ����' and sys_code = 'bankacc' and res_level = 1;
 insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS,
 RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      select ( select max(res_code)+1 from bt_sys_res ), '�����ʽ�ɱ���¼', 'bankacc', @VN_PARENT_CODE, '/newBankacc/redundancyAction.do?method=redundancyClose', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, ''
end;
end;

go 


declare
@VN_COUNT decimal,
@VN_PARENT_CODE decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '�����ʽ��ѯ' and sys_code = 'bankacc';
if (@VN_COUNT = 0 ) 
begin  
 select @VN_PARENT_CODE=RES_CODE from bt_sys_res where res_name = '�����ʽ����' and sys_code = 'bankacc' and res_level = 1;
 insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS,
 RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      select ( select max(res_code)+1 from bt_sys_res ), '�����ʽ��ѯ', 'bankacc', @VN_PARENT_CODE, '/newBankacc/redundancyAction.do?method=queryAllRedundancy', '', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, ''
end;
end;

go 