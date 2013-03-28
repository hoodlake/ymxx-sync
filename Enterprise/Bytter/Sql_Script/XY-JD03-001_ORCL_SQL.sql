--修改日期：20120807
--修改人：祁继鸿
--修改内容：更新代发工资菜单对应路径
--参数设置：
--工资单制单
update bt_sys_res set res_url='/netbank/allWageList.jsp' where sys_code='nis' and res_name='代发工资制单' ;
--工资单修改
update bt_sys_res set res_url='/netbank/allWageModifyList.jsp' where sys_code='nis' and res_name='代发工资制单修改' ;
--代发工资结果查询
update bt_sys_res set res_url='/netbank/allWageResultList.jsp' where sys_code='nis' and res_name='代发工资结果查询' ;
--代发工资结果异常处理
update bt_sys_res set res_url='/netbank/allWageExceptionList.jsp' where sys_code='nis' and res_name='代发工资结果异常处理' ;
--更新明细表增加字段return_msg
alter table nis_wage_detail add return_msg varchar2(150);

commit;

--修改日期：20120813
--修改人：祁继鸿
--修改内容：更新付款方式表，插入代发工资
--参数设置：
--工资单制单
insert into fc_voucher_type
  (VOUCHER_TYPE,
   VOUCHER_NAME,
   SYS_VOUCHER_CODE,
   CASH_TRANSFER_SIGN,
   RMK,
   VALID_SIGN,
   IS_ELECTRON_PAY)
values
  ('48', '代发工资', '48', 'T', '', '1', '1');
  
commit;

--修改日期：20120817
--修改人：祁继鸿
--修改内容：更新付款指令触发器，代发工资可发多条指令
--参数设置：
--工资单制单
create or replace trigger tr_bis_exc_ins
before insert
on bis_exc
referencing old as old new as new
for each row
declare
  li_cnt int;
  ls_cbs_bill_no varchar2(20);
begin
  ls_cbs_bill_no := :new.cbs_bill_no;
  if ls_cbs_bill_no  is not null then
     select count(*) into li_cnt
     from bis_exc
     where cbs_bill_no= ls_cbs_bill_no and (voucher_stat<>'B' and voucher_stat<>'7') and voucher_type <> '48';
     if li_cnt >0 then
         raise_application_error(-20001,'系统已存在凭证'||:new.cbs_bill_no||'的付款指令,不能再产生付款指令!');
         return;
     end if;
  end if;
end;
/
