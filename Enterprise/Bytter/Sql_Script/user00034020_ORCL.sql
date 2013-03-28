--修改时间2012-9-20
--修改人 刘勇
--修改内容  贷款发放表

alter table loan_send_out_info modify REPAY_TYPE varchar2(10);

update loan_send_out_info set REPAY_TYPE=concat('0',REPAY_TYPE) where length(repay_type)=1;

commit;
