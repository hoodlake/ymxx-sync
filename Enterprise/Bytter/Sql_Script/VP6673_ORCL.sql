
--修改人:蒲勇军
--修改时间:2012-09-27 09:21:33
--添加用户充值密码审批表

create table BT_USER_RESTPWD_AP
(
  ID                NUMBER(10) primary key ,
  APP_USER_CODE     VARCHAR2(20),
  TAG_USER_CODE     VARCHAR2(20),
  APPROVE_USER_CODE VARCHAR2(20),
  APP_DATE          DATE,
  STATUS            NUMBER(2)
);

comment on column BT_USER_RESTPWD_AP.APP_USER_CODE      is '重置管理员';
comment on column BT_USER_RESTPWD_AP.TAG_USER_CODE      is '被更改用户';
comment on column BT_USER_RESTPWD_AP.APPROVE_USER_CODE  is '审批管理员';
comment on column BT_USER_RESTPWD_AP.APP_DATE           is '审批日期';
comment on column BT_USER_RESTPWD_AP.STATUS is '状态 -1 打回, 0 重置中 , 1审批通过'; 
