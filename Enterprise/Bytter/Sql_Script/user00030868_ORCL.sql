--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ����´������ʲ˵���Ӧ·��
--�������ã�
--���ʵ��Ƶ�
update bt_sys_res set res_url='/netbank/allWageList.jsp' where sys_code='nis' and res_name='���������Ƶ�' ;
--���ʵ��޸�
update bt_sys_res set res_url='/netbank/allWageModifyList.jsp' where sys_code='nis' and res_name='���������Ƶ��޸�' ;
--�������ʽ����ѯ
update bt_sys_res set res_url='/netbank/allWageResultList.jsp' where sys_code='nis' and res_name='�������ʽ����ѯ' ;
--�������ʽ���쳣����
update bt_sys_res set res_url='/netbank/allWageExceptionList.jsp' where sys_code='nis' and res_name='�������ʽ���쳣����' ;
--������ϸ�������ֶ�return_msg
alter table nis_wage_detail add return_msg varchar2(150);

commit;
