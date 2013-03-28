--�޸���:�����
--�޸�ʱ��:2012-11-05
--�޸�����:�½�����ӳ�ʼ����
create table LC_AMENDATORY  (
   GUID                 VARCHAR(40)                    not null,  --����
   CORP_ID              INT                         not null,  --��λ
   AMENDATORY_CODE      CHAR(13)                        not null,  --�����֤���
   LC_CODE              CHAR(12)                        not null,  --����֤���
   CREDIT_NO            VARCHAR(20),          --����֤��
   ISSUING_BANK_CODE    CHAR(4),          --��֤���б��
   ISSUING_BANK         VARCHAR(50),          --��֤����
   BENEFICIARY          VARCHAR(100),          --������
   AMENDATORY_DATE      Datetime,            --�����֤����
   AMENDATORY_TIMES     INT                         not null,  --�����֤����
   EXPIRY_DATE_NEW      Datetime,            --����Ч����
   SHIP_DATE_NEW        Datetime,            --��װ����
   CREDIT_MONEY_ADD     NUMERIC(15,2),          --����֤����
   CURRENCY_ADD         VARCHAR(2),          --����ұ�
   CREDIT_MONEY_REDUCE  NUMERIC(15,2),          --����֤����
   CURRENCY_REDUCE      VARCHAR(2),          --����ұ�
   CREDIT_MONEY_NEW     NUMERIC(15,2),          --�޸ĺ�����֤���
   CURRENCY_NEW         VARCHAR(2),          --�ұ�
   CLAUSE_AMENDATORY    VARCHAR(200),          --�޸�����
   CAUSE_AMENDATORY     VARCHAR(200),          --�޸�ԭ��
   OP_CODE              VARCHAR(8),          --������
   AMENDATORY_CODE_LAST CHAR(13),
   APPROVES				VARCHAR(150),
   NEXTCHECKER			VARCHAR(150),
   PASS_DATE			Datetime,
   STATUS               INT                         not null,  --״̬
   constraint PK_LC_AMENDATORY primary key (GUID)
)
go

--�½��˵�
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '����֤��֤����', 'lcs', (select res_code from bt_sys_res where res_name='��֤�Ǽ�' and sys_code='lcs'), '/intersettle/LC_Amendatory.jsp', '0', '1', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, ''
go

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '����֤��֤����', 'lcs', (select res_code from bt_sys_res where res_name='��֤�Ǽ�' and sys_code='lcs'), '/intersettle/LC_Amendatory_Handle.jsp', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, ''
go

--�����������
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('lcs_amendcrdt', 'lcs', '����֤��֤', 'A,B,C', 'lc_amendatory', 'credit_money_new',  'nextchecker', 'amendatory_code', '../intersettle/LC_AmendatoryView.jsp', 'com.byttersoft.intersettle.form.LC_AmendatoryForm')
go

--�����ˮ�����ɹ���
insert into bt_key_generator
  (id, tablename, keyalisename, custgenclass, genstrate)
select
   isnull((select max(id) from bt_key_generator), 0) + 1,
   'lc_amendatory',
   'amendatoryCode',
   'com.byttersoft.intersettle.service.LCAmendatoryKeyGenerator',
   'cu'
go

