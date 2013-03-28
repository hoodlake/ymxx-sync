
-- 修改日期：20130227
-- 修改人：吴生火
--修改内容：修改字段长度

alter table bis_exc alter column payer_city varchar(30);
alter table fc_counter_exc alter column payer_city varchar(30);
alter table bis_exc_input alter column payer_city varchar(30);
alter table bis_exc alter column payee_city varchar(30);
alter table fc_counter_exc alter column payee_city varchar(30);
alter table bis_exc_input alter column payee_city varchar(30);






