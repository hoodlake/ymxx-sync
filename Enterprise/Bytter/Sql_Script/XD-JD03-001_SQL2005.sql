--�޸����ڣ�2012.8.22
--�޸��ˣ����پ�
--�޸����ݣ�XD-JD03-001 ������׼���ʱ����������ޱ��Լ����Ҵ������ʱ�  ���Ӵ����Ӳ˵��Ľű�
--�޸�ԭ���µ�ģ�飬��ǰû�б�
--������׼���ʱ�
create table TB_BASE_RATE
(
  base_rate_id     numeric(15) not null,			--��׼�����б�������
  code             varchar(32) not null,			--��׼���ʵı���
  basetypename     varchar(128),					--��׼���͵�����
  timeoftakeeffect datetime,						--��׼������Ч����
  isbankbaserate   numeric(1),						--�Ƿ��� ���л�׼����
  remark           varchar(128)						--��ע��Ϣ
)
GO
alter table TB_BASE_RATE
  add constraint PK_TB_BASE_RATE_ID primary key (BASE_RATE_ID)
GO
alter table TB_BASE_RATE
  add constraint idx_TB_BASE_RATE_code unique (CODE)
GO
--�����������ڱ�
create table TB_CREDIT_PERIOD
(
       credit_period_id numeric(15) not null,		--�������ޱ�������
       code varchar(32) not null,					--�������ڵı���
       periodName varchar(128),						--�������ڵ�����	
       period numeric(2),							--��������
       periodCycle numeric(1),						--�����������ͣ��꣬���꣬���ȣ��£��ܣ��죩
       moneyType numeric(2),						--�������ͣ�����ң���Ԫ��ŷԪ���۱ң�
       creditDays numeric(6)						--�����������
)
GO
alter table TB_CREDIT_PERIOD
  add constraint PK_TB_CREDIT_PERIOD_ID primary key (credit_period_id)
GO

--ȥ��Ψһ�Ե�Լ�� 2012-09-20
--alter table TB_CREDIT_PERIOD
--  add constraint idx_TB_CREDIT_PERIOD_code unique (CODE)
--GO
--������������ά����
create table TB_Loan_Rate_Maintence
(
       loan_rate_maintence_id numeric(15) not null,				--�������ʱ�������
       base_rate_id numeric(15),								--�����������׼���ʱ�
       credit_period_id numeric(15),							--����������������ޱ�
       rate numeric(5,2),										--��׼���ʣ��ٷ���
       rateUpLimit numeric(5),									--��������
       rateDownLimit numeric(5),								--��������
       timeOfTakeEffect datetime,								--��Чʱ��
       timeOfLastModifier datetime,								--����޸�ʱ��
       isRMBLoanRate numeric(1),								--�Ƿ��������������
       status numeric(1),										--�ô������ʵ�ҵ����״̬���ύ������ͨ�������ͨ����
       isValid numeric(1),										--�ô��������Ƿ���Ч
       borrowType numeric(1),									--������ͣ�ͬҵ���룬ͬҵ�����
       foreign KEY(base_rate_id) REFERENCES TB_BASE_RATE(base_rate_id),
       foreign KEY(credit_period_id) REFERENCES TB_CREDIT_PERIOD(credit_period_id)
)
GO

alter table TB_Loan_Rate_Maintence
  add constraint PK_TB_Loan_Rate_Maintence_ID primary key (loan_rate_maintence_id)
GO
alter table TB_LOAN_RATE_MAINTENCE
  add constraint FK_TB_LOAN_RATE_01 foreign key (BASE_RATE_ID)
  references tb_base_rate (BASE_RATE_ID)
GO
alter table TB_LOAN_RATE_MAINTENCE
  add constraint FK_TB_LOAN_RATE_02 foreign KEY(credit_period_id) 
  REFERENCES TB_CREDIT_PERIOD(credit_period_id)
GO

--�޸����ڣ�2012.8.22
--�޸��ˣ����پ�
--�޸����ݣ�XD-JD03-006 �������ʱ����Ӵ��˵�����ֶ�
--�޸�ԭ�򣺱��ṹ������
--������׼���ʱ�
alter table tb_loan_rate_maintence add returnDescribe varchar(1024)
go

--���붨�۹������˵�
insert into bt_sys(sys_code,sys_name,first_page,valid_sign,rmk) values('amm','���۹���ϵͳ','admin','1','���۹���')
GO
--һ���˵����ڲ�����
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'�ڲ�����','amm',0,'','0','0','0','0',1,1,''
GO
--һ���˵����ⲿ����
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'�ⲿ����','amm',0,'','0','0','0','0',2,1,''
GO
--һ���˵�����ѯ
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'��ѯ',    'amm',0,'','0','0','0','0',3,1,''
GO
--�����˵����ⲿ����
--��׼����ά��
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'��׼����ά��','amm',RES_CODE,'/amm/base_rate_type_maintence.jsp','0','0','0','0',1,2,''
         from bt_sys_res
         where res_name = '�ⲿ����' and sys_code='amm'
GO
--��������ά��
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'��������ά��','amm',RES_CODE,'/amm/credit_period_maintence.jsp','0','0','0','0',2,2,''
         from bt_sys_res
         where res_name = '�ⲿ����' and sys_code='amm'
GO
--����Ҵ�������ά��      
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'����Ҵ�������ά��','amm',RES_CODE,'/amm/rmb_load_rate_maintence.jsp','0','0','0','0',3,2,''
         from bt_sys_res
         where res_name = '�ⲿ����' and sys_code='amm'
