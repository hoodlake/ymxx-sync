--�޸����ڣ�2012.9.6
--�޸��ˣ�������
--�޸����ݣ�XD-JD03-007  ���Ӵ������������Ӳ˵��Ľű�
--�޸�ԭ�������Ӳ˵�����ǰû��
--�����Ӵ���Ų˵� 
--INSERT INTO BT_SYS_RES
--(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
--SELECT (SELECT MAX(RES_CODE) + 1 from BT_SYS_RES),'�����','cms',RES_CODE,'/cms/MakeLoanPreview.jsp?view_type=10','0','0','0','0',2,2,''
--FROM BT_SYS_RES
--WHERE RES_NAME = '�������' AND SYS_CODE='cms';
--COMMIT;




--������ʽ
alter table LOAN_SEND_OUT_INFO add FLOAT_WAY VARCHAR2(15);

--���ʵ�����Ч����
alter table LOAN_SEND_OUT_INFO add RATE_ENTRIES_EFFECT_DATE DATE;

--��Ϣ��ʽ
alter table LOAN_SEND_OUT_INFO add INTEREST_WAY VARCHAR2(15);


--��׼��������
alter table LOAN_SEND_OUT_INFO add REFERENCE_RATE_TYPE VARCHAR2(50);

--��������
alter table LOAN_SEND_OUT_INFO add REPAY_CYCLE VARCHAR2(50);

--������ѡ��������߱���
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_SELECT VARCHAR2(50);

--�����ά�������ͬ�涨�ĵ����򸡶�����
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_TEXT VARCHAR2(50);
-- ¼������
alter table LOAN_SEND_OUT_INFO add (LOAN_ENTERING_DATE DATE);


COMMIT;
