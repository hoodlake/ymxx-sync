--�޸���:�´���
--�޸�ʱ��:2012-10-24
--�޸�����:VP6307����˾��Ʒ�¼�������˵�
--------------����˾��Ʒ�¼
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('AB_TALLY_FC_PARAM')
                  AND   TYPE = 'U')
create table AB_TALLY_FC_PARAM
(
  OPERATION_ID    NUMERIC not null,
  VOUCHER_ORDER   NUMERIC not null,
  OPERATION_TYPE  NUMERIC not null,
  DEBIT_SUBJECTS  VARCHAR(200),
  CREDIT_SUBJECTS VARCHAR(200),
constraint PK_FC_PRARM primary key (OPERATION_ID, VOUCHER_ORDER, OPERATION_TYPE)
)

GO

---------------��������˾��ƿ�Ŀ����˵�
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
  FROM BT_SYS_RES
  WHERE SYS_CODE= 'adm'
   and RES_NAME = '����˾��ƿ�Ŀ����'
   and RES_URL = '/admin/fcTallyAction.do?method=listTallyParam';
  IF @VN_COUNT < 1
    BEGIN
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
         '����˾��ƿ�Ŀ����',
         'adm',
         RES_CODE,
         '/admin/fcTallyAction.do?method=listTallyParam',
         '0',
         '1',
         '0',
         '0',
         2,
         '����˾��ƿ�Ŀ����',
         '',
         '',
         '',
         '',
         '',
         null,
         null,
         null,
         null,
         null,
         3,
         ''
    from bt_sys_res
   where res_name = 'ҵ���Ʒ�¼����' and sys_code='adm';
    END;
END;
GO

--------------�޸�ԭ�жҷ�¼��������
   update BT_SYS_RES 
      set res_name = '�������Ļ�ƿ�Ŀ����'
    where sys_code = 'adm'
      and res_name = '�жһ�Ʊ'
      and res_url = '/admin/tallyAction.do?method=listTallyParam'
go
---�޸��ˣ����� 
--�޸�����:ZY-CD-01_ORCL.sql ����ab_operation������ȱ���ֶ�
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_OPERATION') AND NAME='RATMODEL')  
ALTER TABLE AB_OPERATION ADD RATMODEL VARCHAR(10)
GO

--�޸��ˣ����
--�жһ�Ʊ
--���Ʊ��ҵ�����������ͬ�ֻ㡱�ֶ�
--[VP6753]�¿�˹ERP�ϻ��²��ӿڿ���
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_RECEIVE') AND NAME='AS_SPOT_EXCHANGE')  
alter table AB_RECEIVE add AS_SPOT_EXCHANGE char(1) default 0
GO
