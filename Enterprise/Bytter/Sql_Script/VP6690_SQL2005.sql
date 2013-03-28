--修改日期：2012.9.24
--修改人：黄茜
--修改内容：付款明细新增是否加密 1，是；0或空，否
--修改原因：[VP6690]屏蔽报账明细的金额数据以“”号显示

alter table nis_expense_detail add is_encrypted char(1);
