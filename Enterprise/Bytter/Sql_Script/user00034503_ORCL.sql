--�޸�ʱ��2012-11-15
--�޸��� andy.huang
--�޸�����  ������������

--�����˺ű������ֶΡ�ʡ��
alter table bt_bankacc_app add prov varchar2(20);
--�����˺ű������ֶΡ��С�
alter table bt_bankacc_app add city varchar2(20);
--�����˺ű������ֶΡ�ɨ������  0����     1����
alter table bt_bankacc_app add is_householdobject char(1);