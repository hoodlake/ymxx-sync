
--�޸���:���¾�
--�޸�ʱ��:2012-09-27 09:21:33
--����û���ֵ����������

create table BT_USER_RESTPWD_AP
(
  ID                NUMBER(10) primary key ,
  APP_USER_CODE     VARCHAR2(20),
  TAG_USER_CODE     VARCHAR2(20),
  APPROVE_USER_CODE VARCHAR2(20),
  APP_DATE          DATE,
  STATUS            NUMBER(2)
);

comment on column BT_USER_RESTPWD_AP.APP_USER_CODE      is '���ù���Ա';
comment on column BT_USER_RESTPWD_AP.TAG_USER_CODE      is '�������û�';
comment on column BT_USER_RESTPWD_AP.APPROVE_USER_CODE  is '��������Ա';
comment on column BT_USER_RESTPWD_AP.APP_DATE           is '��������';
comment on column BT_USER_RESTPWD_AP.STATUS is '״̬ -1 ���, 0 ������ , 1����ͨ��'; 
