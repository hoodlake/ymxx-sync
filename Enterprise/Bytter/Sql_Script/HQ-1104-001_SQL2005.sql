--�޸���:��˫
--�޸����ڣ�2012-12-13
--�޸����ݣ�1104����ʽ���壬��󳤶ȴ�400�ĳ�1000

ALTER TABLE rpt1104_report_css alter column cell_formula VARCHAR(1000);

--�޸���:��˫
--�޸����ڣ�2012-12-14
--�޸����ݣ�1104�������Ӵ�����ϸ��[�м��]
CREATE TABLE RPT1104_LOANS_DETAIL(
 ID int NOT NULL,
 CORP_CODE VARCHAR(20),
 CORP_NAME VARCHAR(100),
 CUR_CODE CHAR(2),
 AMOUNT NUMERIC(20,2),
 PERIOD int, 
 RPT_DATE DATETIME,
CONSTRAINT PK_RPT1104_LOANS_DETAIL PRIMARY KEY(ID));


--�޸��ˣ���˫
--�޸����ڣ�2012-12-15
--�޸����ݣ�1104��������GETDKMXJE��������ȡ������ϸ���

DECLARE
  @VN_COUNT INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*)
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETDKMXJE%';
  IF @VN_COUNT < 1 
  begin
     INSERT INTO RPT1104_REPORT_FORMULA(FORMULA_NAME,HELP)
    VALUES(
       'GETDKMXJE����ȡ������ϸ��',
       'GETDKMXJE (��������,�ұ�):<br>��ȡ������ϸ���������ϸ���д��Ʊ���������ޣ����޴���?����С�ڵ���?���µĶ�Ӧ�������ڴ�����֣������ͻ��ܡ�
       <br>����1:��ȡ�������Ӧ�Ĵ�����������(-1 ���ڡ�0 ���ڡ�1 ���������ڡ�2 �������������¡�3 ��������һ�ꡢ4 һ�������ꡢ6 ���������ꡢ7 ���������ꡢ8 ��������)<br>
       ����2�����ڴ���ұ���룻<br>ʾ����[GETDKMXJE(1,01)]<br>��ȡ����������������������Ϊ����ҵĶ�Ӧ�������ڵĴ����<br>');
  END;
END;