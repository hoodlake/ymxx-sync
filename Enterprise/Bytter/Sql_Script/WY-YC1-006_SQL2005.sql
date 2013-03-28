--修改日期：20121121
--修改人：费涛
--修改内容：新增代发工资历史表
--修改原因：新增代发工资历史表

drop table NIS_WAGE_HIS;
drop table NIS_WAGE_DETAIL_HIS;
create table NIS_WAGE_HIS
(
  NIS_WAGE_HIS_ID  CHAR(12) not null,
  wage_no        CHAR(12) not null,
  wage_title     VARCHAR(100),
  corp_code      VARCHAR(20),
  payer_acc      VARCHAR(30),
  payer_bank     VARCHAR(100),
  bank_type      CHAR(4),
  wages          numeric(15,2),
  wageday        DATEtime,
  wish_payday    DATEtime,
  status         int,
  voucher_stat   CHAR(1),
  billcode       VARCHAR(16),
  op             VARCHAR(30),
  enter_date     DATEtime default getdate(),
  optime         datetime,
  op_name        VARCHAR(30),
  checkers       VARCHAR(150),
  super_checkers VARCHAR(150),
  approves       VARCHAR(150),
  nextchecker    VARCHAR(150),
  SERIAL_NO_ERP varchar(32),
  zflag_type char(2),
  zflag_reson varchar(240),
  ISFROMERP varchar(1)
);
alter table NIS_WAGE_HIS
  add constraint PK_NIS_WAGE_HIS primary key (NIS_WAGE_HIS_ID); 



--修改日期：20121121
--修改人：费涛
--修改内容：新增代发工资历史明细表
--修改原因：新增代发工资历史明细表
create table NIS_WAGE_DETAIL_HIS
(
  wage_dtl_no_id  CHAR(10) not null,
  wage_dtl_no  CHAR(10) not null,
  NIS_WAGE_HIS_ID char(12),
  user_name    VARCHAR(50),
  empno        VARCHAR(50),
  bank_acc     VARCHAR(30),
  bank_type    CHAR(4),
  wages        NUMeric(15,2),
  wage_no      CHAR(12),
  bill_no      CHAR(12),
  status       int,
  voucher_stat CHAR(1),
  purpose      VARCHAR(10),
  rmk          VARCHAR(100),
  verify       VARCHAR(32),
  voucher_no   VARCHAR(12),
  return_msg   varchar(150),
  optime       datetime,
  reverse1     VARCHAR(100),
  reverse2     VARCHAR(100),
  reverse3     VARCHAR(100),
  reverse4     VARCHAR(100),  
  reverse5     VARCHAR(100),
  SERIAL_NO_ERP varchar(32),
  zflag_type char(2),
  zflag_reson varchar(240),
  ISFROMERP varchar(1)
);
alter table NIS_WAGE_DETAIL_HIS
  add constraint PK_NIS_WAGE_DETAIL_HIS primary key (wage_dtl_no_id);




--修改日期：20121121
--修改人：费涛
--修改内容：修改代发工资主表
--修改原因：修改代发工资主表
ALTER TABLE nis_wage ADD ISFROMERP varchar(1);    
ALTER TABLE nis_wage ADD zflag_type char(2); 
ALTER TABLE nis_wage ADD zflag_reson varchar(240); 
ALTER TABLE nis_wage ADD SERIAL_NO_ERP varchar(32);
ALTER TABLE nis_wage ADD allow_edit_paymoney char(1) default '0'; 
ALTER TABLE nis_wage ADD allow_edit_payeracc char(1) default '1';
ALTER TABLE nis_wage ADD allow_edit_payeeacc char(1) default '0';
ALTER TABLE nis_wage ADD isforindividual char(1) default '1'; 


--修改日期：20121121
--修改人：费涛
--修改内容：修改代发工资明细表
--修改原因：修改代发工资明细表

ALTER TABLE nis_wage_detail ADD zflag_type char(2); 
ALTER TABLE nis_wage_detail ADD zflag_reson varchar(240); 
ALTER TABLE nis_wage_detail ADD SERIAL_NO_ERP varchar(32); 





declare 
@exist_num  decimal(2) ;
begin 
select @exist_num = count(*)  from  bt_sys_res where res_name = '代发工资付款查询' and sys_code = 'nis'  ; 
if(@exist_num < 1) 
begin  
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code)+1 from bt_sys_res ), '代发工资付款查询', 'nis', (select res_code from bt_sys_res  where res_name = '代发工资' and sys_code = 'nis' ), '/netbank/allWageQueryList.jsp', '0', '1', '0', '0', 4, '代发工资付款查询', '', '', '', '', '', null, null, null, null, null, 2, '' 
commit 
end ;
end ;

go
