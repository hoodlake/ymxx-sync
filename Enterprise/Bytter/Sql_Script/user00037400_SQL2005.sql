--�޸����ڣ�2012.01.06
--�޸��ˣ���ѧ��
--�޸����ݣ��޸��ۺϲ�ѯ-�Ŵ���������ܱ�ʹ�����ܱ�����
--�޸�ԭ���ۺϲ�ѯ���Ŵ������еĲ�ѯ��ͳһ
update bt_sys_res  set res_url='/aqs/LoanBalanceCollect.jsp?isLoan=false' where res_name='�����ܱ�' and sys_code='fqs';
update bt_sys_res  set res_url='/aqs/LoanBalanceCollect.jsp?isLoan=true' where res_name='������ܱ�' and sys_code='fqs';
go