--�޸����ڣ�2012.11.5
--�޸��ˣ�����
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����
--������������ģʽ
--alter table ab_operation add ratmodel char(1);
alter table gua_guarantee_info add ratmodel char(1);
alter table lc_enrol add ratmodel char(1);
alter table cms_provide_loan_info add ratmodel char(1);


--�����������������������õ�ҵ��
update bt_approve_business
       set table_field = 'ratmodel,��������'
     where business_code = 'ads_7'
        or business_code = 'grt_lg'
        or business_code = 'lcs_input'
     	or business_code = 'cms_B1';
     	
--��������������ṹ����������     	
--drop table AB_OPERATION_CONTROL cascade constraints;
create table AB_OPERATION_CONTROL
(
  VOUCHER_TYPE  VARCHAR(5) not null,
  VOUCHER_NAME  VARCHAR(50),
  VALID_SIGN    CHAR(1),
  BUSINESS_CODE VARCHAR(100)
)



insert into AB_OPERATION_CONTROL (VOUCHER_TYPE, VOUCHER_NAME, VALID_SIGN, BUSINESS_CODE)
values ('0', '�����ܶ������', '1', 'ads_7,grt_lg,lcs_input,cms_B1');
insert into AB_OPERATION_CONTROL (VOUCHER_TYPE, VOUCHER_NAME, VALID_SIGN, BUSINESS_CODE)
values ('1', '��λ��������', '1', 'ads_7,grt_lg,lcs_input,cms_B1');
go
