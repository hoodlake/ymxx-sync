--���ڣ�2013-01-08
--�޸��ˣ�andy.huang
--�޸����ݣ��������˹���ϵͳ�����Ƿ��˹�����ָ��
DECLARE
  V_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_param
    WHERE CODE = 'isHandSendCmd';
    IF V_COUNT = 0 THEN
      insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('isHandSendCmd', 'cho', '�Ƿ��˹�����ָ��', '1', null, null, null, null, '1,��;0,��', null, null, null, null, 1.00, 2.00, null, null, null);
 commit;    
END IF;
   
END;

/
