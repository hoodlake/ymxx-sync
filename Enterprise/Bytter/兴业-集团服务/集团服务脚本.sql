--���ŷ���
--1�����������ŷ���ָ���
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
'���ŷ���ָ���';

comment on column BIS_GROUP_EXC.ID is
'����ID';

comment on column BIS_GROUP_EXC.PRENT_ACC is
'�����˺ţ������˺ţ�';

comment on column BIS_GROUP_EXC.BANK_ACC is
'���˺ţ���Ա�˺ţ�';

comment on column BIS_GROUP_EXC.BEGIN_DATE is
'��ʼ����';

comment on column BIS_GROUP_EXC.END_DATE is
'��ֹ����';

comment on column BIS_GROUP_EXC.SEARCH_CODE is
'��ѯ����';

comment on column BIS_GROUP_EXC.MIN_MONEY is
'��С���';

comment on column BIS_GROUP_EXC.MAX_MONEY is
'�����';

comment on column BIS_GROUP_EXC.VOUCHER_STAT is
'״̬
0:�ɹ�
2:ʧ��
9���ӿ�ʧ��';

comment on column BIS_GROUP_EXC.RETURN_TIME is
'����ʱ��';

comment on column BIS_GROUP_EXC.RETURN_MSG is
'������Ϣ';

comment on column BIS_GROUP_EXC.BANK_TYPE is
'�������';

comment on column BIS_GROUP_EXC.OPERATION_TYPE is
'ָ������
1������Ա�˻�ָ������˺ţ�
2�����˻��������ָ������˺š���Ա�˺ţ�
3������ʷ�������ѯָ������˺š���Ա�˺š���ʼ���ڡ���ֹ���ڣ�
4�����鼯������ѯָ����˺š����˺š���ʼ���ڡ���ֹ���ڡ���ѯ���룺MEM��
5�����ڲ�������ѯָ��˺š����ʺţ�
6������Ա���ײ�ѯָ���ѡ�˺š���ʼ���ڡ���ֹ���ڡ���С������';



--2����������Ա�˺Ų�ѯָ�
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
'��Ա�˻���Ϣ��';

comment on column BIS_BANK_ACC.SERIAL_ID is
'���к�(32λMD5ֵ��ȷ��Ψһ)';

comment on column BIS_BANK_ACC.BANK_ACC is
'�����˺�';

comment on column BIS_BANK_ACC.ACC_NAME is
'����';

comment on column BIS_BANK_ACC.BANK_NAME is
'������';

comment on column BIS_BANK_ACC.COL_TYPE is
'�鼯����
��ʹ鼯����ʱ�鼯�� ����鼯������鼯���� ʵʱ�������(˫���Զ��鼯) �����鼯 �� ��ʱ�������(˫���Զ��鼯) �� ��ʹ鼯';

comment on column BIS_BANK_ACC.HIERARCHY_RELATION is
'�㼶��ϵ';

comment on column BIS_BANK_ACC.COL_PERIOD is
'�鼯����
0 ÿ��;1 ÿ��;2 ÿѮ;3 ÿ��;4 ����';

comment on column BIS_BANK_ACC.COL_DATE is
'�鼯����
���col_periodΪ�ܣ����������Ϊ0-6��ʾ������һ��������CYCLEΪѮ����������ֱ�ʾѮ�ĵ�1-10�죻CYCLEΪ�£���ʾ����µ�1-31��';

comment on column BIS_BANK_ACC.COL_TIME is
'�鼯ʱ��
HHMMSSΪ����Ա����ҵ�����鼯��ʽ�����������õ�ԭֵ��ʱ�䷶ΧΪ000000-205000������081120��ʾ����8��11��20��';

comment on column BIS_BANK_ACC.RETAINED_AMT is
'������';

comment on column BIS_BANK_ACC.MIN_COL_VALUE is
'��͹鼯���';

comment on column BIS_BANK_ACC.REGISTER_MODEL is
'�Ǽ�ģʽ
0����ģʽ 1ѭ��ί�д���ģʽ';

comment on column BIS_BANK_ACC.RETURN_TIME is
'����ʱ��';

comment on column BIS_BANK_ACC.RETURN_MSG is
'������Ϣ';

comment on column BIS_BANK_ACC.BANK_TYPE is
'�������';



--3���������˻���������
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
'�˻����������Ϣ��';

