--增加人：李鹏飞
--日期：2012-10-12
--内容:[BDC008]人行标准化
--贷款表
alter table cms_loan_info add rateTimeOfTakeEffect DATETIME;
--贷款表
alter table cms_provide_loan_info add rateTimeOfTakeEffect DATETIME;
go
