--�޸���:��˫
--�޸����ڣ�2012-12-13
--�޸����ݣ�1104����ʽ���壬��󳤶ȴ�400�ĳ�1000

ALTER TABLE rpt1104_report_css MODIFY cell_formula VARCHAR2(1000);

--�޸���:��˫
--�޸����ڣ�2012-12-14
--�޸����ݣ�1104�������Ӵ�����ϸ��[�м��]
CREATE TABLE RPT1104_LOANS_DETAIL(
 ID NUMBER NOT NULL,
 CORP_CODE VARCHAR2(20),
 CORP_NAME VARCHAR2(100),
 CUR_CODE CHAR(2),
 AMOUNT NUMBER(20,2),
 PERIOD number, 
 RPT_DATE DATE,
CONSTRAINT PK_RPT1104_LOANS_DETAIL PRIMARY KEY(ID));

COMMENT ON COLUMN RPT1104_LOANS_DETAIL.CORP_CODE IS '�ͻ�����'; 
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.CORP_NAME IS '�ͻ�����'; 
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.CUR_CODE IS '�ұ�'; 
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.AMOUNT IS '���'; 
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.PERIOD IS '��������:-1:����,0:����,1:3������,2:3-6����,3:6����-1��,4:1-2��,6:2-3��,7:3-5��,8:5������';
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.RPT_DATE IS '��������';

--�޸��ˣ���˫
--�޸����ڣ�2012-12-15
--�޸����ݣ�1104��������GETDKMXJE��������ȡ������ϸ���

DECLARE
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETDKMXJE%';
  IF VN_COUNT < 1 THEN
    INSERT INTO RPT1104_REPORT_FORMULA
    VALUES
      ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
       'GETDKMXJE����ȡ������ϸ��',
       'GETDKMXJE (��������,�ұ�):<br>��ȡ������ϸ���������ϸ���д��Ʊ���������ޣ����޴���?����С�ڵ���?���µĶ�Ӧ�������ڴ�����֣������ͻ��ܡ�
       <br>����1:��ȡ�������Ӧ�Ĵ�����������(-1 ���ڡ�0 ���ڡ�1 ���������ڡ�2 �������������¡�3 ��������һ�ꡢ4 һ�������ꡢ6 ���������ꡢ7 ���������ꡢ8 ��������)<br>
       ����2�����ڴ���ұ���룻<br>ʾ����[GETDKMXJE(1,01)]<br>��ȡ����������������������Ϊ����ҵĶ�Ӧ�������ڵĴ����<br>');
  END IF;
  COMMIT;
END;
/
