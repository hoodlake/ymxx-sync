--�޸����ڣ�20120817
--�޸��ˣ���̺�
--�޸����ݣ����¸���ָ��������������ʿɷ�����ָ��
--�������ã�
--���ʵ��Ƶ�
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
         raise_application_error(-20001,'ϵͳ�Ѵ���ƾ֤'||:new.cbs_bill_no||'�ĸ���ָ��,�����ٲ�������ָ��!');
         return;
     end if;
  end if;
end;
/
