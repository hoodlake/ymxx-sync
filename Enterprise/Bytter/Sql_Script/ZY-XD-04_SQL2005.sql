--����չ������
alter table cms_loan_deferred
add DEFERRED_RATE  numeric(8,6);

alter table cms_pl_deferred
add DEFERRED_RATE  numeric(8,6);

--��������
create table CMS_MAIN_TYPE
(
  TYPE_CODE VARCHAR(10) not null,
  TYPE_NAME VARCHAR(30) not null,
  RMK       VARCHAR(100)
);
alter table CMS_MAIN_TYPE
  add constraint PK_CMS_MAIN_TYPE primary key (TYPE_CODE)
;
DECLARE
  @N_COUNT    int;
BEGIN
	SELECT COUNT(*) into @N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='A';
	IF @N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('A','�ڲ�����','');
	END IF;
  COMMIT; 
END; 
GO
DECLARE
  @N_COUNT    int;
BEGIN
	SELECT COUNT(*) into @N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='B';
	IF @N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('B','���н��','');
	END IF;
  COMMIT; 
END; 
GO
DECLARE
  @N_COUNT    int;
BEGIN
	SELECT COUNT(*) into @N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='C';
	IF @N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('C','ί�д���','');
	END IF;
  COMMIT; 
END;
GO
DECLARE
  @N_COUNT    int;
BEGIN
	SELECT COUNT(*) into @N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='D';
	IF @N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('D','ó������','');
	END IF;
  COMMIT; 
END;
GO


