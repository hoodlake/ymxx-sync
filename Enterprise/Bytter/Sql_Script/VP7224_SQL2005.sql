--�޸����ڣ�2012.11.29
--�޸��ˣ�����
--�޸����ݣ�erp�ӿ�ҵ���͸���������ֶ�allow_edit_paytype
--�޸�ԭ��VP����[VP7224]�޸�¼�뵥���޷��༭OA���ݵ��ʽ�ϵͳ���ݵĸ��ʽ����

--���ʽ�Ƿ���Ա༭ 0�����ɱ༭��1���ɱ༭�� Ĭ��Ϊ0
alter table erp_pay_info add allow_edit_paytype char(1) default '0';

--���ʽ�Ƿ���Ա༭ 0�����ɱ༭��1���ɱ༭�� Ĭ��Ϊ0
alter table nis_billhead add allow_edit_paytype char(1);

go