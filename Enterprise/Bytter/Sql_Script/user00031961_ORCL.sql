--修改人：李程
--修改日期：2012-09-06
--修改内容: 数据库ab_emit表新增1个字段
--修改原因:user00031961(增加自开承兑汇票票据的保证金比例)
--bail_proportion number:保证金比例;
ALTER TABLE ab_emit add bail_proportion number(5,4);