comment on column BIS_BANKACC_BAL.ID is
'����ID';

comment on column BIS_BANKACC_BAL.PRENT_ACC is
'�����˺ţ������˺ţ�';

comment on column BIS_BANKACC_BAL.PRENT_ACCNAME is
'�����˺Ż���';

comment on column BIS_BANKACC_BAL.BANK_ACC is
'���˺ţ���Ա�˺ţ�';

comment on column BIS_BANKACC_BAL.BANK_ACCNAME is
'��Ա�˺Ż���';

comment on column BIS_BANKACC_BAL.BANK_NAME is
'������';

comment on column BIS_BANKACC_BAL.REAL_BAL is
'ʵ�ʽ��';

comment on column BIS_BANKACC_BAL.RETAINED_AMT is
'������';

comment on column BIS_BANKACC_BAL.RETURN_TIME is
'����ʱ��';

comment on column BIS_BANKACC_BAL.RETURN_MSG is
'������Ϣ';

comment on column BIS_BANKACC_BAL.BANK_TYPE is
'�������';



--4����������ʷ���������Ϣ��
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
'��ʷ���������Ϣ��';

comment on column BIS_BANKACC_HIS_BAL.ID is
'����ID';

comment on column BIS_BANKACC_HIS_BAL.PRENT_ACC is
'�����˺ţ������˺ţ�';

comment on column BIS_BANKACC_HIS_BAL.PRENT_ACCNAME is
'�����˺Ż���';

comment on column BIS_BANKACC_HIS_BAL.BANK_ACC is
'���˺ţ���Ա�˺ţ�';

comment on column BIS_BANKACC_HIS_BAL.BANK_ACCNAME is
'��Ա�˺Ż���';

comment on column BIS_BANKACC_HIS_BAL.BANK_NAME is
'������';

comment on column BIS_BANKACC_HIS_BAL.TRANS_TIME is
'��������';

comment on column BIS_BANKACC_HIS_BAL.Y_COL_AMT is
'��鼯���';

comment on column BIS_BANKACC_HIS_BAL.Y_ALLOT_AMT is
'��������';

comment on column BIS_BANKACC_HIS_BAL.HIS_RETAINED_AMT is
'������';

comment on column BIS_BANKACC_HIS_BAL.RETURN_TIME is
'����ʱ��';

comment on column BIS_BANKACC_HIS_BAL.RETURN_MSG is
'������Ϣ';

comment on column BIS_BANKACC_HIS_BAL.BANK_TYPE is
'�������';



--5���������ڲ�������Ϣ��
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
'�ڲ�������Ϣ��';

comment on column BIS_INNER_CONTACTS.SERIAL_ID is
'���к�(32λMD5ֵ��ȷ��Ψһ)';

comment on column BIS_INNER_CONTACTS.PRENT_ACC is
'�����˺ţ������˺ţ�';

comment on column BIS_INNER_CONTACTS.PRENT_ACCNAME is
'�����˺Ż���';

comment on column BIS_INNER_CONTACTS.BANK_ACC is
'���˺ţ���Ա�˺ţ�';

comment on column BIS_INNER_CONTACTS.BANK_ACCNAME is
'��Ա�˺Ż���';

comment on column BIS_INNER_CONTACTS.BANK_NAME is
'������';

comment on column BIS_INNER_CONTACTS.REGISTER_DATE is
'�Ǽ�����';

comment on column BIS_INNER_CONTACTS.Y_COL_TOTAL is
'��鼯�ۼ�';

comment on column BIS_INNER_CONTACTS.Y_ALLOT_TOTAL is
'���²��ۼ�';

comment on column BIS_INNER_CONTACTS.RETURN_TIME is
'����ʱ��';

comment on column BIS_INNER_CONTACTS.RETURN_MSG is
'������Ϣ';

comment on column BIS_INNER_CONTACTS.BANK_TYPE is
'�������';

--6)��������Ա������ϸ��
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
'��Ա������ϸ��';

comment on column BIS_BANKACC_TRADE_DTL.SERIAL_ID is
'��ϸΨһ��ʶ.�ñ�־�����нӿڸ������з�����ϸ��ȡ�ؼ��ֶν���MD5,����һ��32λ�ļ��ܴ��� ����ֶ�Ҳ��Ϊ�ӿ��տ���ʵ�Ψһ��ʶ��
ע�⣺�������еļ��ܹؼ����ݶ���̫һ����ͬһ���в�ͬ���ײ�����ϸ�Ĺؼ�����Ҳ��һ����ͬһ���и��Ľ���Ҫ���ǵ����׵ĸı䵼���տ���ʵ��ظ�.
';

