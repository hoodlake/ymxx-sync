-----------�˵�ά��------------------------------------------------
--���ڣ�2012-09-20 
--�޸��ˣ������
--�޸����ݣ��л�����˾����ӿ�
--�����˵�

---����Ƿ��Ѷ���ʶ
alter table fc_accbook add is_read VARCHAR2(20);
alter table fc_accbook_dtl add is_read VARCHAR2(20);
alter table fc_accbook_blned add is_read VARCHAR2(20);
alter table fc_accbook_blned_dtl add is_read VARCHAR2(20);

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ((select max(RES_CODE)+1 from bt_sys_res), '�ֶ�����', 'exchange', (select res_code from bt_sys_res where res_name='��������' and sys_code='exchange'), '/dataExchange/IntrErpBasicDate.jsp', '0', '1', '0', '0', 1, '�ֶ�����', '', '', '', '', '', null, null, null, null, null);


insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ((select max(RES_CODE)+1 from bt_sys_res), '���м���ֶ������������', 'exchange', (select res_code from bt_sys_res where res_name='��������' and sys_code='exchange'), '/dataExchange/IntrErpBasicDateToMid.jsp', '0', '1', '0', '0', 1, '���м���ֶ������������', '', '', '', '', '', null, null, null, null, null);
commit;