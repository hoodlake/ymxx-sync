--修改时间2012-08-27
--修改人 田进
--修改内容 永辉超市从HR传组织信息到其它系统接口
create table  hr_organization_to_other
(
       PRIOX varchar(200),     --优先级
       TYPEID varchar(200),    --对象类型
       SELFID varchar(200) primary key,    --成本核算号
       NAME varchar(200),      --对象名称
       STARTTIME varchar(200), --开始日期
       ENDTIME varchar(200),   --结束日期
       AEDTM varchar(200),     --更改时间
       SSZZ varchar(200),      --所属组织(员工ORGEH)
       OMLEADER varchar(200),  --组织领导
       ISTAT varchar(200),     --计划状态 
       YZZLX varchar(200),     --组织类型
       SCLAS varchar(200),     --相关对象类型
       SUBTY varchar(200),     --子信息类型
       SOBID varchar(200),     --相关对象的标识
       KOSTL varchar(200),     --成本中心
       MCTXT varchar(200),     --为匹配码使用检索词
       BUKRS varchar(200),     --公司代码
       BUTXT varchar(200),     --公司代码或公司的名称
       PRCTR varchar(200),     --利润中心
       AUFNR varchar(200),     --订单号 
       YGITEM varchar(200) 
);
-- Add comments to the columns 
comment on column HR_ORGANIZATION_TO_OTHER.PRIOX
  is '优先级';
comment on column HR_ORGANIZATION_TO_OTHER.TYPEID
  is '对象类型';
comment on column HR_ORGANIZATION_TO_OTHER.SELFID
  is '成本核算号';
comment on column HR_ORGANIZATION_TO_OTHER.NAME
  is '对象名称';
comment on column HR_ORGANIZATION_TO_OTHER.STARTTIME
  is '开始日期';
comment on column HR_ORGANIZATION_TO_OTHER.ENDTIME
  is '结束日期';
comment on column HR_ORGANIZATION_TO_OTHER.AEDTM
  is '更改时间';
comment on column HR_ORGANIZATION_TO_OTHER.SSZZ
  is '所属组织(员工ORGEH)';
comment on column HR_ORGANIZATION_TO_OTHER.OMLEADER
  is '组织领导';
comment on column HR_ORGANIZATION_TO_OTHER.ISTAT
  is '计划状态 ';
comment on column HR_ORGANIZATION_TO_OTHER.YZZLX
  is '组织类型';
comment on column HR_ORGANIZATION_TO_OTHER.SCLAS
  is '相关对象类型';
comment on column HR_ORGANIZATION_TO_OTHER.SUBTY
  is '子信息类型';
comment on column HR_ORGANIZATION_TO_OTHER.SOBID
  is '相关对象的标识';
comment on column HR_ORGANIZATION_TO_OTHER.KOSTL
  is '成本中心';
comment on column HR_ORGANIZATION_TO_OTHER.MCTXT
  is '为匹配码使用检索词';
comment on column HR_ORGANIZATION_TO_OTHER.BUKRS
  is '公司代码';
comment on column HR_ORGANIZATION_TO_OTHER.BUTXT
  is '公司代码或公司的名称';
comment on column HR_ORGANIZATION_TO_OTHER.PRCTR
  is '利润中心';
comment on column HR_ORGANIZATION_TO_OTHER.AUFNR
  is '订单号 ';
comment on column HR_ORGANIZATION_TO_OTHER.YGITEM
  is '员工的ID列表';

  --修改时间2012-09-01
--修改人 田进
--修改内容 永辉超市从HR推送工资信息到资金系统和取消推送
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



--修改时间2012-08-27
--修改人 李德成
--修改内容  对公货款中间表
 
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
is 'SAP返回的消息类';
comment on column ERP_PAY_INFO.REVERSE4
is 'SAP返回的消息编号';
comment on column ERP_PAY_INFO.REVERSE1
  is 'SAP业务类型';
comment on column ERP_PAY_INFO.REVERSE2
  is 'SAP特别总账标识';


  --SAP对私接口
--修改时间2012-08-27
--修改人 李德成
--修改内容  修改单位表
alter table bt_corp add REVERSE13 VARCHAR2(200);
alter table bt_corp add REVERSE14 VARCHAR2(200);

--修改时间2012-08-27
--修改人 李德成
--修改内容  修改对私付款中间表
alter table ERP_PAY_DTL_INFO add REVERSE18 VARCHAR2(300);
alter table ERP_PAY_DTL_INFO add REVERSE19 VARCHAR2(300);
comment on column ERP_PAY_DTL_INFO.REVERSE18
is 'SAP返回的消息类';
comment on column ERP_PAY_DTL_INFO.REVERSE19
is 'SAP返回的消息编号';


  
--sap供应商
 
  --修改时间2012-08-27
--修改人 李德成
--修改内容  供应商账户表
  alter table BT_EXTERNAL_CORP_BANKACC add REVERSE1 VARCHAR2(200);
  comment on column BT_EXTERNAL_CORP_BANKACC.REVERSE1
  is 'SAP供应商账户组';

  

  --修改时间2012-08-27
--修改人 李德成
--修改内容  内部转账
  alter table NIS_ALLOCATION_REQ add REVERSE1 VARCHAR2(300);
  alter table NIS_ALLOCATION_REQ add REVERSE2 VARCHAR2(300);
  comment on column NIS_ALLOCATION_REQ.REVERSE1
  is 'SAP返回的消息类';
  comment on column NIS_ALLOCATION_REQ.REVERSE2
  is 'SAP返回的消息编号';


  --修改时间2012-08-27
--修改人 李德成
--修改内容  归集指令
  alter table BIS_GATHER_CMD add REVERSE11 VARCHAR2(300);
  alter table BIS_GATHER_CMD add REVERSE12 VARCHAR2(300);




--修改时间2012-08-27
--修改人 李德成
--修改内容 供应商视图增加返回字段bank_sourcecode
create or replace view v_bt_external_corp1001 as
select a.id,a.corp_id,a.external_code,b.external_acc,a.external_acc_name as external_corp,a.reverse3,a.from_status,b.bank,b.acc_province,b.acc_city,
b.bank_type,a.address,a.mobile,a.nation_code,b.bank_sourcecode
from bt_external_corp a ,bt_external_corp_bankacc b,r_external_corp_type c
where a.id=b.external_corp_id
and a.id=c.external_corp_id and c.type_code='1001';