comment on column BIS_BANKACC_TRADE_DTL.BANK_ACC is
'�����˺ţ�������';

comment on column BIS_BANKACC_TRADE_DTL.ACC_NAME is
'�˻�����������';

comment on column BIS_BANKACC_TRADE_DTL.BANK_NAME is
'�����У�������';

comment on column BIS_BANKACC_TRADE_DTL.OPP_ACC_NO is
'�Է��ʺ�
';

comment on column BIS_BANKACC_TRADE_DTL.OPP_ACC_NAME is
'�Է�����';

comment on column BIS_BANKACC_TRADE_DTL.OPP_ACC_BANK is
'�Է�������';

comment on column BIS_BANKACC_TRADE_DTL.CD_SIGN is
'��֧��־��
1: ֧��
2������
';

comment on column BIS_BANKACC_TRADE_DTL.RB_SIGN is
'ƾ֤������־��R -�죬B ����
';

comment on column BIS_BANKACC_TRADE_DTL.AMT is
'���';

comment on column BIS_BANKACC_TRADE_DTL.BAL is
'���';

comment on column BIS_BANKACC_TRADE_DTL.FEE_1 is
'������1';

comment on column BIS_BANKACC_TRADE_DTL.FEE_2 is
'������2';

comment on column BIS_BANKACC_TRADE_DTL.BANK_SERIAL_ID is
'�ӿ�ȡ��ϸ�ؼ����ݵ�����ֵ����δMD5֮ǰ�Ĺؼ�Ҫ�ص�����';

comment on column BIS_BANKACC_TRADE_DTL.BIF_CODE is
'���нӿڴ��룬�ɲμ�bis_bif_init��';

comment on column BIS_BANKACC_TRADE_DTL.CUR is
'�ұ�.Ĭ��ֵΪ01:����� 
����ɲμ�bt_currency��
';

comment on column BIS_BANKACC_TRADE_DTL.USES is
'��;';

comment on column BIS_BANKACC_TRADE_DTL.ABS is
'ժҪ';

comment on column BIS_BANKACC_TRADE_DTL.POSTSCRIPT is
'����';

comment on column BIS_BANKACC_TRADE_DTL.TRANS_TIME is
'����ʱ��';

comment on column BIS_BANKACC_TRADE_DTL.VOUCHER_NO is
'ƾ֤��
';

comment on column BIS_BANKACC_TRADE_DTL.VOUCHER_TYPE is
'ƾ֤����';

comment on column BIS_BANKACC_TRADE_DTL.ACC_SERIAL_NO is
'�˺����к�';

comment on column BIS_BANKACC_TRADE_DTL.REC_TIME is
'����ʱ��';


--7���������鼯������ϸ��
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
'�鼯������ϸ��';

comment on column BIS_BANKACC_DTL.SERIAL_ID is
'���к�(32λMD5ֵ��ȷ��Ψһ)';

comment on column BIS_BANKACC_DTL.PRENT_ACCNAME is
'�����˺Ż���';

comment on column BIS_BANKACC_DTL.PRENT_ACC is
'�����˺ţ������˺ţ�';

comment on column BIS_BANKACC_DTL.BANK_ACC is
'���˺ţ���Ա�˺ţ�';

comment on column BIS_BANKACC_DTL.COL_TYPE is
'�鼯����';

comment on column BIS_BANKACC_DTL.ATM is
'���';

comment on column BIS_BANKACC_DTL.TRANS_TIME is
'��������';

comment on column BIS_BANKACC_DTL.BANK_ACCNAME is
'��Ա�˺Ż���';

comment on column BIS_BANKACC_DTL.BANK_NAME is
'������';

comment on column BIS_BANKACC_DTL.PURPOSE is
'��;';

comment on column BIS_BANKACC_DTL.DTL_TYPE is
'��ϸ����
0���鼯��ϸ	1���²���ϸ';

comment on column BIS_BANKACC_DTL.RETURN_TIME is
'����ʱ��';

comment on column BIS_BANKACC_DTL.RETURN_MSG is
'������Ϣ';

comment on column BIS_BANKACC_DTL.BANK_TYPE is
'�������';


commit;
