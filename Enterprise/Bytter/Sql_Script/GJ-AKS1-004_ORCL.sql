--修改人:蔡瑾钊
--修改时间:2012-11-05
--修改内容:新建表及添加初始数据
create table LC_AMENDATORY  (
   GUID                 VARCHAR2(40)                    not null,  --主键
   CORP_ID              INTEGER                         not null,  --单位
   AMENDATORY_CODE      CHAR(13)                        not null,  --申请改证编号
   LC_CODE              CHAR(12)                        not null,  --信用证编号
   CREDIT_NO            VARCHAR2(20),          --信用证号
   ISSUING_BANK_CODE    CHAR(4),          --开证银行编号
   ISSUING_BANK         VARCHAR2(50),          --开证银行
   BENEFICIARY          VARCHAR2(100),          --受益人
   AMENDATORY_DATE      DATE,            --申请改证日期
   AMENDATORY_TIMES     INTEGER                         not null,  --申请改证次数
   EXPIRY_DATE_NEW      DATE,            --新有效日期
   SHIP_DATE_NEW        DATE,            --新装运期
   CREDIT_MONEY_ADD     NUMBER(15,2),          --信用证增额
   CURRENCY_ADD         VARCHAR2(2),          --增额币别
   CREDIT_MONEY_REDUCE  NUMBER(15,2),          --信用证减额
   CURRENCY_REDUCE      VARCHAR2(2),          --减额币别
   CREDIT_MONEY_NEW     NUMBER(15,2),          --修改后信用证金额
   CURRENCY_NEW         VARCHAR2(2),          --币别
   CLAUSE_AMENDATORY    VARCHAR2(200),          --修改条款
   CAUSE_AMENDATORY     VARCHAR2(200),          --修改原因
   OP_CODE              VARCHAR2(8),          --经办人
   AMENDATORY_CODE_LAST CHAR(13),
   APPROVES				VARCHAR2(150),
   NEXTCHECKER			VARCHAR2(150),
   PASS_DATE			DATE,
   STATUS               INTEGER                         not null,  --状态
   constraint PK_LC_AMENDATORY primary key (GUID)
);

--新建菜单
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '信用证改证申请', 'lcs', (select res_code from bt_sys_res where res_name='开证登记' and sys_code='lcs'), '/intersettle/LC_Amendatory.jsp', '0', '1', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '信用证改证办理', 'lcs', (select res_code from bt_sys_res where res_name='开证登记' and sys_code='lcs'), '/intersettle/LC_Amendatory_Handle.jsp', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

--添加审批规则
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('lcs_amendcrdt', 'lcs', '信用证改证', 'A,B,C', 'lc_amendatory', 'credit_money_new',  'nextchecker', 'amendatory_code', '../intersettle/LC_AmendatoryView.jsp', 'com.byttersoft.intersettle.form.LC_AmendatoryForm');

--添加流水号生成规则
insert into bt_key_generator
  (id, tablename, keyalisename, custgenclass, genstrate)
values
  (nvl((select max(id) from bt_key_generator), 0) + 1,
   'lc_amendatory',
   'amendatoryCode',
   'com.byttersoft.intersettle.service.LCAmendatoryKeyGenerator',
   'cu');

commit;