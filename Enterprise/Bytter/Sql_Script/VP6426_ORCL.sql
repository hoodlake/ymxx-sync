-- �޸����ڣ�20120831
-- �޸��ˣ����ֻ�
--�޸����ݣ������ʽ����ͷ������ű�
-- �ʽ��������ϵͳ�ű�
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('fund_pos', 'nis', 'ͷ�����', 'A,B,C', 'NIS_ALLOCATION_REQ', '', 'money', '', 'next_checker', 'bill_no', '../allocation/appAllocation.jsp', '', '', '', '', 'com.byttersoft.allocation.form.FundAllocationAppPosForm', '', '', '', '', '', null, null, null, null, null, '');
insert into bt_sys_res
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS, RES_ORDER,RMK,RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res), 'ͷ�����','nis', res_code, '/allocation/posAllocation.do?method=toList'||chr(38)||'type=13', '0', '1','0','0',4,'ͷ�����',2 
  from bt_sys_res where res_name = '�ʽ����' and sys_code = 'nis' and res_level=1;

commit;

