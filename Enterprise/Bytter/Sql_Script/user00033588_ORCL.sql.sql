--�����ˣ�����
--�޸����ڣ�2012-10-19
--�޸�����: ������������
--�޸�ԭ��:����XD-JD03-013��XD-JD03-008��XD-JD03-009��XD-JD03-010 ϵͳ����-���н����Ϣ��¼����-����ƻ�

--cms_loan_info���send_time�ֶ�
alter table cms_loan_info add send_time number default 1;
--repayment_schedule���send_time�ֶ�
alter table repayment_schedule add send_time number;
commit;
