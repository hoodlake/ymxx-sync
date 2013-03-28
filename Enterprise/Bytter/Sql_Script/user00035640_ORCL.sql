--�޸�ʱ�䣺2012-12-03
--�޸����ݣ����ݲ�¼�����


--��ɾ�������ݲ�¼�����"
drop table ERP_ADDITIONAL_DEFINE cascade constraints;

--���´��������ݲ�¼�����
create table ERP_ADDITIONAL_DEFINE  (
   ID                   NUMBER                          not null,
   FIELD_CODE           VARCHAR2(60),
   FIELD_NAME           VARCHAR2(100),
   IS_ADDITIONAL        CHAR(1),
   IS_NOT_NULL          CHAR(1),
   constraint PK_ERP_ADDITIONAL_DEFINE primary key (ID)
);

comment on table ERP_ADDITIONAL_DEFINE is
'���ݲ�¼�����';

comment on column ERP_ADDITIONAL_DEFINE.ID is
'���';

comment on column ERP_ADDITIONAL_DEFINE.FIELD_CODE is
'��¼�ֶ�';

comment on column ERP_ADDITIONAL_DEFINE.FIELD_NAME is
'��¼�ֶ�������';

comment on column ERP_ADDITIONAL_DEFINE.IS_ADDITIONAL is
'�Ƿ���Ҫ��¼ 0,�� 1,��';

comment on column ERP_ADDITIONAL_DEFINE.IS_NOT_NULL is
'�Ƿ���� 0,�� 1,��';

DECLARE
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM ERP_ADDITIONAL_DEFINE
   WHERE FIELD_CODE='BUSINESS_TYPE';
  IF VN_COUNT < 1 THEN
	--��ʼ������
	insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_NOT_NULL)values(1,'BUSINESS_TYPE','ҵ������','1','0');
  END IF;
  COMMIT;
END;
/
