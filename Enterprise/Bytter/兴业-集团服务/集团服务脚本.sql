--集团服务
--1）新增“集团服务指令表”
create table BIS_GROUP_EXC  (
   ID                   NUMBER(10)                      not null,
   PRENT_ACC            VARCHAR2(30),
   BANK_ACC             VARCHAR2(30),
   BEGIN_DATE           DATE,
   END_DATE             DATE,
   SEARCH_CODE          VARCHAR2(20),
   MIN_MONEY            NUMBER(15,2),
   MAX_MONEY            NUMBER(15,2),
   VOUCHER_STAT         CHAR(1),
   RETURN_TIME          DATE,
   RETURN_MSG           VARCHAR2(140),
   BANK_TYPE            CHAR(4),
   OPERATION_TYPE       CHAR(1),
   constraint PK_BIS_GROUP_EXC primary key (ID)
);

comment on table BIS_GROUP_EXC is
'集团服务指令表';

comment on column BIS_GROUP_EXC.ID is
'主键ID';

comment on column BIS_GROUP_EXC.PRENT_ACC is
'银行账号（网点账号）';

comment on column BIS_GROUP_EXC.BANK_ACC is
'子账号（成员账号）';

comment on column BIS_GROUP_EXC.BEGIN_DATE is
'开始日期';

comment on column BIS_GROUP_EXC.END_DATE is
'截止日期';

comment on column BIS_GROUP_EXC.SEARCH_CODE is
'查询代码';

comment on column BIS_GROUP_EXC.MIN_MONEY is
'最小金额';

comment on column BIS_GROUP_EXC.MAX_MONEY is
'最大金额';

comment on column BIS_GROUP_EXC.VOUCHER_STAT is
'状态
0:成功
2:失败
9：接口失败';

comment on column BIS_GROUP_EXC.RETURN_TIME is
'返回时间';

comment on column BIS_GROUP_EXC.RETURN_MSG is
'返回信息';

comment on column BIS_GROUP_EXC.BANK_TYPE is
'银行类别';

comment on column BIS_GROUP_EXC.OPERATION_TYPE is
'指令类型
1——成员账户指令（网点账号）
2——账户可用余额指令（网点账号、成员账号）
3——历史留存金额查询指令（网点账号、成员账号、开始日期、截止日期）
4——归集调拨查询指令（父账号、子账号、开始日期、截止日期、查询代码：MEM）
5——内部往来查询指令（账号、父帐号）
6——成员交易查询指令（所选账号、开始日期、截止日期、最小金额、最大金额）';



--2）新增“成员账号查询指令”
create table BIS_BANK_ACC  (
   SERIAL_ID            CHAR(32)                        not null,
   BANK_ACC             VARCHAR2(30),
   ACC_NAME             VARCHAR2(100),
   BANK_NAME            VARCHAR2(140),
   COL_TYPE             VARCHAR2(50),
   HIERARCHY_RELATION   VARCHAR2(60),
   COL_PERIOD           DATE,
   COL_DATE             NUMERIC(10),
   COL_TIME             VARCHAR2(20),
   RETAINED_AMT         NUMBER(15,2),
   MIN_COL_VALUE        NUMBER(15,2),
   REGISTER_MODEL       CHAR(1),
   RETURN_TIME          DATE,
   RETURN_MSG           VARCHAR2(140),
   BANK_TYPE            CHAR(4),
   constraint PK_BIS_BANK_ACC primary key (SERIAL_ID)
);

comment on table BIS_BANK_ACC is
'成员账户信息表';

comment on column BIS_BANK_ACC.SERIAL_ID is
'序列号(32位MD5值，确保唯一)';

comment on column BIS_BANK_ACC.BANK_ACC is
'银行账号';

comment on column BIS_BANK_ACC.ACC_NAME is
'户名';

comment on column BIS_BANK_ACC.BANK_NAME is
'开户行';

comment on column BIS_BANK_ACC.COL_TYPE is
'归集类型
逐笔归集、定时归集、 定额归集（单向归集）、 实时定额管理(双向自动归集) 、不归集 、 定时定额管理(双向自动归集) 、 多笔归集';

comment on column BIS_BANK_ACC.HIERARCHY_RELATION is
'层级关系';

comment on column BIS_BANK_ACC.COL_PERIOD is
'归集周期
0 每天;1 每周;2 每旬;3 每月;4 隔天';

comment on column BIS_BANK_ACC.COL_DATE is
'归集日期
如果col_period为周，这里的数字为0-6表示周日周一到周六；CYCLE为旬，这里的数字表示旬的第1-10天；CYCLE为月，表示这个月的1-31天';

