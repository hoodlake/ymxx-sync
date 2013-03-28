
--修改人:蒲勇军
--修改时间:2012-09-27 09:21:33
--添加用户充值密码审批表
create table BT_USER_RESTPWD_AP
(
  ID                NUMERIC(10) primary key ,
  APP_USER_CODE     VARCHAR(20),
  TAG_USER_CODE     VARCHAR(20),
  APPROVE_USER_CODE VARCHAR(20),
  APP_DATE          datetime,
  STATUS            NUMERIC(2)
);



