
--�޸���:���¾�
--�޸�ʱ��:2012-10-15
--�޸�����:�ʽ����,ͷ�������Ӹ���
create table NIS_ALLOCATION_ATTACH
(
  ID          numeric(10) primary key,
  FILE_PATH   VARCHAR(511),
  FILE_NAME   VARCHAR(200),
  FILE_TYPE   numeric(2),
  FILE_DESC   VARCHAR(511),
  TARGET_ID   VARCHAR(100),
  CREATE_DATE DATETIME,
  CREATE_USER numeric(20)
)

GO