comment on column BIS_BANK_ACC.COL_TIME is
'归集时间
HHMMSS为管理员在企业网银归集方式设置里面设置的原值，时间范围为000000-205000，例如081120表示早上8点11分20秒';

comment on column BIS_BANK_ACC.RETAINED_AMT is
'留存金额';

comment on column BIS_BANK_ACC.MIN_COL_VALUE is
'最低归集金额';

comment on column BIS_BANK_ACC.REGISTER_MODEL is
'登记模式
0集团模式 1循环委托贷款模式';

comment on column BIS_BANK_ACC.RETURN_TIME is
'返回时间';

comment on column BIS_BANK_ACC.RETURN_MSG is
'返回信息';

comment on column BIS_BANK_ACC.BANK_TYPE is
'银行类别';



--3）新增”账户可用余额表”
create table BIS_BANKACC_BAL  (
   ID                   NUMBER(10)                      not null,
   PRENT_ACC            VARCHAR2(30),
   PRENT_ACCNAME        VARCHAR2(100),
   BANK_ACC             VARCHAR2(30)                    not null,
   BANK_ACCNAME         VARCHAR2(100),
   BANK_NAME            VARCHAR2(140),
   REAL_BAL             NUMBER(15,2),
   RETAINED_AMT         NUMBER(15,2),
   RETURN_TIME          DATE,
   RETURN_MSG           VARCHAR2(140),
   BANK_TYPE            CHAR(4),
   constraint PK_BIS_BANKACC_BAL primary key (ID),
   constraint AK_UQ_BANK_ACC unique (BANK_ACC)
);

comment on table BIS_BANKACC_BAL is
'账户可用余额信息表';

comment on column BIS_BANKACC_BAL.ID is
'主键ID';

comment on column BIS_BANKACC_BAL.PRENT_ACC is
'银行账号（网点账号）';

comment on column BIS_BANKACC_BAL.PRENT_ACCNAME is
'网点账号户名';

comment on column BIS_BANKACC_BAL.BANK_ACC is
'子账号（成员账号）';

comment on column BIS_BANKACC_BAL.BANK_ACCNAME is
'成员账号户名';

comment on column BIS_BANKACC_BAL.BANK_NAME is
'开户行';

comment on column BIS_BANKACC_BAL.REAL_BAL is
'实际金额';

comment on column BIS_BANKACC_BAL.RETAINED_AMT is
'留存金额';

comment on column BIS_BANKACC_BAL.RETURN_TIME is
'返回时间';

comment on column BIS_BANKACC_BAL.RETURN_MSG is
'返回信息';

comment on column BIS_BANKACC_BAL.BANK_TYPE is
'银行类别';



--4）新增“历史留存余额信息表”
create table BIS_BANKACC_HIS_BAL  (
   ID                   NUMBER(10)                      not null,
   PRENT_ACC            VARCHAR2(30),
   PRENT_ACCNAME        VARCHAR2(100),
   BANK_ACC             VARCHAR2(30),
   BANK_ACCNAME         VARCHAR2(100),
   BANK_NAME            VARCHAR2(140),
   TRANS_TIME           DATE,
   Y_COL_AMT            NUMBER(15,2),
   Y_ALLOT_AMT          NUMERIC(15, 2),
   HIS_RETAINED_AMT     NUMBER(15,2),
   RETURN_TIME          DATE,
   RETURN_MSG           VARCHAR2(140),
   BANK_TYPE            CHAR(4),
   constraint PK_BIS_BANKACC_HIS_BAL primary key (ID),
   constraint AK_UQ_BIS_BANKACC_HIS_BAL unique (BANK_ACC,TRANS_TIME)
);

comment on table BIS_BANKACC_HIS_BAL is
'历史留存余额信息表';

comment on column BIS_BANKACC_HIS_BAL.ID is
'主键ID';

comment on column BIS_BANKACC_HIS_BAL.PRENT_ACC is
'银行账号（网点账号）';

comment on column BIS_BANKACC_HIS_BAL.PRENT_ACCNAME is
'网点账号户名';

comment on column BIS_BANKACC_HIS_BAL.BANK_ACC is
'子账号（成员账号）';

comment on column BIS_BANKACC_HIS_BAL.BANK_ACCNAME is
'成员账号户名';

comment on column BIS_BANKACC_HIS_BAL.BANK_NAME is
'开户行';

comment on column BIS_BANKACC_HIS_BAL.TRANS_TIME is
'交易日期';

comment on column BIS_BANKACC_HIS_BAL.Y_COL_AMT is
'年归集金额';

comment on column BIS_BANKACC_HIS_BAL.Y_ALLOT_AMT is
'年调拨金额';

