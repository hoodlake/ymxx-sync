--�޸����ڣ�2012.9.6
--�޸��ˣ�������
--�޸����ݣ�XD-JD03-007  ���Ӵ������������Ӳ˵��Ľű�
--LOAN_SEND_OUT_INFO
--�����ҳ�� 
--�����ά�������ͬ�涨�ĵ����򸡶�����
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_TEXT VARCHAR(50);

--������ѡ��������߱���
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_SELECT VARCHAR(50);


--������ʽ
alter table LOAN_SEND_OUT_INFO add FLOAT_WAY VARCHAR(15);

--���ʵ�����Ч����
alter table LOAN_SEND_OUT_INFO add RATE_ENTRIES_EFFECT_DATE DATETIME;

--��Ϣ��ʽ
alter table LOAN_SEND_OUT_INFO add INTEREST_WAY VARCHAR(15);


--��׼��������
alter table LOAN_SEND_OUT_INFO add REFERENCE_RATE_TYPE VARCHAR(50);

--��������
alter table LOAN_SEND_OUT_INFO add REPAY_CYCLE VARCHAR(50);

-- ¼������
alter table LOAN_SEND_OUT_INFO add (LOAN_ENTERING_DATE DATE);
go
