--�޸�ʱ��2012-08-27
--�޸��� ���
--�޸����� ���Գ��д�HR����֯��Ϣ������ϵͳ�ӿ�
create table  hr_organization_to_other
(
       PRIOX varchar(200),     --���ȼ�
       TYPEID varchar(200),    --��������
       SELFID varchar(200) primary key,    --�ɱ������
       NAME varchar(200),      --��������
       STARTTIME varchar(200), --��ʼ����
       ENDTIME varchar(200),   --��������
       AEDTM varchar(200),     --����ʱ��
       SSZZ varchar(200),      --������֯(Ա��ORGEH)
       OMLEADER varchar(200),  --��֯�쵼
       ISTAT varchar(200),     --�ƻ�״̬ 
       YZZLX varchar(200),     --��֯����
       SCLAS varchar(200),     --��ض�������
       SUBTY varchar(200),     --����Ϣ����
       SOBID varchar(200),     --��ض���ı�ʶ
       KOSTL varchar(200),     --�ɱ�����
       MCTXT varchar(200),     --Ϊƥ����ʹ�ü�����
       BUKRS varchar(200),     --��˾����
       BUTXT varchar(200),     --��˾�����˾������
       PRCTR varchar(200),     --��������
       AUFNR varchar(200),     --������ 
       YGITEM varchar(200) 
);
-- Add comments to the columns 
comment on column HR_ORGANIZATION_TO_OTHER.PRIOX
  is '���ȼ�';
comment on column HR_ORGANIZATION_TO_OTHER.TYPEID
  is '��������';
comment on column HR_ORGANIZATION_TO_OTHER.SELFID
  is '�ɱ������';
comment on column HR_ORGANIZATION_TO_OTHER.NAME
  is '��������';
comment on column HR_ORGANIZATION_TO_OTHER.STARTTIME
  is '��ʼ����';
comment on column HR_ORGANIZATION_TO_OTHER.ENDTIME
  is '��������';
comment on column HR_ORGANIZATION_TO_OTHER.AEDTM
  is '����ʱ��';
comment on column HR_ORGANIZATION_TO_OTHER.SSZZ
  is '������֯(Ա��ORGEH)';
comment on column HR_ORGANIZATION_TO_OTHER.OMLEADER
  is '��֯�쵼';
comment on column HR_ORGANIZATION_TO_OTHER.ISTAT
  is '�ƻ�״̬ ';
comment on column HR_ORGANIZATION_TO_OTHER.YZZLX
  is '��֯����';
comment on column HR_ORGANIZATION_TO_OTHER.SCLAS
  is '��ض�������';
comment on column HR_ORGANIZATION_TO_OTHER.SUBTY
  is '����Ϣ����';
comment on column HR_ORGANIZATION_TO_OTHER.SOBID
  is '��ض���ı�ʶ';
comment on column HR_ORGANIZATION_TO_OTHER.KOSTL
  is '�ɱ�����';
comment on column HR_ORGANIZATION_TO_OTHER.MCTXT
  is 'Ϊƥ����ʹ�ü�����';
comment on column HR_ORGANIZATION_TO_OTHER.BUKRS
  is '��˾����';
comment on column HR_ORGANIZATION_TO_OTHER.BUTXT
  is '��˾�����˾������';
comment on column HR_ORGANIZATION_TO_OTHER.PRCTR
  is '��������';
comment on column HR_ORGANIZATION_TO_OTHER.AUFNR
  is '������ ';
comment on column HR_ORGANIZATION_TO_OTHER.YGITEM
  is 'Ա����ID�б�';

  --�޸�ʱ��2012-09-01
