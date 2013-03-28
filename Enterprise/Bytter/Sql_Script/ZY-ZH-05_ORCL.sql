--������ �½��� ��ҵ��Ŀ����


create table BT_SAP_SUBJECT_BAL  (
   ID                   NUMBER                          not null,
   CORP_CODE            VARCHAR2(10),
   CORP_NAME            VARCHAR2(80)                    not null,
   SAP_SUBJECT          VARCHAR2(50),
   CUR                  VARCHAR2(10),
   BAL                  NUMBER(15,2),
   END_DATE             DATE,
   CHECKING_DATE        DATE,
   STATUS               CHAR(1)                        default '0',
   CREATER              VARCHAR2(10),
   CREATE_DATE          DATE,
   dif_reasons      VARCHAR2(100),
   constraint PK_BT_SAP_SUBJECT_BAL primary key (ID)
);



--������ �½��˵�

--�˻������������

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1 WHERE t1.sys_code='bankacc' AND t1.res_name='�������' AND t1.father_code='0';
  IF VN_COUNT < 1 THEN
  	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select  (select max(res_code)+1 from bt_sys_res) , '�������', 'bankacc', 0, '/bankacc/', '0', '0', '0', '0', 9, '��Զ', '', '', '', '', '', null, null, null, null, null, 1, ''
 	from bt_sys_res  where res_code=1;
  END IF;
  COMMIT; 
END;
/



--�˺Ź���>>�������>>��Ŀ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='bankacc' AND t1.res_name='��Ŀ����' AND t1.father_code=t2.res_code AND t2.res_name='�������';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(res_code)+1 from bt_sys_res), '��Ŀ����', 'bankacc', 
	(select res_code from bt_sys_res where sys_code='bankacc' and res_name='�������' and father_code=0), '/bankacc/bankReconciliationAction.do?method=queryCorpDateListPre', '0', '0', '0', '0', 1, '��Ŀ����', '', '', '', '', '', null, null, null, null, null, 2, ''
	from bt_sys_res  where res_name = '�������' and sys_code = 'bankacc';
  END IF;
  COMMIT; 
END;
/

----�˺Ź���>>�������>>�����˱�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='bankacc' AND t1.res_name='�����˱�' AND t1.father_code=t2.res_code AND t2.res_name='�������';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'�����˱�','bankacc',res_code,'/bankacc/balanceCheckAction.do?method=toCheckPage'
   ,'0','0','0','0',2,'�����˱�','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '�������' and sys_code = 'bankacc';
  END IF;
  COMMIT; 
END;
/


--�˺Ź���>>�������>>���˼�¼��ѯ
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='bankacc' AND t1.res_name='���˼�¼��ѯ' AND t1.father_code=t2.res_code AND t2.res_name='�������';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(res_code)+1 from bt_sys_res), '���˼�¼��ѯ', 'bankacc', 
	(select res_code from bt_sys_res where sys_code='bankacc' and res_name='�������' and father_code=0), '/bankacc/bankReconciliationAction.do?method=queryResultDateList', '0', '0', '0', '0', 3, '���˼�¼��ѯ', '', '', '', '', '', null, null, null, null, null, 2, ''
	from bt_sys_res  where res_name = '�������' and sys_code = 'bankacc';
  END IF;
  COMMIT; 
END;
/




--������ �½���ͼ ���������ҵ��Ŀ������ϸ
create or replace view v_bt_sap_subject_bal as
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
  left  join bis_acc_his_bal    his  on sap.end_date=his.bal_date and his.bank_acc=acc.bankacc; 
/