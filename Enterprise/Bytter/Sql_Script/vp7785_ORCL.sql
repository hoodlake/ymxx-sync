--���پ� 
--����
--����ģ��ƥ��
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'TEMPLATE_ID_1';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add TEMPLATE_ID_1 NUMBER(10)';
     END IF;
  END;
/
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'TEMPLATE_ID_2';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add TEMPLATE_ID_2 NUMBER(10)';
     END IF;
  END;
/
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'COST_CENTER_CODE';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add COST_CENTER_CODE VARCHAR2(20)';
     END IF;
  END;
/
--�޸����� 20130130
--�޸��� ���
--�޸����� �������нӿ����ñ�
DECLARE
 VC_STR VARCHAR(2000);
 VC_COUNT NUMBER;
BEGIN
 SELECT COUNT(*) INTO VC_COUNT FROM USER_TABLES WHERE TABLE_NAME='ERP_INTER_CONFIG';
 IF VC_COUNT < 1 THEN
  VC_STR := 'CREATE TABLE ERP_INTER_CONFIG
            (
                    INTER_CODE VARCHAR(1) PRIMARY KEY,--�ո���־��0���գ� 1������2��ƾ֤��
                    OFFLINE_SIGN VARCHAR(1),--���߱�־��0����1�ǣ�
                    ONLINE_SIGN VARCHAR(1),--���߱�־��0����1�ǣ�
                    AUTOSEND_SIGN VARCHAR(1),--�Զ����ͱ�־��0����1�ǣ�
                    SPLIT_SIGN VARCHAR(1),--��ֱ�־��0����1�ǣ�
                    MERGER_SIGN VARCHAR(1),--�ϲ���־��0����1�ǣ�
                    BUDGETMATCH_SIGN VARCHAR(1),--Ԥ��ƥ���־��0����1�ǣ�
                    MAKEUP_SIGN VARCHAR(1),--��¼��־��0����1�ǣ�
                    NET_SIGN VARCHAR(1),--��������ƾ֤��0����1�ǣ�
                    CORP_SIGN VARCHAR(1),--���ɵ�λƾ֤��0����1�ǣ�
                    COMPARE_SIGN VARCHAR(1),--���Ҹ���ָ��(0����1��)
                    PAY_IN_COMPARE_SIGN VARCHAR(1),--����¼��ƥ��ģ��(0����1��)
                    DATA_SOURCE VARCHAR(20) --���͵�������Դ��bytter:B,erp:E,other:O��
            )';
  EXECUTE IMMEDIATE VC_STR;
 END IF;
END;
/
comment on column ERP_INTER_CONFIG.INTER_CODE
  is '�ո���־��0���գ� 1������2��ƾ֤��';
comment on column ERP_INTER_CONFIG.OFFLINE_SIGN
  is '���߱�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.ONLINE_SIGN
  is '���߱�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.AUTOSEND_SIGN
  is '�Զ����ͱ�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.SPLIT_SIGN
  is '��ֱ�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.MERGER_SIGN
  is '�ϲ���־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.BUDGETMATCH_SIGN
  is 'Ԥ��ƥ���־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.MAKEUP_SIGN
  is '��¼��־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.NET_SIGN
  is '��������ƾ֤��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.CORP_SIGN
  is '���ɵ�λƾ֤��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.COMPARE_SIGN
  is '���Ҹ���ָ��(0����1��)';
comment on column ERP_INTER_CONFIG.PAY_IN_COMPARE_SIGN
  is '����¼��ƥ��ģ��(0����1��)';
comment on column ERP_INTER_CONFIG.DATA_SOURCE
  is '���͵�������Դ��bytter:B,erp:E,other:O��';
commit;