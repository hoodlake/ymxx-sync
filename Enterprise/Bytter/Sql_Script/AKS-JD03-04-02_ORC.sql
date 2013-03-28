
--修改时间2012-9-11
--修改人 李德成
--修改内容  向贷款数据表中增加字段贷款类型
ALTER TABLE CMS_LOAN_INFO ADD(LOAN_GENRE varchar2(1)); 
comment on column CMS_LOAN_INFO.LOAN_GENRE
  is '贷款类型，1：流动资金贷款     2：票据借贷';

--历史贷款记录贷款类型字段值默认赋值为流动资金贷款
update CMS_LOAN_INFO set LOAN_GENRE = 1;
 
--修改时间2012-9-11
--修改人 李德成
--修改内容  向库存票据表中增加字段
ALTER TABLE AB_RECEIVE ADD(LOAN_REPAY_BILL_CODE  varchar2(13)); 
comment on column AB_RECEIVE.LOAN_REPAY_BILL_CODE
  is '贷款还款表中的主键';

 --修改时间2012-9-11
--修改人 李德成
--修改内容 还款表 
ALTER TABLE CMS_LOAN_REPAY ADD(PAY_TYPE  varchar2(1)); 
comment on column CMS_LOAN_REPAY.PAY_TYPE
  is '支付方式   1:现汇支付   2:票据支付';
  commit;