--修改时间2012-08-27
--修改人 李德成
--修改内容 对公付款增加查询条件
CREATE OR REPLACE VIEW V_ERP_PAY_INFO_TRACK AS
SELECT
E.PAY_INFO_ID,P.CORP_CODE,P.CORP_NAME,E.BURSAR_BILL_NO,L.EXTERNAL_CODE,L.EXTERNAL_CORP,E.OPP_PROV,E.OPP_CITY,E.REC_DATE,E.APP_DATE,E.AMT,
N.PASS_DATE,N.ENTER_DATE,N.ADD_WORD,E.VOUCHER_NO_ERP,E.RETURN_TIME AS EAS_RETURN_TIME,E.RETURN_MSG AS
EAS_RETURN_MSG,E.FAS_RETURN_TIME,E.FAS_RETURN_MSG,S.RETURN_TIME,
S.RETURN_MSG,S.TRANS_TIME,
E.STATUS AS BILL_STATUS,
(
  CASE E.STATUS
       WHEN 0 THEN '待制单'
       WHEN -1 THEN '打回'
       WHEN -5 THEN '已冻结'
       WHEN -10 THEN '指令作废'
       ELSE '已制单'
       END
) AS BILL_STATUS_NAME,N.BILL_NO,A.STATUS AS APPROVE_STATUS,
(
  CASE
       WHEN A.STATUS >= 11 AND A.STATUS < 95 THEN '待审批'
       WHEN A.STATUS >= 95 THEN '审批通过'
       END
) AS APPROVE_STATUS_NAME,S.VOUCHER_STAT,
(
  CASE VOUCHER_STAT
       WHEN '0' THEN '成功'
       WHEN '1' THEN '等待查询'
       WHEN '2' THEN '银行处理失败'
       WHEN '3' THEN '已发送'
       WHEN '5' THEN '收付款数据不全'
       WHEN '6' THEN '待发送'
       WHEN '7' THEN '指令无效'
       WHEN '9' THEN '接口处理失败'
       END
) AS VOUCHER_STAT_NAME,
(
  CASE E.STATUS
       WHEN 98 THEN '失败'
       WHEN 99 THEN '成功'
       END
) AS CRETIFICATE_STATUS_NAME,E.ERP_STATUS,
(
  CASE E.ERP_STATUS
       WHEN 20 THEN '失败'
       WHEN 50 THEN '成功'
       END
) AS ERP_STATUS_NAME
  FROM ERP_PAY_INFO E
  LEFT JOIN BT_EXTERNAL_CORP L ON L.EXTERNAL_CODE = E.EXTERNAL_CODE 
LEFT JOIN NIS_BILLHEAD N ON N.ERP_PAY_INFO_ID = E.PAY_INFO_ID AND N.STATUS <> -2 and N.Is_Business='1'
LEFT JOIN BT_APPROVE_BUSINESS_RLZ A ON A.BILL_CODE = N.BILL_NO
LEFT JOIN BIS_EXC S ON S.CBS_BILL_NO = N.BILL_NO
LEFT JOIN BT_CORP P ON P.CORP_CODE = E.CORP_CODE;

--修改时间2012-08-27
--修改人 李德成
--修改内容 付款制单增加查询条件
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

--修改时间2012-08-27
--修改人 李德成
--修改内容 归集指令增加返回字段EAS
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
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 付方SAP公司代码
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 付方SAP公司名称
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 收方SAP公司代码
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 付方bt公司代码
FROM BIS_GATHER_CMD CMD,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE CMD.PARENT_ACC =ACC1.BANK_ACC
AND CMD.CHILD_ACC = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE9=1
AND CORP2.REVERSE9=1;



--修改时间2012-08-27
--修改人 李德成
--修改内容 归集指令增加返回字段SAP
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
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 付方SAP公司代码
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 付方SAP公司名称
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 收方SAP公司代码
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 付方bt公司代码
FROM BIS_GATHER_CMD CMD,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE CMD.PARENT_ACC =ACC1.BANK_ACC
AND CMD.CHILD_ACC = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE10=1
AND CORP2.REVERSE10=1;



--修改时间2012-08-27
--修改人 李德成
--修改内容 向SAP费用付款结果上传增加返回条件
CREATE OR REPLACE VIEW V_PAY_FEIYONG_RESULT_INFO AS
SELECT BIS.PAYER_ACC_NO AS PAYER_ACC,
       BIS.PAYER_ACC_NAME,
       (SELECT BALANCE_ACCOUNT FROM BT_BANK_ACC WHERE BANK_ACC=BIS.PAYER_ACC_NO) AS PAYER_BANK_CODE,--对应银行账户的结算科目字段
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
       ERP.OPP_ACC_NAME as opp_acc_name,--收款人户名
       ERP.OPP_CITY as opp_city,--收款人市
       ERP.OPP_BANK_ACC as opp_bank_acc,--收方银行账号
       ERP.OPP_BANK_CODE as opp_bank_code,--收方联行号
       ERP.OPP_PROV as opp_prov,--收方省
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
       PAYCORP.CORP_CODE as PAYER_CORP_CODE_BT,--add by lidch 2012-09-01 公司代码
       PAYCORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 付方SAP公司代码
       PAYCORP.REVERSE14 AS PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 付方SAP公司名称
       RECORP.REVERSE13 AS REAL_PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 付方SAP公司代码
       RECORP.REVERSE14 AS REAL_PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 付方SAP公司名称
       ERP.Reverse1 as TYPE_SAP, --add by lidch 2012-09-01 业务类型
       ERP.Reverse2 as NEWUM_SAP, --add by lidch 2012-09-01 特别总账标识
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





--修改时间2012-10-23
--修改人 李德成
--修改内容 向EAS内部转账增加返回字段
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
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 付方SAP公司代码
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 付方SAP公司名称
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 收方SAP公司代码
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 付方bt公司代码
FROM NIS_ALLOCATION_REQ NIS,BIS_EXC BIS,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE NIS.BILL_NO = BIS.CBS_BILL_NO
AND NIS.PAYEE_ACC_NO =ACC1.BANK_ACC
AND NIS.PAYER_ACC_NO = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE9=1
AND CORP2.REVERSE9=1;

--修改时间2012-10-23
--修改人 李德成
--修改内容 向SAP内部转账增加返回字段
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
CORP2.Reverse13 as PAYER_CORP_CODE_SAP,----add by lidch 2012-09-01 付方SAP公司代码
CORP2.Reverse14 as PAYER_CORP_NAME_SAP, ----add by lidch 2012-09-01 付方SAP公司名称
CORP1.Reverse13 as PAYEE_CORP_CODE_SAP, ----add by lidch 2012-09-01 收方SAP公司代码
CORP2.Corp_Code as PAYER_CORP_CODE_BT  ----add by lidch 2012-09-01 付方bt公司代码
FROM NIS_ALLOCATION_REQ NIS,BIS_EXC BIS,BT_BANK_ACC ACC1,BT_BANK_ACC ACC2,BT_CORP CORP1,BT_CORP CORP2
WHERE NIS.BILL_NO = BIS.CBS_BILL_NO
AND NIS.PAYEE_ACC_NO =ACC1.BANK_ACC
AND NIS.PAYER_ACC_NO = ACC2.BANK_ACC
AND ACC1.CORP_ID = CORP1.ID
AND ACC2.CORP_ID = CORP2.ID
AND CORP1.REVERSE10=1
AND CORP2.REVERSE10=1;





--修改时间2012-08-27
--修改人 李德成
--修改内容 向SAP对私付款结果上传增加返回字段
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
       PAYCORP.CORP_CODE as PAYER_CORP_CODE_BT,--add by lidch 2012-09-01 公司代码
       PAYCORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 付方SAP公司代码
       PAYCORP.REVERSE14 AS PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 付方SAP公司名称
       RECORP.REVERSE13 AS REAL_PAYER_CORP_CODE_SAP,
       RECORP.REVERSE14 AS REAL_PAYER_CORP_NAME_SAP,
       ERP.Reverse3 as TYPE_SAP, --add by lidch 2012-09-01 业务类型
       ERP.Reverse4 as NEWUM_SAP --add by lidch 2012-09-01 特别总账标识
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

   
   


