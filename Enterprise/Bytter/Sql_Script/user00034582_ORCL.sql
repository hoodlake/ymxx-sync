--修改日期：2012-11-09
--修改人：卢燕南
--修改内容：添加字段
--修改原因：中远——ZY-ZH-06

--添加字段
alter table bt_dictionary add stat number(10);

--添加字段注释
comment on column BT_DICTIONARY.stat is '状态';

commit;

