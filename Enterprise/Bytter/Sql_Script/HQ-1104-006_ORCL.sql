--�޸��ˣ���˫
--�޸����ڣ�2013-2-4
--�޸����ݣ�������ϸ�ɼ���[�м��]����ֶ�
ALTER TABLE RPT1104_LOANS_DETAIL ADD LOAN_TYPE CHAR(2);
ALTER TABLE RPT1104_LOANS_DETAIL ADD ENTERPRISE_SCALE CHAR(4);
ALTER TABLE RPT1104_LOANS_DETAIL ADD INDUSTRY_CODE VARCHAR2(8);

COMMENT ON COLUMN RPT1104_LOANS_DETAIL.LOAN_TYPE IS '���ʽ';
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.ENTERPRISE_SCALE IS '��ҵ��ģ����';
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.INDUSTRY_CODE IS '���б�׼����ҵ����';

--��ӵ�����ʽ�ֶ�
ALTER TABLE RPT1104_INDEX_VALUE_DTL ADD LOAN_TYPE CHAR(2);
COMMENT ON COLUMN RPT1104_INDEX_VALUE_DTL.LOAN_TYPE IS '������ʽ';
--����������
ALTER TABLE RPT1104_SUBJECT_BALANCE ADD NET_CODE CHAR(4);

--���¹�ʽ˵��
UPDATE RPT1104_REPORT_FORMULA
   SET HELP = 'GETDKZLWJFL(�弶����,����,�������,��ҵ����,��ҵ��ģ,������ʽ,��������):<br>
��ȡ���������弶������Ϣ�������<br>
����1����Ҫ��ȡ�Ĵ��������弶��������������Ӧ����Ŀ���(������,��ע��,�μ���....)<br>
����2����Ҫ��ȡ�Ĵ��������弶��������������Ӧ�ı���<br>
����3����Ҫ��ȡ�Ĵ��������弶��������������Ӧ���������<br>
����4����Ҫ��ȡ�Ĵ��������弶��������������Ӧ����ҵ����(��ѡ)<br>
����5����Ҫ��ȡ�Ĵ��������弶��������������Ӧ����ҵ��ģ����(��ѡ)<br>
����6����Ҫ��ȡ�Ĵ��������弶��������������Ӧ�ĵ�����ʽ(��ѡ)<br>
����7����Ҫ��ȡ�Ĵ��������弶��������������Ӧ����������(��ѡ)<br>
ʾ��1��GETDKZLWJFL(1001,01,1000,A,CS01,01,2)<br>
ע:����д��,��ֱ����,��������д��Ϣ'
 WHERE FORMULA_NAME LIKE 'GETDKZLWJFL��%';
--���¹�ʽ˵��
UPDATE RPT1104_REPORT_FORMULA
   SET FORMULA_NAME = 'GETTYCRQK����ȡ���ǰʮ�Ҳ�����',
       HELP         = 'GETTYCRQK(ǰʮ���еڼ��ҵ�����,ȡ��������Ӧ�ڼ����ֵ):<br>��ȡ���ǰʮ�Ҳ�������Դ��ͬҵ���������Ĳ������������ҴΡ��������������ȡֵ<br>
����1:��ȡ��Ҫ�Ĳ������ǰʮ���ж�Ӧ�ڼ��ҵ�����<br>
����2:��ȡ�����Ӧ���еڼ����ֵ���磺��һ���ȡ�û������ڶ����ȡ�û���λ�����Ӧ������<br>
ʾ��:GETTYCRQK(3,1) ��ȡǰ10���е����Ҳ�ȡ�����һ���ֵ(��λ����),��Ӧ�������ڵĲ������<br>
ע:����д��,��ֱ����,��������д��Ϣ'
 WHERE FORMULA_NAME LIKE 'GETTYCRQK��%';
COMMIT;
