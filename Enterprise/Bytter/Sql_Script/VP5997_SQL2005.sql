--�޸����ڣ�2012.8.14
--�޸��ˣ�����
--�޸����ݣ�erp�ӿ�ҵ���͸���������ֶ�allow_edit_paymoney
--�޸�ԭ��VP����5997���ڿ�ʿ��2012062901---��ERPת�ƹ����ĸ�����Ϣ�����޸�

--�������Ƿ���Ա༭ 0�����ɱ༭��1���ɱ༭�� Ĭ��Ϊ0
alter table erp_pay_info add allow_edit_paymoney char(1) default '0';

--�������Ƿ���Ա༭ 0�����ɱ༭��1���ɱ༭�� Ĭ��Ϊ0
alter table nis_billhead add allow_edit_paymoney char(1);

--�ֶγ���̫�̣��޸�Ϊ100���ַ�
alter table erp_pay_info alter column bank_name varchar(100);
