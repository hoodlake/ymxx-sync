--�޸�ʱ��2012-12-05
--�޸��� ���販
--�޸�����  �жһ�Ʊ ���� ʵ�����͵��ֶΣ��Լ�ϵͳ����

--�Կ�Ʊ�ݱ�������ʵ�����͡��ֶ�
alter table AB_EMIT add PRACTICE_TYPE varchar(30);
--�Կ�Ʊ�ݱ�������ʵ����λ���ֶ�
alter table AB_EMIT add PAYMENT_CORP varchar(200);
--�Կ�Ʊ�ݱ��������ͻ��ѿ�Ʊ���ֶ�
alter table AB_EMIT add REMIT numeric(18,2);
--�Կ�Ʊ�ݱ��������ͻ�Ӧ����ֶ�
alter table AB_EMIT add REPAYMENT numeric(18,2);
--�Կ�Ʊ�ݱ��������Ӽ������ֶ�
alter table AB_EMIT add INCREASE_PROFIT numeric(18,2);
--�Կ�Ʊ�ݱ���������ȡ����ѡ��ֶ�
alter table AB_EMIT add SERVICE_CHARGE numeric(18,2);




declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_param where sys_code='ads' and code='practice_type';
if (@VN_COUNT = 0 ) 
begin  
  insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
   values ('practice_type','ads','ʵ������',null,null,null,0,'ʵ������','˵�������ʵ��������Ӣ�ķֺŷָ�',null,null,null,null,0,10,null,null,null);
end;
end;
go 
