--�޸����ڣ�20121225
--�޸��ˣ�����
--�����ţ�VP7610 ��������֧�ֿ���
--�޸����ݣ��������кš�ʡ�С����������Ա�֧�ֿ��д������ʡ�


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