CREATE OR REPLACE VIEW V_CMS_INTEREST_DTL AS
select "CONTRACT_CODE","BILL_CODE","RATE_ID","CYCLE_ID","BILL_TYPE_CODE","BILL_TYPE","LOAN_ACC","CORP_ID","LOAN_SEND_OUT_MONEY","BALANCE","CUR_CODE","LOAN_SEND_OUT_DATE","REPAY_DATE","DELAY_DEADLINE_DATE","LOAN_RATE","DEFERRED_RATE","OVERDUE_RATE","NET_CODE","FLOAT_WAY","BORROW_CODE","BORROW_NAME","INTEREST_WAY","RATE_EFFECT_DATE","POINTS_PRO_SELECT","POINTS_PRO_TEXT" from (
--�ڲ�����
select b.CONTRACT_CODE,--��ͬ���
       a.bill_code, --ҵ����
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'A' bill_type_code,
       '�ڲ�����' bill_type,
       a.loan_acc,--�˺�
       a.corp_id,--��λ����
       a.loan_send_out_money,--(����)���Ž��
       (loan_send_out_money - (select nvl(sum(repay_money),0.00) from cms_loan_repay d where d.li_code=a.bill_code and d.status>=102)) balance,--���
       b.cur_code,--�ұ�
       a.loan_send_out_date,--��Ϣ����
       a.repay_date,--��������
       a.repay_date delay_deadline_date,--չ�ڵ�������
       a.loan_rate,--����
       a.deferred_rate,--չ������
       a.overdue_rate,--��������
       b.net_code, --����
       a.float_way, --������ʽ
       b.net_code borrow_code,--����� ������
       (select net_name from bt_net where net_code=b.net_code) borrow_name,--���������
       a.INTEREST_WAY, --��Ϣ��ʽ(Ԥ������) 1��ĩ��ϢԤ��,2��ĩ��Ϣ��Ԥ��,3ÿ�½�Ϣ,4��ĩ����ϢԤ��,5��ĩ����Ϣ��Ԥ��
       a.RATE_ENTRIES_EFFECT_DATE RATE_EFFECT_DATE,--���ʵ�����Ч����
       a.POINTS_PROPORTION_SELECT POINTS_PRO_SELECT ,--����/����  1.������2����
       to_number(a.POINTS_PROPORTION_TEXT) points_pro_text --����/����ֵ
  from loan_send_out_info a,cms_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and a.corp_id=c.id
 and a.status>=102 and a.status<>110
 and a.interest_way in  ('1','2','3','4','01','02','03','04','5','05')
union
select b.CONTRACT_CODE,--��ͬ���
       a.bill_code, --ҵ����
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'C' test_type_code,
       'ί�д���' test_type,
       a.loan_acc,--�˺�
       b.loan_opp,--��λ����
       a.money,--(����)���Ž��
       (a.money - (select nvl(sum(d.money),0.00) from cms_precative_loan_repay d where d.pl_code=a.bill_code and d.status>=102)) balance,--���
       b.currency,--�ұ�
       a.SEND_DATE,--��Ϣ����
       a.DEADLINE_DATE,--��������
       a.DEADLINE_DATE delay_deadline_date,--չ�ڵ�������
       a.RATE,--����
       0.00 deferred_rate,--չ������
       0.00 overdue_rate,--��������
       c.net_code, --����
       a.float_way, --������ʽ
       (select corp_code from bt_corp where id=b.precative_id) borrow_code,--����� ��ί�е�λ
       (select corp_name from bt_corp where id=b.precative_id) borrow_name,--���������
       a.INTEREST_WAY, --��Ϣ��ʽ(Ԥ������)
       a.RATE_ENTRIES_EFFECT_DATE,--���ʵ�����Ч����
       a.POINTS_PROPORTION_SELECT,--����/����  1.������2����
       a.POINTS_PROPORTION_TEXT --����/����ֵ
  from cms_precative_loan_send a,cms_precative_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and a.precative_id=c.id
 and a.status>=102 and a.status<>110
 and a.interest_way in  ('1','2','3','4','01','02','03','04','5','05')
union
--���н��
select b.CONTRACT_NO,--��ͬ���
       a.bill_code, --ҵ����
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'B' test_type_code,
       '���н��' test_type,
       a.acc_code,--�˺�
       b.corp_id,--��λ����
       a.money,--(����)���Ž��
       (a.money - (select nvl(sum(d.repay_money),0.00) from cms_provide_loan_repay d where d.send_code=a.bill_code and d.status>=102)) balance,--���
       b.cur_code,--�ұ�
       a.SEND_DATE,--��Ϣ����
       a.DEADLINE_DATE,--��������
       a.DEADLINE_DATE delay_deadline_date,--չ�ڵ�������
       a.pl_RATE,--����
       b.deferred_rate,--չ������
       b.overdue_rate,--��������
       b.net_code ,--����
       a.float_way, --������ʽ
       b.BANK_CODE, --����� �����д���
       (select bank_name from bt_bank where BANK_CODE=b.BANK_CODE) borrow_name,--���������
       a.INTEREST_WAY, --��Ϣ��ʽ(Ԥ������)
       a.RATE_ENTRIES_EFFECT_DATE,--���ʵ�����Ч����
       a.POINTS_PROPORTION_SELECT,--����/����  1.������2����
       a.POINTS_PROPORTION_TEXT --����/����ֵ
  from cms_provide_loan_send a,cms_provide_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and b.corp_id=c.id
 and a.status>=102 and a.status<>110
 and b.cpl_interest_payment<>'002'
 and a.interest_way in  ('1','2','3','4','01','02','03','04','5','05')
);

