
--修改日期：20121205
--修改人：吴生火
--修改内容：增加记账主表付息凭证字段
--参数设置：
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='FC_ACCBOOK' AND COLUMN_NAME='INTEREST_CHARGE';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table fc_accbook add interest_charge varchar2(1)  ';
     execute immediate 'alter table fc_accbook_blned add interest_charge varchar2(1)  ';
     execute immediate 'alter table fc_pre_accbook add interest_charge varchar2(1) ';
  COMMIT;
 END IF; 
END;
/
