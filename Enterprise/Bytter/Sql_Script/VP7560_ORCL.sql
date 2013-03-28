
--�޸����ڣ�20121205
--�޸��ˣ�������
--�޸����ݣ������Զ����˵�¼�û���
--�������ã�


DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���BT_USER_ONLINE��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BT_USER_ONLINE';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table BT_USER_ONLINE
				(  USER_CODE       VARCHAR2(8) not null,
                                   ONLINE_SIGN      CHAR(1),
				   constraint PK_BT_USER_ONLINE primary key (USER_CODE)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
