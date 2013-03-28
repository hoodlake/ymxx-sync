--修改人:蒲勇军
--修改时间:2012-09-11
--修改内容:-付款参数表新增“预算科目”列
alter table bt_payment_param add item_code varchar(100)
GO
--更新菜单路径
update bt_sys_res set res_name='付款方式参数' where sys_code='adm' and res_name='付款记账参数'
GO