-- Create table
--Ԥ��/��Ϣ��¼��
create table CMS_INTEREST_REC
(
  ID                  numeric(10) not null,
  BALANCE_DATE        DATE not null,
  BILL_CODE           VARCHAR(50) not null, 
  BILL_TYPE           CHAR(1) not null,
  INTEREST_SIGN       CHAR(1) not null,
  INTEREST_TIME       DATE,
STATUS              CHAR(1) default '0'
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table CMS_INTEREST_REC
  add constraint PK_CMS_INTEREST_REC primary key (ID)
;
-- Create/Recreate indexes   CMS_INTEREST_REC
create index IDX_CMS_INTEREST_REC on CMS_INTEREST_REC (BALANCE_DATE,BILL_CODE);

--����
DECLARE
  @N_COUNT    int;
BEGIN
	SELECT COUNT(*) into @N_COUNT FROM tb_generator where gen_name='cms_interest_rec_id';
	IF @N_COUNT < 1 THEN
		insert into tb_generator values((select max(id)+1 from tb_generator),'cms_interest_rec_id',1 );
	END IF;
  COMMIT; 
END;
GO
DECLARE
  @N_COUNT    int;
BEGIN
	SELECT COUNT(*) into @N_COUNT FROM tb_generator where gen_name='cms_interest_dtl_id';
	IF @N_COUNT < 1 THEN
		insert into tb_generator values((select max(id)+1 from tb_generator),'cms_interest_dtl_id',1 );
	END IF;
  COMMIT; 
END;
GO


--������ϢԤ��/��Ϣ��
-- Create table
create table CMS_INTEREST_DTL
(
  ID                  numeric(10) unique,
  INTEREST_TIME       DATE not null,
  BALANCE_DATE        DATE not null,
  CONTRACT_CODE       VARCHAR(50) not null,
  BILL_CODE           VARCHAR(50) not null,
  BILL_TYPE           CHAR(1) not null,
  NET_CODE            CHAR(4) NOT NULL,
  CORP_ID             numeric(10) not null,
  LOAN_MONEY          numeric(14,2) default 0,
  BALANCE             numeric(14,2) default 0,
  CUR_CODE            char(4)  null,
  INTEREST_TYPE       CHAR(1) not null,
  INTEREST_START_DATE DATE not null,
  BLN_INST_DATE       DATE not null,
  DAYS                numeric(10) not null,
  CUMULATION          numeric(14,2) not null,
  INTEREST_RATE       numeric(8,6) not null,
  INTEREST            numeric(14,2) not null,
  NATURAL_INTEREST    numeric(14,2) not null,--
  BORROW_CODE         VARCHAR(50)  null,--
  BORROW_NAME         VARCHAR(200)  null,--
  INTEREST_SIGN       CHAR(1) not null,
  STATUS              CHAR(1) default '0',
  RMK                 VARCHAR(20),
  statusZone          VARCHAR(10)
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table cms_interest_dtl
  add constraint PK_cms_interest_dtl primary key (BILL_CODE,  INTEREST_TIME, INTEREST_TYPE, INTEREST_START_DATE);


--�˵�
--delete from BT_SYS_RES t where t.sys_code='cms' and t.res_name in ('������Ϣ����','��Ϣ����','��ϢԤ��','��Ϣ');
--һ���˵� �Ŵ�����->������Ϣ����
DECLARE
	@N_COUNT int;
BEGIN
	SELECT COUNT(*) INTO @N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='������Ϣ����';
	IF @N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			values( (select max(RES_CODE) + 1 from bt_sys_res),'������Ϣ����','cms',0,'','0','0','0','0',4,1,'');
  	END IF;
  	COMMIT;
END;
GO

--�����˵� �Ŵ�����->��Ϣ����
DECLARE
	@N_COUNT int;
BEGIN
	SELECT COUNT(*) INTO @N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='��Ϣ����';
	IF @N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'��Ϣ����','cms',RES_CODE,'/cms/rateInRoughlyCalc.jsp','0','0','0','0',1,2,''
         		from bt_sys_res
         			where res_name = '������Ϣ����' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
GO

--�����˵� �Ŵ�����->��ϢԤ��
DECLARE
	@N_COUNT int;
BEGIN
	SELECT COUNT(*) INTO @N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='��ϢԤ��';
	IF @N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'��ϢԤ��','cms',RES_CODE,'/cms/rateInProvision.jsp','0','0','0','0',2,2,''
         		from bt_sys_res
         			where res_name = '������Ϣ����' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
GO
--�����˵� �Ŵ�����->��Ϣ
DECLARE
	@N_COUNT int;
BEGIN
	SELECT COUNT(*) INTO @N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='��Ϣ';
	IF @N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'��Ϣ','cms',RES_CODE,'/cms/rateInEnd.jsp','0','0','0','0',3,2,''
         		from bt_sys_res
         			where res_name = '������Ϣ����' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
GO
