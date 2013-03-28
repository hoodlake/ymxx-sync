--�޸��ˣ����ֻ�
--�޸����ڣ�2012-12-19
--�޸�����: ������Ӫ�����ʷ�����ͳ�Ʊ�
--�޸�ԭ��: ��ͼ�������š����гжһ�Ʊ������֤����Ѻ��
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='V_CMS_FINACIAL')
DROP VIEW V_CMS_FINACIAL
GO
CREATE VIEW V_CMS_FINACIAL AS
SELECT ENT.EN_TYPE,
       ENT.ID,
       ENT.CORP_ID,
       ENT.MONEY,
       ENT.BANK_CODE,
       ENT.CUR_CODE,
       ENT.ENTERDATE,
       ENT.DEADLINEDATE,
       ENT.CLC_ID,
       ENT.RATE,
       ENT.PL_CLASS,
       ENT.RMK,
       BANK.BANK_NAME,
       BANK.BANK_TYPE
  FROM (SELECT 'A' AS EN_TYPE,
               'A' || SEND.BILL_CODE AS ID,
               SEND.CORP_ID,
               SEND.MONEY,
               INFO.BANK_CODE,
               SEND.CUR_CODE,
               SEND.SEND_DATE AS ENTERDATE,
               SEND.DEADLINE_DATE AS DEADLINEDATE,
               INFO.CLC_ID,
               INFO.PL_CLASS,
               SEND.PL_RATE AS RATE,
               SEND.RMK AS RMK
          FROM CMS_PROVIDE_LOAN_INFO INFO, CMS_PROVIDE_LOAN_SEND SEND
         WHERE INFO.BILL_CODE = SEND.FATHER_CODE
           AND SEND.STATUS > = 95 --��������ͨ��
        UNION
        SELECT 'B' AS EN_TYPE,
               'B' || AB.ID AS ID,
               AB.CORP_ID,
               AB.MONEY,
               BK.BANK_CODE,
               NULL AS CUR_CODE,
               AB.ISSUE_DATE AS ENTERDATE,
               AB.MATURITY_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               AB.BAIL_PROPORTION AS RATE,
               AB.REMARK AS RMK
          FROM AB_EMIT AB,BT_BANK bk
         WHERE AB.SUBJECT <> '000' --�ǵǼǣ��ѿ���Ʊ��
           AND (AB.BAIL_PROPORTION <> 1 OR AB.BAIL_PROPORTION IS NULL) --��֤�������Ϊ1
           AND AB.ACCEPTOR = BK.BANK_NAME
           AND AB.BILL_TYPE = '��Ʊ' 
           AND AB.IS_APPEND = '1'
        UNION
        SELECT 'C' AS EN_TYPE,
               'C' || LC.CODE AS ID,
               LC.CORP_ID,
               DPS.DEPOSIT_MONEY AS MONEY,
               LC.ISSUING_BANK_CODE AS BANK_CODE,
               LC.CURRENCY AS CUR_CODE,
               LC.ISSUING_DATE AS ENTERDATE,
               ARR.PAYMENT_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               DPS.INTEREST_RATE AS RATE,
               LC.RMK AS RMK
          FROM LC_ENROL LC, LC_BILL_ARRIVAL ARR, LC_DEPOSIT DPS
         WHERE LC.CODE = ARR.LC_CODE
           AND DPS.CODE = ARR.CODE
           AND LC.STATUS >= 95
           AND LC.STATUS < 101
           AND LC.LC_TYPE = '0' --����ͨ��
        ) ENT
  LEFT JOIN BT_BANK BANK ON ENT.BANK_CODE = BANK.BANK_CODE;
GO

