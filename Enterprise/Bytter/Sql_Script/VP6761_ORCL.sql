
--�޸���:���¾�
--�޸�ʱ��:2012-10-15
--�޸�����:�ʽ����,ͷ�������Ӹ���
create table NIS_ALLOCATION_ATTACH
(
  ID          NUMBER(10) primary key,
  FILE_PATH   VARCHAR2(511),
  FILE_NAME   VARCHAR2(200),
  FILE_TYPE   NUMBER(2),
  FILE_DESC   VARCHAR2(511),
  TARGET_ID   VARCHAR2(100),
  CREATE_DATE DATE,
  CREATE_USER VARCHAR2(20)
);
-- Add comments to the columns 
comment on column NIS_ALLOCATION_ATTACH.FILE_PATH
  is '�ļ��洢·��';
comment on column NIS_ALLOCATION_ATTACH.FILE_NAME
  is '�ļ�����';
comment on column NIS_ALLOCATION_ATTACH.FILE_TYPE
  is '�ļ�����: 1,ͷ�����';
comment on column NIS_ALLOCATION_ATTACH.FILE_DESC
  is '�ļ�����';
comment on column NIS_ALLOCATION_ATTACH.TARGET_ID
  is '�ļ�Ŀ��ID';
  
commit;

