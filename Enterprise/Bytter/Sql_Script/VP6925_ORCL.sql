--�޸����ڣ�20121030
--�޸��ˣ�  �ന��
--��������ʵʱ����ѯ�˵�
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL,RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '����ʵʱ���', 'fqs', (select res_code from bt_sys_res  where res_name='�������ݱ���' and sys_code='fqs' and res_level=1), '/aqs/bankAccRTBal.do?method=toQuery', '0', '1', '0', '0', 1, '', 2,'');
commit;