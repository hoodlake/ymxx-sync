--修改日期：2012.11.28
--修改人：刘之三
--修改内容：以收定支
--修改原因：以收定支
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
   WHERE CODE= 'isPayCtrl' AND SYS_CODE='fbs';
  IF VN_COUNT < 1 THEN
    insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
    values ('isPayCtrl', 'fbs', '是否执行以收定支控制', '1', null, null, '0', '是否执行以收定支控制.1是;0否', '1,是;0,否;', '', '', '', '', 1.00, 48.00, null, null, null);
  END IF;
  COMMIT; 
END;
/ 