GO
--��Ҵ�������ά��      
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'��Ҵ�������ά��','amm',RES_CODE,'/amm/foreign_currency_load_rate_maintence.jsp','0','0','0','0',4,2,''
         from bt_sys_res
         where res_name = '�ⲿ����' and sys_code='amm'
GO
--�������ʸ���
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'�������ʸ���','amm',RES_CODE,'/amm/loan_rate_check.jsp','0','0','0','0',5,2,''
         from bt_sys_res
         where res_name = '�ⲿ����' and sys_code='amm'
GO
--�����˵�����ѯ
--����Ҵ������ʲ�ѯ    
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'����Ҵ������ʲ�ѯ','amm',RES_CODE,'/amm/rmb_load_rate_query.jsp','0','0','0','0',1,2,''
         from bt_sys_res
         where res_name = '��ѯ' and sys_code='amm'
GO
--��Ҵ������ʲ�ѯ
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'��Ҵ������ʲ�ѯ','amm',RES_CODE,'/amm/foreign_currency_load_rate_query.jsp','0','0','0','0',2,2,''
         from bt_sys_res
         where res_name = '��ѯ' and sys_code='amm'
GO



--�޸����ڣ�2012.9.15
--�޸��ˣ�������
--�޸����ݣ�XD-JD03-001 �������ʱ����桱ϵͳԤ��ֵ��
--�޸�ԭ�򣺱��ṹ������
--�����������ʱ�
alter table TB_CREDIT_PERIOD add isSysValue varchar(10)
go

--�޸����ڣ�2012.9.17
--�޸��ˣ�������
--�޸����ݣ�XD-JD03-001 
--�޸�ԭ���������͵���
--�����������ʱ�
alter table tb_loan_rate_maintence alter column rate numeric(12,6)
go
alter table TB_CREDIT_PERIOD alter column MONEYTYPE VARCHAR(10)
go
alter table TB_CREDIT_PERIOD alter column PERIOD INT
go
alter table tb_base_rate alter column REMARK VARCHAR(400)
go

--2012-09-27 user00032968
alter table TB_CREDIT_PERIOD alter column PERIOD INT;

--��ʼ  
--�޸��ˣ�������
--�޸�ԭ�򣺲˵�ҳ�����ת�谴��˾�涨�Ĺ淶������ 
update bt_sys_res set res_url='/amm/fcQueryLoanRateMaintence.do?method=toList' where res_url='/amm/foreign_currency_load_rate_query.jsp' 

update bt_sys_res set res_url='/amm/rmbQueryLoanRateMaintence.do?method=toList' where res_url='/amm/rmb_load_rate_query.jsp' 
        
update bt_sys_res set res_url='/amm/fcLoanRateMaintence.do?method=toList' where res_url='/amm/foreign_currency_load_rate_maintence.jsp' 
        
update bt_sys_res set res_url='/amm/rmbLoanRateMaintence.do?method=toList' where res_url= '/amm/rmb_load_rate_maintence.jsp' 
      
update bt_sys_res set res_url='/amm/creditPeriod.do?method=toList' where  res_url= '/amm/credit_period_maintence.jsp' 

update bt_sys_res set res_url='/amm/baseRate.do?method=toList' where res_url= '/amm/base_rate_type_maintence.jsp'

update bt_sys_res set res_url='/amm/loan_rate_check.do?method=toList' where res_url='/amm/loan_rate_check.jsp' ;

go



--ϵͳԤ��ֵ 
INSERT INTO TB_BASE_RATE (base_rate_id,code,  basetypename,  timeoftakeeffect,   isbankbaserate,  remark)
VALUES(1,'001','���л�׼����',getdate(),1,'���л�׼����')
go

INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(1,'R001','���������ڣ��������£�', 6,'4',1,180,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(2,'R002','��������һ�꣨��һ�꣩', 1,'1',1,360,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(3,'R003','һ�������꣨�����꣩', 3,'1',1,1080,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(4,'R004','���������꣨�����꣩', 5,'1',1,1800,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,     periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(5,'R005','��������' ,'1',1,1800,'1')
go

INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(6,'W001','��ҹ', 1,'6',2,1,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(7,'W002','һ��', 1,'5',2,7,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(8,'W003','����', 2,'5',2,14,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(9,'W004','һ����', 1,'4',2,30,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,  period,   periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(10,'W005','������' ,2,'4',2,60,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(11,'W006','������', 3,'4',2,90,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(12,'W007','�ĸ���', 4,'4',2,120,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(13,'W008','�����', 5,'4',2,150,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(14,'W009','������', 6,'4',2,180,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,    period, periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(15,'W010','�߸���' ,7,'4',2,210,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(16,'W011','�˸���', 8,'4',2,240,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(17,'W012','�Ÿ���', 9,'4',2,270,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(18,'W013','ʮ����', 10,'4',2,300,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(19,'W014','ʮһ����', 11,'4',2,330,'1')
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(20,'W015','ʮ������' ,12,'4',2,360,'1')
go



--����һ�� 2012-09-27 12:10
alter table tb_loan_rate_maintence add moneyType VARCHAR(10);

--�޸����ڣ�2012.9.27
--�޸��ˣ�����
--�޸����ݣ���������ά������׼����ά�� ��ʼ�����ӱ�
--�޸�ԭ��user00032969��user00032869��user00032468��������¼��ͻ�׼����ά������ʧ�ܣ�Υ��ΨһԼ��

insert into TB_GENERATOR(gen_name,gen_value)values ('credit_period_id',21);

insert into TB_GENERATOR(gen_name,gen_value)values('TB_BASE_RATE',2);

go