--�޸����ڣ�20121225
--�޸��ˣ�����
--�����ţ�����ҵ�����͡������˺š���ƿ�Ŀ��Ӧ��ϵ����
--�޸����ݣ��¿�˹ ����ҵ�����͡������˺š���ƿ�Ŀ��Ӧ��ϵ����

DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN 
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BIS_ACCOUNT_ITEM';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table BIS_ACCOUNT_ITEM  (   ID   CHAR(12)   not null,   BUSINESS_CODE VARCHAR2(32) ,   BANK_ACC VARCHAR2(30),   ACCOUNT_ITEM VARCHAR2(30),   constraint PK_BIS_ACCOUNT_ITEM primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END; 
/


declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '��ƿ�Ŀ��Ӧ��ϵ����' and sys_code = 'exchange'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '��ƿ�Ŀ��Ӧ��ϵ����', 'exchange', (select res_code from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange' ), '/netbank/accountingItem.do?method=toSelectCorpView', '0', '1', '0', '0', (select RES_ORDER+1 from bt_sys_res  where res_name='��ƿ�Ŀ��Ӧ��ϵ����' and  sys_code = 'exchange'), '��ƿ�Ŀ��Ӧ��ϵ����', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
commit;
