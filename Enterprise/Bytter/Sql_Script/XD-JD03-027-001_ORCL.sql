--�޸����ڣ�20120921
--�޸��ˣ�Ҷ����
--�����ţ�XD-JD03-027 ϵͳ����-����̨��
--�޸����ݣ�ϵͳ���� ���� �ڲ������Ƿ�Ʒ� �Ŵ������Ƿ����
--�������ã�
INSERT INTO BT_PARAM (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_TYPE, RMK, REVERSE1, REVERSE6) VALUES ('is_charging', 'cms', '�ڲ������Ƿ�Ʒ�', 0, 0, 'VALUE = 0����VALUE = 1����', '0,��;1,��', 1);
INSERT INTO BT_PARAM (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_TYPE, RMK, REVERSE1, REVERSE6) VALUES ('is_accounting', 'cms', '�Ŵ������Ƿ����', 1, 0, 'VALUE = 0����VALUE = 1����', '0,��;1,��', 1);
COMMIT;