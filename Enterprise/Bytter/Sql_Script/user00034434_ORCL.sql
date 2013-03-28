--日期：2012-11-14
--修改人：leiyx
--修改内容：修改参数“内部贷款启用计费功能”，将参数名称修改为“启用信贷台账管理”；
update bt_param a
set
a.name='启用信贷台账管理'
where
a.code='is_charging';
COMMIT;
