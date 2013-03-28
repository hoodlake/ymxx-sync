--修改人：陈春燕
--修改日期：2012-08-15
--修改内容: 数据库ab_receive表新增一个字段discount_to_middlenet(贴现到中间级网点的标识)
--修改原因:user00031072 贴现到二级网点的票据，只能在入库列表中，不能在登记列表，避免不符合实际情况的删除
alter table ab_receive add  discount_to_middlenet CHAR(1) default 0
go
