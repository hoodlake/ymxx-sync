--�޸�ʱ��2012-12-10
--�޸��� ����
--�޸�����  20121130��ԭ��ý��������Ϣ����ʾ��־Ҳ����ʾ����
update bt_param set param_value1=rtrim(ltrim(param_value1)) where sys_code='nis' and code='budgetsel';
update bt_param set reverse1='0,����Ԥ��;1,��Ԥ��' where  sys_code='nis' and code='budgetsel';
go
