--修改日期：2012.11.5
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新
--授信限制审批模式
--alter table ab_operation add ratmodel char(1);
alter table gua_guarantee_info add ratmodel char(1);
alter table lc_enrol add ratmodel char(1);
alter table cms_provide_loan_info add ratmodel char(1);

--设置审批流程其他条件设置的业务
update bt_approve_business
       set table_field = 'ratmodel,其它条件'
     where business_code = 'ads_7'
        or business_code = 'grt_lg'
        or business_code = 'lcs_input'
     	or business_code = 'cms_B1';
     	
--增加其他条件表结构及配置数据     	
--drop table AB_OPERATION_CONTROL cascade constraints;
create table AB_OPERATION_CONTROL
(
  VOUCHER_TYPE  VARCHAR2(5) not null,
  VOUCHER_NAME  VARCHAR2(50),
  VALID_SIGN    CHAR(1),
  BUSINESS_CODE VARCHAR2(100)
)
TABLESPACE USERS;


insert into AB_OPERATION_CONTROL (VOUCHER_TYPE, VOUCHER_NAME, VALID_SIGN, BUSINESS_CODE)
values ('0', '集团总额共享授信', '1', 'ads_7,grt_lg,lcs_input,cms_B1');
insert into AB_OPERATION_CONTROL (VOUCHER_TYPE, VOUCHER_NAME, VALID_SIGN, BUSINESS_CODE)
values ('1', '单位自主授信', '1', 'ads_7,grt_lg,lcs_input,cms_B1');
commit;
