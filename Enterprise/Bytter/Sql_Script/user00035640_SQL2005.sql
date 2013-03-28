--�޸�ʱ�䣺2012-12-03
--�޸����ݣ����ݲ�¼�����


--��ɾ�������ݲ�¼�����"
drop table ERP_ADDITIONAL_DEFINE;

--���´��������ݲ�¼�����
create table ERP_ADDITIONAL_DEFINE  (
   ID                   int                          not null,
   FIELD_CODE           VARCHAR(60),
   FIELD_NAME           VARCHAR(100),
   IS_ADDITIONAL        CHAR(1),
   IS_NOT_NULL          CHAR(1),
   constraint PK_ERP_ADDITIONAL_DEFINE primary key (ID)
);

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM ERP_ADDITIONAL_DEFINE
   WHERE FIELD_CODE='BUSINESS_TYPE';
  IF @VN_COUNT < 1
	BEGIN
		--��ʼ������
		insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_NOT_NULL)values(1,'BUSINESS_TYPE','ҵ������','1','0');
  END;
END;
GO
