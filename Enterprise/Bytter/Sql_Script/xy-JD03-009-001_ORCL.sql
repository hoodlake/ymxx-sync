--修改日期：20121016
--修改人：  余川锋
alter table FC_SEC_ACC drop constraint UNIQ_FC_SEC_ACC_1 cascade;
--如果不存在 BIS_DEPOSITORY_BAL 则创建 
declare
  i integer;
begin
  select count(*) into i from user_tables where table_name = 'BIS_DEPOSITORY_BAL';
  if i = 0 then
    execute immediate 'create table BIS_DEPOSITORY_BAL
    (
       ACCT_ID        VARCHAR2(60),
       acct_NAME      VARCHAR2(60),
       FUNDACCT_ID    VARCHAR2(60),
       BROKER         VARCHAR2(30),
       avail_bal      number(15,2),  bif_code       char(4),
       return_code    VARCHAR2(30),
       return_msg     VARCHAR2(60),
       query_TIME     DATE,
       last_TIME      DATE,
       constraint PK_bis_depository_bal primary key (ACCT_ID,bif_code)
    )';
  end if;
end;
/
alter table FC_SEC_ACC modify RMK VARCHAR2(500);
commit;