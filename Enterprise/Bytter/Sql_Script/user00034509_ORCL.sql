--�޸��ˣ����
--�жһ�Ʊ
--���Ʊ��ҵ�����������ͬ�ֻ㡱�ֶ�
--[VP6753]�¿�˹ERP�ϻ��²��ӿڿ���
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_RECEIVE' AND COLUMN_NAME = 'AS_SPOT_EXCHANGE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_RECEIVE add AS_SPOT_EXCHANGE char(1) default 0';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
