--�޸���:�����
--�޸�ʱ��:2012-11-07
--�޸�����:��Ӳ˵�

--��Ӳ˵�
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '����֤��֤ͳ��', 'lcs', (select res_code from bt_sys_res where res_name='��֤�Ǽ�' and sys_code='lcs'), '/intersettle/LC_AmendatoryInfo.jsp', '0', '1', '0', '0', 9, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;