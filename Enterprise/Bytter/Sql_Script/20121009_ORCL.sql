
--�޸���:���¾�
--�޸�ʱ��:2012-10-9
--�޸�����:����ֶβ�����������ֶ� 
 
DECLARE
  VN_COUNT     NUMBER;
  V_STR        VARCHAR2(1000);
BEGIN
select COUNT(*) 
  INTO VN_COUNT
  from user_tab_cols 
 where table_name = 'AB_OPERATION' AND COLUMN_NAME = 'ATTACHMENT';
IF VN_COUNT < 1 THEN
  V_STR := ' ALTER TABLE AB_OPERATION ADD ATTACHMENT CHAR(10)';
  EXECUTE IMMEDIATE V_STR;
END IF;
END;
/




