--修改日期：2013-02-26
--修改人：黄学安
--修改内容：初始化贷款固定利(费)率
update CMS_LOAN_INFO  set clb_fixed_rate = 0.000000 where clb_fixed_rate is null;
go