--修改时间2012-9-11
--修改人 李德成
--修改内容  向贷款数据表中增加字段贷款类型LOAN_GENRE贷款类型，1：流动资金贷款     2：票据借贷
ALTER TABLE CMS_LOAN_INFO ADD LOAN_GENRE VARCHAR(1)
go
--历史贷款记录贷款类型字段值默认赋值为流动资金贷款
update CMS_LOAN_INFO set LOAN_GENRE = 1
go

--修改时间2012-9-11
--修改人 李德成
--修改内容  向库存票据表中增加字段LOAN_REPAY_BILL_CODE贷款还款表中的主键
ALTER TABLE AB_RECEIVE ADD LOAN_REPAY_BILL_CODE  VARCHAR(13)
go
--修改时间2012-9-11
--修改人 李德成
--修改内容 还款表 PAY_TYPE支付方式   1:现汇支付   2:票据支付
ALTER TABLE CMS_LOAN_REPAY ADD PAY_TYPE  VARCHAR(1)
go