--�޸����ڣ�20121225
--�޸��ˣ�����
--�����ţ�����ҵ�����͡������˺š���ƿ�Ŀ��Ӧ��ϵ����
--�޸����ݣ��¿�˹ ����ҵ�����͡������˺š���ƿ�Ŀ��Ӧ��ϵ����
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BIS_ACCOUNT_ITEM')
                  AND   TYPE = 'U')
create table BIS_ACCOUNT_ITEM  ( 
  ID   CHAR(12)   not null,  
 BUSINESS_CODE VARCHAR(32) ,   
 BANK_ACC VARCHAR(30),   
 ACCOUNT_ITEM VARCHAR(30), 
 constraint PK_BIS_ACCOUNT_ITEM primary key (ID
))
GO



declare 
   @exist_num  decimal(2) ;
    begin 
      select @exist_num = count(*)  from  bt_sys_res where res_name = '��ƿ�Ŀ��Ӧ��ϵ����' and sys_code = 'exchange'  ; 
      if(@exist_num < 1) 
        begin  
             insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
             select (select max(res_code)+1 from bt_sys_res ), '��ƿ�Ŀ��Ӧ��ϵ����', 'exchange', (select res_code from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange' ), '/netbank/accountingItem.do?method=toSelectCorpView', '0', '1', '0', '0', 11, '��ƿ�Ŀ��Ӧ��ϵ����', '', '', '', '', '', null, null, null, null, null, 2, '';

        end ;
    end ;
go