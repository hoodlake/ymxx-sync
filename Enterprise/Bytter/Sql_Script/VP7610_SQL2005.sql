--修改日期：20121225
--修改人：费滔
--需求编号：VP7610 代发工资支持跨行
--修改内容：增加联行号、省市、开户名，以便支持跨行代发工资。


-- Add/modify columns 
alter table Nis_Wage_Detail add PROV varchar(32);
alter table Nis_Wage_Detail add CITY varchar(32);
alter table Nis_Wage_Detail add AREA_SIGN CHAR(1);
alter table Nis_Wage_Detail add DIF_BANK CHAR(1);
alter table NIS_WAGE_DETAIL add CORRESPONDENT_Code varchar(20);
alter table nis_wage_detail add PAY_INFO_ID numeric;
alter table NIS_WAGE_DETAIL add PAYEE_BANK_NAME varchar(100);



-- Add/modify columns 
alter table NIS_WAGE add PAY_INFO_ID numeric;

