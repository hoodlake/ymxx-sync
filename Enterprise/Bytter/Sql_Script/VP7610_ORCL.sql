--�޸����ڣ�20121225
--�޸��ˣ�����
--�����ţ�VP7610 ��������֧�ֿ���
--�޸����ݣ��������кš�ʡ�С����������Ա�֧�ֿ��д������ʡ�


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
  is 'ʡ';
comment on column Nis_Wage_Detail.CITY
  is '��';
comment on column Nis_Wage_Detail.AREA_SIGN
  is 'ͬ�Ǳ�ʶ 0ͬ��,���';
comment on column Nis_Wage_Detail.DIF_BANK
  is 'ͬ�б�ʶ 0ͬ��,1����';
comment on column NIS_WAGE_DETAIL.CORRESPONDENT_Code
is '���к�';
comment on column nis_wage_detail.PAY_INFO_ID
  is 'erp_pay_info���pay_info_id';
comment on column NIS_WAGE_DETAIL.PAYEE_BANK_NAME 
  is '��������';



-- Add/modify columns 
alter table NIS_WAGE add PAY_INFO_ID number;
-- Add comments to the columns 
comment on column NIS_WAGE.PAY_INFO_ID
  is 'erp_pay_info���pay_info_id';
