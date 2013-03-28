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
  is 'ƾ֤��';
-- Add comments to the columns 
comment on column GSPZK.ZWPZK_DWBH
  is '��λ���';
comment on column GSPZK.ZWPZK_PZNM
  is 'ƾ֤����(ͬһ���ļ���Ψһ1..999999999)';
comment on column GSPZK.ZWPZK_KJND
  is '������';
comment on column GSPZK.ZWPZK_KJQJ
  is '����ڼ�';
comment on column GSPZK.ZWPZK_PZRQ
  is 'ƾ֤����YYYYMMDD';
comment on column GSPZK.ZWPZK_PZBH
  is 'ƾ֤���
(4λ����ͬһ������ڼ�Ψһ
0001..9999)';
comment on column GSPZK.ZWPZK_LXBH
  is '���ͱ��';
comment on column GSPZK.ZWPZK_FJZS
  is '��������';
comment on column GSPZK.ZWPZK_TYPE
  is 'ƾ֤����(''0''����,''1''����,''2''����,''3''����,''4''ת��,''5''����,''6''�ڲ�����ת��
д�롰5��
)';
comment on column GSPZK.ZWPZK_ZDR
  is '�Ƶ���';
comment on column GSPZK.ZWPZK_PZR
  is '��׼��';
comment on column GSPZK.ZWPZK_FHR
  is '������';
comment on column GSPZK.ZWPZK_JZR
  is '������';
comment on column GSPZK.ZWPZK_CN
  is '����(ZJXT)';
comment on column GSPZK.ZWPZK_KJZG
  is '�������(�Զ���д)';
comment on column GSPZK.ZWPZK_FHF
  is '���˱�־';
comment on column GSPZK.ZWPZK_JZF
  is '���˱�־';
comment on column GSPZK.ZWPZK_WZF
  is '������־';
comment on column GSPZK.ZWPZK_ZFF
  is '���ϱ�־';
comment on column GSPZK.ZWPZK_XJDQ
  is '�ֽ�������ȡ';
comment on column GSPZK.ZWPZK_PZZT
  is '��׼״̬';
comment on column GSPZK.ZWPZK_YRJKLB
  is '����ӿ����';
comment on column GSPZK.ZWPZK_YRND
  is '�������';
comment on column GSPZK.ZWPZK_YRQJ
  is '�����ڼ�';
comment on column GSPZK.ZWPZK_WBPZ
  is '�ⲿƾ֤��Ϣ��';
comment on column GSPZK.ZWPZK_JJYY
  is '�ܾ�ԭ��';
comment on column GSPZK.ZWPZK_ZDBZ
  is 'ֻ����־(0:���޸ģ�1:ֻ��)';
comment on column GSPZK.SERIAL_ID
  is '��Ӧbytter����';

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
  is 'ƾ֤��¼';
-- Add comments to the columns 
comment on column GSPZFL.ZWPZFL_DWBH
  is '��λ���';
comment on column GSPZFL.ZWPZFL_PZNM
  is 'ƾ֤����';
comment on column GSPZFL.ZWPZFL_FLNM
  is '��¼����(1..999999999)';
comment on column GSPZFL.ZWPZFL_FLBH
  is '��¼���(0001..9999)';
comment on column GSPZFL.ZWPZFL_KMBH
  is '��Ŀ���';
comment on column GSPZFL.ZWPZFL_JSFS
  is '���㷽ʽ';
comment on column GSPZFL.ZWPZFL_ZY
  is 'ժҪ';
comment on column GSPZFL.ZWPZFL_JE
  is '���';
comment on column GSPZFL.ZWPZFL_SL
  is '����';
comment on column GSPZFL.ZWPZFL_DJ
  is '����';
comment on column GSPZFL.ZWPZFL_WB
  is '���';
comment on column GSPZFL.ZWPZFL_HL
  is '����';
comment on column GSPZFL.ZWPZFL_JZFX
  is '���˷���(1:�跽��2:�跽)';
comment on column GSPZFL.ZWPZFL_JSH
  is '�����';
comment on column GSPZFL.ZWPZFL_YWRQ
  is 'ҵ������(YYYYMMDD)';
comment on column GSPZFL.ZWPZFL_WBBH
  is '��ұ��';
comment on column GSPZFL.ZWPZFL_YHDZ
  is '���ж��ʶ�ȡ';
comment on column GSPZFL.SERIAL_ID
  is '��Ӧbytter����';


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
  is '��λ���';
comment on column GSFZYS.ZWFZYS_PZNM
  is 'ƾ֤����';
comment on column GSFZYS.ZWFZYS_FLNM
  is '��¼����';
comment on column GSFZYS.WFZYS_YSBH
  is '�������(0001..9999)';
comment on column GSFZYS.ZWFZYS_KMBH
  is '��Ŀ���';
comment on column GSFZYS.ZWFZYS_BMBH
  is '���ű��';
comment on column GSFZYS.ZWFZYS_WLDWBH
  is '������λ���';
comment on column GSFZYS.ZWFZYS_ZGBH
  is 'Ա�����';
comment on column GSFZYS.ZWFZYS_CPBH
  is '��Ʒ���';
comment on column GSFZYS.ZWFZYS_XMBH
  is '��Ŀ���';
comment on column GSFZYS.ZWFZYS_WBBH
  is '��ұ��';
comment on column GSFZYS.ZWFZYS_JZFX
  is '���˷���(1:�跽;2:����)';
comment on column GSFZYS.ZWFZYS_SL
  is '����';
comment on column GSFZYS.ZWFZYS_DJ
  is '����';
comment on column GSFZYS.ZWFZYS_WB
  is '���';
comment on column GSFZYS.ZWFZYS_HL
  is '����';
comment on column GSFZYS.ZWFZYS_JE
  is '���';
comment on column GSFZYS.ZWFZYS_YWRQ
  is 'ҵ������(YYYYMMDD)';
comment on column GSFZYS.ZWFZYS_YWH
  is 'ҵ���';
comment on column GSFZYS.ZWFZYS_ZRR
  is '������';
comment on column GSFZYS.ZWFZYS_PJH
  is 'Ʊ�ݺ�';
comment on column GSFZYS.ZWFZYS_DWDZ
  is '��λ���˶�ȡ��־';
comment on column GSFZYS.ZWFZYS_JSFS
  is '���㷽ʽ';
comment on column GSFZYS.ZWFZYS_JSH
  is '�����';
comment on column GSFZYS.ZWFZYS_YT
  is '��;';
comment on column GSFZYS.SERIAL_ID
  is '��Ӧbytter����';