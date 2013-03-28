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
