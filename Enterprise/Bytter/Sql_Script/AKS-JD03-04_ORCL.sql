--�޸��ˣ��´���
--�޸����ڣ�2012-09-08
--�޸�����: �����˵�
--�޸�ԭ��:����-AKS-JD03-04[Ʊ���ϲ��»�]
insert into BT_SYS_RES
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         'Ʊ�ݻ���',
         'ads',
         RES_CODE,
         '',
         '0',
         '1',
         '0',
         '0',
         3,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2,
         ''
    from bt_sys_res
   where res_name = '���Ʊ��ҵ��';
   commit;
----------------- 
insert into BT_SYS_RES
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         'Ʊ���ϻ�',
         'ads',
         RES_CODE,
         '/AB/allocation.do?method=allocationList'||'&'||'opType=0',
         '0',
         '1',
         '0',
         '0',
         3,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2,
         ''
    from bt_sys_res
   where res_name = 'Ʊ�ݻ���' and father_code >0;
   commit;
-------------����Ʊ�ݹ鼯�˵�
insert into BT_SYS_RES
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         'Ʊ�ݹ鼯',
         'ads',
         RES_CODE,
         '/AB/allocation.do?method=allocationList'||'&'||'opType=1',
         '0',
         '1',
         '0',
         '0',
         3,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2,
         ''
    from bt_sys_res
   where res_name = 'Ʊ�ݻ���' and father_code >0;
   commit;
---------------------------
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_40', 'ads', 'Ʊ���ϻ�', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '');
commit;
-----Ʊ�ݹ鼯����
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_41', 'ads', 'Ʊ�ݹ鼯', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '');
commit;
----------------�²���������
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_42', 'ads', '�²�����', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '');
commit;
--------------Ʊ���²�����
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_43', 'ads', 'Ʊ���²�', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '');
commit;
--ҵ�����42,43����ҳ��SQL
UPDATE BT_APPROVE_BUSINESS T
   SET T.URL1 = '../AB/bill/billAllocatedCheck.jsp'
 WHERE T.BUSINESS_CODE IN ('ads_42', 'ads_43');
 
--�½�Ʊ�ݹ鼯������
--�½�Ʊ�ݹ鼯������
create table AB_BILL_ALLOCATION_STOCK  (
   ID                   NUMBER(28)    NOT NULL,
   OPERATION_ID         NUMBER(28)    NOT NULL,
   CORP_ID              NUMBER(10),
   CORP_NAME            VARCHAR2(80),
   REG_DATE             DATE,
   ALLOCATION_TYPE      VARCHAR2(20), 
   CENTER_CORP_ID       NUMBER(10),
   CENTER_CORP_NAME     VARCHAR2(80),
   BILL_CODES           VARCHAR2(200),
   ALLOCATED_CODE       VARCHAR2(20),
   MONEY                NUMBER(18,2),
   IS_TALLY             CHAR
);

alter table AB_BILL_ALLOCATION_STOCK
  add constraint PK_AB_BILL_ALLOCATION_STOCK primary key (ID);
  
-- Add comments to the columns 
  comment on column AB_BILL_ALLOCATION_STOCK.ID
  is '����';
  comment on column AB_BILL_ALLOCATION_STOCK.OPERATION_ID
  is '����ҵ�������';
  comment on column AB_BILL_ALLOCATION_STOCK.CORP_ID
  is '��Ա��λID';
  comment on column AB_BILL_ALLOCATION_STOCK.CORP_NAME
  is '��Ա��λ����';
  comment on column AB_BILL_ALLOCATION_STOCK.REG_DATE
  is 'ҵ�����ʱ��';
  comment on column AB_BILL_ALLOCATION_STOCK.ALLOCATION_TYPE
  is '����ҵ�����ͣ�1�ϻ���2�鼯��3�²���';
  comment on column AB_BILL_ALLOCATION_STOCK.CENTER_CORP_ID
  is '���ĵ�λID';
  comment on column AB_BILL_ALLOCATION_STOCK.CENTER_CORP_NAME
  is '���ĵ�λ����';
  comment on column AB_BILL_ALLOCATION_STOCK.BILL_CODES
  is '������Ʊ�ݺ���';
  comment on column AB_BILL_ALLOCATION_STOCK.ALLOCATED_CODE
  is '�²����ţ��鼯ʱΪ��';  
  comment on column AB_BILL_ALLOCATION_STOCK.MONEY
  is '���';
  comment on column AB_BILL_ALLOCATION_STOCK.IS_TALLY
  is 'CS����״̬(1������ɣ�0δ���)';
--------------------
INSERT INTO TB_GENERATOR
  (ID, GEN_NAME, GEN_VALUE)
VALUES
  ((SELECT MAX(ID) + 1 FROM TB_GENERATOR), 'AB_BILL_ALLOCATION_STOCK_ID', 1);
  commit;
---------------------ҵ�����������ԭ�򣬸���,���뵥λ
alter table ab_operation add(app_reason VARCHAR2(200));
--alter table ab_operation add(attachment VARCHAR2(200));

--�޸���:���¾�
--�޸�ʱ��:2012-10-9
--�޸�����:����ֶβ�����������ֶ� 
 
DECLARE
  VN_COUNT     NUMBER;
  V_STR        VARCHAR2(1000);
BEGIN
select COUNT(*) 
  INTO VN_COUNT
  from user_tab_cols 
 where table_name = 'AB_OPERATION' AND COLUMN_NAME = 'ATTACHMENT';
IF VN_COUNT < 1 THEN
  V_STR := ' ALTER TABLE AB_OPERATION ADD ATTACHMENT CHAR(10)';
  EXECUTE IMMEDIATE V_STR;
