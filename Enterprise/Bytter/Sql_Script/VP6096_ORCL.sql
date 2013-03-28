
--修改日期：20121210
--修改人：吴生火
--修改内容：诚通CFCA3.0证书需求，增加CFCA版本参数字段
--参数设置：
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FC_PARAM
   WHERE PARAM_CODE='cfca_version';
  IF VN_COUNT < 1 THEN
  insert into fc_param (PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
values ( 'cfca_version', 'CFCA版本号', '0', '1为CFCA3.0版本,0为老版本', '', '', '');

  COMMIT;
 END IF; 
END;
/


