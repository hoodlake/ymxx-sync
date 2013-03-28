
--修改人:蒲勇军
--修改时间:2012-10-15
--修改内容:资金调拨,头寸调拨添加附件
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
  is '文件存储路径';
comment on column NIS_ALLOCATION_ATTACH.FILE_NAME
  is '文件名称';
comment on column NIS_ALLOCATION_ATTACH.FILE_TYPE
  is '文件类型: 1,头寸调拨';
comment on column NIS_ALLOCATION_ATTACH.FILE_DESC
  is '文件描述';
comment on column NIS_ALLOCATION_ATTACH.TARGET_ID
  is '文件目标ID';
  
commit;

