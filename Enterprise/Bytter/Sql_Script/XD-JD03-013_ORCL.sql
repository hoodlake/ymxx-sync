--�����ˣ�����
--�޸����ڣ�2012-09-12
--�޸�����: �����Ŵ����¼�롢��¼�л���ƻ���
--�޸�ԭ��:����XD-JD03-013 ϵͳ����-���н����Ϣ��¼����-����ƻ�

--�ֶ�˵�� 
--REPAYMENT_SCHEDULE_ID  ����ƻ�ID
--BILL_CODE              Ʊ�ݺ���
--REPAYMENT_BEGIN_DATE   ���ʼ��
--REPAYMENT_CYCEL        ��������
--PREDICE_REPAYMENT_DATE Ԥ�ƻ�����
--REPAYMENT_MONEY        ������
--REPAYMENT_RATE         ������Ϣ
--CURRENT_REPAYMENT_MONEY ���ڻ�����
--REALITY_REPAYMENT_DATE ʵ�ʻ�����
--REALITY_REPAYMENT_MONEY ʵ�ʻ����
--SURPLUS_MONEY           ʣ�౾��
--IS_REPAY                �Ƿ��ѻ�
--REMARK                     ��ע
create table REPAYMENT_SCHEDULE
(
 REPAYMENT_SCHEDULE_ID    NUMBER(10) NOT NULL , 
 BILL_CODE                CHAR(13) NOT NULL,
 REPAYMENT_BEGIN_DATE     DATE   ,
 REPAYMENT_CYCEL          CHAR(2) ,
 PREDICE_REPAYMENT_DATE   DATE  ,   
 REPAYMENT_MONEY          NUMBER(15,2) NOT NULL,
 REPAYMENT_RATE           NUMBER(15,2) NOT NULL,
 CURRENT_REPAYMENT_MONEY  NUMBER(15,2) ,  
 REALITY_REPAYMENT_DATE   DATE,
 REALITY_REPAYMENT_MONEY  NUMBER(15,2),  
 SURPLUS_MONEY            NUMBER(15,2), 
 IS_REPAY                 CHAR(1),
 REMARK                   VARCHAR2(100)
);

--��cms_provide_loan_info�����ֶ�


--��֤�����
alter table cms_provide_loan_info add bailMoney_rate number;

--��֤���ͬ
alter table cms_provide_loan_info add bailMoney_contract VARCHAR2(50);


--������ʽ
alter table cms_provide_loan_info add float_way VARCHAR2(15);

--���ʵ�����Ч����
alter table cms_provide_loan_info add rate_entries_effect_date DATE;

--��Ϣ��ʽ
alter table cms_provide_loan_info add interest_way VARCHAR2(15);


--��׼��������
alter table cms_provide_loan_info add reference_rate_type VARCHAR2(50);

--��������
alter table cms_provide_loan_info add repay_cycle VARCHAR2(50);

--������ѡ��������߱���
alter table cms_provide_loan_info add points_proportion_select VARCHAR2(50);

--�����ά�������ͬ�涨�ĵ����򸡶�����
alter table cms_provide_loan_info add points_proportion_text VARCHAR2(50);




--��cms_provide_loan_info�����ֶ�

--������ʽ
alter table cms_provide_loan_repay add float_way VARCHAR2(15);

--���ʵ�����Ч����
alter table cms_provide_loan_repay add rate_entries_effect_date DATE;

--��Ϣ��ʽ
alter table cms_provide_loan_repay add interest_way VARCHAR2(15);


--��׼��������
alter table cms_provide_loan_repay add reference_rate_type VARCHAR2(50);

--��������
alter table cms_provide_loan_repay add repay_cycle VARCHAR2(50);

--������ѡ��������߱���
alter table cms_provide_loan_repay add points_proportion_select VARCHAR2(50);

--�����ά�������ͬ�涨�ĵ����򸡶�����
alter table cms_provide_loan_repay add points_proportion_text VARCHAR2(50);


--չ������
alter table cms_provide_loan_repay add deferred_rate number(8,6);


--��������
alter table cms_provide_loan_repay add overdue_rate number(8,6);

--�ϴμ�Ϣ��
alter table cms_provide_loan_repay add last_time_interest_date date;

--��������
alter table cms_provide_loan_repay add pl_rate number(8,6);

--����ƻ�id
alter table cms_provide_loan_repay add repayment_schedule_id number;

commit