END IF;
END;
/





alter table ab_operation add(operater_corp_Id  NUMBER(10));
---------------�����²�����˵�
insert into BT_SYS_RES
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '�²�����',
         'ads',
         RES_CODE,
         '/AB/allocated.do?method=allocatedAppList',
         '0',
         '1',
         '0',
         '0',
         3,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2,
         ''
    from bt_sys_res
   where res_name = 'Ʊ�ݻ���' and father_code >0;
---------------����Ʊ���²��˵�
insert into BT_SYS_RES
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         'Ʊ���²�',
         'ads',
         RES_CODE,
         '/AB/allocated.do?method=billAllocated',
         '0',
         '1',
         '0',
         '0',
         3,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2,
         ''
    from bt_sys_res
   where res_name = 'Ʊ�ݻ���' and father_code >0;
   commit;
---------------��Ҫ�ж����ü��˲�����ҵ������
insert into BT_ACCOUNT_BUSINESS (ID, BUSINESS_NAME, SYS_CODE)
values (40, '�ϻ�', 'ads');
insert into BT_ACCOUNT_BUSINESS (ID, BUSINESS_NAME, SYS_CODE)
values (41, '�鼯', 'ads');
insert into BT_ACCOUNT_BUSINESS (ID, BUSINESS_NAME, SYS_CODE)
values (43, '�²�', 'ads');
commit;
--Ʊ�ݴ�����ѯ�˵�
INSERT INTO BT_SYS_RES
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
VALUES
  ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES),
   'Ʊ�ݴ�����ѯ',
   'ads',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'ads'
       AND RES_NAME = '��ѯͳ��'),
   '/AB/billAllocationStock.do?method=billAllocationStockInit',
   '0',
   '1',
   '0',
   '0',
   (SELECT MAX(RES_ORDER) + 1
      FROM BT_SYS_RES
     WHERE FATHER_CODE = (SELECT RES_CODE
                            FROM BT_SYS_RES
                           WHERE SYS_CODE = 'ads'
                             AND RES_NAME = '��ѯͳ��')),
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   2,
   '');
   commit;

-- �޸����ڣ�20120922
-- �޸��ˣ�������
--�޸����ݣ�AKSƱ���ϻ��²��鼯

declare 
 max_id_cs20120922 number;
 max_id_cs20120922_id number;
 max_id_cs20120922_1 number;
 begin
    select count(*) into max_id_cs20120922 from bt_function where FUNCTION_IDEN='w_chalk_trac';
    if max_id_cs20120922=0 then
      select FUNCTION_ID into max_id_cs20120922_id from bt_function where function_name='�жһ�Ʊ';
      --����
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '����', '', '', '', 'Mod', max_id_cs20120922_id, 6, '', '1', 'interacc', '����', '1');
      --�������˸��˸���
      select max(function_id)+1 into max_id_cs20120922_id from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_id, 'w_chalk_trac', '��������', '', '', '', 'Mnu', max_id_cs20120922_1, 1, '', '1', 'interacc', '��������', '1');

      select max(function_id)+1 into max_id_cs20120922_id from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_id, 'w_chalk_trac_modify', '��������', '', '', '', 'Mnu', max_id_cs20120922_1, 2, '', '1', 'interacc', '��������', '1');

      select max(function_id)+1 into max_id_cs20120922_id from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_id, 'w_chalk_trac_check', '��������', '', '', '', 'Mnu', max_id_cs20120922_1, 3, '', '1', 'interacc', '��������', '1');
      --��������
      select FUNCTION_ID into max_id_cs20120922 from bt_function where FUNCTION_IDEN='w_chalk_trac';
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '����', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', max_id_cs20120922, 1, '', '1', 'interacc', '����', '1');
      
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '���', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', max_id_cs20120922, 2, '', '1', 'interacc', '���', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', 'ˢ��', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', max_id_cs20120922, 3, '', '1', 'interacc', 'ˢ����ʾ', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', max_id_cs20120922, 4, '', '1', 'interacc', '��ӡԤ��', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', max_id_cs20120922, 5, '', '1', 'interacc', '��ӡ', '1');
      --��������
      select FUNCTION_ID into max_id_cs20120922 from bt_function where FUNCTION_IDEN='w_chalk_trac_modify';
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '����', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', max_id_cs20120922, 1, '', '1', 'interacc', '�������', '1');
      
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '���', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', max_id_cs20120922, 2, '', '1', 'interacc', '���', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', 'ˢ��', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', max_id_cs20120922, 3, '', '1', 'interacc', 'ˢ����ʾ', '1');
      
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', max_id_cs20120922, 4, '', '1', 'interacc', '��ӡԤ��', '1');
      
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', max_id_cs20120922, 5, '', '1', 'interacc', '��ӡ', '1');


      --��������
      select FUNCTION_ID into max_id_cs20120922 from bt_function where FUNCTION_IDEN='w_chalk_trac_check';
      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '����', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', max_id_cs20120922, 1, '', '1', 'interacc', '����', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '���', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', max_id_cs20120922, 2, '', '1', 'interacc', '���', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', 'ˢ��', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', max_id_cs20120922, 3, '', '1', 'interacc', 'ˢ����ʾ', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', max_id_cs20120922, 4, '', '1', 'interacc', '��ӡԤ��', '1');

      select max(function_id)+1 into max_id_cs20120922_1 from BT_FUNCTION;
      insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (max_id_cs20120922_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', max_id_cs20120922, 5, '', '1', 'interacc', '��ӡ', '1');
    end if;
     
end;
/
commit;