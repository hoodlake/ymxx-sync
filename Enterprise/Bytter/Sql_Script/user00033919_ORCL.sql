--�޸�ʱ��2012-9-20
--�޸��� ����
--�޸�����  ����ű�

alter table loan_send_out_info modify REPAY_TYPE varchar2(10);

update loan_send_out_info set REPAY_TYPE=concat('0',REPAY_TYPE);

commit;