comment on column BIS_BANKACC_HIS_BAL.HIS_RETAINED_AMT is
'留存金额';

comment on column BIS_BANKACC_HIS_BAL.RETURN_TIME is
'返回时间';

comment on column BIS_BANKACC_HIS_BAL.RETURN_MSG is
'返回信息';

comment on column BIS_BANKACC_HIS_BAL.BANK_TYPE is
'银行类别';



--5）新增“内部往来信息表”
create table BIS_INNER_CONTACTS  (
   SERIAL_ID            CHAR(32)                        not null,
   PRENT_ACC            VARCHAR2(30),
   PRENT_ACCNAME        VARCHAR2(100),
   BANK_ACC             VARCHAR2(30),
   BANK_ACCNAME         VARCHAR2(100),
   BANK_NAME            VARCHAR2(140),
   REGISTER_DATE        DATE,
   Y_COL_TOTAL          NUMERIC(15, 2),
   Y_ALLOT_TOTAL        NUMBER(15,2),
   RETURN_TIME          DATE,
   RETURN_MSG           VARCHAR2(140),
   BANK_TYPE            CHAR(4),
   constraint PK_BIS_INNER_CONTACTS primary key (SERIAL_ID)
);

comment on table BIS_INNER_CONTACTS is
'内部往来信息表';

comment on column BIS_INNER_CONTACTS.SERIAL_ID is
'序列号(32位MD5值，确保唯一)';

comment on column BIS_INNER_CONTACTS.PRENT_ACC is
'银行账号（网点账号）';

comment on column BIS_INNER_CONTACTS.PRENT_ACCNAME is
'网点账号户名';

comment on column BIS_INNER_CONTACTS.BANK_ACC is
'子账号（成员账号）';

comment on column BIS_INNER_CONTACTS.BANK_ACCNAME is
'成员账号户名';

comment on column BIS_INNER_CONTACTS.BANK_NAME is
'开户行';

comment on column BIS_INNER_CONTACTS.REGISTER_DATE is
'登记日期';

comment on column BIS_INNER_CONTACTS.Y_COL_TOTAL is
'年归集累计';

comment on column BIS_INNER_CONTACTS.Y_ALLOT_TOTAL is
'年下拨累计';

comment on column BIS_INNER_CONTACTS.RETURN_TIME is
'返回时间';

comment on column BIS_INNER_CONTACTS.RETURN_MSG is
'返回信息';

comment on column BIS_INNER_CONTACTS.BANK_TYPE is
'银行类别';

--6)新增“成员交易明细表”
create table BIS_BANKACC_TRADE_DTL  (
   SERIAL_ID            CHAR(32)                        not null,
   BANK_ACC             VARCHAR2(30),
   ACC_NAME             VARCHAR2(140),
   BANK_NAME            VARCHAR2(140),
   OPP_ACC_NO           VARCHAR2(30),
   OPP_ACC_NAME         VARCHAR2(140),
   OPP_ACC_BANK         VARCHAR2(140),
   CD_SIGN              CHAR(1),
   RB_SIGN              CHAR(1),
   AMT                  NUMBER(15,2),
   BAL                  NUMBER(15,2),
   FEE_1                NUMBER(15,2),
   FEE_2                NUMBER(15,2),
   BANK_SERIAL_ID       VARCHAR2(30),
   BIF_CODE             CHAR(4),
   CUR                  CHAR(2),
   USES                 VARCHAR2(140),
   ABS                  VARCHAR2(140),
   POSTSCRIPT           VARCHAR2(140),
   TRANS_TIME           DATE,
   VOUCHER_NO           VARCHAR2(30),
   VOUCHER_TYPE         VARCHAR2(20),
   ACC_SERIAL_NO        VARCHAR2(20),
   REC_TIME             DATE,
   constraint PK_BIS_BANKACC_TRADE_DTL primary key (SERIAL_ID)
);

comment on table BIS_BANKACC_TRADE_DTL is
'成员交易明细表';

comment on column BIS_BANKACC_TRADE_DTL.SERIAL_ID is
'明细唯一标识.该标志由银行接口根据银行返回明细中取关键字段进行MD5,生成一个32位的加密串。 另此字段也作为接口收款记帐的唯一标识。
注意：各个银行的加密关键数据都不太一样。同一银行不同交易产生明细的关键数据也不一样故同一银行更改交易要考虑到交易的改变导致收款记帐的重复.
';

comment on column BIS_BANKACC_TRADE_DTL.BANK_ACC is
'银行账号（本方）';

comment on column BIS_BANKACC_TRADE_DTL.ACC_NAME is
'账户名（本方）';

