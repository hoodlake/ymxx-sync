--�޸����ڣ�20120822
--�޸��ˣ���̺�
--�޸����ݣ�XD-JD03-021 ϵͳ����-����֪ͨ��ӡ
--�޸����ݣ��޸ĵ������Ѳ�ѯ
--�������ã�
update bt_sys_res
   set res_url = '/cms/AllMatureQuery.jsp'
 where res_name = '�������Ѳ�ѯ'
   and sys_code = 'cms'
go

--�޸����ڣ�20120822
--�޸��ˣ���̺�
--�޸����ݣ����Ӵ߿�֪ͨ��ӡ���ò˵�
--�������ã�
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
select
  (select max(res_code) + 1 from bt_sys_res),
   '�߿�֪ͨ��ӡ����',
   'cms',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'cms'
       AND RES_NAME = '��ѯ'),
   '/cms/dunningNotices.jsp',
   '0',
   '0',
   '0',
   '0',
   13,
   '�߿�֪ͨ��ӡ����',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2,
   ''
go

--�޸����ڣ�20120822
--�޸��ˣ���̺�
--�޸����ݣ��߿�֪ͨ��ӡ�������ݱ����
--�������ã�
create table cms_dunningNotices (
       noticeType      varchar(12)       not null,  --�߿�����
       noticeTitle     varchar(100)              ,--�߿����
       noticeContent   varchar(500)             ,--�߿�����
       noticeFoot      varchar(100)             ,--�߿��β
       rmk             varchar(100)             ,--��ע
        constraint PK_cms_dunningNotices primary key (noticeType)
)
go

--�޸����ڣ�20120822
--�޸��ˣ���̺�
--�޸����ݣ���ʼ���߿�֪ͨ��ӡ�������ݱ��������
--�������ã�
insert into cms_dunningNotices
  (noticeType, noticeTitle, noticeContent, noticeFoot, rmk)
values
  ('unexpired',
   '����֪ͨ',
   '          �㵥λ��#dkrq#�����#dkbb# #jkje#Ԫ (��ͬ�ţ�#htbh# �˺ţ�#dkzh# ���ʣ�#dkll#  )������#dkzqdqr#���ڣ�����#whje# Ԫ��ĩ�黹����������˾��ʱ�黹�������Ϣ������������ع涨����',
   '',
   'δ���ڴ߿�֪ͨ')
insert into cms_dunningNotices
  (noticeType, noticeTitle, noticeContent, noticeFoot, rmk)
values
  ('overdue',
   '���ڵ��������֪ͨ',
   '          �㵥λ��#dkrq#�����#dkbb# #jkje#Ԫ (��ͬ�ţ�#htbh# �˺ţ�#dkzh# ���ʣ�#dkll#  )������#dkzqdqr#���ڣ�����#whje# Ԫ��ĩ�黹����������˾��ʱ�黹�������Ϣ������������ع涨����',
   '',
   '�����ڴ߿�֪ͨ')
go


--�޸����ڣ�20120822
--�޸��ˣ���̺�
--�޸����ݣ�������̨������Ϣ
--�������ã�
insert into sys_subscribe_rules (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (18, 'cms', '18', '��ҵ����/��������', 10, '��ҵ����/��������', '����${count}����ҵ����/���ڣ�', '', '', '2', '1', '2010-08-03', null)
go