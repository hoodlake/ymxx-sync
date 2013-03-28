--刘建武 新建表 企业科目余额表



create table BT_SAP_SUBJECT_BAL  (
   ID                   int                          not null,
   CORP_CODE            VARCHAR(10),
   CORP_NAME            VARCHAR(80)                  not null,
   SAP_SUBJECT          VARCHAR(50),
   CUR                  VARCHAR(10),
   BAL                  numeric(15,2),
   END_DATE             DATEtime,
   CHECKING_DATE        DATEtime,
   STATUS               CHAR(1)                      default ('0'),
   CREATER              VARCHAR(10),
   CREATE_DATE          DATEtime,
   dif_reasons			VARCHAR(100),
   constraint PK_BT_SAP_SUBJECT_BAL primary key (ID)
)

go

--刘建武 新建菜单


--账户管理》银企对账

DECLARE
  @VN_COUNT    int;
BEGIN
  SELECT @VN_COUNT=COUNT(*)
    FROM bt_sys_res t1 WHERE t1.sys_code='bankacc' AND t1.res_name='银企对账' AND t1.father_code='0';
  IF @VN_COUNT < 1 
	begin
  	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select  (select max(res_code)+1 from bt_sys_res) , '银企对账', 'bankacc', 0, '/bankacc/', '0', '0', '0', '0', 9, '中远', '', '', '', '', '', null, null, null, null, null, 1, ''
 	from bt_sys_res  where res_code=1;
  END ; 
END;
go



--账号管理>>银企对账>>科目余额导入
DECLARE
  @VN_COUNT    int;
BEGIN
  SELECT @VN_COUNT=COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='bankacc' AND t1.res_name='科目余额导入' AND t1.father_code=t2.res_code AND t2.res_name='银企对账';
  IF @VN_COUNT < 1 
	begin 
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(res_code)+1 from bt_sys_res), '科目余额导入', 'bankacc', 
	(select res_code from bt_sys_res where sys_code='bankacc' and res_name='银企对账' and father_code=0), '/bankacc/bankReconciliationAction.do?method=queryCorpDateListPre', '0', '0', '0', '0', 1, '科目余额导入', '', '', '', '', '', null, null, null, null, null, 2, ''
	from bt_sys_res  where res_name = '银企对账' and sys_code = 'bankacc';
  END ;
  
END;
go

----账号管理>>银企对账>>余额对账表
DECLARE
  @VN_COUNT    int;
BEGIN
  SELECT @VN_COUNT = COUNT(*) 
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='bankacc' AND t1.res_name='余额对账表' AND t1.father_code=t2.res_code AND t2.res_name='银企对账';
  IF @VN_COUNT < 1 
  begin
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'余额对账表','bankacc',res_code,'/bankacc/balanceCheckAction.do?method=toCheckPage'
   ,'0','0','0','0',2,'余额对账表','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '银企对账' and sys_code = 'bankacc';
  END; 
END;
go


--账号管理>>银企对账>>对账记录查询
DECLARE
  @VN_COUNT    int;
BEGIN
  SELECT @VN_COUNT=COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='bankacc' AND t1.res_name='对账记录查询' AND t1.father_code=t2.res_code AND t2.res_name='银企对账';
  IF @VN_COUNT < 1 
  	begin
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(res_code)+1 from bt_sys_res), '对账记录查询', 'bankacc', 
	(select res_code from bt_sys_res where sys_code='bankacc' and res_name='银企对账' and father_code=0), '/bankacc/bankReconciliationAction.do?method=queryResultDateList', '0', '0', '0', '0', 3, '对账记录查询', '', '', '', '', '', null, null, null, null, null, 2, ''
	from bt_sys_res  where res_name = '银企对账' and sys_code = 'bankacc';
  END; 
END;
go





--刘建武 新建视图 银企对账企业科目余额导入明细
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='v_bt_sap_subject_bal')
DROP VIEW v_bt_sap_subject_bal
GO
create  view v_bt_sap_subject_bal as
select sap.ID,
       sap.CORP_CODE,
       sap.CORP_NAME,
       sap.SAP_SUBJECT,
       sap.CUR,
       sap.BAL,
       sap.END_DATE,
       sap.CHECKING_DATE,
       sap.STATUS,
       sap.CREATER,
       sap.CREATE_DATE,
       sap.dif_reasons,
       cu.cur_name,
       acc.bankacc,
       acc.acc_name,
       bank.bank_name,
       usr.user_code creater_code,
       usr.user_name creater_name,
       his.bank_bal
  from BT_SAP_SUBJECT_BAL sap
  inner join bt_bankacc_app     acc  on sap.sap_subject = acc.sap_subject and sap.corp_code=acc.corp_code
  inner join bt_currency        cu   on sap.cur = cu.cur_code
  inner join bt_bank            bank on bank.bank_code = acc.bank_code
  inner join bt_user            usr  on usr.user_code=sap.creater
  left  join bis_acc_his_bal    his  on sap.end_date=his.bal_date and his.bank_acc=acc.bankacc
 
go