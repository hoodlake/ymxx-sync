--�޸�ʱ��2012-9-20
--�޸��� ����
--�޸�����  ����ű�

alter table loan_send_out_info alter column REPAY_TYPE varchar(10);

update loan_send_out_info set REPAY_TYPE='0'+REPAY_TYPE where len(rtrim(repay_type))=1;; 
go
	