--�޸���:���¾�
--�޸�ʱ��:2012-09-11
--�޸�����:-���������������Ԥ���Ŀ����
alter table bt_payment_param add item_code varchar(100)
GO
--���²˵�·��
update bt_sys_res set res_name='���ʽ����' where sys_code='adm' and res_name='������˲���'
GO

