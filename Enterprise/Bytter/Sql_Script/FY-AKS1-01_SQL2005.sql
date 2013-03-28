--�޸���:�����
--�޸�ʱ��:2012-10-12
--�޸�����:�½�����ӳ�ʼ����
create table FINANIC_COST_TYPE  (
   GUID                 VARCHAR(40) NOT NULL, --����
   TYPE_CODE            VARCHAR(40), --���ͱ���
   TYPE_NAME            VARCHAR(80), --��������
   IS_DEFAULT           INT, --Ĭ��ֵ
   COM_MENT           VARCHAR(255), --��ע
   constraint TYPE_CODE_UNIQUE unique(TYPE_CODE),
   constraint TYPE_NAME_UNIQUE unique(TYPE_NAME)
)
GO
alter table FINANIC_COST_TYPE
   add constraint PK_FINANIC_COST_TYPE primary key (GUID)
GO
insert into finanic_cost_type values('c4905cc2d4e146a5b46d5e63afe3ffb9','001','������',0,'ϵͳԤ��')
GO
insert into finanic_cost_type values('695fe648a3384cf6bc98a7a66b55b66f','002','��������',0,'ϵͳԤ��')
GO
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
   RES_LEVEL)
  select(select max(RES_CODE) + 1 from bt_sys_res),
         '���ù���',
         'cms',
         '0',
         '',
         '0',
         '1',
         '0',
         '0',
         3,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         1
         
GO        

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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '��������ά��',
         'cms',
         res_code,
         '/cms/costType.do?method=toList',
         '0',
         '1',
         '0',
         '0',
         1,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2
  from bt_sys_res
   where res_name = '���ù���'
   and sys_code='cms'
GO