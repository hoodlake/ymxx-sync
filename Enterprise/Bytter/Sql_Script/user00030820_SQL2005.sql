-- 修改表BT_BASE_BUDGETRULE主键生成方式
-- 修改日期：20120907
-- 修改原因：程序中表的主键值从种子表获取，而表设计采用自增长，新增时报错
-- 修改人：费滔
CREATE TABLE BT_BASE_BUDGETRULE_TEMP
  (
  ID int NOT NULL ,
  RULE_CODE varchar(80) NULL,
  CORP_NAME varchar(80) NULL,
  CORP_CODE char(4) NULL,
  CORP_ID int NULL,
  OBJECT_ID int NULL,
  DATA_RULE varchar(100) NULL,
  BUDGET_SUBJECT_CODE varchar(40) NULL,
  BUDGET_SUBJECT_NAME varchar(100) NULL,
  IS_VALID char(1) NULL,
  OP_NAME varchar(40) NULL,
  OP_CODE varchar(8) NOT NULL,
  OP_TIME datetime NULL,
  cd_sign char(1) NULL
  ) 
go  
insert into BT_BASE_BUDGETRULE_TEMP
  select * from BT_BASE_BUDGETRULE
go
drop table BT_BASE_BUDGETRULE
go
exec sp_rename 'BT_BASE_BUDGETRULE_TEMP','BT_BASE_BUDGETRULE'
go
ALTER TABLE BT_BASE_BUDGETRULE ADD CONSTRAINT
	PK_BT_BASE_BUDGETRULE PRIMARY KEY (ID) 
go