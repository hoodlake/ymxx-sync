--�޸����ڣ�2012.01.06
--�޸��ˣ���ѧ��
--�޸����ݣ��޸��ۺϲ�ѯ-�Ŵ����������ܱ��ʹ�����ܱ�����
--�޸�ԭ���ۺϲ�ѯ���Ŵ������еĲ�ѯ��ͳһ
update bt_sys_res t set t.res_url='/aqs/LoanBalanceCollect.jsp?isLoan=false' where t.res_name='�����ܱ�' and t.sys_code='fqs';
update bt_sys_res t set t.res_url='/aqs/LoanBalanceCollect.jsp?isLoan=true' where t.res_name='������ܱ�' and t.sys_code='fqs';
commit;