-- �޸����ڣ�2012-12-19
-- �޸��ˣ�����Դ
-- �޸����ݣ��ۺϲ�ѯ-�Ŵ�����-��������������ϸ������Ӫ�����ʷ�����ͳ�Ʊ����ʽṹ��������
-- �޸����ڣ�2012-12-19
-- �޸��ˣ�����Դ
-- �޸����ݣ�ϵͳ����ά�������������н�����
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='V_CMS_FINACIAL_DETAIL')
DROP VIEW V_CMS_FINACIAL_DETAIL
GO
CREATE VIEW V_CMS_FINACIAL_DETAIL AS
SELECT ENT.EN_TYPE,
       ENT.ID,
       ENT.CORP_ID,
       ENT.MONEY,
       ENT.BANK_CODE,
       ENT.CUR_CODE,
       ENT.ENTERDATE,
       ENT.DEADLINEDATE,
       ENT.CLC_ID,
       ENT.RATE,
       ENT.PL_CLASS,
       ENT.RMK,
       ENT.CONTRACT_NO,
       ENT.SEND_CODE,
       BANK.BANK_NAME,
       BANK.BANK_TYPE
  FROM (SELECT 'A' AS EN_TYPE,
               'A' || INFO.BILL_CODE AS ID,
               INFO.CORP_ID,
               (SEND.MONEY- nvl((select SUM(REPAY.REPAY_MONEY) from CMS_PROVIDE_LOAN_REPAY REPAY where REPAY.PLI_CODE = SEND.FATHER_CODE AND SEND.BILL_CODE = REPAY.SEND_CODE AND REPAY.STATUS =102 ),0)) AS MONEY,
               INFO.BANK_CODE,
               SEND.CUR_CODE,
               SEND.SEND_DATE AS ENTERDATE,
               SEND.DEADLINE_DATE AS DEADLINEDATE,
               INFO.CLC_ID,
               INFO.PL_CLASS,
               INFO.PL_RATE AS RATE,
               INFO.RMK AS RMK,
               INFO.CONTRACT_NO AS CONTRACT_NO,
               SEND.BILL_CODE AS SEND_CODE
          FROM CMS_PROVIDE_LOAN_INFO INFO, CMS_PROVIDE_LOAN_SEND SEND
         WHERE INFO.BILL_CODE = SEND.FATHER_CODE
            AND SEND.STATUS > = 95 --��������ͨ��
        UNION
        SELECT 'B' AS EN_TYPE,
               'B' || AB.ID AS ID,
               AB.CORP_ID,
               AB.MONEY,
               BK.BANK_CODE,
               NULL AS CUR_CODE,
               AB.ISSUE_DATE AS ENTERDATE,
               AB.MATURITY_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               (AB.BAIL_PROPORTION*100) AS RATE,
               AB.REMARK AS RMK,
               AB.PACT_NO AS CONTRACT_NO,
               NULL AS SEND_CODE
          FROM AB_EMIT AB,BT_BANK BK
         WHERE AB.SUBJECT <> '000' --�ǵǼǣ��ѿ���Ʊ��
           AND (AB.BAIL_PROPORTION <> 1 OR AB.BAIL_PROPORTION IS NULL) --��֤�������Ϊ1
           AND AB.ACCEPTOR = BK.BANK_NAME
           AND AB.BILL_TYPE = '��Ʊ'
           AND AB.IS_APPEND = '1'
        UNION
        SELECT 'C' AS EN_TYPE,
               'C' || LC.CODE AS ID,
               LC.CORP_ID,
               DPS.DEPOSIT_MONEY AS MONEY,
               BANK.BANK_CODE AS BANK_CODE,
               LC.CURRENCY AS CUR_CODE,
               LC.ISSUING_DATE AS ENTERDATE,
               ARR.PAYMENT_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               DPS.INTEREST_RATE AS RATE,
               LC.RMK AS RMK,
               LC.CONTRACT_NO AS CONTRACT_NO,
               NULL AS SEND_CODE
          FROM LC_ENROL LC, LC_BILL_ARRIVAL ARR, LC_DEPOSIT DPS,BT_BANK BANK
         WHERE LC.CODE = ARR.LC_CODE
           AND DPS.CODE = ARR.CODE
           AND LC.STATUS >= 95
           AND LC.STATUS < 101
           AND LC.LC_TYPE = '0' --����ͨ��
           AND LC.ISSUING_BANK = BANK.BANK_NAME
        ) ENT
  LEFT JOIN BT_BANK BANK ON ENT.BANK_CODE = BANK.BANK_CODE;
GO

-- �޸����ڣ�2012-12-19
-- �޸��ˣ�����Դ
-- �޸����ݣ��ۺϲ�ѯ-�Ŵ�����-��������������ϸ������Ӫ�����ʷ�����ͳ�Ʊ����ʽṹ��������
-- �޸����ڣ�2012-12-19
-- �޸��ˣ�����Դ
-- �޸����ݣ�ϵͳ����ά�������������н�����
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
  WHERE SYS_CODE = 'fqs' and res_name='����������ϸ����' and res_level = '2';
  IF @VN_COUNT < 1
    BEGIN
      	insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'����������ϸ����','fqs',res_code,'/cms/BankFinancingDetails.jsp','0','1','0','0',10,'����������ϸ����','','','','','',null,null,null,null,null,2  
		from bt_sys_res  where res_name = '�Ŵ�����' and sys_code = 'fqs' and res_level = '1';  
    END;
  END IF;
  
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
  WHERE SYS_CODE = 'fqs' and res_name='��Ӫ�����ʷ�����ͳ�Ʊ�' and res_level = '2';
  IF @VN_COUNT < 1
    BEGIN
      	insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'��Ӫ�����ʷ�����ͳ�Ʊ�','fqs',res_code,'/cms/BusinessFinancing.jsp','0','1','0','0',11,'��Ӫ�����ʷ�����ͳ�Ʊ�','','','','','',null,null,null,null,null,2  
		from bt_sys_res  where res_name = '�Ŵ�����' and sys_code = 'fqs' and res_level = '1';   
    END;
  END IF;
  
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
  WHERE SYS_CODE = 'fqs' and res_name='���ʽṹ��������' and res_level = '2';
  IF @VN_COUNT < 1
    BEGIN
      	insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'���ʽṹ��������','fqs',res_code,'/cms/FinancingStructureB.jsp','0','1','0','0',12,'���ʽṹ��������','','','','','',null,null,null,null,null,2  
		from bt_sys_res  where res_name = '�Ŵ�����' and sys_code = 'fqs' and res_level = '1';  
    END;
  END IF;
  
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param
  WHERE SYS_CODE = 'cms' and code = 'special_bank_loan_type';
  IF @VN_COUNT < 1
    BEGIN
      	insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
		values ('special_bank_loan_type', 'cms', '�������н�����', '', null, null, '0', '�������н�����', '˵����ά�����Ի��������м��÷ֺŸ���', '', '', '', '', '0.00', '', null, null, null);
    END;
  END IF;
  GO
END;
