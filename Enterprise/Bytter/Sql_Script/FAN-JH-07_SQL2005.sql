--ģ�涨�� 
/*==============================================================*/
/* 1.Table: ERP_TEMPLATE_DATADEFINE��ƾ֤ģ�����ݶ����       */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DATADEFINE';
   IF @tb_exists <> 0 BEGIN
      DROP TABLE ERP_TEMPLATE_DATADEFINE cascade constraints;
   END;
END;
go
create table ERP_TEMPLATE_DATADEFINE  (
   ID                   NUMBER not null,
   FIELD_CODE           VARCHAR2(60),
   FIELD_NAME           VARCHAR2(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR2(100),
   IS_TEMPLATE_DTL      CHAR(1),
   constraint PK_ERP_TEMPLATE_DATADEFINE primary key (ID)
);
--��ʼ����ƾ֤ģ�����ݶ��������
insert into ERP_TEMPLATE_DATADEFINE values(1,'VOUCHER_TYPE_CODE','ƾ֤���','0','0','ƾ֤���','0');
insert into ERP_TEMPLATE_DATADEFINE values(2,'REFER_CODE','�ο�ƾ֤���','0','0','�ο�ƾ֤���','0');
insert into ERP_TEMPLATE_DATADEFINE values(3,'VOUCHER_PRE_TEXT','ƾ̧֤ͷ�ı�','0','0','ƾ̧֤ͷ�ı�','0');
insert into ERP_TEMPLATE_DATADEFINE values(4,'ITEM_CODE','Ԥ���Ŀ','0','0','Ԥ���Ŀ','0');
insert into ERP_TEMPLATE_DATADEFINE values(5,'REFER','����','0','0','����','0');
insert into ERP_TEMPLATE_DATADEFINE values(6,'ABS','ժҪ','0','0','ժҪ','0');
insert into ERP_TEMPLATE_DATADEFINE values(7,'PURPOSE','��;','0','0','��;','0');
insert into ERP_TEMPLATE_DATADEFINE values(8,'PAY_TYPE','���㷽ʽ','0','0','���㷽ʽ','0');
insert into ERP_TEMPLATE_DATADEFINE values(9,'REVERSE1','�Զ���һ','0','0','�Զ���һ','0');
insert into ERP_TEMPLATE_DATADEFINE values(10,'REVERSE2','�Զ����','0','0','�Զ����','0');
insert into ERP_TEMPLATE_DATADEFINE values(11,'SUBJECT_CODE','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(12,'SUBJECT_NAME','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(13,'SUBJECT_CLASS','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(14,'SUBJECT_TYPE','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(15,'COST_CENTER_CODE','�ɱ�����','0','0','�ɱ�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(16,'CASH_FLOW_CODE','�ֽ�������','0','0','�ֽ�������','1');
insert into ERP_TEMPLATE_DATADEFINE values(17,'ACCOUNT_CODE','���˴���','0','0','���˴���','1');
insert into ERP_TEMPLATE_DATADEFINE values(18,'ACCOUNT_TYPE','�˻�����','0','0','�˻�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(19,'DTL_ABS','ժҪ','0','0','ժҪ','1');
insert into ERP_TEMPLATE_DATADEFINE values(20,'PAYMENT_REASON_CODE','����ԭ�����','0','0','����ԭ�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(21,'LEDGER_SIGN','���˱�ʶ','0','0','���˱�ʶ','1');
insert into ERP_TEMPLATE_DATADEFINE values(22,'TRANS_TYPE','��������','0','0','��������','1');
insert into ERP_TEMPLATE_DATADEFINE values(23,'ASSIGN','����','0','0','����','1');
insert into ERP_TEMPLATE_DATADEFINE values(24,'TRADE_PARTNER','ó�׻��','0','0','ó�׻��','1');
insert into ERP_TEMPLATE_DATADEFINE values(25,'TAX_CODE','˰��','0','0','˰��','1');
insert into ERP_TEMPLATE_DATADEFINE values(26,'DTL_ITEM_CODE','Ԥ�����','0','0','Ԥ�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(27,'DTL_REVERSE1','�Զ���һ','0','0','�Զ���һ','1');
insert into ERP_TEMPLATE_DATADEFINE values(28,'DTL_REVERSE2','�Զ����','0','0','�Զ����','1');



/*==============================================================*/
/* 2.Table: ERP_TEMPLATE_DATADEFINE��ģ�����ͱ�               */
/*==============================================================*/
DECLARE
    @tb_exists int;
BEGIN 
    SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_TYPE';
    IF @tb_exists <> 0 BEGIN
       DROP TABLE ERP_TEMPLATE_TYPE cascade constraints;
    END;
END;
GO
create table ERP_TEMPLATE_TYPE  (
   ID                   NUMERIC(10) not null,
   TYPE_CODE            VARCHAR(20) unique,
   TYPE_NAME            VARCHAR(50),
   GENERAL_RANGE        NUMERIC(10),
   MATCHING_FIELD       VARCHAR(100),
   RMK                  VARCHAR(200),
   MODIFY_DATE          DATE default SYSDATE,
   constraint PK_ERP_TEMPLATE_TYPE primary key (ID)
);


/*==============================================================*/
/* 3.Table: ERP_TEMPLATE_DATADEFINE��ģ�����������           */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN 
   SELECT @tb_exists=COUNT(*)  FROM tabs t WHERE t.table_name='ERP_TEMPLATE_TYPE_DTL';
   IF @tb_exists <> 0 BEGIN
      DROP TABLE ERP_TEMPLATE_TYPE_DTL cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_TYPE_DTL  (
   ID                   NUMERIC not null,
   FIELD_CODE           VARCHAR(60),
   FIELD_NAME           VARCHAR(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR(100),
   IS_TEMPLATE_DTL      CHAR(1),
   TYPE_CODE            VARCHAR(32),
   constraint PK_ERP_TEMPLATE_TYPE_DTL primary key (ID)
);


/*==============================================================*/
/* 4.Table: ERP_TEMPLATE_DATADEFINE��ģ������                 */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE  (
   ID                   NUMERIC(10) not null,
   CORP_CODE            VARCHAR(4),
   REFER_CODE           VARCHAR(32),
   VOUCHER_PRE_TEXT     VARCHAR(60),
   REFER                VARCHAR(50),
   PAY_TYPE             VARCHAR(4),
   ITEM_CODE            VARCHAR(40),
   VOUCHER_TYPE_CODE    CHAR(2),
   TYPE_CODE            VARCHAR(32),
   TEMPLATE_NAME        VARCHAR(32),
   TEMPLATE_CODE        VARCHAR(32),
   ABS                  VARCHAR(100),
   PURPOSE              VARCHAR(100),
   RMK                  VARCHAR(100),
   REVERSE1             VARCHAR(100),
   REVERSE2             VARCHAR(100),
   constraint PK_ERP_TEMPLATE primary key (ID)
);

/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DATADEFINE��ģ���¼��               */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DTL';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE_DTL cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_DTL  (
   ID                   NUMERIC(10)                      not null,
   TEMPLATE_ID          NUMERIC(10),
   ENTRY_CODE           VARCHAR(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR(60),
   SUBJECT_NAME         VARCHAR(100),
   SUBJECT_CLASS        VARCHAR(100),
   SUBJECT_TYPE         VARCHAR(100),
   COST_CENTER_CODE     VARCHAR(20),
   CASH_FLOW_CODE       VARCHAR(100),
   ACCOUNT_CODE         VARCHAR(50),
   ACCOUNT_TYPE         VARCHAR(100),
   PAYMENT_REASON_CODE  VARCHAR(50),
   LEDGER_SIGN          VARCHAR(50),
   TRANS_TYPE           VARCHAR(50),
   ASSIGN               VARCHAR(100),
   TRADE_PARTNER        VARCHAR(100),
   TAX_CODE             VARCHAR(50),
   DTL_ITEM_CODE        VARCHAR(50),
   DTL_REVERSE1         VARCHAR(100),
   DTL_REVERSE2         VARCHAR(100),
   DTL_ABS              VARCHAR(200),
   constraint PK_ERP_TEMPLATE_DTL primary key (ID)
);


--��ʼ���˵�
/*==============================================================*/
/* Menu:ģ������ά���������˵���                                */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = '���ݷ���' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '���ݷ���', 'exchange',0, 
             '', '0', '0', '0', '0', 3, '���ݷ���', 1, '');
   END;
END;
go
/*==============================================================*/
/* Menu:ģ������ά���������˵���                                */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
   FROM bt_sys_res
   WHERE res_name = 'ģ�涨��' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             'ģ�涨��', 'exchange',   
             (select res_code from bt_sys_res where res_name='���ݷ���' and sys_code='exchange'), 
             '', '0', '1', '0', '0', 1, 'ģ�涨��', 2, '');
   END;
END;
GO
/*==============================================================*/
/* Menu:ģ������ά�����ļ��˵���                                */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = 'ģ��ά��' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             'ģ��ά��', 'exchange',   
             (select res_code from bt_sys_res where res_name='ģ�涨��' and sys_code='exchange'), 
             '/dataExchange/erpTemplate.do?method=initContent', '0', '1', '0', '0', 1, '', 3, '');
   END;
END;
go
/*==============================================================*/
/* Menu:ģ��ά�����ļ��˵���                                    */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = 'ģ������ά��' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             'ģ������ά��', 'exchange',   
             (select res_code from bt_sys_res where res_name='ģ�涨��' and sys_code='exchange'), 
             '/dataExchange/erpTemplateType.do?method=initContent', '0', '1', '0', '0', 2, '', 3, '');
   END;
END;
go
/*==============================================================*/
/* Menu:��������                                                */
/*==============================================================*/
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatetypedetailid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatetypedetailid',
             '100'
      );    
   END;
END;
go
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists= COUNT(*) FROM tb_generator t where t.gen_name='erptemplatetypeid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatetypeid',
             '100'
      );    
   END;
END;
go
DECLARE 
   @record_exists int;
BEGIN
   SELECT  @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplateid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplateid',
             '100'
      );    
   END;
END;
GO
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatedetailid';
   IF @record_exists = 0
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatedetailid',
             '100'
      );    
   END;
END;
GO
COMMIT;

