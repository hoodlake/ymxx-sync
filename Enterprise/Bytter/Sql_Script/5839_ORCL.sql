
--�޸���:���¾�
--�޸�ʱ��:2012-09-28
--�ʽ����������������������

CREATE OR REPLACE PROCEDURE UPDATE_BIS_EXC_VOUNCHERFROM
 As
  VOUNCHER_NO CHAR(10);      --����ƾ֤��
  ORIGIN_NO   VARCHAR2(100); --ԭʼƾ֤��
  ORIGIN_NO_TEMP VARCHAR2(100); --ԭʼƾ֤��
  VOUNCHER_FROM NUMBER(2);
  IS_FROM_CS NUMBER(1);
  no_data_found EXCEPTION;
Begin
  for j in (select e.voucher_no,e.cbs_bill_no from bis_exc e where e.voucher_from is null ) loop
      VOUNCHER_NO := j.voucher_no;
      if(j.cbs_bill_no is null) then
         IS_FROM_CS := 1;
         VOUNCHER_FROM := 6;
      else
        SELECT max(orig_voucher_no) into ORIGIN_NO FROM (
            select voucher_no,orig_voucher_no from fc_accbook  union
            select voucher_no,orig_voucher_no from fc_accbook_blned
            ) f where f.voucher_no = j.cbs_bill_no;

        --���ƾ֤��Ϊ��,��ʹ��ԭʼ��ƾ֤��
        if(ORIGIN_NO is null) then
           ORIGIN_NO :=j.cbs_bill_no;
        else
           IS_FROM_CS := 1;
           VOUNCHER_FROM := 6;
        end if;
      end if;
      --���Ȳ�ѯ����
      if(ORIGIN_NO is not null)then

        begin
        select max(n.bill_no) into ORIGIN_NO_TEMP  FROM nis_billhead n where n.bill_no =ORIGIN_NO ;
        VOUNCHER_FROM := 5;
        exception
        when NO_DATA_FOUND then
          begin
           select r.bill_no into ORIGIN_NO_TEMP from nis_allocation_req r where r.bill_no = ORIGIN_NO;
           VOUNCHER_FROM := 2;
           exception
           when NO_DATA_FOUND then
           VOUNCHER_FROM := -1;
          end ;
       end ;
      end if;

      --���ԭʼƾ֤�Ų�����null
      if(ORIGIN_NO_TEMP is not null)then
          update bis_exc e set e.voucher_from = VOUNCHER_FROM where e.voucher_no = j.voucher_no;
      else if(IS_FROM_CS = 1) then
           update bis_exc e set e.voucher_from = 6 where e.voucher_no = j.voucher_no;
      end if;
      end if;
   End Loop;
end UPDATE_BIS_EXC_VOUNCHERFROM;

/

call update_bis_exc_vouncherfrom();

