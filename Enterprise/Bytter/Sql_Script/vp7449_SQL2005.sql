--�޸����ڣ�20121119
--�޸��ˣ���̺�
--�޸����ݣ������Ƿ��ȸ������˲���
--�������ã�
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_PARAM
   WHERE CODE='isParentUnitPay' AND SYS_CODE='nis';
  IF @VN_COUNT < 1 
   insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('isParentUnitPay', 'nis', '�Ƿ������ϼ���λ����', '0', null, null, '0', '�Ƿ������ϼ���λ����,0��;1��', '1,��;0,��;', '', '', '', '', 1.00, 3.00, null, null, null);
END;
go
