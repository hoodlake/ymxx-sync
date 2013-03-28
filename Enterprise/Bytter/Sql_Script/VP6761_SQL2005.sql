
--修改人:蒲勇军
--修改时间:2012-10-15
--修改内容:资金调拨,头寸调拨添加附件
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

