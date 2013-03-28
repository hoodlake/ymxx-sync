--修改日期：20121016
--修改人：  余川锋
alter table FC_SEC_ACC ALTER column RMK VARCHAR(500)
GO
IF NOT EXISTS (SELECT 1 FROM  SYSOBJECTS  WHERE  ID = OBJECT_ID('BIS_DEPOSITORY_BAL') AND TYPE = 'U')
create table BIS_DEPOSITORY_BAL
(
  ACCT_ID        VARCHAR(60) not null,
  acct_NAME      VARCHAR(60),
  FUNDACCT_ID    VARCHAR(60),         
  BROKER         VARCHAR(30),   
  avail_bal      NUMERIC(15,2),
  bif_code       char(4) not null,
  return_code    VARCHAR(30),
  return_msg     VARCHAR(60),
  query_TIME     DATETIME,                     
  last_TIME      DATETIME,
  CONSTRAINT PK_BIS_DEPOSITORY_BAL_01 PRIMARY KEY (ACCT_ID,bif_code)
)
GO