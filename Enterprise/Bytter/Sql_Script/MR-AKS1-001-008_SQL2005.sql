--修改时间2012-11-03
--修改人 邹仁斌 
--修改内容   贸易融资


---更新贸易融资所在的位置  
update bt_sys_res set res_order=4 where sys_code='cms' and res_order=3 and res_url is null 

go 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资', 'cms', 0, '', '0', '0', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 1, '')
go 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资申请录入', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=save', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '')
go 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资申请暂存', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=tempsave', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '')
go 

/*==============================================================*/
/* 贸易融资信息表                                               */
/*============================================================ */
create table FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   -----融资单编号
   TYPE_CODE            varchar2(10)                    not null,   -----融资类别
   BILL_CODE            CHAR(10),                                   -----借款信息
   FOFE_CODE            CHAR(14),                                   -----福费延融信息
   ENTER_DATE           DATE                            not null,   -----录入日期 
   OP                   VARCHAR2(8)                     not null,   -----操作人员 
   EDITOP               VARCHAR2(8),                                -----编辑人员 
   EDIT_DATE            DATE,                                       -----编辑日期 
   DEPOSIT_DATE         DATE,                                       -----保证金日期
   DEPOSIT_INTER_RATES  NUMBER(6,4),                                -----保证金利率
   ATTACHMENT           varchar2(200),                              -----附件   
   FLAG                 CHAR(1),                                    ---1、表示国内 2、表示国际
   constraint PK_FINANC_INFO primary key (CODE)
) 

/*==============================================================*/
/* 贷款使用人信息                                               */                         
/*==============================================================*/
 

create table FINANC_LOAN_USER  (
   GUID                 CHAR(40)                        not null,
   REQ_CODE             char(14)                        not null,   ----融资单编号
   LOAN_USER            VARCHAR(80)                     not null,   ---贷款使用人
   AMOUNT               NUMBER(18, 2),                              ---金额
   constraint PK_FINANC_LOAN_USER primary key (GUID)
)

/*==============================================================*/
/* 贸易融资类别                                               */                         
/*==============================================================*/ 

create table FINANC_TYPE  (
   GUID                 CHAR(40)                        not null,
   TYPE_CODE            VARCHAR2(10)                    not null,   ---类型编号
   NAME                 VARCHAR(100)                    not null,   ---名称
   constraint PK_FINANC_TYPE primary key (GUID)
)

/*==============================================================*/
/* 福费延融资信息                                               */                         
/*==============================================================*/ 

create table FOFE_FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   --融资单编号
   REQ_DATE             DATE                            not null,   --申请日期
   END_DATE             DATE,                                       --单据到单日期
   DIS_DATE             DATE,                                       --扣息日期
   RATE                 NUMBER(6,4)                     not null,   --利率
   LOAN                 NUMBER(8,4)                     not null,   --利息
   MONEY                NUMBER(18,2),                               --到账金额
   OP                   VARCHAR2(8),                                --录入操作员
   ENTRY_DATE           DATE,                                       --录入时间
   EDIT_OP              VARCHAR2(8),                                --修改操作员
   EDIT_DATE            DATE,                                       --修改日期
   constraint PK_FOFE_FINANC_INFO primary key (CODE)
)

go 


