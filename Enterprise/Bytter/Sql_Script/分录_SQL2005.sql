create table GSPZK
(
  ZWPZK_DWBH   VARCHAR2(30),
  ZWPZK_PZNM   VARCHAR2(9),
  ZWPZK_KJND   VARCHAR2(4),
  ZWPZK_KJQJ   VARCHAR2(2),
  ZWPZK_PZRQ   VARCHAR2(8),
  ZWPZK_PZBH   VARCHAR2(8),
  ZWPZK_LXBH   VARCHAR2(2),
  ZWPZK_FJZS   INTEGER default 0,
  ZWPZK_TYPE   VARCHAR2(1),
  ZWPZK_ZDR    VARCHAR2(20),
  ZWPZK_PZR    VARCHAR2(20),
  ZWPZK_FHR    VARCHAR2(20),
  ZWPZK_JZR    VARCHAR2(20),
  ZWPZK_CN     VARCHAR2(20),
  ZWPZK_KJZG   VARCHAR2(20),
  ZWPZK_FHF    VARCHAR2(1) default 0,
  ZWPZK_JZF    VARCHAR2(1) default 0,
  ZWPZK_WZF    VARCHAR2(1) default 1,
  ZWPZK_ZFF    VARCHAR2(1) default 0,
  ZWPZK_XJDQ   VARCHAR2(1) default 0,
  ZWPZK_PZZT   VARCHAR2(1),
  ZWPZK_YRJKLB VARCHAR2(20),
  ZWPZK_YRND   VARCHAR2(4),
  ZWPZK_YRQJ   VARCHAR2(2),
  ZWPZK_WBPZ   VARCHAR2(255),
  ZWPZK_JJYY   VARCHAR2(100),
  ZWPZK_ZDBZ   CHAR(1) default 0,
  SERIAL_ID    VARCHAR2(32)
);
comment on table GSPZK
  is '凭证库';
-- Add comments to the columns 
comment on column GSPZK.ZWPZK_DWBH
  is '单位编号';
comment on column GSPZK.ZWPZK_PZNM
  is '凭证内码(同一个文件内唯一1..999999999)';
comment on column GSPZK.ZWPZK_KJND
  is '会计年度';
comment on column GSPZK.ZWPZK_KJQJ
  is '会计期间';
comment on column GSPZK.ZWPZK_PZRQ
  is '凭证日期YYYYMMDD';
comment on column GSPZK.ZWPZK_PZBH
  is '凭证编号
(4位，在同一个会计期间唯一
0001..9999)';
comment on column GSPZK.ZWPZK_LXBH
  is '类型编号';
comment on column GSPZK.ZWPZK_FJZS
  is '附件张数';
comment on column GSPZK.ZWPZK_TYPE
  is '凭证类型(''0''输入,''1''冲销,''2''复制,''3''生成,''4''转入,''5''引入,''6''内部交易转入
写入“5”
)';
comment on column GSPZK.ZWPZK_ZDR
  is '制单人';
comment on column GSPZK.ZWPZK_PZR
  is '批准人';
comment on column GSPZK.ZWPZK_FHR
  is '复核人';
comment on column GSPZK.ZWPZK_JZR
  is '记账人';
comment on column GSPZK.ZWPZK_CN
  is '出纳(ZJXT)';
comment on column GSPZK.ZWPZK_KJZG
  is '会计主管(自动填写)';
comment on column GSPZK.ZWPZK_FHF
  is '复核标志';
comment on column GSPZK.ZWPZK_JZF
  is '记账标志';
comment on column GSPZK.ZWPZK_WZF
  is '完整标志';
comment on column GSPZK.ZWPZK_ZFF
  is '作废标志';
comment on column GSPZK.ZWPZK_XJDQ
  is '现金流量读取';
comment on column GSPZK.ZWPZK_PZZT
  is '批准状态';
comment on column GSPZK.ZWPZK_YRJKLB
  is '引入接口类别';
comment on column GSPZK.ZWPZK_YRND
  is '引入年度';