comment on column BIS_BANKACC_TRADE_DTL.BANK_NAME is
'开户行（本方）';

comment on column BIS_BANKACC_TRADE_DTL.OPP_ACC_NO is
'对方帐号
';

comment on column BIS_BANKACC_TRADE_DTL.OPP_ACC_NAME is
'对方户名';

comment on column BIS_BANKACC_TRADE_DTL.OPP_ACC_BANK is
'对方开户行';

comment on column BIS_BANKACC_TRADE_DTL.CD_SIGN is
'收支标志：
1: 支出
2：收入
';

comment on column BIS_BANKACC_TRADE_DTL.RB_SIGN is
'凭证红蓝标志（R -红，B 蓝）
';

comment on column BIS_BANKACC_TRADE_DTL.AMT is
'金额';

comment on column BIS_BANKACC_TRADE_DTL.BAL is
'余额';

comment on column BIS_BANKACC_TRADE_DTL.FEE_1 is
'手续费1';

comment on column BIS_BANKACC_TRADE_DTL.FEE_2 is
'手续费2';

comment on column BIS_BANKACC_TRADE_DTL.BANK_SERIAL_ID is
'接口取明细关键数据的明文值，即未MD5之前的关键要素的明文';

comment on column BIS_BANKACC_TRADE_DTL.BIF_CODE is
'银行接口代码，可参见bis_bif_init表';

comment on column BIS_BANKACC_TRADE_DTL.CUR is
'币别.默认值为01:人民币 
具体可参见bt_currency表
';

comment on column BIS_BANKACC_TRADE_DTL.USES is
'用途';

comment on column BIS_BANKACC_TRADE_DTL.ABS is
'摘要';

comment on column BIS_BANKACC_TRADE_DTL.POSTSCRIPT is
'附言';

comment on column BIS_BANKACC_TRADE_DTL.TRANS_TIME is
'交易时间';

comment on column BIS_BANKACC_TRADE_DTL.VOUCHER_NO is
'凭证号
';

comment on column BIS_BANKACC_TRADE_DTL.VOUCHER_TYPE is
'凭证类型';

comment on column BIS_BANKACC_TRADE_DTL.ACC_SERIAL_NO is
'账号序列号';

comment on column BIS_BANKACC_TRADE_DTL.REC_TIME is
'接收时间';


--7）新增“归集调拨明细表”
create table BIS_BANKACC_DTL  (
   SERIAL_ID            CHAR(32)                        not null,
   PRENT_ACCNAME        VARCHAR2(100),
   PRENT_ACC            VARCHAR2(30),
   BANK_ACC             VARCHAR2(30),
   COL_TYPE             VARCHAR2(50),
   ATM                  NUMBER(15,2),
   TRANS_TIME           DATE,
   BANK_ACCNAME         VARCHAR2(100),
   BANK_NAME            VARCHAR2(140),
   PURPOSE              VARCHAR2(100),
   DTL_TYPE             CHAR(1),
   RETURN_TIME          DATE,
   RETURN_MSG           VARCHAR2(140),
   BANK_TYPE            CHAR(4),
   constraint PK_BIS_BANKACC_DTL primary key (SERIAL_ID)
);

comment on table BIS_BANKACC_DTL is
'归集调拨明细表';

comment on column BIS_BANKACC_DTL.SERIAL_ID is
'序列号(32位MD5值，确保唯一)';

comment on column BIS_BANKACC_DTL.PRENT_ACCNAME is
'网点账号户名';

comment on column BIS_BANKACC_DTL.PRENT_ACC is
'银行账号（网点账号）';

comment on column BIS_BANKACC_DTL.BANK_ACC is
'子账号（成员账号）';

comment on column BIS_BANKACC_DTL.COL_TYPE is
'归集类型';

comment on column BIS_BANKACC_DTL.ATM is
'金额';

comment on column BIS_BANKACC_DTL.TRANS_TIME is
'交易日期';

comment on column BIS_BANKACC_DTL.BANK_ACCNAME is
'成员账号户名';

comment on column BIS_BANKACC_DTL.BANK_NAME is
'开户行';

comment on column BIS_BANKACC_DTL.PURPOSE is
'用途';

comment on column BIS_BANKACC_DTL.DTL_TYPE is
'明细类型
0，归集明细	1，下拨明细';

comment on column BIS_BANKACC_DTL.RETURN_TIME is
'返回时间';

comment on column BIS_BANKACC_DTL.RETURN_MSG is
'返回信息';

comment on column BIS_BANKACC_DTL.BANK_TYPE is
'银行类别';


commit;
