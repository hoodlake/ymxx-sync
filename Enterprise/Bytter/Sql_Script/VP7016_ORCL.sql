--�޸���:�´���
--�޸�ʱ��:2012-11-2
--�޸�����:ZY-CD-01_ORCL.sql ����ab_operation������ȱ���ֶ�
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_OPERATION' AND COLUMN_NAME = 'RATMODEL';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_OPERATION add RATMODEL char(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/