comment on column GSPZK.ZWPZK_YRQJ
  is '引入期间';
comment on column GSPZK.ZWPZK_WBPZ
  is '外部凭证信息列';
comment on column GSPZK.ZWPZK_JJYY
  is '拒绝原因';
comment on column GSPZK.ZWPZK_ZDBZ
  is '只读标志(0:可修改；1:只读)';
comment on column GSPZK.SERIAL_ID
  is '对应bytter主键';

create table GSPZFL
(
  ZWPZFL_DWBH VARCHAR2(30),
  ZWPZFL_PZNM VARCHAR2(9),
  ZWPZFL_FLNM VARCHAR2(9),
  ZWPZFL_FLBH VARCHAR2(4),
  ZWPZFL_KMBH VARCHAR2(30),
  ZWPZFL_JSFS VARCHAR2(4),
  ZWPZFL_ZY   VARCHAR2(60),
  ZWPZFL_JE   FLOAT,
  ZWPZFL_SL   FLOAT default 0,
  ZWPZFL_DJ   FLOAT default 0,
  ZWPZFL_WB   FLOAT default 0,
  ZWPZFL_HL   FLOAT default 0,
  ZWPZFL_JZFX VARCHAR2(1),
  ZWPZFL_JSH  VARCHAR2(20),
  ZWPZFL_YWRQ VARCHAR2(8),
  ZWPZFL_WBBH VARCHAR2(10),
  ZWPZFL_YHDZ VARCHAR2(1) default 0,
  SERIAL_ID   VARCHAR2(32)
);

comment on table GSPZFL
  is '凭证分录';
-- Add comments to the columns 
comment on column GSPZFL.ZWPZFL_DWBH
  is '单位编号';
comment on column GSPZFL.ZWPZFL_PZNM
  is '凭证内码';
comment on column GSPZFL.ZWPZFL_FLNM
  is '分录内码(1..999999999)';
comment on column GSPZFL.ZWPZFL_FLBH
  is '分录编号(0001..9999)';
comment on column GSPZFL.ZWPZFL_KMBH
  is '科目编号';
comment on column GSPZFL.ZWPZFL_JSFS
  is '结算方式';
comment on column GSPZFL.ZWPZFL_ZY
  is '摘要';
comment on column GSPZFL.ZWPZFL_JE
  is '金额';
comment on column GSPZFL.ZWPZFL_SL
  is '数量';
comment on column GSPZFL.ZWPZFL_DJ
  is '单价';
comment on column GSPZFL.ZWPZFL_WB
  is '外币';
comment on column GSPZFL.ZWPZFL_HL
  is '汇率';
comment on column GSPZFL.ZWPZFL_JZFX
  is '记账方向(1:借方；2:借方)';
comment on column GSPZFL.ZWPZFL_JSH
  is '结算号';
comment on column GSPZFL.ZWPZFL_YWRQ
  is '业务日期(YYYYMMDD)';
comment on column GSPZFL.ZWPZFL_WBBH
  is '外币编号';
comment on column GSPZFL.ZWPZFL_YHDZ
  is '银行对帐读取';
comment on column GSPZFL.SERIAL_ID
  is '对应bytter主键';