--修改时间2012-08-27
--修改人 李德成
--修改内容 向SAP对公货款反馈结果上传增加返回字段
CREATE OR REPLACE VIEW V_PAY_RESULT_INFO AS
SELECT "PAYER_ACC","PAYER_ACC_NAME","PAYER_BANK_CODE","PAYER_BANK","TRANS_TIME","OP_NAME","VOUCHER_STAT","POSTSCRIPT","RETURN_MSG","BILL_NO","EXTERNAL_CODE","EXTERNAL_CORP","ACC_BOOK","BURSAR_BILL_NO","PAYER_CORP_CODE","PAYER_CORP","PAY_TYPE","AMT","TAXPAYER_CODE","TAXPAYER_NAME","REGION","STATUS","ERP_STATUS","REC_COST_CENTER_CODE","REC_COST_CENTER_NAME","PAY_INFO_ID","SOURCE_TABLE_ERP","REC_CORP_CODE","REC_CORP_NAME","ID","CUS_SON_ID","CUS_SON_NAME","CUS_PARENT_ID","CUS_PARENT_NAME","PAYER_CORP_CODE_SAP","PAYER_CORP_NAME_SAP","TYPE_SAP","NEWUM_SAP","PAYER_CORP_CODE_BT","REAL_PAYER_CORP_CODE_SAP","REAL_PAYER_CORP_NAME_SAP","REVERSE4","REVERSE5","BANKBOOK_NUM"
 FROM (
SELECT BIS.PAYER_ACC_NO AS PAYER_ACC,
       BIS.PAYER_ACC_NAME,
       (SELECT BALANCE_ACCOUNT FROM BT_BANK_ACC WHERE BANK_ACC=BIS.PAYER_ACC_NO) AS PAYER_BANK_CODE,--对应银行账户的结算科目字段
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
       PAYCORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 付方SAP公司代码
       PAYCORP.REVERSE14 AS PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 付方SAP公司名称
       PAYCORP.Corp_Code as PAYER_CORP_CODE_BT,--,--add by lidch 2012-09-01 公司代码
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
       ERP.Reverse1 as TYPE_SAP, --add by lidch 2012-09-01 业务类型
       ERP.Reverse2 as NEWUM_SAP, --add by lidch 2012-09-01 特别总账标识
       RECORP.REVERSE11 AS REC_CORP_CODE,
       RECORP.REVERSE12 AS REC_CORP_NAME,
       RECORP.REVERSE13 AS REAL_PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 付方SAP公司代码
       RECORP.REVERSE14 AS REAL_PAYER_CORP_NAME_SAP,--add by lidch 2012-09-01 付方SAP公司名称
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







--修改时间2012-08-30
--修改人 田进
--修改内容 永辉超市从HR传员工和员工银行卡信息到其它系统接口
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
  is '办公电话';
comment on column NIS_PERSONNEL_DETAIL.REVERSE6
  is '职务';
comment on column NIS_PERSONNEL_DETAIL.REVERSE8
  is '最后修改时间';
comment on column NIS_PERSONNEL_DETAIL.REVERSE9
  is 'email';
comment on column NIS_PERSONNEL_DETAIL.REVERSE10
  is '人事范围';
comment on column NIS_PERSONNEL_DETAIL.REVERSE11
  is '人事子范围';
comment on column NIS_PERSONNEL_DETAIL.REVERSE12
  is '主岗位';
comment on column NIS_PERSONNEL_DETAIL.REVERSE13
  is '员工组';
comment on column NIS_PERSONNEL_DETAIL.REVERSE14
  is '员工子组';
comment on column NIS_PERSONNEL_DETAIL.REVERSE15
  is 'IC号码';
comment on column NIS_PERSONNEL_DETAIL.REVERSE16
  is '成本中心';
comment on column NIS_PERSONNEL_DETAIL.REVERSE17
  is '组织单位';
comment on column NIS_PERSONNEL_DETAIL.BANK_TYPE
  is '银行类型';
comment on column NIS_PERSONNEL_DETAIL.ACC_NAME
  is '户名';




comment on column ERP_PAY_DTL_INFO.REVERSE11
  is '工资核算单位';
comment on column ERP_PAY_DTL_INFO.REVERSE12
  is '年份';
comment on column ERP_PAY_DTL_INFO.REVERSE13
  is '月份';
comment on column ERP_PAY_DTL_INFO.REVERSE14
  is '姓名';
comment on column ERP_PAY_DTL_INFO.REVERSE15
  is '操作人工号';
comment on column ERP_PAY_DTL_INFO.REVERSE16
  is '操作人姓名';
comment on column ERP_PAY_DTL_INFO.REVERSE17
  is '操作时间';
comment on column ERP_PAY_DTL_INFO.OA_CHECK_MESSAGE
  is 'OA双向交叉验证反回结果信息';
comment on column ERP_PAY_DTL_INFO.CASHFLOWCODE
  is '现金流量代码';


--修改日期 2012-09-04
--修改人 田进
--修改内容 新增加用款申请表 apply_money_erp
create table apply_money_erp
(
       id varchar(32) primary key,  
       apply_no varchar(32),    --申请单号
       salary_no varchar(200),               --工资编号
       salary_accounting_corp varchar(150), --工资核算单位
       salary_accountint_txt varchar(150),  --工资核算范围文件
       pay_date varchar(80),                 --支付日期
       use_quality varchar(150),            --用款性质
       apply_total_money number(15,2),      --申请总额
       apply_total_person number,           --申请总人数
       apply_person varchar(100),           --申请人
       examine_pass_date varchar(80),        --审批通过时间
       corp_code varchar(100),               --公司代码
       corp_name varchar(150),              --公司名称
       count_person number,                 --人数
       total_salary number(15,2),            --工资总额
       status varchar(40),                    --状态（0初始值，1已发放，-1打回，-2删除）
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
  is '申请单号';
comment on column APPLY_MONEY_ERP.SALARY_NO
  is '工资编号';
comment on column APPLY_MONEY_ERP.SALARY_ACCOUNTING_CORP
  is '工资核算单位';
comment on column APPLY_MONEY_ERP.SALARY_ACCOUNTINT_TXT
  is '工资核算范围文本';
comment on column APPLY_MONEY_ERP.PAY_DATE
  is '支付日期';
comment on column APPLY_MONEY_ERP.USE_QUALITY
  is '用款性质';
comment on column APPLY_MONEY_ERP.APPLY_TOTAL_MONEY
  is '申请总额';
comment on column APPLY_MONEY_ERP.APPLY_TOTAL_PERSON
  is '申请总人数';
comment on column APPLY_MONEY_ERP.APPLY_PERSON
  is '申请人';
comment on column APPLY_MONEY_ERP.EXAMINE_PASS_DATE
  is '审批通过时间';
comment on column APPLY_MONEY_ERP.CORP_CODE
  is '公司代码';
comment on column APPLY_MONEY_ERP.CORP_NAME
  is '公司名称';
comment on column APPLY_MONEY_ERP.COUNT_PERSON
  is '人数';
comment on column APPLY_MONEY_ERP.TOTAL_SALARY
  is '工资总额';
comment on column APPLY_MONEY_ERP.STATUS
  is '状态（0初始值，1已发放，-1打回，-2删除）';




comment on column ERP_PAY_INFO_FEIYONG.OA_CHECK_MESSAGE
  is 'OA双向交叉验证返回结束信息';

  comment on column ERP_PAY_INFO_FEIYONG.reverse5
  is '利润中心';







comment on column ERP_PAY_INFO_FEIYONG.REVERSE1
  is 'SAP业务类型';
comment on column ERP_PAY_INFO_FEIYONG.REVERSE2
  is 'SAP特别总账标识';
comment on column ERP_PAY_INFO_FEIYONG.REVERSE3
  is '消息，消息类';
comment on column ERP_PAY_INFO_FEIYONG.REVERSE4
  is '消息编号';
  




comment on column bt_corp.REVERSE13
  is 'sap公司代码';
comment on column bt_corp.REVERSE14
  is 'sap公司名称';




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
  is '交易类型编码';
comment on column YH_TRANS_TYPE_CUSTOMER.type_name
  is '交易类型名称';
comment on column YH_TRANS_TYPE_CUSTOMER.customer_code
  is '编号';
comment on column YH_TRANS_TYPE_CUSTOMER.customer_name
  is '名称';
comment on column YH_TRANS_TYPE_CUSTOMER.bank_acc
  is '账号';
comment on column YH_TRANS_TYPE_CUSTOMER.abs
  is '摘要';
comment on column YH_TRANS_TYPE_CUSTOMER.bank_direction
  is '账号方向: 1:本方;2对方';


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
  is '交易类型编码';
comment on column YH_TRANS_TYPE.type_name
  is '交易类型名称';
comment on column YH_TRANS_TYPE.type
  is '类别';
comment on column YH_TRANS_TYPE.auto_match
  is '自动匹配';
comment on column YH_TRANS_TYPE.oa_confirm
  is '是否oa认领';
comment on column YH_TRANS_TYPE.sap_accounting
  is '是否sap记账';
comment on column YH_TRANS_TYPE.sap_code
  is 'sap账户组编码';
comment on column YH_TRANS_TYPE.rmk
  is '备注';


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
  is '单据号';
comment on column YH_MATCH_INFO.bank_acc
  is '账号';
comment on column YH_MATCH_INFO.acc_name
  is '户名';
comment on column YH_MATCH_INFO.bank_name
  is '银行名称';
comment on column YH_MATCH_INFO.opp_bank_acc
  is '对方账号';
comment on column YH_MATCH_INFO.opp_acc_name
  is '对方户名';
comment on column YH_MATCH_INFO.opp_bank_name
  is '对方银行名称';
comment on column YH_MATCH_INFO.cd_sign
  is '收支属性 0:收；1支';
comment on column YH_MATCH_INFO.amt
  is '金额';
  comment on column YH_MATCH_INFO.status
  is '状态(1新增，2取消)';
comment on column YH_MATCH_INFO.abs
  is '摘要';
comment on column YH_MATCH_INFO.postscirpt
  is '附言';
comment on column YH_MATCH_INFO.trans_time
  is '交易日期';
comment on column YH_MATCH_INFO.match_id
  is '匹配信息id';
comment on column YH_MATCH_INFO.oa_send
  is '是否已发送OA 1：是；0：否 ；2：待发送';
comment on column YH_MATCH_INFO.oa_confirm
  is 'oa是否已认领  1：是；0：否 ；2：部分认领 ';
comment on column YH_MATCH_INFO.sap_accounting
  is 'sap记账  1：是；0：否；2：待记账';
  comment on column YH_MATCH_INFO.sap_accounting
  is '存放历史明细表的serial_id';
comment on column YH_MATCH_INFO.auto_match_status
  is '是否自动匹配；1：是;0否';
  comment on column YH_MATCH_INFO.voucher_no1
  is '凭证号1';
  comment on column YH_MATCH_INFO.voucher_no2
  is '凭证号2';
  comment on column YH_MATCH_INFO.returnTime1
  is '返回时间1';
  comment on column YH_MATCH_INFO.returnTime2
  is '返回时间2';
  comment on column YH_MATCH_INFO.returnStatus1
  is '返回状态1';
  comment on column YH_MATCH_INFO.returnStatus2
  is '返回状态2';
  comment on column YH_MATCH_INFO.returnMsg1
  is '返回消息1';
  comment on column YH_MATCH_INFO.returnMsg2
  is '返回消息2';


-- Create table
create table YH_MATCH_DTL_INFO
(
  id            VARCHAR2(32) not null,--uuid
  serial_id     VARCHAR2(32),--认领编号；主表的serail_id
  type_code     VARCHAR2(30),--收款类型代码
  type_name     VARCHAR2(100),--收款类型名称
  customer_code VARCHAR2(20),--客户编号
  customer_name VARCHAR2(150),--客户名称
  stores_code   VARCHAR2(20),--门店编号
  stores_name   VARCHAR2(100),--门店名称
  confirm_amt   NUMBER(15,2),--认领金额
  operator_code VARCHAR2(20),--认领人编号
  operator_name VARCHAR2(100),--认领人名称
  rmk           VARCHAR2(300),--备注
  confim_date   VARCHAR2(10),--认领日期字符yyyymmdd
  reverse1      VARCHAR2(100),--
  reverse2      VARCHAR2(100),--
  status      CHAR(1) default 0 --状态（0：确认待记账；1 已记账; 2:可以发送到sap记账）
);

comment on column YH_MATCH_DTL_INFO.id
  is 'uuid';
comment on column YH_MATCH_DTL_INFO.serial_id
  is '认领编号；主表的serail_id';
comment on column YH_MATCH_DTL_INFO.type_code
  is '收款类型代码';
comment on column YH_MATCH_DTL_INFO.type_name
  is '收款类型名称';
comment on column YH_MATCH_DTL_INFO.customer_code
  is '客户编号';
comment on column YH_MATCH_DTL_INFO.customer_name
  is '客户名称';
comment on column YH_MATCH_DTL_INFO.stores_code
  is '门店编号';
comment on column YH_MATCH_DTL_INFO.stores_name
  is '门店名称';
comment on column YH_MATCH_DTL_INFO.confirm_amt
  is '认领金额';
comment on column YH_MATCH_DTL_INFO.operator_code
  is '认领人编号';
comment on column YH_MATCH_DTL_INFO.operator_name
  is '认领人名称';
comment on column YH_MATCH_DTL_INFO.rmk
  is '备注';
comment on column YH_MATCH_DTL_INFO.confim_date
  is '认领日期字符yyyymmdd';
comment on column YH_MATCH_DTL_INFO.status
  is '状态（0：确认待记账；1 已记账; 2:可以发送到sap记账）';

ALTER TABLE yh_match_dtl_info ADD(voucher_no varchar(300));
ALTER TABLE yh_match_dtl_info ADD(returnTime date);
ALTER TABLE yh_match_dtl_info ADD(returnStatus varchar(300));
ALTER TABLE yh_match_dtl_info ADD(returnMsg varchar(300));
ALTER TABLE yh_match_dtl_info ADD(zsstatus char(1));

commit;


--修改时间 2012-09-30
--修改人 田进
--修改内容 增加永辉超市应收回款视图
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
  is '凭证号';
comment on column YH_MATCH_DTL_INFO.RETURNTIME
  is '调用时间';
comment on column YH_MATCH_DTL_INFO.RETURNSTATUS
  is '状态';
comment on column YH_MATCH_DTL_INFO.RETURNMSG
  is '返回消息';
comment on column YH_MATCH_DTL_INFO.ZSSTATUS
  is '招商收款是否成功(1为成功，2为失败)';


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
CORP.REVERSE13 AS PAYER_CORP_CODE_SAP,--add by lidch 2012-09-01 付方SAP公司代码
CORP.REVERSE14 AS PAYER_CORP_NAME_SAP --add by lidch 2012-09-01 付方SAP公司名称
FROM ERP_PAY_DTL_INFO DTL,BT_CORP CORP,NIS_PERSONNEL_DETAIL PERSON
WHERE DTL.CORP_CODE = CORP.CORP_CODE
AND   DTL.WORK_NO = PERSON.WORK_NO;



--新增菜单  网上银行>>付款>>工资用款单
--刘建武

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '工资用款单', 'nis', 15, '/fjyh/applyMoneyErpAction.do?method=goQueryApply', '0', '0', '0', '0', 10, '永辉', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;


--永辉超市新建工资用款申请单视图 v_apply_money_erp 
--刘建武

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
          then '8'  --无明细
     when (nvl(no_pay.no_pay_person,0)=0 and nvl(back_pay.back_pay_person,0)=0 and nvl(all_pay.all_pay_person,0)>0)
          then '1'  --已汇总
     when (nvl(no_pay.no_pay_person,0)>0 or nvl(back_pay.back_pay_person,0)>0)
          then '0'  --待汇总
     else '9'       --数据异常
end pay_status,
case
    when ( nvl(apply_total_person,0) = nvl(all_pay.all_pay_person,0) and nvl(apply_total_money,0) = nvl(all_pay.all_pay_money,0) )
         then '1' --人数与明细完全匹配
    when ( nvl(apply_total_person,0) != nvl(all_pay.all_pay_person,0) and nvl(apply_total_money,0) != nvl(all_pay.all_pay_money,0))
         then '2' --人数与金额都不匹配
    when ( nvl(apply_total_money,0) != nvl(all_pay.all_pay_money,0))
         then '3' --金额不匹配
    when ( nvl(apply_total_person,0) != nvl(all_pay.all_pay_person,0))
         then '4' --人数不匹配
    else '9'      --数据异常
end match_status,
corp.id corp_id
from apply_money_erp info
left join bt_corp corp on corp.corp_code= info.corp_code
--申请信息表以 公司代码和工资编号作为一组，逻辑上唯一
left join
(
--待汇总明细数及金额
select apply_bill_no,corp_code,count(*) no_pay_person ,sum(amt) no_pay_money from erp_pay_dtl_info
where pay_type='4' and status=0
group by apply_bill_no,corp_code
) no_pay  on info.salary_no=no_pay.apply_bill_no and info.corp_code=no_pay.corp_code
left join
(
--已审批打回或指令退回明细数及金额
select apply_bill_no,corp_code,count(*) back_pay_person,sum(amt) back_pay_money from erp_pay_dtl_info
where pay_type='4' and status in(-1,-10)
group by apply_bill_no,corp_code
) back_pay on info.salary_no=back_pay.apply_bill_no and info.corp_code=back_pay.corp_code
left join
(
--所有明细数及金额
select apply_bill_no,corp_code,count(*) all_pay_person,sum(amt) all_pay_money from erp_pay_dtl_info
where pay_type='4'
group by apply_bill_no,corp_code
) all_pay on info.salary_no=all_pay.apply_bill_no and info.corp_code=all_pay.corp_code;
/




--新增菜单  网上银行>>付款>>交易类型维护
--吴结兵

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '交易类型维护', 'nis', 16, '/yhcs/YhTransTypeMade.jsp', '0', '0', '0', '0', 10, '永辉', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;

--新增菜单  网上银行>>付款>>客户交易类型维护
--吴结兵

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '客户交易类型维护', 'nis', 16, '/yhcs/yhTransTypeCustomer.do?operCode=1', '0', '0', '0', '0', 10, '永辉', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;

--新增菜单  网上银行>>付款>>自动匹配
--吴结兵

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '自动匹配', 'nis', 16, '/yhcs/yhMatchInfo.do?bz=1', '0', '0', '0', '0', 10, '永辉', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;
--新增菜单  网上银行>>付款>>手动匹配
--吴结兵

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '手动匹配', 'nis', 16, '/yhcs/yhMatchInfo.do?bz=0', '0', '0', '0', '0', 10, '永辉', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;

--新增菜单  网上银行>>付款>>收款记录及认领查询
--吴结兵

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code)+1 from bt_sys_res), '收款记录及认领查询', 'nis', 16, '/yhcs/yhMatchInfoDetail.do', '0', '0', '0', '0', 10, '永辉', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;


