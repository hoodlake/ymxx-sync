--�޸���  ����˫
--�޸����ڣ�2012-12-20
--�޸����ݣ������������Կ�Ʊ�ݵǼǸ����˺��Ƿ������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param  WHERE sys_code='ads' AND code='PAYNO';
  IF VN_COUNT < 1 THEN
   INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('PAYNO','ads','�Կ�Ʊ�ݸ����˺��Ƿ����',0,0,'0 ��;1 ��','0,��;1,��',1);
  END IF;
  COMMIT; 
END;
/