create table GSFZYS
(
  ZWFZYS_DWBH   VARCHAR2(30),
  ZWFZYS_PZNM   VARCHAR2(9),
  ZWFZYS_FLNM   VARCHAR2(9),
  WFZYS_YSBH    VARCHAR2(4),
  ZWFZYS_KMBH   VARCHAR2(30),
  ZWFZYS_BMBH   VARCHAR2(30),
  ZWFZYS_WLDWBH VARCHAR2(30),
  ZWFZYS_ZGBH   VARCHAR2(16),
  ZWFZYS_CPBH   VARCHAR2(20),
  ZWFZYS_XMBH   VARCHAR2(700),
  ZWFZYS_WBBH   VARCHAR2(10),
  ZWFZYS_JZFX   CHAR(1),
  ZWFZYS_SL     FLOAT(8) default 0,
  ZWFZYS_DJ     FLOAT(8) default 0,
  ZWFZYS_WB     FLOAT(8) default 0,
  ZWFZYS_HL     FLOAT(8) default 0,
  ZWFZYS_JE     NUMBER(15,2) default 0,
  ZWFZYS_YWRQ   VARCHAR2(8),
  ZWFZYS_YWH    VARCHAR2(20),
  ZWFZYS_ZRR    VARCHAR2(20),
  ZWFZYS_PJH    VARCHAR2(20),
  ZWFZYS_DWDZ   CHAR(1),
  ZWFZYS_SJ01   FLOAT(8) default 0,
  ZWFZYS_SJ02   FLOAT(8) default 0,
  ZWFZYS_SJ03   FLOAT(8) default 0,
  ZWFZYS_SJ04   FLOAT(8) default 0,
  ZWFZYS_SJ05   FLOAT(8) default 0,
  ZWFZYS_SM01   VARCHAR2(100),
  ZWFZYS_SM02   VARCHAR2(100),
  ZWFZYS_SM03   VARCHAR2(100),
  ZWFZYS_SM04   VARCHAR2(100),
  ZWFZYS_SM05   VARCHAR2(100),
  ZWFZYS_SM06   VARCHAR2(100),
  ZWFZYS_SM07   VARCHAR2(100),
  ZWFZYS_SM08   VARCHAR2(100),
  ZWFZYS_SM09   VARCHAR2(100),
  ZWFZYS_SM10   VARCHAR2(100),
  ZWFZYS_JSFS   VARCHAR2(4),
  ZWFZYS_JSH    VARCHAR2(20),
  ZWFZYS_YT     VARCHAR2(60),
  SERIAL_ID     VARCHAR2(32)
);

comment on column GSFZYS.ZWFZYS_DWBH
  is '单位编号';
comment on column GSFZYS.ZWFZYS_PZNM
  is '凭证内码';
comment on column GSFZYS.ZWFZYS_FLNM
  is '分录内码';
comment on column GSFZYS.WFZYS_YSBH
  is '辅助编号(0001..9999)';
comment on column GSFZYS.ZWFZYS_KMBH
  is '科目编号';
comment on column GSFZYS.ZWFZYS_BMBH
  is '部门编号';
comment on column GSFZYS.ZWFZYS_WLDWBH
  is '往来单位编号';
comment on column GSFZYS.ZWFZYS_ZGBH
  is '员工编号';
comment on column GSFZYS.ZWFZYS_CPBH
  is '产品编号';
comment on column GSFZYS.ZWFZYS_XMBH
  is '项目编号';
comment on column GSFZYS.ZWFZYS_WBBH
  is '外币编号';
comment on column GSFZYS.ZWFZYS_JZFX
  is '记账方向(1:借方;2:贷方)';
comment on column GSFZYS.ZWFZYS_SL
  is '数量';
comment on column GSFZYS.ZWFZYS_DJ
  is '单价';
comment on column GSFZYS.ZWFZYS_WB
  is '外币';
comment on column GSFZYS.ZWFZYS_HL
  is '汇率';
comment on column GSFZYS.ZWFZYS_JE
  is '金额';
comment on column GSFZYS.ZWFZYS_YWRQ
  is '业务日期(YYYYMMDD)';
comment on column GSFZYS.ZWFZYS_YWH
  is '业务号';
comment on column GSFZYS.ZWFZYS_ZRR
  is '责任人';
comment on column GSFZYS.ZWFZYS_PJH
  is '票据号';
comment on column GSFZYS.ZWFZYS_DWDZ
  is '单位对账读取标志';
comment on column GSFZYS.ZWFZYS_JSFS
  is '结算方式';
comment on column GSFZYS.ZWFZYS_JSH
  is '结算号';
comment on column GSFZYS.ZWFZYS_YT
  is '用途';
comment on column GSFZYS.SERIAL_ID
  is '对应bytter主键';