--增加视图
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
values ('2', 'YS013', '招商押金回款', '0', '1', '1', '1', null, null, 'C', null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('7', 'YS011', '团购转账押金回款', '0', '1', '1', '1', null, null, 'C', null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('9', 'YS999', '未确认收款', '0', '0', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('10', 'YS888', '其他类型收款', '0', '0', '0', '0', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('3', 'YS007', '供应商回款', '0', '1', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('4', 'YS008', '营业款', '0', '1', '0', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('5', 'YS005', '永辉卡回款', '0', '0', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('6', 'YS004', 'POS收款', '0', '1', '0', '0', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('8', 'YS001', '团购转账回款', '0', '1', '1', '1', 'Z001', null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('1', 'YS003', '招商回款', '0', '1', '1', '1', 'Z003', null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('ff8080813a63254c013a633849920001', 'YS014', '纸皮回款', '0', '1', '1', '1', null, null, null, null);
insert into YH_TRANS_TYPE (id, type_code, type_name, type, auto_match, oa_confirm, sap_accounting, sap_code, rmk, reverse1, reverse2)
values ('ff8080813a63254c013a6338a6640002', 'YS015', '纸皮转账押金回款', '0', '1', '1', '1', null, null, 'C', null);
commit;
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('123', 'YS008', '营业款', '9006', '福州市铁路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('124', 'YS008', '营业款', '9007', '福州市西洪店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('125', 'YS008', '营业款', '9008', '福州市福屿店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('126', 'YS008', '营业款', '9009', '福州市铜盘店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('127', 'YS008', '营业款', '9010', '福州市屏西店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('128', 'YS008', '营业款', '9011', '福州市西门店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('129', 'YS008', '营业款', '9012', '福州市黎明店', '811109696308093001', '黎明店营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('130', 'YS008', '营业款', '9013', '福州市津泰店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('131', 'YS008', '营业款', '9014', '福州市象园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('132', 'YS008', '营业款', '9015', '福州市国棉店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('133', 'YS008', '营业款', '9016', '福州市中平店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('134', 'YS008', '营业款', '9017', '福州市华林店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('135', 'YS008', '营业款', '9018', '福州市汇达店', '413058377832', '汇达营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('136', 'YS008', '营业款', '9019', '福州市屏山店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('137', 'YS008', '营业款', '9020', '福州市井楼门店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('138', 'YS008', '营业款', '9021', '福州市杨桥店', '413058377832', '杨桥店营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('139', 'YS008', '营业款', '9022', '闽侯甘蔗店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('140', 'YS008', '营业款', '9023', '福州市群众店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('141', 'YS008', '营业款', '9024', '福州市马尾店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('142', 'YS008', '营业款', '9025', '福州市碧水芳洲店', '111', '营业款', '1', null, null);
commit;
prompt 100 records committed...
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('143', 'YS008', '营业款', '9026', '福州市茶会店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('144', 'YS008', '营业款', '9027', '福州市金辉店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('145', 'YS008', '营业款', '9028', '福州市三木店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('146', 'YS008', '营业款', '9029', '福州市上渡店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('147', 'YS008', '营业款', '9030', '福州市琅岐店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('148', 'YS008', '营业款', '9031', '福州市湖前店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('149', 'YS008', '营业款', '9032', '福州市省府店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('150', 'YS008', '营业款', '9033', '福州市融侨店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('151', 'YS008', '营业款', '9034', '福州市澳门店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('152', 'YS008', '营业款', '9035', '福州市东水店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('153', 'YS008', '营业款', '9036', '福州市滨江丽景店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('154', 'YS008', '营业款', '9037', '福州市君临闽江店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('155', 'YS008', '营业款', '9038', '闽侯大学城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('156', 'YS008', '营业款', '9039', '福州市五四北店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('157', 'YS008', '营业款', '9040', '福州市白马店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('158', 'YS008', '营业款', '9041', '福州市前屿店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('159', 'YS008', '营业款', '9042', '福州市交通店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('160', 'YS008', '营业款', '9043', '福州市岳峰店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('161', 'YS008', '营业款', '9044', '福州市城门店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('162', 'YS008', '营业款', '9045', '福州市鳌峰店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('163', 'YS008', '营业款', '9046', '福州市福飞店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('164', 'YS008', '营业款', '9047', '闽侯县昙石山店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('165', 'YS008', '营业款', '9048', '莆田市荔城北店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('166', 'YS008', '营业款', '9049', '福州市鼓山苑店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('167', 'YS008', '营业款', '9050', '南平市体育公园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('168', 'YS008', '营业款', '9051', '南平市四鹤店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('169', 'YS008', '营业款', '9052', '南平市前进店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('170', 'YS008', '营业款', '9053', '南平市建瓯管葡店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('171', 'YS008', '营业款', '9054', '南平市梅山店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('172', 'YS008', '营业款', '9055', '南平市火车站店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('173', 'YS008', '营业款', '9056', '南平市长富广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('174', 'YS008', '营业款', '9057', '厦门市海天店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('175', 'YS008', '营业款', '9058', '南平市东溪店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('176', 'YS008', '营业款', '9059', '闽清华侨城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('177', 'YS008', '营业款', '9060', '永安市五四店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('178', 'YS008', '营业款', '9061', '永安市五洲店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('179', 'YS008', '营业款', '9062', '石狮振兴店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('180', 'YS008', '营业款', '9063', '泉州市泉秀店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('181', 'YS008', '营业款', '9064', '福清成龙步行街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('182', 'YS008', '营业款', '9065', '福清桥溪店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('183', 'YS008', '营业款', '9066', '福州市新园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('184', 'YS008', '营业款', '9067', '闽清坂东店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('185', 'YS008', '营业款', '9068', '福州市浦新店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('186', 'YS008', '营业款', '9069', '福清市兰天花园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('187', 'YS008', '营业款', '9070', '厦门市岳阳店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('188', 'YS008', '营业款', '9071', '厦门市祥和店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('189', 'YS008', '营业款', '9072', '厦门市西林店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('190', 'YS008', '营业款', '9073', '厦门市康乐店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('191', 'YS008', '营业款', '9074', '福清市兰天商贸城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('192', 'YS008', '营业款', '9075', '泉州市惠安建设南路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('193', 'YS008', '营业款', '9076', '建瓯建贸店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('194', 'YS008', '营业款', '9077', '泉州市东街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('195', 'YS008', '营业款', '9078', '福州市江南水都店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('196', 'YS008', '营业款', '9079', '福州市西园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('197', 'YS008', '营业款', '9080', '江北区观音桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('198', 'YS008', '营业款', '9081', '渝北区加州店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('199', 'YS008', '营业款', '9082', '渝北区东和春天店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('200', 'YS008', '营业款', '9083', '渝北区两路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('201', 'YS008', '营业款', '9084', '渝中区大坪店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('202', 'YS008', '营业款', '9085', '江北区五里店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('203', 'YS008', '营业款', '9086', '渝北区黄泥塝店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('204', 'YS008', '营业款', '9087', '长寿区协信店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('205', 'YS008', '营业款', '9088', '南岸区四公里店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('206', 'YS008', '营业款', '9089', '渝北区双龙店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('207', 'YS008', '营业款', '9090', '大渡口区香港城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('208', 'YS008', '营业款', '9091', '梁平县大众店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('209', 'YS008', '营业款', '9092', '南岸区南坪东路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('210', 'YS008', '营业款', '9093', '九龙坡区西城天街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('211', 'YS008', '营业款', '9094', '綦江县河西店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('212', 'YS008', '营业款', '9095', '璧山县时代商都店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('213', 'YS008', '营业款', '9096', '渝北区空港店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('214', 'YS008', '营业款', '9097', '万盛区民盛店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('215', 'YS008', '营业款', '9098', '丰台区六里桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('216', 'YS008', '营业款', '9099', '九龙坡区石桥铺店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('217', 'YS008', '营业款', '9100', '綦江县河东店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('218', 'YS008', '营业款', '9101', '渝中区白象街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('219', 'YS008', '营业款', '9102', '渝中区储奇门店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('220', 'YS008', '营业款', '9103', '渝中区较场口店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('221', 'YS008', '营业款', '9104', '万盛区万盛名都店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('222', 'YS008', '营业款', '9105', '长乐吴航店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('223', 'YS008', '营业款', '9106', '江北区大石坝店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('224', 'YS008', '营业款', '9107', '沙坪坝区天星桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('225', 'YS008', '营业款', '9108', '渝北区龙头寺店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('226', 'YS008', '营业款', '9109', '石景山区鲁谷店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('227', 'YS008', '营业款', '9110', '福清龙田龙安街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('228', 'YS008', '营业款', '9111', '厦门市思东店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('229', 'YS008', '营业款', '9112', '沙坪坝区汉渝路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('230', 'YS008', '营业款', '9113', '福州市闽侯白沙店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('231', 'YS008', '营业款', '9114', '万州区王牌路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('232', 'YS008', '营业款', '9115', '南岸区南湖花园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('233', 'YS008', '营业款', '9116', '福清中环店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('234', 'YS008', '营业款', '9117', '合川区金世纪广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('235', 'YS008', '营业款', '9118', '江北区建新东路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('236', 'YS008', '营业款', '9119', '北碚区天生丽街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('237', 'YS008', '营业款', '9120', '福州市鹤林店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('238', 'YS008', '营业款', '9121', '开县新天地店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('239', 'YS008', '营业款', '9122', '厦门市海沧禹洲店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('240', 'YS008', '营业款', '9123', '沙坪坝区童家桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('241', 'YS008', '营业款', '9124', '莆田市城涵东店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('242', 'YS008', '营业款', '9125', '梁平县西池广场店', '111', '营业款', '1', null, null);
commit;
prompt 200 records committed...
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('243', 'YS008', '营业款', '9126', '铜梁县广龙明珠店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('244', 'YS008', '营业款', '9127', '南平市松溪佳禾馨苑店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('245', 'YS008', '营业款', '9128', '宁化龙门店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('246', 'YS008', '营业款', '9129', '长乐郑和店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('247', 'YS008', '营业款', '9130', '沙坪坝区嘉茂购物中心店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('248', 'YS008', '营业款', '9131', '大兴区旧宫店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('249', 'YS008', '营业款', '9132', '垫江县西欧花园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('250', 'YS008', '营业款', '9133', '漳州市龙海角美店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('251', 'YS008', '营业款', '9134', '福州市居住主题公园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('252', 'YS008', '营业款', '9135', '莆田市天九湾店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('253', 'YS008', '营业款', '9136', '南安水头店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('254', 'YS008', '营业款', '9137', '南岸区弹新街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('255', 'YS008', '营业款', '9138', '忠县中博大道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('256', 'YS008', '营业款', '9139', '福州市福新店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('257', 'YS008', '营业款', '9140', '泉州市浮桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('258', 'YS008', '营业款', '9141', '福安新华店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('259', 'YS008', '营业款', '9142', '渝北区宝圣西路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('260', 'YS008', '营业款', '9143', '渝北区武陵路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('261', 'YS008', '营业款', '9144', '福州市东方名城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('262', 'YS008', '营业款', '9145', '万州区国贸广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('263', 'YS008', '营业款', '9146', '合肥市宝文店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('264', 'YS008', '营业款', '9147', '巴南区人民广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('265', 'YS008', '营业款', '9148', '江北区金源时代购物中心店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('266', 'YS008', '营业款', '9149', '合肥市世纪金源滨湖店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('267', 'YS008', '营业款', '9150', '合肥市马鞍山南路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('268', 'YS008', '营业款', '9151', '合肥市史河路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('269', 'YS008', '营业款', '9152', '合肥市潜山店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('270', 'YS008', '营业款', '9153', '合肥市武里山路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('271', 'YS008', '营业款', '9154', '厦门市新阳店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('272', 'YS008', '营业款', '9155', '海淀区增光路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('273', 'YS008', '营业款', '9156', '朝阳区山水文园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('274', 'YS008', '营业款', '9157', '丰台区草桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('275', 'YS008', '营业款', '9158', '泉州市德化兴南店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('276', 'YS008', '营业款', '9159', '南川区南大街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('277', 'YS008', '营业款', '9160', '渝中区人和街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('278', 'YS008', '营业款', '9161', '沙坪坝区双碑鼎盛店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('279', 'YS008', '营业款', '9162', '沙坪坝区新桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('280', 'YS008', '营业款', '9163', '福州市金山公园道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('281', 'YS008', '营业款', '9164', '贵阳市源购物中心店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('282', 'YS008', '营业款', '9165', '福州市福湾店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('283', 'YS008', '营业款', '9166', '莆田市正荣时代广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('284', 'YS008', '营业款', '9167', '昌平区回龙观店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('285', 'YS008', '营业款', '9168', '武隆县南城中央广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('286', 'YS008', '营业款', '9169', '池州市长江路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('287', 'YS008', '营业款', '9170', '巴南区土桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('288', 'YS008', '营业款', '9171', '北碚区文星湾旺德旺城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('289', 'YS008', '营业款', '9172', '莆田市仙游滨江嘉苑店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('290', 'YS008', '营业款', '9173', '沙县鸿图店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('291', 'YS008', '营业款', '9174', '将乐日照东门店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('292', 'YS008', '营业款', '9175', '江北区望江店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('293', 'YS008', '营业款', '9176', '南岸区万达广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('294', 'YS008', '营业款', '9177', '大渡口区壹街购物中心店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('295', 'YS008', '营业款', '9178', '朝阳区双桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('296', 'YS008', '营业款', '9179', '东城区恒基店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('297', 'YS008', '营业款', '9180', '合肥市海洲店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('298', 'YS008', '营业款', '9181', '北辰区集贤店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('299', 'YS008', '营业款', '9182', '南京市滨江新城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('300', 'YS008', '营业款', '9183', '芜湖市陵籍山路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('301', 'YS008', '营业款', '9184', '贵阳市恒峰店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('302', 'YS008', '营业款', '9185', '巴南区都和广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('303', 'YS008', '营业款', '9186', '荣昌县莲花广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('304', 'YS008', '营业款', '9187', '福州市金祥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('305', 'YS008', '营业款', '9188', '合肥市四里河店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('306', 'YS008', '营业款', '9189', '合肥市桐城南路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('307', 'YS008', '营业款', '9190', '秀山县秀山店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('308', 'YS008', '营业款', '9191', '九龙坡区石坪桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('309', 'YS008', '营业款', '9192', '莆田市仙游鲤城广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('310', 'YS008', '营业款', '9193', '漳州市龙海龙池店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('311', 'YS008', '营业款', '9194', '南平市顺昌中山店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('312', 'YS008', '营业款', '9195', '厦门市金湖店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('313', 'YS008', '营业款', '9196', '合肥市肥西水晶城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('314', 'YS008', '营业款', '9197', '盐城市人民中路宝龙店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('315', 'YS008', '营业款', '9198', '蚌埠市胜利路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('316', 'YS008', '营业款', '9199', '福州市首山店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('317', 'YS008', '营业款', '9200', '沈阳市东中街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('318', 'YS008', '营业款', '9201', '石家庄市民心广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('319', 'YS008', '营业款', '9202', '朝阳区垡头店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('320', 'YS008', '营业款', '9203', '北辰区双街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('321', 'YS008', '营业款', '9204', '贵阳市贵乌店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('322', 'YS008', '营业款', '9205', '郑州市东太康路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('323', 'YS008', '营业款', '9206', '郑州市大学路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('324', 'YS008', '营业款', '9207', '郑州市大岗刘店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('325', 'YS008', '营业款', '9208', '沙坪坝区陈家桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('326', 'YS008', '营业款', '9209', '宁德市霞浦松城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('327', 'YS008', '营业款', '9210', '白山市松江河万达广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('328', 'YS008', '营业款', '9211', '大庆市东风路万达广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('329', 'YS008', '营业款', '9212', '沈阳市碧塘公园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('330', 'YS008', '营业款', '9213', '沈阳市华府新天地店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('331', 'YS008', '营业款', '9214', '洛阳市开元大道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('332', 'YS008', '营业款', '9215', '荣昌县沿河中路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('333', 'YS008', '营业款', '9216', '莆田市涵江华友广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('334', 'YS008', '营业款', '9217', '遵义市仁怀国酒大道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('335', 'YS008', '营业款', '9218', '昌平区龙旗广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('336', 'YS008', '营业款', '9219', '渝北区星湖路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('337', 'YS008', '营业款', '9220', '丰台区马家堡店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('338', 'YS008', '营业款', '9221', '海淀区金沟河店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('339', 'YS008', '营业款', '9222', '丰台区千禧街店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('340', 'YS008', '营业款', '9223', '常州市北大街百盛店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('341', 'YS008', '营业款', '9224', '南平市建阳金都店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('342', 'YS008', '营业款', '9225', '福州市连江金牛山广场店', '111', '营业款', '1', null, null);
commit;
prompt 300 records committed...
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('343', 'YS008', '营业款', '9226', '常州市茂业店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('344', 'YS008', '营业款', '9227', '顺义区新世界店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('345', 'YS008', '营业款', '9228', '南京市大厂店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('346', 'YS008', '营业款', '9229', '南京市雨花台店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('347', 'YS008', '营业款', '9230', '海淀区清河店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('348', 'YS008', '营业款', '9231', '新乡市新一街宝龙城市广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('349', 'YS008', '营业款', '9232', '济源市文昌店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('350', 'YS008', '营业款', '9233', '苏州市常熟方塔街百盛店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('351', 'YS008', '营业款', '9234', '郑州市凤凰城店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('352', 'YS008', '营业款', '9235', '三明市清流雁塔店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('353', 'YS008', '营业款', '9236', '石家庄市西美五洲店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('354', 'YS008', '营业款', '9237', '九龙坡区民生广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('355', 'YS008', '营业款', '9238', '沈阳市沈辽东路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('356', 'YS008', '营业款', '9239', '璧山县青杠店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('357', 'YS008', '营业款', '9240', '云阳县双江店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('358', 'YS008', '营业款', '9241', '成都市温江光华大道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('359', 'YS008', '营业款', '9242', '张家口市宣化店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('360', 'YS008', '营业款', '9243', '六盘水市钟山中路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('361', 'YS008', '营业款', '9244', '石家庄市新石店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('362', 'YS008', '营业款', '9245', '海淀区文慧园店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('363', 'YS008', '营业款', '9246', '渝北区金开大道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('364', 'YS008', '营业款', '9247', '渝北区金渝大道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('365', 'YS008', '营业款', '9248', '大连市天津街佳兆业店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('366', 'YS008', '营业款', '9249', '长春市宽平大路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('367', 'YS008', '营业款', '9250', '福州市新天宇城市广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('368', 'YS008', '营业款', '9251', '郑州市中州大道店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('369', 'YS008', '营业款', '9252', '泉州市晋江万达广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('370', 'YS008', '营业款', '9253', '宁德市霞浦太康路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('371', 'YS008', '营业款', '9254', '渝北区星光天地店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('372', 'YS008', '营业款', '9255', '沙坪坝区大学城北路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('373', 'YS008', '营业款', '9256', '成都市抚琴南路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('374', 'YS008', '营业款', '9257', '沙坪坝区联芳桥店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('375', 'YS008', '营业款', '9258', '新乡市和谐路南关店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('376', 'YS008', '营业款', '9259', '白山市松江河南区万达广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('377', 'YS008', '营业款', '9260', '长寿区盛世桃源店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('378', 'YS008', '营业款', '9261', '连云港市解放中路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('379', 'YS008', '营业款', '9262', '沈阳路万达广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('380', 'YS008', '营业款', '9263', '苏州市枫桥路店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('381', 'YS008', '营业款', '9264', '漳州市漳浦龙湖店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('382', 'YS008', '营业款', '9265', '漳州市九龙大道万达广场店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('383', 'YS008', '营业款', '9266', '温州市龙湾万达店', '111', '营业款', '1', null, null);
insert into YH_TRANS_TYPE_CUSTOMER (id, type_code, type_name, customer_code, customer_name, bank_acc, abs, bank_direction, reverse1, reverse2)
values ('384', 'YS008', '营业款', '9267', '淮安市健康东路店', '111', '营业款', '1', null, null);
commit;

insert into FI_PARAM (id, param_code, param_name, param_value, rmk, col_add1, col_add2)
values (3, 'organization_detail', '组织架构同步信息', '20121021', null, null, null);
insert into FI_PARAM (id, param_code, param_name, param_value, rmk, col_add1, col_add2)
values (4, 'syn_bis', '匹配历史明细最后同步的时间', '20121101', null, null, null);

insert into BT_EXT_FIELD_PROPERTY (id, ext_table_code, ext_field_code, component_label, default_value, ext_type, ext_values, is_required, is_readonly, view_sort, is_enabled)
values (5, 'BT_CORP', 'reverse14', 'SAP公司名称', null, '1', null, 0, 0, '04', 1);
insert into BT_EXT_FIELD_PROPERTY (id, ext_table_code, ext_field_code, component_label, default_value, ext_type, ext_values, is_required, is_readonly, view_sort, is_enabled)
values (4, 'BT_CORP', 'reverse13', 'SAP公司代码', null, '1', null, 0, 0, '03', 1);
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
       OA_business_type varchar(100), --OA业务类型
       OA_rmk varchar(2000),          --OA业务类型描述
       SAP_cash_flow_code varchar(100),   --SAP现金流量代码
       SAP_rmk varchar(2000)              --SAP现金流量代码描述
       
);

comment on column BT_CASH_FLOW.OA_BUSINESS_TYPE
  is 'OA业务类型';
comment on column BT_CASH_FLOW.OA_RMK
  is 'OA业务类型描述';
comment on column BT_CASH_FLOW.SAP_CASH_FLOW_CODE
  is 'SAP现金流量代码';
comment on column BT_CASH_FLOW.SAP_RMK
  is 'SAP现金流量代码描述';

  insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (1, 'FY002000', '员工三项费用：差旅费报销', 'A53', '支付其他与经营活动有关的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (2, 'FY004000', '员工三项费用：业务招待费报销', 'A53', '支付其他与经营活动有关的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (3, 'FY006000', '员工三项费用：交通卡报销', 'A53', '支付其他与经营活动有关的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (4, 'FY009000', '员工三项费用：市内交通费报销', 'A53', '支付其他与经营活动有关的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (5, 'FY007000', '员工三项费用：员工借款', 'A53', '支付其他与经营活动有关的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (6, 'FY008000', '员工三项费用：员工还款-报销抵借款', 'A53', '支付其他与经营活动有关的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (7, 'FY008001', '员工三项费用：员工还款-自主还款', 'A53', '支付其他与经营活动有关的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (8, 'FY012000', '先申请后报销：通用费用', 'A53', '支付其他与经营活动有关的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (9, 'FY012001', '先申请后报销：门店加工劳务费', 'A50', '购买商品、接受劳务支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (10, 'FY012002', '先申请后报销：员工福利费', 'A56', '支付给职工以及为职工支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (11, 'FY013000', '直接报销：通用费用', 'A53', '支付其他与经营活动有关的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (12, 'FY013001', '直接报销：门店加工劳务费', 'A50', '购买商品、接受劳务支付的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (13, 'FY013002', '直接报销：员工福利费', 'A56', '支付给职工以及为职工支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (14, 'FY014000', '预付账款：预付通用费用', 'A53', '支付其他与经营活动有关的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (15, 'FY014001', '预付账款：门店加工劳务费', 'A50', '购买商品、接受劳务支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (16, 'FY014002', '预付账款：员工福利费', 'A56', '支付给职工以及为职工支付的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (17, 'FY014003', '预付账款：报销抵预付', 'Z99', '与现金流量无关');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (18, 'FY014004', '报销抵押金', 'Z99', '与现金流量无关');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (19, 'FY014005', '其他应收款-供应商押金', 'Z99', '与现金流量无关');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (20, 'FY015000', '通用员工借款：通用费用', 'A53', '支付其他与经营活动有关的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (21, 'FY015001', '通用员工借款：门店加工劳务费', 'A50', '购买商品、接受劳务支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (22, 'FY015002', '通用员工借款：员工福利费', 'A56', '支付给职工以及为职工支付的现金');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (23, 'FY016000', '通用员工还款：报销抵借款', 'A53', '支付其他与经营活动有关的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (24, 'FY016001', '通用员工还款：自主还款', 'A53', '支付其他与经营活动有关的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (25, 'FY016002', '通用员工还款：门店加工车间劳务费-报销抵借款', 'A50', '购买商品、接受劳务支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (26, 'FY016003', '通用员工还款：门店加工车间劳务费-自主还款', 'A50', '购买商品、接受劳务支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (27, 'FY016004', '通用员工还款：员工福利费--报销抵借款', 'A56', '支付给职工以及为职工支付的现金 ');

insert into bt_cash_flow (ID, OA_BUSINESS_TYPE, OA_RMK, SAP_CASH_FLOW_CODE, SAP_RMK)
values (28, 'FY016005', '通用员工还款：员工福利费--自主还款', 'A56', '支付给职工以及为职工支付的现金 ');
commit;





