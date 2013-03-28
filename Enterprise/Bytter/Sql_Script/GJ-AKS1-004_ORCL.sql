--�޸���:�����
--�޸�ʱ��:2012-11-05
--�޸�����:�½�����ӳ�ʼ����
create table LC_AMENDATORY  (
   GUID                 VARCHAR2(40)                    not null,  --����
   CORP_ID              INTEGER                         not null,  --��λ
   AMENDATORY_CODE      CHAR(13)                        not null,  --�����֤���
   LC_CODE              CHAR(12)                        not null,  --����֤���
   CREDIT_NO            VARCHAR2(20),          --����֤��
   ISSUING_BANK_CODE    CHAR(4),          --��֤���б��
   ISSUING_BANK         VARCHAR2(50),          --��֤����
   BENEFICIARY          VARCHAR2(100),          --������
   AMENDATORY_DATE      DATE,            --�����֤����
   AMENDATORY_TIMES     INTEGER                         not null,  --�����֤����
   EXPIRY_DATE_NEW      DATE,            --����Ч����
   SHIP_DATE_NEW        DATE,            --��װ����
   CREDIT_MONEY_ADD     NUMBER(15,2),          --����֤����
   CURRENCY_ADD         VARCHAR2(2),          --����ұ�
   CREDIT_MONEY_REDUCE  NUMBER(15,2),          --����֤����
   CURRENCY_REDUCE      VARCHAR2(2),          --����ұ�
   CREDIT_MONEY_NEW     NUMBER(15,2),          --�޸ĺ�����֤���
   CURRENCY_NEW         VARCHAR2(2),          --�ұ�
   CLAUSE_AMENDATORY    VARCHAR2(200),          --�޸�����
   CAUSE_AMENDATORY     VARCHAR2(200),          --�޸�ԭ��
   OP_CODE              VARCHAR2(8),          --������
   AMENDATORY_CODE_LAST CHAR(13),
   APPROVES				VARCHAR2(150),
   NEXTCHECKER			VARCHAR2(150),
   PASS_DATE			DATE,
   STATUS               INTEGER                         not null,  --״̬
   constraint PK_LC_AMENDATORY primary key (GUID)
);

--�½��˵�
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '����֤��֤����', 'lcs', (select res_code from bt_sys_res where res_name='��֤�Ǽ�' and sys_code='lcs'), '/intersettle/LC_Amendatory.jsp', '0', '1', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '����֤��֤����', 'lcs', (select res_code from bt_sys_res where res_name='��֤�Ǽ�' and sys_code='lcs'), '/intersettle/LC_Amendatory_Handle.jsp', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

--�����������
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('lcs_amendcrdt', 'lcs', '����֤��֤', 'A,B,C', 'lc_amendatory', 'credit_money_new',  'nextchecker', 'amendatory_code', '../intersettle/LC_AmendatoryView.jsp', 'com.byttersoft.intersettle.form.LC_AmendatoryForm');

--�����ˮ�����ɹ���
insert into bt_key_generator
  (id, tablename, keyalisename, custgenclass, genstrate)
values
  (nvl((select max(id) from bt_key_generator), 0) + 1,
   'lc_amendatory',
   'amendatoryCode',
   'com.byttersoft.intersettle.service.LCAmendatoryKeyGenerator',
   'cu');

commit;