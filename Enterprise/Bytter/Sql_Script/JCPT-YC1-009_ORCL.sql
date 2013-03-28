--修改日期：2012.11.09
--修改人：刘之三
--修改内容：最大付款日期维护
--修改原因：最大付款日期维护
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BT_MAX_PAY_DATE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE BT_MAX_PAY_DATE(ID NUMBER(10) PRIMARY KEY ,ENTER_DATE DATE,BUSINESS_TYPE_NAME VARCHAR2(40),CORP_CODE VARCHAR2(40),PAY_MONTH VARCHAR2(200),MAX_PAY_DAY NUMBER(2),RMK VARCHAR2(400),VALID_SIGN VARCHAR2(2))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--修改人：费滔
--修改日期：2012-11-07
--修改内容: 新增erp_pay_info 和fbs_item的中间表
--修改原因:易才天预算新增需求
 create or replace  view V_BUSINESS_INFO as 
   select e.bytter_id as item_code ,e.erp_id as business_Type ,e.erp_name  as business_Name from erp_basic_data e where e.data_type='FBS_ITEM' and e.erp_sys_name='budget' ;
   comment on column V_BUSINESS_INFO.item_code   is '科目代码';
   comment on column V_BUSINESS_INFO.business_Name   is '业务名称';
   comment on column V_BUSINESS_INFO.business_type   is '业务代码';

declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '最大付款日期维护' and sys_code = 'adm'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '最大付款日期维护', 'adm', (select res_code from bt_sys_res  where res_name = '基础数据维护' and sys_code = 'adm' ), '/admin/createBtMaxPayDate.jsp', '0', '1', '0', '0', 11, '最大付款日期维护', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;
end if;
end ;
/

   
   
--修改人：费滔
--修改日期：2012-11-07
--修改内容: 易才节假日付款执行系统参数增加
--修改原因:易才节假日付款执行系统参数增加  

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='festivalPay' AND SYS_CODE='nis';
  IF VN_COUNT < 1 THEN
    INSERT INTO BT_PARAM (CODE,SYS_CODE,NAME,PARAM_VALUE1,PARAM_VALUE2,PARAM_VALUE3,PARAM_TYPE,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10)
  VALUES ('festivalPay','nis','节假日付款执行','0',null,null,'','节假日付款执行,默认节假日执行','0,节假日执行;1,节前最后一个工作日;2,节后第一个工作日','','','','',1.00,36.00,null,null,null);
  COMMIT;
 END IF; 
END;
/
