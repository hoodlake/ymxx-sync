--修改日期：20121225
--修改人：费滔
--需求编号：VP7610 代发工资支持跨行
--修改内容：增加联行号、省市、开户名，以便支持跨行代发工资。


-- Add/modify columns 
alter table Nis_Wage_Detail add PROV varchar2(32);
alter table Nis_Wage_Detail add CITY varchar2(32);
alter table Nis_Wage_Detail add AREA_SIGN CHAR(1);
alter table Nis_Wage_Detail add DIF_BANK CHAR(1);
alter table NIS_WAGE_DETAIL add CORRESPONDENT_Code varchar2(20);
alter table nis_wage_detail add PAY_INFO_ID number;
alter table NIS_WAGE_DETAIL add PAYEE_BANK_NAME varchar2(100);
-- Add comments to the columns 
comment on column Nis_Wage_Detail.PROV
  is '省';
comment on column Nis_Wage_Detail.CITY
  is '市';
comment on column Nis_Wage_Detail.AREA_SIGN
  is '同城标识 0同城,异地';
comment on column Nis_Wage_Detail.DIF_BANK
  is '同行标识 0同行,1它行';
comment on column NIS_WAGE_DETAIL.CORRESPONDENT_Code
is '联行号';
comment on column nis_wage_detail.PAY_INFO_ID
  is 'erp_pay_info表的pay_info_id';
comment on column NIS_WAGE_DETAIL.PAYEE_BANK_NAME 
  is '银行名称';



-- Add/modify columns 
alter table NIS_WAGE add PAY_INFO_ID number;
-- Add comments to the columns 
comment on column NIS_WAGE.PAY_INFO_ID
  is 'erp_pay_info表的pay_info_id';
