--�޸����ڣ�20120911
--�޸��ˣ�Ҷ����
--�޸����ݣ�XD-JD03-020 ϵͳ����-����ͳ��̨��
--�޸����ݣ�ϵͳ�˵� ���� ����ͳ��̨��
--�������ã�
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '����ͳ��̨��', 'cms', RES_CODE, '/cms/LoanTotalTree.jsp', '0', '0', '0', '0', (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '��ѯ' AND T3.SYS_CODE = 'cms';
COMMIT;