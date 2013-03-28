--修改时间：2013-01-30
--修改人：费滔
--修改原因：V10.4BUG,发现以下提醒没法通过参数是否启用控制控制
--银行借款提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '银行借款提醒' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (29, 'cms', '29', '银行借款提醒', '10', '银行借款提醒', '您有${count}笔银行借款到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

