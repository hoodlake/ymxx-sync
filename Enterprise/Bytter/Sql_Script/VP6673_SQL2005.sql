
--�޸���:���¾�
--�޸�ʱ��:2012-09-27 09:21:33
--����û���ֵ����������
create table BT_USER_RESTPWD_AP
(
  ID                NUMERIC(10) primary key ,
  APP_USER_CODE     VARCHAR(20),
  TAG_USER_CODE     VARCHAR(20),
  APPROVE_USER_CODE VARCHAR(20),
  APP_DATE          datetime,
  STATUS            NUMERIC(2)
);



