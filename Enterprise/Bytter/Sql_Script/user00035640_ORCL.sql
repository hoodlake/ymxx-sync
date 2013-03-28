--修改时间：2012-12-03
--修改内容：数据补录定义表


--先删除“数据补录定义表"
drop table ERP_ADDITIONAL_DEFINE cascade constraints;

--重新创建表”数据补录定义表“
create table ERP_ADDITIONAL_DEFINE  (
   ID                   NUMBER                          not null,
   FIELD_CODE           VARCHAR2(60),
   FIELD_NAME           VARCHAR2(100),
   IS_ADDITIONAL        CHAR(1),
   IS_NOT_NULL          CHAR(1),
   constraint PK_ERP_ADDITIONAL_DEFINE primary key (ID)
);

comment on table ERP_ADDITIONAL_DEFINE is
'数据补录定义表';

comment on column ERP_ADDITIONAL_DEFINE.ID is
'编号';

comment on column ERP_ADDITIONAL_DEFINE.FIELD_CODE is
'补录字段';

comment on column ERP_ADDITIONAL_DEFINE.FIELD_NAME is
'补录字段中文名';

comment on column ERP_ADDITIONAL_DEFINE.IS_ADDITIONAL is
'是否需要补录 0,否 1,是';

comment on column ERP_ADDITIONAL_DEFINE.IS_NOT_NULL is
'是否必填 0,否 1,是';

DECLARE
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM ERP_ADDITIONAL_DEFINE
   WHERE FIELD_CODE='BUSINESS_TYPE';
  IF VN_COUNT < 1 THEN
	--初始化数据
	insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_NOT_NULL)values(1,'BUSINESS_TYPE','业务类型','1','0');
  END IF;
  COMMIT;
END;
/
