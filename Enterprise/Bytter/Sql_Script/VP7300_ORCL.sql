--�޸���:�´���
--�޸�ʱ��:2012-12-27
--�޸�����:�޸�����ͳ�����
--����������ͳ��˵������ BT_APPROVE_BUSINESS �и���sys_code business_code ȷ��ҪҪ����ͳ�Ƶ�����ҵ��
--�����Ҫ����ͳ�ƣ�������������ҵ���ҳ�����BT_APPROVE_BUSINESS ��total_set����ֵ����ֵ��ʾҳ��ͳ���е�
--�б�ʾ����0��ʼ����жҵ���������Ϊ��5��
--�ж�
update BT_APPROVE_BUSINESS set total_set=5 where business_code like 'ads_%';
commit;
----
update BT_APPROVE_BUSINESS set total_set=3 where business_code like 'cms_A1';
commit;

update BT_APPROVE_BUSINESS set total_set=4 where business_code = 'cms_A3';
commit;

