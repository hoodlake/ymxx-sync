--修改日期：2012-07-30
--修改人：  费滔
--修改内容: 将种子表TB_GENERATOR中DATAEXCHANGE_ERP_TYPE_ID对应的value于数据表ERP_TYPE对应
--修改原因: 系统初始化时ERP_TYPE表中有四条数据，而种子表TB_GENERATOR的value却从1开始，导致新增时报错
delete from TB_GENERATOR where gen_name='DATAEXCHANGE_ERP_TYPE_ID'
go
insert into TB_GENERATOR(GEN_NAME,GEN_VALUE) select 'DATAEXCHANGE_ERP_TYPE_ID',(select count(TYPE_ID)+1 from ERP_TYPE)
go