--ɾ�������������Ĵ���̨�˲˵�
delete from bt_sys_res where RES_NAME='����̨��' and sys_code='cms' and father_code=(select res_code from bt_sys_res where RES_NAME='�������' and sys_code='cms');
commit;