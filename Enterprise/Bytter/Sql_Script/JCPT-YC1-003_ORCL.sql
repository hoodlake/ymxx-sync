--�޸����ڣ�2012.11.28
--�޸��ˣ���֮��
--�޸����ݣ����ն�֧
--�޸�ԭ�����ն�֧
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
   WHERE CODE= 'isPayCtrl' AND SYS_CODE='fbs';
  IF VN_COUNT < 1 THEN
    insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
    values ('isPayCtrl', 'fbs', '�Ƿ�ִ�����ն�֧����', '1', null, null, '0', '�Ƿ�ִ�����ն�֧����.1��;0��', '1,��;0,��;', '', '', '', '', 1.00, 48.00, null, null, null);
  END IF;
  COMMIT; 
END;
/ 