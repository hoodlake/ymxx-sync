--修改时间2012-12-05
--修改人 王诣博
--修改内容  承兑汇票 增加 实付类型等字段，以及系统参数

--自开票据表新增”实付类型“字段
alter table AB_EMIT add PRACTICE_TYPE varchar(30);
--自开票据表新增”实付单位“字段
alter table AB_EMIT add PAYMENT_CORP varchar(200);
--自开票据表新增”客户已开票汇款“字段
alter table AB_EMIT add REMIT numeric(18,2);
--自开票据表新增”客户应还款“字段
alter table AB_EMIT add REPAYMENT numeric(18,2);
--自开票据表新增”加价利润“字段
alter table AB_EMIT add INCREASE_PROFIT numeric(18,2);
--自开票据表新增”收取服务费“字段
alter table AB_EMIT add SERVICE_CHARGE numeric(18,2);




declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_param where sys_code='ads' and code='practice_type';
if (@VN_COUNT = 0 ) 
begin  
  insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
   values ('practice_type','ads','实务类型',null,null,null,0,'实务类型','说明：多个实务类型用英文分号分隔',null,null,null,null,0,10,null,null,null);
end;
end;
go 
