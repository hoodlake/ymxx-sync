--�޸��ˣ��´���
--�޸����ڣ�2012-09-03
--�޸�����: ����Ʊ��ҵ���������������Ƿ����ϵͳ������ab_operation ����
--�޸�ԭ��:����AKS-JD03-03
------����Ʊ��ҵ���������������Ƿ����ϵͳ����
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('BBTIS', 'ads', 'Ʊ��ҵ���������������Ƿ����', '0', null, null, '0', '0 ��;1 ��(bill batch transact is summarizing)', '0,��;1,��', '', '', '', '', 1.00, null, null, null, null);
commit;
------��������ƾ֤����ҵ�����ID
alter table ab_operation add( summary_business_group VARCHAR2(20));
commit; 
