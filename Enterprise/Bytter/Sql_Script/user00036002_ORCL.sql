--�޸�����:����Ѻ��Ǽ������ֶ�
--�޸���:����
--�޸�ʱ��:2012-12-07
--�۾���
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'GUA_MORTGAGE_INFO' AND COLUMN_NAME = 'DEPRECIATION_RATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table gua_mortgage_info add depreciation_rate number(8,6)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
