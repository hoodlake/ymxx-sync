--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ����´������ʲ˵���Ӧ·��
--�������ã�
--���ʵ��Ƶ�
update bt_sys_res set res_url='/netbank/allWageList.jsp' where sys_code='nis' and res_name='���������Ƶ�' ;
--���ʵ��޸�
update bt_sys_res set res_url='/netbank/allWageModifyList.jsp' where sys_code='nis' and res_name='���������Ƶ��޸�' ;
--�������ʽ����ѯ
update bt_sys_res set res_url='/netbank/allWageResultList.jsp' where sys_code='nis' and res_name='�������ʽ����ѯ' ;
--�������ʽ���쳣����
update bt_sys_res set res_url='/netbank/allWageExceptionList.jsp' where sys_code='nis' and res_name='�������ʽ���쳣����' ;
--������ϸ�������ֶ�return_msg
alter table nis_wage_detail add return_msg varchar2(150);

commit;

--�޸����ڣ�20120813
--�޸��ˣ���̺�
--�޸����ݣ����¸��ʽ�������������
--�������ã�
--���ʵ��Ƶ�
insert into fc_voucher_type
  (VOUCHER_TYPE,
   VOUCHER_NAME,
   SYS_VOUCHER_CODE,
   CASH_TRANSFER_SIGN,
   RMK,
   VALID_SIGN,
   IS_ELECTRON_PAY)
values
  ('48', '��������', '48', 'T', '', '1', '1');
  
commit;

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
