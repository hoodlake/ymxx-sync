--修改时间2012-12-05
--修改人 王诣博
--修改内容  信用证登记  增加 实付类型等字段，以及系统参数

--信用证登记表新增”实付类型“字段
alter table lc_enrol add PRACTICE_TYPE varchar2(30);
--信用证登记表新增”实付单位“字段
alter table lc_enrol add PAYMENT_CORP varchar2(200);
--信用证登记表新增”客户已开票汇款“字段
alter table lc_enrol add REMIT NUMBER(18,2);
--信用证登记表新增”客户应还款“字段
alter table lc_enrol add REPAYMENT NUMBER(18,2);
--信用证登记表新增”加价利润“字段
alter table lc_enrol add INCREASE_PROFIT NUMBER(18,2);
--信用证登记表新增”收取服务费“字段
alter table lc_enrol add SERVICE_CHARGE NUMBER(18,2);



DECLARE
VN_COUNT   number(10,2);
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
   WHERE sys_code='lcs' and code='practice_type';
   IF VN_COUNT = 0 THEN
   insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
   values ('practice_type','lcs','实务类型',null,null,null,0,'实务类型','说明：多个实务类型用英文分号分隔',null,null,null,null,0,10,null,null,null);
   commit;
 END IF;
END;
/
