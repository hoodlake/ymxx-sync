--�޸����ڣ�2012-12-18
--�޸��ˣ�¬����
--�޸����ݣ��ֻ�������ز˵�
--�޸�ԭ��BFS-JD1-0006

--�����˵�����ҳ >> ����ƽ̨ >> �ֻ�����ƽ̨��������ά��>> ����������Ϣ����
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '����������Ϣ����', 'adm', RES_CODE, '/admin/mesAction.do?method=queryMesRemindRules', '0', '1', '0', '0', 10, '����������Ϣ����', '', '', '', '', '', null, null, null, null, null, 2, '' from bt_sys_res where sys_code = 'adm' and RES_NAME = '�ֻ�����ƽ̨��������ά��';

--�����˵�����ҳ >> ����ƽ̨ >> �ֻ�����ƽ̨��������ά��>> ���ŷ��͹�������
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '���ŷ��͹�������', 'adm', RES_CODE, '/admin/mesAction.do?method=queryMesSendRules', '0', '1', '0', '0', 10, '���ŷ��͹�������', '', '', '', '', '', null, null, null, null, null, 2, '' from bt_sys_res where sys_code = 'adm' and RES_NAME = '�ֻ�����ƽ̨��������ά��';

--�����˵�����ҳ >> ����ƽ̨ >> �ֻ����ŷ�����Ϣ����
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '�ֻ����ŷ�����Ϣ����', 'sms', RES_CODE, '/sms/mesTrackAction.do?method=listMesTrack', '', '0', '', '0', 5, '�ֻ����ŷ�����Ϣ����', '', '', '', '', '', null, null, null, null, null, 2, '' from bt_sys_res where sys_code = 'sms' and RES_NAME = '����ƽ̨';

go

--�޸����ڣ�2012-12-18
--�޸��ˣ�¬����
--�޸����ݣ����ϵͳ����
--�޸�ԭ��BFS-JD1-0006

--������������
insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
select 20, 'sms', '20', '������������', 10, '������������', '����һ�ʸ������룬�����ʺ�${payerAccount}�տ��ʺ�${payeeAccount}����${money}Ԫ��', '', '', '2', '1', to_date('05-12-2012', 'dd-mm-yyyy'), null;

--����ɹ�����
insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
select 21, 'sms', '21', '����ɹ�����', 10, '����ɹ�����', '����һ�����н��׳ɹ����������ͣ�${payType}  �����ʺţ�${payerAccount} �տ��ʺţ�${payeeAccount} ��${money}Ԫ��', '', '', '2', '1', to_date('05-12-2012', 'dd-mm-yyyy'), null;

--�����˻����
insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
select 22, 'sms', '22', '�����˻����', 10, '�����˻����', '�˻�${account}�������У�${bankType}����ǰ��10000.00Ԫ��', '', '', '2', '1', to_date('05-12-2012', 'dd-mm-yyyy'), null;

go