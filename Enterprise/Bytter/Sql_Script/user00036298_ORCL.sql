--�޸����ڣ�20121225
--�޸��ˣ�zourb 
--�޸����ݣ������������ֶ�
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='CMS_OUT_FINANC' AND COLUMN_NAME='REASON';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table cms_out_financ add reason varchar2(100)';
  COMMIT;
 END IF; 
END;
/