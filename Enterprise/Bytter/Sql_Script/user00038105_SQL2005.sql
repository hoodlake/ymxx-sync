--�޸����ڣ�2013.1.21
--�޸��ˣ��ܱ�
--�޸����ݣ�����ƽ̨�µĲ˵�  ��֧����ά��   Ҫ��Ϊ   �˻�����ά��
--�޸�ԭ��Ҫ�뿪���Ǳ߱���һ�µ�����

update bt_sys_res set res_name ='�˻�����ά��' where res_name ='��֧����ά��' and sys_code='adm' and res_url='/admin/accType.do?method=queryAccTypeList';
commit;