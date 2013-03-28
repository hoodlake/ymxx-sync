--修改日期：2012-07-30
--修改人：  费滔
--修改内容: 将种子表TB_GENERATOR中DATAEXCHANGE_ERP_TYPE_ID对应的value于数据表ERP_TYPE对应
--修改原因: 系统初始化时ERP_TYPE表中有四条数据，而种子表TB_GENERATOR的value却从1开始，导致新增时报错
delete from TB_GENERATOR where gen_name='DATAEXCHANGE_ERP_TYPE_ID';
insert into TB_GENERATOR(GEN_NAME,GEN_VALUE) values('DATAEXCHANGE_ERP_TYPE_ID',(select count(*) from ERP_TYPE)); 
commit;