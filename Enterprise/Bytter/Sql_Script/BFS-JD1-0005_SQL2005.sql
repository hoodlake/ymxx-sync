--�޸����ڣ�2012-12-18
--�޸��ˣ�¬����
--�޸����ݣ��ֻ����ſ�����ز˵�
--�޸�ԭ��BFS-JD1-0005

--�����˵�����ҳ >> ����ƽ̨ >> �ֻ�����ƽ̨��������ά��
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '�ֻ�����ƽ̨��������ά��', 'adm', 0, '', '0', '1', '0', '0', 1, '�ֻ�����ƽ̨��������ά��', '', '', '', '', '', null, null, null, null, null, 1, '' from BT_SYS_RES ;

--�����˵�����ҳ >> ����ƽ̨ >> �ֻ�����ƽ̨��������ά��>> ��������
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '��������', 'adm', RES_CODE, '/admin/mesOpenAction.do?method=queryMesOpen', '0', '1', '0', '0', 10, '��������', '', '', '', '', '', null, null, null, null, null, 2, '' from bt_sys_res where sys_code = 'adm' and RES_NAME = '�ֻ�����ƽ̨��������ά��' ;

go

--�޸����ڣ�2012-12-19
--�޸��ˣ�¬����
--�޸����ݣ���Ӷ��ſ�����Ϣ��
--�޸�ԭ��BFS-JD1-0005
create table BT_MESSAGE_OPEN  (
   ID                   NUMERIC                          not null,
   USER_CODE            CHAR(4),
   USER_NAME            VARCHAR(80),
   PHONE_NUMBER         VARCHAR(20),
   IS_ENABLE            NUMERIC(2),
   OPEN_DATE            DATETIME,
   OPEN_TYPE            VARCHAR(32),
   OPEN_NAME            VARCHAR(64),
   NOTICE_CONTENT       VARCHAR(512),
   NOTICE_TYPE          VARCHAR(64),
   TARGET_BUSINESS      VARCHAR(512),
   constraint PK_BT_MESSAGE_OPEN primary key (ID)
);

comment on table BT_MESSAGE_OPEN is
'���ſ�����Ϣ��';

go