--�޸��� ���
--�޸����� ���Գ��д�HR���͹�����Ϣ���ʽ�ϵͳ��ȡ������
ALTER TABLE ERP_PAY_DTL_INFO ADD(reverse11 varchar(150)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(reverse12 varchar(400)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(reverse13 varchar(200)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(reverse14 varchar(100)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(reverse15 varchar(100)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(reverse16 varchar(100)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(reverse17 varchar(100)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(OA_CHECK_MESSAGE varchar(100)); 
ALTER TABLE ERP_PAY_DTL_INFO ADD(cashFlowCode varchar(200)); 

ALTER TABLE erp_pay_info_feiyong ADD(OA_CHECK_MESSAGE varchar(100)); 
alter table ERP_PAY_INFO_FEIYONG add REVERSE1 VARCHAR2(200);
alter table ERP_PAY_INFO_FEIYONG add REVERSE2 VARCHAR2(200);
alter table ERP_PAY_INFO_FEIYONG add REVERSE3 VARCHAR2(500);
alter table ERP_PAY_INFO_FEIYONG add REVERSE4 VARCHAR2(100);
ALTER TABLE erp_pay_info_feiyong ADD(reverse5 varchar(100)); 
ALTER TABLE erp_pay_info_feiyong ADD(reverse6 varchar(100)); 
ALTER TABLE erp_pay_info_feiyong ADD(reverse7 varchar(100)); 
ALTER TABLE erp_pay_info_feiyong ADD(reverse8 varchar(100)); 
ALTER TABLE erp_pay_info_feiyong ADD(reverse9 varchar(100)); 
ALTER TABLE erp_pay_info_feiyong ADD(reverse10 varchar(100)); 



--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸�����  �Թ������м��
 
alter table ERP_PAY_INFO add REVERSE1 VARCHAR2(200);
alter table ERP_PAY_INFO add REVERSE2 VARCHAR2(200);
alter table ERP_PAY_INFO add REVERSE3 VARCHAR2(300);
alter table ERP_PAY_INFO add REVERSE4 VARCHAR2(300);
alter table ERP_PAY_INFO add REVERSE5 VARCHAR2(100);
alter table ERP_PAY_INFO add REVERSE5 VARCHAR2(100);
alter table ERP_PAY_INFO add REVERSE6 VARCHAR2(100);
alter table ERP_PAY_INFO add REVERSE7 VARCHAR2(100);
alter table ERP_PAY_INFO add REVERSE8 VARCHAR2(100);
alter table ERP_PAY_INFO add REVERSE9 VARCHAR2(100);
alter table ERP_PAY_INFO add REVERSE10 VARCHAR2(100);
comment on column ERP_PAY_INFO.REVERSE3
is 'SAP���ص���Ϣ��';
comment on column ERP_PAY_INFO.REVERSE4
is 'SAP���ص���Ϣ���';
comment on column ERP_PAY_INFO.REVERSE1
  is 'SAPҵ������';
comment on column ERP_PAY_INFO.REVERSE2
  is 'SAP�ر����˱�ʶ';


  --SAP��˽�ӿ�
--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸�����  �޸ĵ�λ��
alter table bt_corp add REVERSE13 VARCHAR2(200);
alter table bt_corp add REVERSE14 VARCHAR2(200);

--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸�����  �޸Ķ�˽�����м��
alter table ERP_PAY_DTL_INFO add REVERSE18 VARCHAR2(300);
alter table ERP_PAY_DTL_INFO add REVERSE19 VARCHAR2(300);
comment on column ERP_PAY_DTL_INFO.REVERSE18
is 'SAP���ص���Ϣ��';
comment on column ERP_PAY_DTL_INFO.REVERSE19
is 'SAP���ص���Ϣ���';


  
--sap��Ӧ��
 
  --�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸�����  ��Ӧ���˻���
  alter table BT_EXTERNAL_CORP_BANKACC add REVERSE1 VARCHAR2(200);
  comment on column BT_EXTERNAL_CORP_BANKACC.REVERSE1
  is 'SAP��Ӧ���˻���';

  

  --�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸�����  �ڲ�ת��
  alter table NIS_ALLOCATION_REQ add REVERSE1 VARCHAR2(300);
  alter table NIS_ALLOCATION_REQ add REVERSE2 VARCHAR2(300);
  comment on column NIS_ALLOCATION_REQ.REVERSE1
  is 'SAP���ص���Ϣ��';
  comment on column NIS_ALLOCATION_REQ.REVERSE2
  is 'SAP���ص���Ϣ���';


  --�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸�����  �鼯ָ��
  alter table BIS_GATHER_CMD add REVERSE11 VARCHAR2(300);
  alter table BIS_GATHER_CMD add REVERSE12 VARCHAR2(300);




--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� ��Ӧ����ͼ���ӷ����ֶ�bank_sourcecode
create or replace view v_bt_external_corp1001 as
select a.id,a.corp_id,a.external_code,b.external_acc,a.external_acc_name as external_corp,a.reverse3,a.from_status,b.bank,b.acc_province,b.acc_city,
b.bank_type,a.address,a.mobile,a.nation_code,b.bank_sourcecode
from bt_external_corp a ,bt_external_corp_bankacc b,r_external_corp_type c
where a.id=b.external_corp_id
and a.id=c.external_corp_id and c.type_code='1001';


--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� �Թ��������Ӳ�ѯ����
CREATE OR REPLACE VIEW V_ERP_PAY_INFO_TRACK AS
SELECT
E.PAY_INFO_ID,P.CORP_CODE,P.CORP_NAME,E.BURSAR_BILL_NO,L.EXTERNAL_CODE,L.EXTERNAL_CORP,E.OPP_PROV,E.OPP_CITY,E.REC_DATE,E.APP_DATE,E.AMT,
N.PASS_DATE,N.ENTER_DATE,N.ADD_WORD,E.VOUCHER_NO_ERP,E.RETURN_TIME AS EAS_RETURN_TIME,E.RETURN_MSG AS
EAS_RETURN_MSG,E.FAS_RETURN_TIME,E.FAS_RETURN_MSG,S.RETURN_TIME,
S.RETURN_MSG,S.TRANS_TIME,
E.STATUS AS BILL_STATUS,
(
  CASE E.STATUS
       WHEN 0 THEN '���Ƶ�'
       WHEN -1 THEN '���'
       WHEN -5 THEN '�Ѷ���'
       WHEN -10 THEN 'ָ������'
       ELSE '���Ƶ�'
       END
) AS BILL_STATUS_NAME,N.BILL_NO,A.STATUS AS APPROVE_STATUS,
(
  CASE
       WHEN A.STATUS >= 11 AND A.STATUS < 95 THEN '������'
       WHEN A.STATUS >= 95 THEN '����ͨ��'
       END
) AS APPROVE_STATUS_NAME,S.VOUCHER_STAT,
(
  CASE VOUCHER_STAT
       WHEN '0' THEN '�ɹ�'
       WHEN '1' THEN '�ȴ���ѯ'
       WHEN '2' THEN '���д���ʧ��'
       WHEN '3' THEN '�ѷ���'
       WHEN '5' THEN '�ո������ݲ�ȫ'
       WHEN '6' THEN '������'
       WHEN '7' THEN 'ָ����Ч'
       WHEN '9' THEN '�ӿڴ���ʧ��'
       END
) AS VOUCHER_STAT_NAME,
(
  CASE E.STATUS
       WHEN 98 THEN 'ʧ��'
       WHEN 99 THEN '�ɹ�'
       END
) AS CRETIFICATE_STATUS_NAME,E.ERP_STATUS,
(
  CASE E.ERP_STATUS
       WHEN 20 THEN 'ʧ��'
       WHEN 50 THEN '�ɹ�'
       END
) AS ERP_STATUS_NAME
  FROM ERP_PAY_INFO E
  LEFT JOIN BT_EXTERNAL_CORP L ON L.EXTERNAL_CODE = E.EXTERNAL_CODE 
LEFT JOIN NIS_BILLHEAD N ON N.ERP_PAY_INFO_ID = E.PAY_INFO_ID AND N.STATUS <> -2 and N.Is_Business='1'
LEFT JOIN BT_APPROVE_BUSINESS_RLZ A ON A.BILL_CODE = N.BILL_NO
LEFT JOIN BIS_EXC S ON S.CBS_BILL_NO = N.BILL_NO
LEFT JOIN BT_CORP P ON P.CORP_CODE = E.CORP_CODE;

--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� �����Ƶ����Ӳ�ѯ����
CREATE OR REPLACE VIEW V_ERP_PAY_INFO_YH AS
SELECT F.PAY_INFO_ID,B.EXTERNAL_ACC_NAME AS OPP_ACC_NAME,B.BANK_TYPE AS OPP_BANK_TYPE,B.TYPE_NAME AS OPP_BANK_TYPE_NAME,B.EXTERNAL_ACC AS OPP_BANK_ACC,
B.BANK AS OPP_BANK_NAME,B.ACC_PROVINCE AS OPP_PROV,B.ACC_CITY AS OPP_CITY,B.EXTERNAL_CORP,B.EXTERNAL_CODE,B.EXTERNAL_ACC_NAME,F.CORP_CODE,
F.REGION,F.ACC_BOOK,F.TAXPAYER_CODE,F.TAXPAYER_NAME,F.BURSAR_BILL_NO,F.REC_DATE,F.APP_DATE,B.BANK_SOURCECODE AS OPP_BANK_CODE,F.AMT,
F.CASH_PAYEE,F.CERTIFICATE,F.STATUS,P.ID AS CORP_ID,P.CORP_NAME,F.CUR_CODE,Y.CUR_NAME,B.ACC_PROVINCE AS PROV,B.ACC_CITY AS CITY,F.VOUCHER_NO_ERP,
F.RETURN_TIME,F.RETURN_MSG,F.FAS_RETURN_TIME,F.FAS_RETURN_MSG
FROM ERP_PAY_INFO F
LEFT JOIN (
SELECT E.EXTERNAL_CORP,E.EXTERNAL_CODE,E.EXTERNAL_ACC_NAME,C.EXTERNAL_ACC,C.BANK,P.BANK_TYPE,P.TYPE_NAME,C.BANK_SOURCECODE,C.ACC_PROVINCE,C.ACC_CITY,e.reverse3
FROM BT_EXTERNAL_CORP E,BT_EXTERNAL_CORP_BANKACC C,BT_BANK_TYPE P
WHERE E.ID = C.EXTERNAL_CORP_ID AND C.BANK_TYPE = P.BANK_TYPE
) B ON B.EXTERNAL_CODE = F.EXTERNAL_CODE 
LEFT JOIN BT_CORP P ON P.CORP_CODE = F.CORP_CODE
LEFT JOIN BT_CURRENCY Y ON Y.CUR_CODE = F.CUR_CODE;

--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� �鼯ָ�����ӷ����ֶ�EAS
CREATE OR REPLACE VIEW V_GATHER_RESULT_EAS AS
SELECT
CMD.SERIAL_ID,
CMD.VOUCHER_NO,
CMD.GATHER_AMT,
CMD.POLICY_CODE,
CMD.TRANS_TIME,
CMD.CMD_STAT,CMD.
ERP_STATUS,
ACC1.BANK_ACC AS PAYEE_ACC,
ACC1.ACC_NAME AS PAYEE_ACC_NAME,
ACC1.BANK_NAME AS PAYEE_BANK_NAME,
ACC1.BALANCE_ACCOUNT as payee_BALANCE_ACCOUNT,
ACC1.bankbook_num as payee_bankbook_num,
ACC2.BANK_ACC AS PAYER_ACC,
ACC2.ACC_NAME AS PAYER_ACC_NAME,
ACC2.BANK_NAME AS PAYER_BANK_NAME,
ACC2.BALANCE_ACCOUNT as payer_BALANCE_ACCOUNT,
ACC2.bankbook_num as payer_bankbook_num,
CORP1.REVERSE11 AS PAYEE_CORP_CODE,
CORP1.REVERSE12 AS PAYEE_CORP_NAME,
CORP2.REVERSE11 AS PAYER_CORP_CODE,
CORP2.REVERSE12 AS PAYER_CORP_NAME,
CMD.ABS,
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 ����SAP��˾����
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 ����SAP��˾����
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 �շ�SAP��˾����
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 ����bt��˾����
FROM BIS_GATHER_CMD CMD,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE CMD.PARENT_ACC =ACC1.BANK_ACC
AND CMD.CHILD_ACC = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE9=1
AND CORP2.REVERSE9=1;



--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� �鼯ָ�����ӷ����ֶ�SAP
CREATE OR REPLACE VIEW V_GATHER_RESULT_SAP AS
SELECT
CMD.SERIAL_ID,
CMD.VOUCHER_NO,
CMD.GATHER_AMT,
CMD.POLICY_CODE,
CMD.TRANS_TIME,
CMD.CMD_STAT,CMD.
ERP_STATUS,
ACC1.BANK_ACC AS PAYEE_ACC,
ACC1.ACC_NAME AS PAYEE_ACC_NAME,
ACC1.BANK_NAME AS PAYEE_BANK_NAME,
ACC1.BALANCE_ACCOUNT as payee_BALANCE_ACCOUNT,
ACC1.bankbook_num as payee_bankbook_num,
ACC2.BANK_ACC AS PAYER_ACC,
ACC2.ACC_NAME AS PAYER_ACC_NAME,
ACC2.BANK_NAME AS PAYER_BANK_NAME,
ACC2.BALANCE_ACCOUNT as payer_BALANCE_ACCOUNT,
ACC2.bankbook_num as payer_bankbook_num,
CORP1.REVERSE11 AS PAYEE_CORP_CODE,
CORP1.REVERSE12 AS PAYEE_CORP_NAME,
CORP2.REVERSE11 AS PAYER_CORP_CODE,
CORP2.REVERSE12 AS PAYER_CORP_NAME,
CMD.ABS,
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 ����SAP��˾����
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 ����SAP��˾����
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 �շ�SAP��˾����
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 ����bt��˾����
FROM BIS_GATHER_CMD CMD,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE CMD.PARENT_ACC =ACC1.BANK_ACC
AND CMD.CHILD_ACC = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE10=1
AND CORP2.REVERSE10=1;



--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� ��SAP���ø������ϴ����ӷ�������
CREATE OR REPLACE VIEW V_PAY_FEIYONG_RESULT_INFO AS
SELECT BIS.PAYER_ACC_NO AS PAYER_ACC,
       BIS.PAYER_ACC_NAME,
       (SELECT BALANCE_ACCOUNT FROM BT_BANK_ACC WHERE BANK_ACC=BIS.PAYER_ACC_NO) AS PAYER_BANK_CODE,--��Ӧ�����˻��Ľ����Ŀ�ֶ�
       (SELECT bankbook_num FROM BT_BANK_ACC WHERE BANK_ACC=BIS.PAYER_ACC_NO) AS bankbook_num,
       BIS.PAYER_BANK_NAME AS PAYER_BANK,
       BIS.TRANS_TIME,
       BIS.USER_NAME AS OP_NAME,
       BIS.VOUCHER_STAT,
       BIS.POSTSCRIPT,
       BIS.RETURN_MSG,
       BIS.CBS_BILL_NO AS BILL_NO,
       ERP.EXTERNAL_CODE,
       ERP.EXTERNAL_NAME as external_corp,
       ERP.ACC_BOOK,
       ERP.OPP_ACC_NAME as opp_acc_name,--�տ��˻���
       ERP.OPP_CITY as opp_city,--�տ�����
       ERP.OPP_BANK_ACC as opp_bank_acc,--�շ������˺�
       ERP.OPP_BANK_CODE as opp_bank_code,--�շ����к�
       ERP.OPP_PROV as opp_prov,--�շ�ʡ
       ERP.BURSAR_BILL_NO,
       PAYCORP.REVERSE11 AS PAYER_CORP_CODE,
       PAYCORP.REVERSE12 AS PAYER_CORP,
       NIS.PAY_TYPE,
       BIS.AMT,
       ERP.TAXPAYER_CODE,
       ERP.TAXPAYER_NAME,
       ERP.REGION,
       ERP.STATUS,
       ERP.ERP_STATUS,
       ERP.REC_COST_CENTER_CODE,
       ERP.REC_COST_CENTER_NAME,
       ERP.PAY_INFO_ID,
       ERP.TAXPAYER_CODE AS REC_CORP_CODE,
       ERP.TAXPAYER_NAME AS REC_CORP_NAME,
       PAYCORP.CORP_CODE as PAYER_CORP_CODE_BT,--add by lidch 2012-09-01 ��˾����
       PAYCORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       PAYCORP.REVERSE14 AS PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       RECORP.REVERSE13 AS REAL_PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       RECORP.REVERSE14 AS REAL_PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       ERP.Reverse1 as TYPE_SAP, --add by lidch 2012-09-01 ҵ������
       ERP.Reverse2 as NEWUM_SAP, --add by lidch 2012-09-01 �ر����˱�ʶ
       ERP.REVERSE4,
       ERP.REVERSE5
  FROM BIS_EXC          BIS,
       NIS_BILLHEAD     NIS,
       Erp_Pay_Info_Feiyong     ERP,
       BT_CORP          PAYCORP,
       BT_CORP          RECORP
 WHERE BIS.CBS_BILL_NO = NIS.BILL_NO
   AND NIS.ERP_PAY_INFO_ID = ERP.PAY_INFO_ID
   AND NIS.IS_BUSINESS = '2'
   AND NIS.CORP_CODE = PAYCORP.CORP_CODE
   AND ERP.CORP_CODE = RECORP.CORP_CODE;





--�޸�ʱ��2012-10-23
--�޸��� ��³�
--�޸����� ��EAS�ڲ�ת�����ӷ����ֶ�
CREATE OR REPLACE VIEW V_PAY_INSIDE_RESULT_EAS AS
SELECT
NIS.BILL_NO,
BIS.AMT,
BIS.VOUCHER_STAT,
BIS.TRANS_TIME,
BIS.POSTSCRIPT,
NIS.ERP_STATUS,
ACC1.BANK_ACC AS PAYEE_ACC,
ACC1.ACC_NAME AS PAYEE_ACC_NAME,
ACC1.BANK_NAME AS PAYEE_BANK_NAME,
ACC1.BALANCE_ACCOUNT AS PAYEE_BALANCE_ACCOUNT,
ACC1.bankbook_num AS payee_bankbook_num,
ACC2.BANK_ACC AS PAYER_ACC,
ACC2.ACC_NAME AS PAYER_ACC_NAME,
ACC2.BANK_NAME AS PAYER_BANK_NAME,
ACC2.BALANCE_ACCOUNT AS PAYER_BALANCE_ACCOUNT,
ACC2.bankbook_num AS payer_bankbook_num,
CORP1.REVERSE11 AS PAYEE_CORP_CODE,
CORP1.REVERSE12 AS PAYEE_CORP_NAME,
CORP2.REVERSE11 AS PAYER_CORP_CODE,
CORP2.REVERSE12 AS PAYER_CORP_NAME,
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 ����SAP��˾����
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 ����SAP��˾����
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 �շ�SAP��˾����
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 ����bt��˾����
FROM NIS_ALLOCATION_REQ NIS,BIS_EXC BIS,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE NIS.BILL_NO = BIS.CBS_BILL_NO
AND NIS.PAYEE_ACC_NO =ACC1.BANK_ACC
AND NIS.PAYER_ACC_NO = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE9=1
AND CORP2.REVERSE9=1;

--�޸�ʱ��2012-10-23
--�޸��� ��³�
--�޸����� ��SAP�ڲ�ת�����ӷ����ֶ�
CREATE OR REPLACE VIEW V_PAY_INSIDE_RESULT_SAP AS
SELECT
NIS.BILL_NO,
BIS.AMT,
BIS.VOUCHER_STAT,
BIS.TRANS_TIME,
BIS.POSTSCRIPT,
NIS.ERP_STATUS,
ACC1.BANK_ACC AS PAYEE_ACC,
ACC1.ACC_NAME AS PAYEE_ACC_NAME,
ACC1.BANK_NAME AS PAYEE_BANK_NAME,
ACC1.BALANCE_ACCOUNT AS PAYEE_BALANCE_ACCOUNT,
ACC1.bankbook_num AS payee_bankbook_num,
ACC2.BANK_ACC AS PAYER_ACC,
ACC2.ACC_NAME AS PAYER_ACC_NAME,
ACC2.BANK_NAME AS PAYER_BANK_NAME,
ACC2.BALANCE_ACCOUNT AS PAYER_BALANCE_ACCOUNT,
ACC2.bankbook_num AS payer_bankbook_num,
CORP1.REVERSE11 AS PAYEE_CORP_CODE,
CORP1.REVERSE12 AS PAYEE_CORP_NAME,
CORP2.REVERSE11 AS PAYER_CORP_CODE,
CORP2.REVERSE12 AS PAYER_CORP_NAME,
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 ����SAP��˾����
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 ����SAP��˾����
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 �շ�SAP��˾����
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 ����bt��˾����
FROM NIS_ALLOCATION_REQ NIS,BIS_EXC BIS,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE NIS.BILL_NO = BIS.CBS_BILL_NO
AND NIS.PAYEE_ACC_NO =ACC1.BANK_ACC
AND NIS.PAYER_ACC_NO = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE10=1
AND CORP2.REVERSE10=1;





--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� ��SAP��˽�������ϴ����ӷ����ֶ�
CREATE OR REPLACE VIEW V_PAY_PRIVATE_RESULT AS
SELECT BIS.PAYER_ACC_NO,
       BIS.PAYER_ACC_NAME,
       BIS.PAYER_BANK_NAME,
       BIS.TRANS_TIME,
       BIS.VOUCHER_STAT,
       ERP.PAY_TYPE,
       ERP.LOAN_BILL_NO,
       ERP.REPAYMENT_BILL_NO,
       ERP.APPLY_BILL_NO,
       PAYCORP.REVERSE11 AS CORP_CODE,
       PAYCORP.REVERSE12 AS CORP_NAME,
       ERP.COST_CENTER_CODE,
       ERP.COST_CENTER_NAME,
       NIS.PAY_MONEY AS SUM_PAYMONEY,
       ERP.REQ_MONEY,
       ERP.AMT,
       ERP.REPAYMENT_MONEY,
       ERP.WORK_NO,
       PERSON.USER_NAME,
       ERP.STATUS,
       ERP.ID,
       ERP.PURPOSE,
       ERP.RMK,
       ERP.REC_COST_CENTER_CODE AS REC_CORP_CODE,
       ERP.REC_COST_CENTER_NAME AS REC_CORP_NAME,
       NIS.BILL_NO,
       (SELECT BALANCE_ACCOUNT FROM BT_BANK_ACC WHERE BANK_ACC=NIS.PAYER_ACC) AS BALANCE_ACCOUNT,
       (SELECT bankbook_num FROM BT_BANK_ACC WHERE BANK_ACC=NIS.PAYER_ACC) AS bankbook_num,
       PAYCORP.CORP_CODE as PAYER_CORP_CODE_BT,--add by lidch 2012-09-01 ��˾����
       PAYCORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       PAYCORP.REVERSE14 AS PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       RECORP.REVERSE13 AS REAL_PAYER_CORP_CODE_SAP,
       RECORP.REVERSE14 AS REAL_PAYER_CORP_NAME_SAP,
       ERP.Reverse3 as TYPE_SAP, --add by lidch 2012-09-01 ҵ������
       ERP.Reverse4 as NEWUM_SAP --add by lidch 2012-09-01 �ر����˱�ʶ
  FROM BIS_EXC            BIS,
       NIS_BILLHEAD       NIS,
       NIS_EXPENSE_DETAIL DTL,
       NIS_PERSONNEL_DETAIL PERSON,
       ERP_PAY_DTL_INFO   ERP,
       BT_CORP            PAYCORP,
       BT_CORP RECORP
 WHERE BIS.CBS_BILL_NO = NIS.BILL_NO
   AND NIS.BILL_NO = DTL.BILLCODE
   AND DTL.ERP_PAY_INFO_ID = ERP.ID
   AND DTL.STATUS <> -2
   AND ERP.WORK_NO = PERSON.WORK_NO
   AND NIS.CORP_CODE = PAYCORP.CORP_CODE
   AND ERP.CORP_CODE=RECORP.CORP_CODE
   AND ERP.PAY_TYPE <> '4';

   
   


--�޸�ʱ��2012-08-27
--�޸��� ��³�
--�޸����� ��SAP�Թ����������ϴ����ӷ����ֶ�
CREATE OR REPLACE VIEW V_PAY_RESULT_INFO AS
SELECT "PAYER_ACC","PAYER_ACC_NAME","PAYER_BANK_CODE","PAYER_BANK","TRANS_TIME","OP_NAME","VOUCHER_STAT","POSTSCRIPT","RETURN_MSG","BILL_NO","EXTERNAL_CODE","EXTERNAL_CORP","ACC_BOOK","BURSAR_BILL_NO","PAYER_CORP_CODE","PAYER_CORP","PAY_TYPE","AMT","TAXPAYER_CODE","TAXPAYER_NAME","REGION","STATUS","ERP_STATUS","REC_COST_CENTER_CODE","REC_COST_CENTER_NAME","PAY_INFO_ID","SOURCE_TABLE_ERP","REC_CORP_CODE","REC_CORP_NAME","ID","CUS_SON_ID","CUS_SON_NAME","CUS_PARENT_ID","CUS_PARENT_NAME","PAYER_CORP_CODE_SAP","PAYER_CORP_NAME_SAP","TYPE_SAP","NEWUM_SAP","PAYER_CORP_CODE_BT","REAL_PAYER_CORP_CODE_SAP","REAL_PAYER_CORP_NAME_SAP","REVERSE4","REVERSE5","BANKBOOK_NUM"
 FROM (
SELECT BIS.PAYER_ACC_NO AS PAYER_ACC,
       BIS.PAYER_ACC_NAME,
       (SELECT BALANCE_ACCOUNT FROM BT_BANK_ACC WHERE BANK_ACC=BIS.PAYER_ACC_NO) AS PAYER_BANK_CODE,--��Ӧ�����˻��Ľ����Ŀ�ֶ�
       BIS.PAYER_BANK_NAME AS PAYER_BANK,
       BIS.TRANS_TIME,
       BIS.USER_NAME AS OP_NAME,
       BIS.VOUCHER_STAT,
       BIS.POSTSCRIPT,
       BIS.RETURN_MSG,
       BIS.CBS_BILL_NO AS BILL_NO,
       EXTER.EXTERNAL_CODE,
       EXTER.EXTERNAL_CORP,
       ERP.ACC_BOOK,
       ERP.BURSAR_BILL_NO,
       PAYCORP.REVERSE11 AS PAYER_CORP_CODE,
       PAYCORP.REVERSE12 AS PAYER_CORP,
       PAYCORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       PAYCORP.REVERSE14 AS PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       PAYCORP.Corp_Code as PAYER_CORP_CODE_BT,--,--add by lidch 2012-09-01 ��˾����
       NIS.PAY_TYPE,
       BIS.AMT,
       ERP.TAXPAYER_CODE,
       ERP.TAXPAYER_NAME,
       ERP.REGION,
       ERP.STATUS,
       ERP.ERP_STATUS,
       ERP.REC_COST_CENTER_CODE,
       ERP.REC_COST_CENTER_NAME,
       ERP.PAY_INFO_ID,
       ERP.source_table_erp,  --add by lidch 2012-09-01
       ERP.Reverse1 as TYPE_SAP, --add by lidch 2012-09-01 ҵ������
       ERP.Reverse2 as NEWUM_SAP, --add by lidch 2012-09-01 �ر����˱�ʶ
       RECORP.REVERSE11 AS REC_CORP_CODE,
       RECORP.REVERSE12 AS REC_CORP_NAME,
       RECORP.REVERSE13 AS REAL_PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       RECORP.REVERSE14 AS REAL_PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 ����SAP��˾����
       ERP.REVERSE4,
       ERP.REVERSE5,
       (SELECT bankbook_num FROM BT_BANK_ACC WHERE BANK_ACC=BIS.PAYER_ACC_NO) AS BANKBOOK_NUM 
  FROM BIS_EXC          BIS,
       NIS_BILLHEAD     NIS,
       ERP_PAY_INFO     ERP,
       BT_EXTERNAL_CORP EXTER,
       BT_CORP          PAYCORP,
       BT_CORP          RECORP
 WHERE BIS.CBS_BILL_NO = NIS.BILL_NO
   AND NIS.ERP_PAY_INFO_ID = ERP.PAY_INFO_ID
   AND NIS.IS_BUSINESS = '1'
   AND ERP.EXTERNAL_CODE = EXTER.EXTERNAL_CODE
   AND NIS.CORP_CODE = PAYCORP.CORP_CODE
   AND ERP.CORP_CODE = RECORP.CORP_CODE
   ) T
   LEFT JOIN ERP_CUSTOMER_MAP ECM ON T.EXTERNAL_CODE = ECM.CUS_SON_ID;







--�޸�ʱ��2012-08-30
--�޸��� ���
--�޸����� ���Գ��д�HR��Ա����Ա�����п���Ϣ������ϵͳ�ӿ�
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(reverse11 varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(reverse12 varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(reverse13 varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(reverse14 varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(reverse15 varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(reverse16 varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(reverse17 varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(bank_type varchar(10)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(acc_name varchar(300)); 
ALTER TABLE NIS_PERSONNEL_DETAIL ADD(bank_code varchar(300));

alter table NIS_PERSONNEL_DETAIL modify REVERSE9 VARCHAR(300);
alter table NIS_PERSONNEL_DETAIL modify REVERSE10 VARCHAR(300);

comment on column NIS_PERSONNEL_DETAIL.REVERSE4
  is '�칫�绰';
comment on column NIS_PERSONNEL_DETAIL.REVERSE6
  is 'ְ��';
comment on column NIS_PERSONNEL_DETAIL.REVERSE8
  is '����޸�ʱ��';
comment on column NIS_PERSONNEL_DETAIL.REVERSE9
  is 'email';
comment on column NIS_PERSONNEL_DETAIL.REVERSE10
  is '���·�Χ';
comment on column NIS_PERSONNEL_DETAIL.REVERSE11
  is '�����ӷ�Χ';
comment on column NIS_PERSONNEL_DETAIL.REVERSE12
  is '����λ';
comment on column NIS_PERSONNEL_DETAIL.REVERSE13
  is 'Ա����';
comment on column NIS_PERSONNEL_DETAIL.REVERSE14
  is 'Ա������';
comment on column NIS_PERSONNEL_DETAIL.REVERSE15
  is 'IC����';
comment on column NIS_PERSONNEL_DETAIL.REVERSE16
  is '�ɱ�����';
comment on column NIS_PERSONNEL_DETAIL.REVERSE17
  is '��֯��λ';
comment on column NIS_PERSONNEL_DETAIL.BANK_TYPE
  is '��������';
comment on column NIS_PERSONNEL_DETAIL.ACC_NAME
  is '����';




comment on column ERP_PAY_DTL_INFO.REVERSE11
  is '���ʺ��㵥λ';
comment on column ERP_PAY_DTL_INFO.REVERSE12
  is '���';
comment on column ERP_PAY_DTL_INFO.REVERSE13
  is '�·�';
comment on column ERP_PAY_DTL_INFO.REVERSE14
  is '����';
comment on column ERP_PAY_DTL_INFO.REVERSE15
  is '�����˹���';
comment on column ERP_PAY_DTL_INFO.REVERSE16
  is '����������';
comment on column ERP_PAY_DTL_INFO.REVERSE17
  is '����ʱ��';
comment on column ERP_PAY_DTL_INFO.OA_CHECK_MESSAGE
  is 'OA˫�򽻲���֤���ؽ����Ϣ';
comment on column ERP_PAY_DTL_INFO.CASHFLOWCODE
  is '�ֽ���������';


--�޸����� 2012-09-04
--�޸��� ���
--�޸����� �������ÿ������ apply_money_erp
create table apply_money_erp
(
       id varchar(32) primary key,  
       apply_no varchar(32),    --���뵥��
       salary_no varchar(200),               --���ʱ��
       salary_accounting_corp varchar(150), --���ʺ��㵥λ
       salary_accountint_txt varchar(150),  --���ʺ��㷶Χ�ļ�
       pay_date varchar(80),                 --֧������
       use_quality varchar(150),            --�ÿ�����
       apply_total_money number(15,2),      --�����ܶ�
       apply_total_person number,           --����������
       apply_person varchar(100),           --������
       examine_pass_date varchar(80),        --����ͨ��ʱ��
       corp_code varchar(100),               --��˾����
       corp_name varchar(150),              --��˾����
       count_person number,                 --����
       total_salary number(15,2),            --�����ܶ�
       status varchar(40),                    --״̬��0��ʼֵ��1�ѷ��ţ�-1��أ�-2ɾ����
       reverse1 varchar(100),
       reverse2 varchar(100),
       reverse3 varchar(100),
       reverse4 varchar(100),
       reverse5 varchar(100),
       reverse6 varchar(100),
       reverse7 varchar(100),
       reverse8 varchar(100),
       reverse9 number,
       reverse10 number
);

comment on column APPLY_MONEY_ERP.APPLY_NO
  is '���뵥��';
comment on column APPLY_MONEY_ERP.SALARY_NO
  is '���ʱ��';
comment on column APPLY_MONEY_ERP.SALARY_ACCOUNTING_CORP
  is '���ʺ��㵥λ';
comment on column APPLY_MONEY_ERP.SALARY_ACCOUNTINT_TXT
  is '���ʺ��㷶Χ�ı�';
comment on column APPLY_MONEY_ERP.PAY_DATE
  is '֧������';
comment on column APPLY_MONEY_ERP.USE_QUALITY
  is '�ÿ�����';
comment on column APPLY_MONEY_ERP.APPLY_TOTAL_MONEY
  is '�����ܶ�';
comment on column APPLY_MONEY_ERP.APPLY_TOTAL_PERSON
  is '����������';
comment on column APPLY_MONEY_ERP.APPLY_PERSON
  is '������';
comment on column APPLY_MONEY_ERP.EXAMINE_PASS_DATE
  is '����ͨ��ʱ��';
comment on column APPLY_MONEY_ERP.CORP_CODE
  is '��˾����';
comment on column APPLY_MONEY_ERP.CORP_NAME
  is '��˾����';
comment on column APPLY_MONEY_ERP.COUNT_PERSON
  is '����';
comment on column APPLY_MONEY_ERP.TOTAL_SALARY
  is '�����ܶ�';
comment on column APPLY_MONEY_ERP.STATUS
  is '״̬��0��ʼֵ��1�ѷ��ţ�-1��أ�-2ɾ����';




comment on column ERP_PAY_INFO_FEIYONG.OA_CHECK_MESSAGE
  is 'OA˫�򽻲���֤���ؽ�����Ϣ';

  comment on column ERP_PAY_INFO_FEIYONG.reverse5
  is '��������';







comment on column ERP_PAY_INFO_FEIYONG.REVERSE1
  is 'SAPҵ������';
comment on column ERP_PAY_INFO_FEIYONG.REVERSE2
  is 'SAP�ر����˱�ʶ';
comment on column ERP_PAY_INFO_FEIYONG.REVERSE3
  is '��Ϣ����Ϣ��';
comment on column ERP_PAY_INFO_FEIYONG.REVERSE4
  is '��Ϣ���';
  




comment on column bt_corp.REVERSE13
  is 'sap��˾����';
comment on column bt_corp.REVERSE14
  is 'sap��˾����';




-- Create table
create table YH_TRANS_TYPE_CUSTOMER
(
  id             VARCHAR2(32),
  type_code      VARCHAR2(20),
  type_name      VARCHAR2(100),
  customer_code  VARCHAR2(20),
  customer_name  VARCHAR2(100),
  bank_acc       VARCHAR2(30),
  abs            VARCHAR2(200),
  bank_direction CHAR(1),
  reverse1       VARCHAR2(100),
  reverse2       VARCHAR2(100)
);
-- Add comments to the columns 
comment on column YH_TRANS_TYPE_CUSTOMER.id
  is 'uuid';
comment on column YH_TRANS_TYPE_CUSTOMER.type_code
  is '�������ͱ���';
comment on column YH_TRANS_TYPE_CUSTOMER.type_name
  is '������������';
comment on column YH_TRANS_TYPE_CUSTOMER.customer_code
  is '���';
comment on column YH_TRANS_TYPE_CUSTOMER.customer_name
  is '����';
comment on column YH_TRANS_TYPE_CUSTOMER.bank_acc
  is '�˺�';
comment on column YH_TRANS_TYPE_CUSTOMER.abs
  is 'ժҪ';
comment on column YH_TRANS_TYPE_CUSTOMER.bank_direction
  is '�˺ŷ���: 1:����;2�Է�';


-- Create table
create table YH_TRANS_TYPE
(
  id             VARCHAR2(32),
  type_code      VARCHAR2(20),
  type_name      VARCHAR2(100),
  type           CHAR(1),
  auto_match     CHAR(1),
  oa_confirm     CHAR(1),
  sap_accounting CHAR(1),
  sap_code       VARCHAR2(20),
  rmk            VARCHAR2(250),
  reverse1       VARCHAR2(100),
  reverse2       VARCHAR2(100)
);
-- Add comments to the columns 
comment on column YH_TRANS_TYPE.id
  is 'uuid';
comment on column YH_TRANS_TYPE.type_code
  is '�������ͱ���';
comment on column YH_TRANS_TYPE.type_name
  is '������������';
comment on column YH_TRANS_TYPE.type
  is '���';
comment on column YH_TRANS_TYPE.auto_match
  is '�Զ�ƥ��';
comment on column YH_TRANS_TYPE.oa_confirm
  is '�Ƿ�oa����';
comment on column YH_TRANS_TYPE.sap_accounting
  is '�Ƿ�sap����';
comment on column YH_TRANS_TYPE.sap_code
  is 'sap�˻������';
comment on column YH_TRANS_TYPE.rmk
  is '��ע';


-- Create table
create table YH_MATCH_INFO
(
  serial_id         VARCHAR2(32),
  bank_acc          VARCHAR2(30),
  acc_name          VARCHAR2(150),
  bank_name         VARCHAR2(150),
  opp_bank_acc      VARCHAR2(30),
  opp_acc_name      VARCHAR2(150),
  opp_bank_name     VARCHAR2(150),
  cd_sign           CHAR(1) default 0,
  amt               NUMBER(15,2),
  abs               VARCHAR2(200),
  postscirpt        VARCHAR2(200),
  trans_time        DATE,
  match_id          VARCHAR2(32),
  oa_send           CHAR(1) default 0,
  oa_confirm        CHAR(1) default 0,
  sap_accounting    CHAR(1) default 0,
  status	    char(1),
  reverse1          VARCHAR2(150),
  reverse2          VARCHAR2(150),
  serial_no	    VARCHAR2(32),
  auto_match_status CHAR(1) default 0,
  voucher_no1       VARCHAR2(200),
  voucher_no2       VARCHAR2(200),
  returnTime1	    date,
  returnTime2       date,
  returnStatus1	    VARCHAR2(50),
  returnStatus2     VARCHAR2(50),
  returnMsg1	    VARCHAR2(500),
  returnMsg2	    VARCHAR2(500)
);
-- Add comments to the columns 
comment on column YH_MATCH_INFO.serial_id
  is '���ݺ�';
comment on column YH_MATCH_INFO.bank_acc
  is '�˺�';
comment on column YH_MATCH_INFO.acc_name
  is '����';
comment on column YH_MATCH_INFO.bank_name
  is '��������';
comment on column YH_MATCH_INFO.opp_bank_acc
  is '�Է��˺�';
comment on column YH_MATCH_INFO.opp_acc_name
  is '�Է�����';
comment on column YH_MATCH_INFO.opp_bank_name
  is '�Է���������';
comment on column YH_MATCH_INFO.cd_sign
  is '��֧���� 0:�գ�1֧';
comment on column YH_MATCH_INFO.amt
  is '���';
  comment on column YH_MATCH_INFO.status
  is '״̬(1������2ȡ��)';
comment on column YH_MATCH_INFO.abs
  is 'ժҪ';
comment on column YH_MATCH_INFO.postscirpt
  is '����';
comment on column YH_MATCH_INFO.trans_time
  is '��������';
comment on column YH_MATCH_INFO.match_id
  is 'ƥ����Ϣid';
comment on column YH_MATCH_INFO.oa_send
  is '�Ƿ��ѷ���OA 1���ǣ�0���� ��2��������';
comment on column YH_MATCH_INFO.oa_confirm
  is 'oa�Ƿ�������  1���ǣ�0���� ��2���������� ';
comment on column YH_MATCH_INFO.sap_accounting
  is 'sap����  1���ǣ�0����2��������';
  comment on column YH_MATCH_INFO.sap_accounting
  is '�����ʷ��ϸ���serial_id';
comment on column YH_MATCH_INFO.auto_match_status
  is '�Ƿ��Զ�ƥ�䣻1����;0��';
  comment on column YH_MATCH_INFO.voucher_no1
  is 'ƾ֤��1';
  comment on column YH_MATCH_INFO.voucher_no2
  is 'ƾ֤��2';
  comment on column YH_MATCH_INFO.returnTime1
  is '����ʱ��1';
  comment on column YH_MATCH_INFO.returnTime2
  is '����ʱ��2';
  comment on column YH_MATCH_INFO.returnStatus1
  is '����״̬1';
  comment on column YH_MATCH_INFO.returnStatus2
  is '����״̬2';
  comment on column YH_MATCH_INFO.returnMsg1
  is '������Ϣ1';
  comment on column YH_MATCH_INFO.returnMsg2
  is '������Ϣ2';


-- Create table
create table YH_MATCH_DTL_INFO
(
  id            VARCHAR2(32) not null,--uuid
  serial_id     VARCHAR2(32),--�����ţ������serail_id
  type_code     VARCHAR2(30),--�տ����ʹ���
  type_name     VARCHAR2(100),--�տ���������
  customer_code VARCHAR2(20),--�ͻ����
  customer_name VARCHAR2(150),--�ͻ�����
  stores_code   VARCHAR2(20),--�ŵ���
  stores_name   VARCHAR2(100),--�ŵ�����
  confirm_amt   NUMBER(15,2),--������
  operator_code VARCHAR2(20),--�����˱��
  operator_name VARCHAR2(100),--����������
  rmk           VARCHAR2(300),--��ע
  confim_date   VARCHAR2(10),--���������ַ�yyyymmdd
  reverse1      VARCHAR2(100),--
  reverse2      VARCHAR2(100),--
  status      CHAR(1) default 0 --״̬��0��ȷ�ϴ����ˣ�1 �Ѽ���; 2:���Է��͵�sap���ˣ�
);

comment on column YH_MATCH_DTL_INFO.id
  is 'uuid';
comment on column YH_MATCH_DTL_INFO.serial_id
  is '�����ţ������serail_id';
comment on column YH_MATCH_DTL_INFO.type_code
  is '�տ����ʹ���';
comment on column YH_MATCH_DTL_INFO.type_name
  is '�տ���������';
comment on column YH_MATCH_DTL_INFO.customer_code
  is '�ͻ����';
comment on column YH_MATCH_DTL_INFO.customer_name
  is '�ͻ�����';
comment on column YH_MATCH_DTL_INFO.stores_code
  is '�ŵ���';
comment on column YH_MATCH_DTL_INFO.stores_name
  is '�ŵ�����';
comment on column YH_MATCH_DTL_INFO.confirm_amt
  is '������';
comment on column YH_MATCH_DTL_INFO.operator_code
  is '�����˱��';
comment on column YH_MATCH_DTL_INFO.operator_name
  is '����������';
comment on column YH_MATCH_DTL_INFO.rmk
  is '��ע';
comment on column YH_MATCH_DTL_INFO.confim_date
  is '���������ַ�yyyymmdd';
comment on column YH_MATCH_DTL_INFO.status
  is '״̬��0��ȷ�ϴ����ˣ�1 �Ѽ���; 2:���Է��͵�sap���ˣ�';

ALTER TABLE yh_match_dtl_info ADD(voucher_no varchar(300));
ALTER TABLE yh_match_dtl_info ADD(returnTime date);
ALTER TABLE yh_match_dtl_info ADD(returnStatus varchar(300));
ALTER TABLE yh_match_dtl_info ADD(returnMsg varchar(300));
ALTER TABLE yh_match_dtl_info ADD(zsstatus char(1));

commit;


--�޸�ʱ�� 2012-09-30
--�޸��� ���
--�޸����� �������Գ���Ӧ�ջؿ���ͼ
create or replace view v_yh_match_info_type12 as
select t.type_code,
       t.type_name,
       t.type,
       t.auto_match,
       t.oa_confirm as type_oa_confirm,
       t.sap_accounting as type_sap_accounting,
       t.sap_code,
       r.customer_code,
       r.customer_name,
       r.abs as type_abs,
       bc.corp_code,
       bc.balance_account,
       bc.bankbook_num,
       p.reverse13 as sap_corp_code,
       o.serial_id,
       o.bank_acc,
       o.acc_name,
       o.bank_name,
       o.opp_bank_acc,
       o.opp_acc_name,
       o.opp_bank_name,
       o.cd_sign,
       o.amt,
       o.abs,
       o.trans_time,
       o.oa_send,
       o.oa_confirm,
       o.sap_accounting,
       o.match_id,
       o.status,
       o.voucher_no1,
       o.voucher_no2,
       o.returnTime1,
       O.returnTime2,
       o.returnStatus1,
       o.returnStatus2,
       o.returnMsg1,
       o.returnMsg2
  from yh_match_info o, yh_trans_type t, yh_trans_type_customer r,bt_bank_acc bc,bt_corp p
 where o.match_id = r.id
   and t.type_code = r.type_code
   and o.bank_acc = bc.bank_acc
   and bc.corp_code = p.corp_code;


create or replace view v_yh_match_info_type3 as
select t.type_code,
       t.type_name,
       t.type,
       t.auto_match,
       t.oa_confirm as type_oa_confirm,
       t.sap_accounting as type_sap_accounting,
       t.sap_code,
       t.reverse1 as zzbs,
       lo.id,
       lo.customer_code,
       lo.customer_name,
       lo.stores_code,
       lo.stores_name,
       lo.confirm_amt,
       lo.confim_date,
       lo.reverse1,
       lo.reverse2,
       lo.rmk,
       lo.zsstatus,
       bc.corp_code,
       bc.balance_account,
       bc.bankbook_num,
       p.reverse13 as sap_corp_code,
       o.serial_id,
       o.bank_acc,
       o.acc_name,
       o.bank_name,
       o.opp_bank_acc,
       o.opp_acc_name,
       o.opp_bank_name,
       o.cd_sign,
       o.amt,
       o.abs,
       o.trans_time,
       o.oa_send,
       o.oa_confirm,
       o.sap_accounting,
       o.match_id,
       o.status,
       o.voucher_no1,
       o.voucher_no2,
       o.returnTime1,
       o.returnTime2,
       o.returnStatus1,
       o.returnStatus2,
       o.returnMsg1,
       o.returnMsg2,
       lo.voucher_no,
       lo.returntime,
       lo.returnstatus,
       lo.returnmsg
  from yh_match_info o, yh_match_dtl_info lo,yh_trans_type t,bt_bank_acc bc,bt_corp p
 where o.serial_id = lo.serial_id
   and t.type_code = lo.type_code
   and o.bank_acc = bc.bank_acc
   and bc.corp_code = p.corp_code;






ALTER TABLE YH_MATCH_INFO ADD(reverse3 varchar(300));
ALTER TABLE YH_MATCH_INFO ADD(reverse4 varchar(300));
ALTER TABLE YH_MATCH_INFO ADD(reverse5 varchar(300));
ALTER TABLE YH_MATCH_INFO ADD(reverse6 varchar(300));
ALTER TABLE YH_MATCH_INFO ADD(reverse7 varchar(300));
ALTER TABLE YH_MATCH_INFO ADD(reverse8 varchar(300));
ALTER TABLE YH_MATCH_INFO ADD(reverse9 varchar(300));
ALTER TABLE YH_MATCH_INFO ADD(reverse10 varchar(300));


create or replace view v_wait_confirm_data
as 
select 
o.serial_id,
o.bank_acc,
o.acc_name,
o.bank_name,
o.opp_bank_acc,
o.opp_acc_name,
o.opp_bank_name,
o.cd_sign,
o.amt,
o.abs,
o.postscirpt,
o.trans_time,
o.match_id,
o.oa_send,
o.oa_confirm,
o.sap_accounting,
o.status,
o.reverse1,
o.reverse2,
o.serial_no,
o.auto_match_status,
o.voucher_no1,
o.voucher_no2,
o.returntime1,
o.returntime2,
o.returnstatus1,
o.returnstatus2,
o.returnmsg1,
o.returnmsg2,
o.reverse3,
o.reverse4,
o.reverse5,
o.reverse6,
o.reverse7,
o.reverse8,
o.reverse9,
o.reverse10,
b.reverse13 as sap_corp_code,
t.type_code,
t.type_name,
t.customer_code,
r.oa_confirm as y_oa_confirm 
from yh_match_info o,yh_trans_type_customer t,bt_bank_acc bt,bt_corp b,yh_trans_type r
where o.bank_acc=bt.bank_acc 
and b.corp_code=bt.corp_code 
and o.match_id=t.id 
and t.type_code=r.type_code;




comment on column YH_MATCH_DTL_INFO.VOUCHER_NO
  is 'ƾ֤��';
comment on column YH_MATCH_DTL_INFO.RETURNTIME
  is '����ʱ��';
comment on column YH_MATCH_DTL_INFO.RETURNSTATUS
  is '״̬';
comment on column YH_MATCH_DTL_INFO.RETURNMSG
  is '������Ϣ';
comment on column YH_MATCH_DTL_INFO.ZSSTATUS
  is '�����տ��Ƿ�ɹ�(1Ϊ�ɹ���2Ϊʧ��)';


CREATE OR REPLACE VIEW V_PRIVATE_RETURN AS
SELECT 
DTL.ID,
DTL.PAY_TYPE,
DTL.LOAN_BILL_NO,
DTL.APPLY_BILL_NO,
DTL.REPAYMENT_BILL_NO,
DTL.COST_CENTER_CODE,
DTL.COST_CENTER_NAME,
DTL.REQ_MONEY,
DTL.AMT,
DTL.REPAYMENT_MONEY,
DTL.EXPENSE_DATE,
DTL.STATUS,
DTL.PURPOSE,
DTL.REVERSE1,
DTL.REVERSE2,
DTL.REVERSE3,
DTL.REVERSE4,
DTL.REVERSE5,
DTL.REVERSE6,
DTL.REC_COST_CENTER_CODE,
DTL.REC_COST_CENTER_NAME,
PERSON.WORK_NO,
PERSON.USER_NAME,
CORP.REVERSE11 AS PAYER_CORP_CODE,
CORP.REVERSE12 AS PAYER_CORP_NAME,
CORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 ����SAP��˾����
CORP.REVERSE14 AS PAYER_CORP_NAME_SAP --add by lidch 2012-09-01 ����SAP��˾����
FROM ERP_PAY_DTL_INFO DTL,BT_CORP CORP,NIS_PERSONNEL_DETAIL PERSON
WHERE DTL.CORP_CODE = CORP.CORP_CODE
AND   DTL.WORK_NO = PERSON.WORK_NO;



--�����˵�  ��������>>����>>�����ÿ
--������

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '�����ÿ', 'nis', 15, '/fjyh/applyMoneyErpAction.do?method=goQueryApply', '0', '0', '0', '0', 10, '����', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;


--���Գ����½������ÿ����뵥��ͼ v_apply_money_erp 
--������

create or replace view v_apply_money_erp as
select info.apply_no, info.salary_no, info.salary_accounting_corp, info.salary_accountint_txt, info.pay_date,
info.use_quality, info.apply_total_money, info.apply_total_person, info.apply_person, info.examine_pass_date,
info.corp_code, info.corp_name, info.count_person, info.total_salary, info.status, info.reverse1, info.reverse2,
info.reverse3,info.reverse4, info.reverse5, info.reverse6, info.reverse7, info.reverse8, info.reverse9, info.reverse10 ,
nvl(no_pay.no_pay_person,0) no_pay_person,nvl(no_pay.no_pay_money,0) no_pay_money,
nvl(back_pay.back_pay_person,0) back_pay_person,nvl(back_pay.back_pay_money,0) back_pay_money,
nvl(all_pay.all_pay_person,0) all_pay_person,nvl(all_pay.all_pay_money,0) all_pay_money,
nvl(no_pay.no_pay_person,0)+nvl(back_pay.back_pay_person,0) can_pay_person,
nvl(no_pay.no_pay_money,0)+nvl(back_pay.back_pay_money,0) can_pay_money,
case
     when (nvl(all_pay.all_pay_person,0)=0)
          then '8'  --����ϸ
     when (nvl(no_pay.no_pay_person,0)=0 and nvl(back_pay.back_pay_person,0)=0 and nvl(all_pay.all_pay_person,0)>0)
          then '1'  --�ѻ���
     when (nvl(no_pay.no_pay_person,0)>0 or nvl(back_pay.back_pay_person,0)>0)
          then '0'  --������
     else '9'       --�����쳣
end pay_status,
case
    when ( nvl(apply_total_person,0) = nvl(all_pay.all_pay_person,0) and nvl(apply_total_money,0) = nvl(all_pay.all_pay_money,0) )
         then '1' --��������ϸ��ȫƥ��
    when ( nvl(apply_total_person,0) != nvl(all_pay.all_pay_person,0) and nvl(apply_total_money,0) != nvl(all_pay.all_pay_money,0))
         then '2' --���������ƥ��
    when ( nvl(apply_total_money,0) != nvl(all_pay.all_pay_money,0))
         then '3' --��ƥ��
    when ( nvl(apply_total_person,0) != nvl(all_pay.all_pay_person,0))
         then '4' --������ƥ��
    else '9'      --�����쳣
end match_status,
corp.id corp_id
from apply_money_erp info
left join bt_corp corp on corp.corp_code= info.corp_code
--������Ϣ���� ��˾����͹��ʱ����Ϊһ�飬�߼���Ψһ
left join
(
--��������ϸ�������
select apply_bill_no,corp_code,count(*) no_pay_person ,sum(amt) no_pay_money from erp_pay_dtl_info
where pay_type='4' and status=0
group by apply_bill_no,corp_code
) no_pay  on info.salary_no=no_pay.apply_bill_no and info.corp_code=no_pay.corp_code
left join
(
--��������ػ�ָ���˻���ϸ�������
select apply_bill_no,corp_code,count(*) back_pay_person,sum(amt) back_pay_money from erp_pay_dtl_info
where pay_type='4' and status in(-1,-10)
group by apply_bill_no,corp_code
) back_pay on info.salary_no=back_pay.apply_bill_no and info.corp_code=back_pay.corp_code
left join
(
--������ϸ�������
select apply_bill_no,corp_code,count(*) all_pay_person,sum(amt) all_pay_money from erp_pay_dtl_info
where pay_type='4'
group by apply_bill_no,corp_code
) all_pay on info.salary_no=all_pay.apply_bill_no and info.corp_code=all_pay.corp_code;
/




--�����˵�  ��������>>����>>��������ά��
--����

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '��������ά��', 'nis', 16, '/yhcs/YhTransTypeMade.jsp', '0', '0', '0', '0', 10, '����', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;

--�����˵�  ��������>>����>>�ͻ���������ά��
--����

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '�ͻ���������ά��', 'nis', 16, '/yhcs/yhTransTypeCustomer.do?operCode=1', '0', '0', '0', '0', 10, '����', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;

--�����˵�  ��������>>����>>�Զ�ƥ��
--����

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '�Զ�ƥ��', 'nis', 16, '/yhcs/yhMatchInfo.do?bz=1', '0', '0', '0', '0', 10, '����', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;
--�����˵�  ��������>>����>>�ֶ�ƥ��
--����

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '�ֶ�ƥ��', 'nis', 16, '/yhcs/yhMatchInfo.do?bz=0', '0', '0', '0', '0', 10, '����', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;

--�����˵�  ��������>>����>>�տ��¼�������ѯ
--����

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '�տ��¼�������ѯ', 'nis', 16, '/yhcs/yhMatchInfoDetail.do', '0', '0', '0', '0', 10, '����', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;


--������ͼ
create or replace view v_yh_match_info as
select yh_match_info.serial_id,
       yh_match_info.bank_acc,
       yh_match_info.acc_name,
       yh_match_info.bank_name,
       yh_match_info.opp_bank_acc,
       yh_match_info.opp_acc_name,
       yh_match_info.opp_bank_name,
       yh_match_info.cd_sign,
       yh_match_info.amt,
       yh_match_info.abs,
       yh_match_info.postscirpt,
       yh_match_info.trans_time,
       yh_match_info.match_id,
       yh_match_info.oa_send,
       yh_match_info.oa_confirm,
       yh_match_info.sap_accounting,
       yh_match_info.reverse1,
       yh_match_info.reverse2,
       yh_match_info.auto_match_status,
       yh_trans_type.auto_match need_auto_match,
       yh_trans_type.oa_confirm need_oa_confirm,
       yh_trans_type.sap_accounting need_sap_accounting,
       yh_trans_type.type_code,
       yh_match_info.VOUCHER_NO1,
       yh_match_info.RETURNTIME1
  from yh_match_info
  left join yh_trans_type_customer on yh_match_info.match_id=yh_trans_type_customer.id
  left join yh_trans_type on yh_trans_type.type_code=yh_trans_type_customer.type_code;
/


  insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('2', 'YS013', '����Ѻ��ؿ�', '0', '1', '1', '1', null, null, 'C', null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('7', 'YS011', '�Ź�ת��Ѻ��ؿ�', '0', '1', '1', '1', null, null, 'C', null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('9', 'YS999', 'δȷ���տ�', '0', '0', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('10', 'YS888', '���������տ�', '0', '0', '0', '0', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('3', 'YS007', '��Ӧ�̻ؿ�', '0', '1', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('4', 'YS008', 'Ӫҵ��', '0', '1', '0', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('5', 'YS005', '���Կ��ؿ�', '0', '0', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('6', 'YS004', 'POS�տ�', '0', '1', '0', '0', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('8', 'YS001', '�Ź�ת�˻ؿ�', '0', '1', '1', '1', 'Z001', null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('1', 'YS003', '���̻ؿ�', '0', '1', '1', '1', 'Z003', null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('ff8080813a63254c013a633849920001', 'YS014', 'ֽƤ�ؿ�', '0', '1', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('ff8080813a63254c013a6338a6640002', 'YS015', 'ֽƤת��Ѻ��ؿ�', '0', '1', '1', '1', null, null, 'C', null);
commit;
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('123', 'YS008', 'Ӫҵ��', '9006', '��������·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('124', 'YS008', 'Ӫҵ��', '9007', '�����������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('125', 'YS008', 'Ӫҵ��', '9008', '�����и����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('126', 'YS008', 'Ӫҵ��', '9009', '������ͭ�̵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('127', 'YS008', 'Ӫҵ��', '9010', '������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('128', 'YS008', 'Ӫҵ��', '9011', '���������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('129', 'YS008', 'Ӫҵ��', '9012', '������������', '811109696308093001', '������Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('130', 'YS008', 'Ӫҵ��', '9013', '�����н�̩��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('131', 'YS008', 'Ӫҵ��', '9014', '��������԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('132', 'YS008', 'Ӫҵ��', '9015', '�����й��޵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('133', 'YS008', 'Ӫҵ��', '9016', '��������ƽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('134', 'YS008', 'Ӫҵ��', '9017', '�����л��ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('135', 'YS008', 'Ӫҵ��', '9018', '�����л���', '413058377832', '���Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('136', 'YS008', 'Ӫҵ��', '9019', '��������ɽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('137', 'YS008', 'Ӫҵ��', '9020', '�����о�¥�ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('138', 'YS008', 'Ӫҵ��', '9021', '���������ŵ�', '413058377832', '���ŵ�Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('139', 'YS008', 'Ӫҵ��', '9022', '��������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('140', 'YS008', 'Ӫҵ��', '9023', '������Ⱥ�ڵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('141', 'YS008', 'Ӫҵ��', '9024', '��������β��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('142', 'YS008', 'Ӫҵ��', '9025', '�����б�ˮ���޵�', '111', 'Ӫҵ��', '1', null, null);
commit;
prompt 100 records committed...
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('143', 'YS008', 'Ӫҵ��', '9026', '�����в���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('144', 'YS008', 'Ӫҵ��', '9027', '�����н�Ե�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('145', 'YS008', 'Ӫҵ��', '9028', '��������ľ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('146', 'YS008', 'Ӫҵ��', '9029', '�������϶ɵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('147', 'YS008', 'Ӫҵ��', '9030', '��������᪵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('148', 'YS008', 'Ӫҵ��', '9031', '�����к�ǰ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('149', 'YS008', 'Ӫҵ��', '9032', '������ʡ����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('150', 'YS008', 'Ӫҵ��', '9033', '���������ȵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('151', 'YS008', 'Ӫҵ��', '9034', '�����а��ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('152', 'YS008', 'Ӫҵ��', '9035', '�����ж�ˮ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('153', 'YS008', 'Ӫҵ��', '9036', '�����б���������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('154', 'YS008', 'Ӫҵ��', '9037', '�����о���������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('155', 'YS008', 'Ӫҵ��', '9038', '�����ѧ�ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('156', 'YS008', 'Ӫҵ��', '9039', '���������ı���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('157', 'YS008', 'Ӫҵ��', '9040', '�����а����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('158', 'YS008', 'Ӫҵ��', '9041', '������ǰ���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('159', 'YS008', 'Ӫҵ��', '9042', '�����н�ͨ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('160', 'YS008', 'Ӫҵ��', '9043', '�����������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('161', 'YS008', 'Ӫҵ��', '9044', '�����г��ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('162', 'YS008', 'Ӫҵ��', '9045', '�����������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('163', 'YS008', 'Ӫҵ��', '9046', '�����и��ɵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('164', 'YS008', 'Ӫҵ��', '9047', '�������ʯɽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('165', 'YS008', 'Ӫҵ��', '9048', '��������Ǳ���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('166', 'YS008', 'Ӫҵ��', '9049', '�����й�ɽԷ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('167', 'YS008', 'Ӫҵ��', '9050', '��ƽ��������԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('168', 'YS008', 'Ӫҵ��', '9051', '��ƽ���ĺ׵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('169', 'YS008', 'Ӫҵ��', '9052', '��ƽ��ǰ����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('170', 'YS008', 'Ӫҵ��', '9053', '��ƽ�н�걹��ϵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('171', 'YS008', 'Ӫҵ��', '9054', '��ƽ��÷ɽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('172', 'YS008', 'Ӫҵ��', '9055', '��ƽ�л�վ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('173', 'YS008', 'Ӫҵ��', '9056', '��ƽ�г����㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('174', 'YS008', 'Ӫҵ��', '9057', '�����к����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('175', 'YS008', 'Ӫҵ��', '9058', '��ƽ�ж�Ϫ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('176', 'YS008', 'Ӫҵ��', '9059', '���廪�ȳǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('177', 'YS008', 'Ӫҵ��', '9060', '���������ĵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('178', 'YS008', 'Ӫҵ��', '9061', '���������޵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('179', 'YS008', 'Ӫҵ��', '9062', 'ʯʨ���˵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('180', 'YS008', 'Ӫҵ��', '9063', 'Ȫ����Ȫ���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('181', 'YS008', 'Ӫҵ��', '9064', '����������нֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('182', 'YS008', 'Ӫҵ��', '9065', '������Ϫ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('183', 'YS008', 'Ӫҵ��', '9066', '��������԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('184', 'YS008', 'Ӫҵ��', '9067', '�����ණ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('185', 'YS008', 'Ӫҵ��', '9068', '���������µ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('186', 'YS008', 'Ӫҵ��', '9069', '���������컨԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('187', 'YS008', 'Ӫҵ��', '9070', '������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('188', 'YS008', 'Ӫҵ��', '9071', '��������͵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('189', 'YS008', 'Ӫҵ��', '9072', '���������ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('190', 'YS008', 'Ӫҵ��', '9073', '�����п��ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('191', 'YS008', 'Ӫҵ��', '9074', '������������ó�ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('192', 'YS008', 'Ӫҵ��', '9075', 'Ȫ���лݰ�������·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('193', 'YS008', 'Ӫҵ��', '9076', '��걽�ó��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('194', 'YS008', 'Ӫҵ��', '9077', 'Ȫ���ж��ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('195', 'YS008', 'Ӫҵ��', '9078', '�����н���ˮ����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('196', 'YS008', 'Ӫҵ��', '9079', '��������԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('197', 'YS008', 'Ӫҵ��', '9080', '�����������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('198', 'YS008', 'Ӫҵ��', '9081', '�山�����ݵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('199', 'YS008', 'Ӫҵ��', '9082', '�山�����ʹ����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('200', 'YS008', 'Ӫҵ��', '9083', '�山����·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('201', 'YS008', 'Ӫҵ��', '9084', '��������ƺ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('202', 'YS008', 'Ӫҵ��', '9085', '�����������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('203', 'YS008', 'Ӫҵ��', '9086', '�山�������Y��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('204', 'YS008', 'Ӫҵ��', '9087', '������Э�ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('205', 'YS008', 'Ӫҵ��', '9088', '�ϰ����Ĺ����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('206', 'YS008', 'Ӫҵ��', '9089', '�山��˫����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('207', 'YS008', 'Ӫҵ��', '9090', '��ɿ�����۳ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('208', 'YS008', 'Ӫҵ��', '9091', '��ƽ�ش��ڵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('209', 'YS008', 'Ӫҵ��', '9092', '�ϰ�����ƺ��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('210', 'YS008', 'Ӫҵ��', '9093', '��������������ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('211', 'YS008', 'Ӫҵ��', '9094', '�뽭�غ�����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('212', 'YS008', 'Ӫҵ��', '9095', '�ɽ��ʱ���̶���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('213', 'YS008', 'Ӫҵ��', '9096', '�山���ո۵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('214', 'YS008', 'Ӫҵ��', '9097', '��ʢ����ʢ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('215', 'YS008', 'Ӫҵ��', '9098', '��̨�������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('216', 'YS008', 'Ӫҵ��', '9099', '��������ʯ���̵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('217', 'YS008', 'Ӫҵ��', '9100', '�뽭�غӶ���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('218', 'YS008', 'Ӫҵ��', '9101', '����������ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('219', 'YS008', 'Ӫҵ��', '9102', '�����������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('220', 'YS008', 'Ӫҵ��', '9103', '�������ϳ��ڵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('221', 'YS008', 'Ӫҵ��', '9104', '��ʢ����ʢ������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('222', 'YS008', 'Ӫҵ��', '9105', '�����⺽��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('223', 'YS008', 'Ӫҵ��', '9106', '��������ʯ�ӵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('224', 'YS008', 'Ӫҵ��', '9107', 'ɳƺ���������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('225', 'YS008', 'Ӫҵ��', '9108', '�山����ͷ�µ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('226', 'YS008', 'Ӫҵ��', '9109', 'ʯ��ɽ��³�ȵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('227', 'YS008', 'Ӫҵ��', '9110', '�������������ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('228', 'YS008', 'Ӫҵ��', '9111', '������˼����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('229', 'YS008', 'Ӫҵ��', '9112', 'ɳƺ��������·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('230', 'YS008', 'Ӫҵ��', '9113', '�����������ɳ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('231', 'YS008', 'Ӫҵ��', '9114', '����������·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('232', 'YS008', 'Ӫҵ��', '9115', '�ϰ����Ϻ���԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('233', 'YS008', 'Ӫҵ��', '9116', '�����л���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('234', 'YS008', 'Ӫҵ��', '9117', '�ϴ��������͹㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('235', 'YS008', 'Ӫҵ��', '9118', '���������¶�·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('236', 'YS008', 'Ӫҵ��', '9119', '�������������ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('237', 'YS008', 'Ӫҵ��', '9120', '�����к��ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('238', 'YS008', 'Ӫҵ��', '9121', '��������ص�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('239', 'YS008', 'Ӫҵ��', '9122', '�����к������޵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('240', 'YS008', 'Ӫҵ��', '9123', 'ɳƺ����ͯ���ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('241', 'YS008', 'Ӫҵ��', '9124', '�����гǺ�����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('242', 'YS008', 'Ӫҵ��', '9125', '��ƽ�����ع㳡��', '111', 'Ӫҵ��', '1', null, null);
commit;
prompt 200 records committed...
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('243', 'YS008', 'Ӫҵ��', '9126', 'ͭ���ع��������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('244', 'YS008', 'Ӫҵ��', '9127', '��ƽ����Ϫ�Ѻ�ܰԷ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('245', 'YS008', 'Ӫҵ��', '9128', '�������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('246', 'YS008', 'Ӫҵ��', '9129', '����֣�͵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('247', 'YS008', 'Ӫҵ��', '9130', 'ɳƺ������ï�������ĵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('248', 'YS008', 'Ӫҵ��', '9131', '�������ɹ���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('249', 'YS008', 'Ӫҵ��', '9132', '�潭����ŷ��԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('250', 'YS008', 'Ӫҵ��', '9133', '����������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('251', 'YS008', 'Ӫҵ��', '9134', '�����о�ס���⹫԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('252', 'YS008', 'Ӫҵ��', '9135', '������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('253', 'YS008', 'Ӫҵ��', '9136', '�ϰ�ˮͷ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('254', 'YS008', 'Ӫҵ��', '9137', '�ϰ������½ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('255', 'YS008', 'Ӫҵ��', '9138', '�����в������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('256', 'YS008', 'Ӫҵ��', '9139', '�����и��µ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('257', 'YS008', 'Ӫҵ��', '9140', 'Ȫ���и��ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('258', 'YS008', 'Ӫҵ��', '9141', '�����»���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('259', 'YS008', 'Ӫҵ��', '9142', '�山����ʥ��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('260', 'YS008', 'Ӫҵ��', '9143', '�山������·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('261', 'YS008', 'Ӫҵ��', '9144', '�����ж������ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('262', 'YS008', 'Ӫҵ��', '9145', '��������ó�㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('263', 'YS008', 'Ӫҵ��', '9146', '�Ϸ��б��ĵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('264', 'YS008', 'Ӫҵ��', '9147', '����������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('265', 'YS008', 'Ӫҵ��', '9148', '��������Դʱ���������ĵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('266', 'YS008', 'Ӫҵ��', '9149', '�Ϸ������ͽ�Դ������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('267', 'YS008', 'Ӫҵ��', '9150', '�Ϸ�����ɽ��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('268', 'YS008', 'Ӫҵ��', '9151', '�Ϸ���ʷ��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('269', 'YS008', 'Ӫҵ��', '9152', '�Ϸ���Ǳɽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('270', 'YS008', 'Ӫҵ��', '9153', '�Ϸ�������ɽ·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('271', 'YS008', 'Ӫҵ��', '9154', '������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('272', 'YS008', 'Ӫҵ��', '9155', '����������·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('273', 'YS008', 'Ӫҵ��', '9156', '������ɽˮ��԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('274', 'YS008', 'Ӫҵ��', '9157', '��̨�����ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('275', 'YS008', 'Ӫҵ��', '9158', 'Ȫ���е»����ϵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('276', 'YS008', 'Ӫҵ��', '9159', '�ϴ����ϴ�ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('277', 'YS008', 'Ӫҵ��', '9160', '�������˺ͽֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('278', 'YS008', 'Ӫҵ��', '9161', 'ɳƺ����˫����ʢ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('279', 'YS008', 'Ӫҵ��', '9162', 'ɳƺ�������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('280', 'YS008', 'Ӫҵ��', '9163', '�����н�ɽ��԰����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('281', 'YS008', 'Ӫҵ��', '9164', '������Դ�������ĵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('282', 'YS008', 'Ӫҵ��', '9165', '�����и����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('283', 'YS008', 'Ӫҵ��', '9166', '����������ʱ���㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('284', 'YS008', 'Ӫҵ��', '9167', '��ƽ�������۵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('285', 'YS008', 'Ӫҵ��', '9168', '��¡���ϳ�����㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('286', 'YS008', 'Ӫҵ��', '9169', '�����г���·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('287', 'YS008', 'Ӫҵ��', '9170', '���������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('288', 'YS008', 'Ӫҵ��', '9171', '�������������������ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('289', 'YS008', 'Ӫҵ��', '9172', '���������α�����Է��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('290', 'YS008', 'Ӫҵ��', '9173', 'ɳ�غ�ͼ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('291', 'YS008', 'Ӫҵ��', '9174', '�������ն��ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('292', 'YS008', 'Ӫҵ��', '9175', '������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('293', 'YS008', 'Ӫҵ��', '9176', '�ϰ������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('294', 'YS008', 'Ӫҵ��', '9177', '��ɿ���Ҽ�ֹ������ĵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('295', 'YS008', 'Ӫҵ��', '9178', '������˫�ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('296', 'YS008', 'Ӫҵ��', '9179', '�����������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('297', 'YS008', 'Ӫҵ��', '9180', '�Ϸ��к��޵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('298', 'YS008', 'Ӫҵ��', '9181', '���������͵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('299', 'YS008', 'Ӫҵ��', '9182', '�Ͼ��б����³ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('300', 'YS008', 'Ӫҵ��', '9183', '�ߺ����꼮ɽ·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('301', 'YS008', 'Ӫҵ��', '9184', '�����к���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('302', 'YS008', 'Ӫҵ��', '9185', '���������͹㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('303', 'YS008', 'Ӫҵ��', '9186', '�ٲ��������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('304', 'YS008', 'Ӫҵ��', '9187', '�����н����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('305', 'YS008', 'Ӫҵ��', '9188', '�Ϸ�������ӵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('306', 'YS008', 'Ӫҵ��', '9189', '�Ϸ���ͩ����·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('307', 'YS008', 'Ӫҵ��', '9190', '��ɽ����ɽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('308', 'YS008', 'Ӫҵ��', '9191', '��������ʯƺ�ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('309', 'YS008', 'Ӫҵ��', '9192', '������������ǹ㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('310', 'YS008', 'Ӫҵ��', '9193', '�������������ص�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('311', 'YS008', 'Ӫҵ��', '9194', '��ƽ��˳����ɽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('312', 'YS008', 'Ӫҵ��', '9195', '�����н����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('313', 'YS008', 'Ӫҵ��', '9196', '�Ϸ��з���ˮ���ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('314', 'YS008', 'Ӫҵ��', '9197', '�γ���������·������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('315', 'YS008', 'Ӫҵ��', '9198', '������ʤ��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('316', 'YS008', 'Ӫҵ��', '9199', '��������ɽ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('317', 'YS008', 'Ӫҵ��', '9200', '�����ж��нֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('318', 'YS008', 'Ӫҵ��', '9201', 'ʯ��ׯ�����Ĺ㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('319', 'YS008', 'Ӫҵ��', '9202', '��������ͷ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('320', 'YS008', 'Ӫҵ��', '9203', '������˫�ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('321', 'YS008', 'Ӫҵ��', '9204', '�����й��ڵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('322', 'YS008', 'Ӫҵ��', '9205', '֣���ж�̫��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('323', 'YS008', 'Ӫҵ��', '9206', '֣���д�ѧ·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('324', 'YS008', 'Ӫҵ��', '9207', '֣���д������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('325', 'YS008', 'Ӫҵ��', '9208', 'ɳƺ�����¼��ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('326', 'YS008', 'Ӫҵ��', '9209', '������ϼ���ɳǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('327', 'YS008', 'Ӫҵ��', '9210', '��ɽ���ɽ������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('328', 'YS008', 'Ӫҵ��', '9211', '�����ж���·���㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('329', 'YS008', 'Ӫҵ��', '9212', '�����б�����԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('330', 'YS008', 'Ӫҵ��', '9213', '�����л�������ص�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('331', 'YS008', 'Ӫҵ��', '9214', '�����п�Ԫ�����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('332', 'YS008', 'Ӫҵ��', '9215', '�ٲ����غ���·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('333', 'YS008', 'Ӫҵ��', '9216', '�����к������ѹ㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('334', 'YS008', 'Ӫҵ��', '9217', '�������ʻ����ƴ����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('335', 'YS008', 'Ӫҵ��', '9218', '��ƽ������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('336', 'YS008', 'Ӫҵ��', '9219', '�山���Ǻ�·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('337', 'YS008', 'Ӫҵ��', '9220', '��̨����ұ���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('338', 'YS008', 'Ӫҵ��', '9221', '�������𹵺ӵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('339', 'YS008', 'Ӫҵ��', '9222', '��̨��ǧ���ֵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('340', 'YS008', 'Ӫҵ��', '9223', '�����б���ְ�ʢ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('341', 'YS008', 'Ӫҵ��', '9224', '��ƽ�н����𶼵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('342', 'YS008', 'Ӫҵ��', '9225', '������������ţɽ�㳡��', '111', 'Ӫҵ��', '1', null, null);
commit;
prompt 300 records committed...
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('343', 'YS008', 'Ӫҵ��', '9226', '������ïҵ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('344', 'YS008', 'Ӫҵ��', '9227', '˳�����������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('345', 'YS008', 'Ӫҵ��', '9228', '�Ͼ��д󳧵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('346', 'YS008', 'Ӫҵ��', '9229', '�Ͼ����껨̨��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('347', 'YS008', 'Ӫҵ��', '9230', '��������ӵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('348', 'YS008', 'Ӫҵ��', '9231', '��������һ�ֱ������й㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('349', 'YS008', 'Ӫҵ��', '9232', '��Դ���Ĳ���', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('350', 'YS008', 'Ӫҵ��', '9233', '�����г��췽���ְ�ʢ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('351', 'YS008', 'Ӫҵ��', '9234', '֣���з�˳ǵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('352', 'YS008', 'Ӫҵ��', '9235', '����������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('353', 'YS008', 'Ӫҵ��', '9236', 'ʯ��ׯ���������޵�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('354', 'YS008', 'Ӫҵ��', '9237', '�������������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('355', 'YS008', 'Ӫҵ��', '9238', '���������ɶ�·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('356', 'YS008', 'Ӫҵ��', '9239', '�ɽ����ܵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('357', 'YS008', 'Ӫҵ��', '9240', '������˫����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('358', 'YS008', 'Ӫҵ��', '9241', '�ɶ����½��⻪�����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('359', 'YS008', 'Ӫҵ��', '9242', '�żҿ���������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('360', 'YS008', 'Ӫҵ��', '9243', '����ˮ����ɽ��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('361', 'YS008', 'Ӫҵ��', '9244', 'ʯ��ׯ����ʯ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('362', 'YS008', 'Ӫҵ��', '9245', '�������Ļ�԰��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('363', 'YS008', 'Ӫҵ��', '9246', '�山���𿪴����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('364', 'YS008', 'Ӫҵ��', '9247', '�山����������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('365', 'YS008', 'Ӫҵ��', '9248', '���������ּ���ҵ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('366', 'YS008', 'Ӫҵ��', '9249', '�����п�ƽ��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('367', 'YS008', 'Ӫҵ��', '9250', '��������������й㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('368', 'YS008', 'Ӫҵ��', '9251', '֣�������ݴ����', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('369', 'YS008', 'Ӫҵ��', '9252', 'Ȫ���н������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('370', 'YS008', 'Ӫҵ��', '9253', '������ϼ��̫��·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('371', 'YS008', 'Ӫҵ��', '9254', '�山���ǹ���ص�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('372', 'YS008', 'Ӫҵ��', '9255', 'ɳƺ������ѧ�Ǳ�·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('373', 'YS008', 'Ӫҵ��', '9256', '�ɶ��и�����·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('374', 'YS008', 'Ӫҵ��', '9257', 'ɳƺ���������ŵ�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('375', 'YS008', 'Ӫҵ��', '9258', '�����к�г·�Ϲص�', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('376', 'YS008', 'Ӫҵ��', '9259', '��ɽ���ɽ����������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('377', 'YS008', 'Ӫҵ��', '9260', '������ʢ����Դ��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('378', 'YS008', 'Ӫҵ��', '9261', '���Ƹ��н����·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('379', 'YS008', 'Ӫҵ��', '9262', '����·���㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('380', 'YS008', 'Ӫҵ��', '9263', '�����з���·��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('381', 'YS008', 'Ӫҵ��', '9264', '����������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('382', 'YS008', 'Ӫҵ��', '9265', '�����о���������㳡��', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('383', 'YS008', 'Ӫҵ��', '9266', '��������������', '111', 'Ӫҵ��', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('384', 'YS008', 'Ӫҵ��', '9267', '�����н�����·��', '111', 'Ӫҵ��', '1', null, null);
commit;

insert into FI_PARAM (id, param_code, param_name, param_value, rmk, col_add1, col_add2)
values (3, 'organization_detail', '��֯�ܹ�ͬ����Ϣ', '20121021', null, null, null);
insert into FI_PARAM (id, param_code, param_name, param_value, rmk, col_add1, col_add2)
values (4, 'syn_bis', 'ƥ����ʷ��ϸ���ͬ����ʱ��', '20121101', null, null, null);

insert into BT_EXT_FIELD_PROPERTY (id, ext_table_code, ext_field_code, component_label, default_value, ext_type, ext_values, is_required, is_readonly, view_sort, is_enabled)
values (5, 'BT_CORP', 'reverse14', 'SAP��˾����', null, '1', null, 0, 0, '04', 1);
insert into BT_EXT_FIELD_PROPERTY (id, ext_table_code, ext_field_code, component_label, default_value, ext_type, ext_values, is_required, is_readonly, view_sort, is_enabled)
values (4, 'BT_CORP', 'reverse13', 'SAP��˾����', null, '1', null, 0, 0, '03', 1);
commit;

update erp_pay_info set source_table_erp='EAS';
COMMIT;

update bt_corp set reverse10=1 where corp_code 
in('1001','1002','1003','1004','1005','1006','1007','1008','1009','1010','1011','1012','1013','1014','1015','1016','1017','8001','7001');

update bt_corp set reverse9=1 where corp_code 
not in('1001','1002','1003','1004','1005','1006','1007','1008','1009','1010','1011','1012','1013','1014','1015','1016','1017','8001','7001');
commit;

alter table BIS_GATHER_CMD modify erp_voucher_no varchar2(300);
alter table NIS_ALLOCATION_REQ modify erp_voucher_no varchar2(300);

create table bt_cash_flow
(
       id integer primary key,
       OA_business_type varchar(100), --OAҵ������
       OA_rmk varchar(2000),          --OAҵ����������
       SAP_cash_flow_code varchar(100),   --SAP�ֽ���������
       SAP_rmk varchar(2000)              --SAP�ֽ�������������
       
);

comment on column BT_CASH_FLOW.OA_BUSINESS_TYPE
  is 'OAҵ������';
comment on column BT_CASH_FLOW.OA_RMK
  is 'OAҵ����������';
comment on column BT_CASH_FLOW.SAP_CASH_FLOW_CODE
  is 'SAP�ֽ���������';
comment on column BT_CASH_FLOW.SAP_RMK
  is 'SAP�ֽ�������������';

  insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (1, 'FY002000', 'Ա��������ã����÷ѱ���', 'A53', '֧�������뾭Ӫ��йص��ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (2, 'FY004000', 'Ա��������ã�ҵ���д��ѱ���', 'A53', '֧�������뾭Ӫ��йص��ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (3, 'FY006000', 'Ա��������ã���ͨ������', 'A53', '֧�������뾭Ӫ��йص��ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (4, 'FY009000', 'Ա��������ã����ڽ�ͨ�ѱ���', 'A53', '֧�������뾭Ӫ��йص��ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (5, 'FY007000', 'Ա��������ã�Ա�����', 'A53', '֧�������뾭Ӫ��йص��ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (6, 'FY008000', 'Ա��������ã�Ա������-�����ֽ��', 'A53', '֧�������뾭Ӫ��йص��ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (7, 'FY008001', 'Ա��������ã�Ա������-��������', 'A53', '֧�������뾭Ӫ��йص��ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (8, 'FY012000', '�����������ͨ�÷���', 'A53', '֧�������뾭Ӫ��йص��ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (9, 'FY012001', '������������ŵ�ӹ������', 'A50', '������Ʒ����������֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (10, 'FY012002', '�����������Ա��������', 'A56', '֧����ְ���Լ�Ϊְ��֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (11, 'FY013000', 'ֱ�ӱ�����ͨ�÷���', 'A53', '֧�������뾭Ӫ��йص��ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (12, 'FY013001', 'ֱ�ӱ������ŵ�ӹ������', 'A50', '������Ʒ����������֧�����ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (13, 'FY013002', 'ֱ�ӱ�����Ա��������', 'A56', '֧����ְ���Լ�Ϊְ��֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (14, 'FY014000', 'Ԥ���˿Ԥ��ͨ�÷���', 'A53', '֧�������뾭Ӫ��йص��ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (15, 'FY014001', 'Ԥ���˿�ŵ�ӹ������', 'A50', '������Ʒ����������֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (16, 'FY014002', 'Ԥ���˿Ա��������', 'A56', '֧����ְ���Լ�Ϊְ��֧�����ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (17, 'FY014003', 'Ԥ���˿������Ԥ��', 'Z99', '���ֽ������޹�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (18, 'FY014004', '������Ѻ��', 'Z99', '���ֽ������޹�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (19, 'FY014005', '����Ӧ�տ�-��Ӧ��Ѻ��', 'Z99', '���ֽ������޹�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (20, 'FY015000', 'ͨ��Ա����ͨ�÷���', 'A53', '֧�������뾭Ӫ��йص��ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (21, 'FY015001', 'ͨ��Ա�����ŵ�ӹ������', 'A50', '������Ʒ����������֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (22, 'FY015002', 'ͨ��Ա����Ա��������', 'A56', '֧����ְ���Լ�Ϊְ��֧�����ֽ�');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (23, 'FY016000', 'ͨ��Ա����������ֽ��', 'A53', '֧�������뾭Ӫ��йص��ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (24, 'FY016001', 'ͨ��Ա�������������', 'A53', '֧�������뾭Ӫ��йص��ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (25, 'FY016002', 'ͨ��Ա������ŵ�ӹ����������-�����ֽ��', 'A50', '������Ʒ����������֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (26, 'FY016003', 'ͨ��Ա������ŵ�ӹ����������-��������', 'A50', '������Ʒ����������֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (27, 'FY016004', 'ͨ��Ա�����Ա��������--�����ֽ��', 'A56', '֧����ְ���Լ�Ϊְ��֧�����ֽ� ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (28, 'FY016005', 'ͨ��Ա�����Ա��������--��������', 'A56', '֧����ְ���Լ�Ϊְ��֧�����ֽ� ');
commit;





