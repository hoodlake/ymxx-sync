

--修改人:蒲勇军
--修改时间:2012-09-19
--离线账户授权表
create table BT_UNDERLINE_ACC_GRANT
(
  GRANT_ID               NUMERIC(10) PRIMARY KEY,
  USER_CODE              VARCHAR(8) not null,
  bank_acc               VARCHAR(50) not null,
  GRANT_DTL              CHAR(1),
  GRANT_BAL              CHAR(1),
  GRANT_EXG              CHAR(1),
  GRANT_USER             CHAR(8),
  STATUS                 CHAR(1)
);




