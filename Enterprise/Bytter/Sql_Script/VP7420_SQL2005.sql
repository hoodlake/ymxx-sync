--�޸����ڣ�2012.12.21
--�޸��ˣ���֮��
--�޸����ݣ��ʽ�Ԥ���˵��޸�
--�޸�ԭ���ʽ�Ԥ���˵��޸�
 
delete from bt_sys_res where RES_NAME='����Ԥ������ά��' and sys_code='fwg' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='����ά��' and sys_code='fwg')
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), 'Ԥ������ά��', 'fwg', (select res_code from bt_sys_res where res_name='����ά��' and sys_code='fwg'), '/fundwarning/strategyAction.do', '0', '0', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='����Ԥ�����Բ�ѯ' and sys_code='fwg' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='����ά��' and sys_code='fwg')
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), 'Ԥ�����Բ�ѯ', 'fwg', (select res_code from bt_sys_res where res_name='����ά��' and sys_code='fwg'), '/fundwarning/strategyAction.do?param=search', '0', '0', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
