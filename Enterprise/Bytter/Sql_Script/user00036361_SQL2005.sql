--�޸���  ����˫
--�޸����ڣ�2012-12-20
--�޸����ݣ������������Կ�Ʊ�ݵǼǸ����˺��Ƿ������
GO
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT 
     @VN_COUNT = COUNT(*)
    FROM bt_param  WHERE sys_code='ads' AND code='PAYNO';
  IF @VN_COUNT < 1
  BEGIN
   INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('PAYNO','ads','�Կ�Ʊ�ݸ����˺��Ƿ����',0,0,'0 ��;1 ��','0,��;1,��',1);
  END;
END;
GO
