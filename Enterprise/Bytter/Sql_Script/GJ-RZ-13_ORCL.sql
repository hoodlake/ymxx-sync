update bt_param set name='�����Ŵ�̨�˹���' where code='is_charging';
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE  RES_NAME='����̨�˹���' and sys_code='cms' and RES_LEVEL=1;
   IF VN_COUNT = 0 THEN
       insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
       values ((select max(res_code) + 1 from bt_sys_res), '����̨�˹���', 'cms', 0, '', '0', '1', '0', '0', 0, '', '', '', '', '', '', null, null, null, null, null, 1, '');
   END IF;
end;
/
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='��������¼��' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
       values ((select max(res_code) + 1 from bt_sys_res), '��������¼��', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=1', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=8', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '�����', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/LoanSendOutPreview.jsp', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/ContractManage.jsp?li_code=0'||chr(38)||'opflag=1', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

 delete from bt_sys_res where RES_NAME='����̨��' and sys_code='cms' and RES_LEVEL=2;
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '����̨��', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/cmsLoanBill.do?method=toList', '0', '1', '0', '0', 4, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 delete from bt_sys_res where RES_NAME='�������' and sys_code='cms' and RES_LEVEL=2;
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�������', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/cmsLoanAnnul.do?method=initQuery', '0', '1', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 
 delete from bt_sys_res where RES_NAME='�����̨��' and sys_code='cms' and RES_LEVEL=2;
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�����̨��', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/cmsLoanRepay.do?method=initQuery', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 
 delete from bt_sys_res where RES_NAME='�ʽ�ռ�÷�' and sys_code='cms' and RES_LEVEL=2;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�ʽ�ռ�÷�', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '', '0', '1', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 delete from bt_sys_res where RES_NAME='�Ʒ�' and sys_code='cms' and RES_LEVEL=3;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�Ʒ�', 'cms', (select res_code from bt_sys_res where res_name='�ʽ�ռ�÷�' and sys_code='cms'), '/cms/billing.do?method=toList', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 delete from bt_sys_res where RES_NAME='����ռ�÷�' and sys_code='cms' and RES_LEVEL=3;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '����ռ�÷�', 'cms', (select res_code from bt_sys_res where res_name='�ʽ�ռ�÷�' and sys_code='cms'), '/cms/accountingFee.do?method=toList', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 delete from bt_sys_res where RES_NAME='�ɷѼ�¼' and sys_code='cms' and RES_LEVEL=3;
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�ɷѼ�¼', 'cms', (select res_code from bt_sys_res where res_name='�ʽ�ռ�÷�' and sys_code='cms'), '/cms/cmsPaymentRecord.do?method=toList', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 
 DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='��������¼��' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '��������¼��', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/loan_add.jsp', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/
   DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '�����', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/LoanSendOutPreview.jsp', '0', '1', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

     DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=8', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/ContractManage.jsp?li_code=0'||chr(38)||'opflag=1', '0', '1', '0', '0', 13, '', '', '', '', '', '', null, null, null, null, null, 2, ''); 
   END IF;
end;
/
commit;