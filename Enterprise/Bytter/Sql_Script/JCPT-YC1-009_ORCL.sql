--�޸����ڣ�2012.11.09
--�޸��ˣ���֮��
--�޸����ݣ���󸶿�����ά��
--�޸�ԭ����󸶿�����ά��
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BT_MAX_PAY_DATE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE BT_MAX_PAY_DATE(ID NUMBER(10) PRIMARY KEY ,ENTER_DATE DATE,BUSINESS_TYPE_NAME VARCHAR2(40),CORP_CODE VARCHAR2(40),PAY_MONTH VARCHAR2(200),MAX_PAY_DAY NUMBER(2),RMK VARCHAR2(400),VALID_SIGN VARCHAR2(2))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--�޸��ˣ�����
--�޸����ڣ�2012-11-07
--�޸�����: ����erp_pay_info ��fbs_item���м��
--�޸�ԭ��:�ײ���Ԥ����������
 create or replace  view V_BUSINESS_INFO as 
   select e.bytter_id as item_code ,e.erp_id as business_Type ,e.erp_name  as business_Name from erp_basic_data e where e.data_type='FBS_ITEM' and e.erp_sys_name='budget' ;
   comment on column V_BUSINESS_INFO.item_code   is '��Ŀ����';
   comment on column V_BUSINESS_INFO.business_Name   is 'ҵ������';
   comment on column V_BUSINESS_INFO.business_type   is 'ҵ�����';

declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '��󸶿�����ά��' and sys_code = 'adm'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '��󸶿�����ά��', 'adm', (select res_code from bt_sys_res  where res_name = '��������ά��' and sys_code = 'adm' ), '/admin/createBtMaxPayDate.jsp', '0', '1', '0', '0', 11, '��󸶿�����ά��', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;
end if;
end ;
/

   
   
--�޸��ˣ�����
--�޸����ڣ�2012-11-07
--�޸�����: �ײŽڼ��ո���ִ��ϵͳ��������
--�޸�ԭ��:�ײŽڼ��ո���ִ��ϵͳ��������  

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='festivalPay' AND SYS_CODE='nis';
  IF VN_COUNT < 1 THEN
    INSERT INTO BT_PARAM (CODE,SYS_CODE,NAME,PARAM_VALUE1,PARAM_VALUE2,PARAM_VALUE3,PARAM_TYPE,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10)
  VALUES ('festivalPay','nis','�ڼ��ո���ִ��','0',null,null,'','�ڼ��ո���ִ��,Ĭ�Ͻڼ���ִ��','0,�ڼ���ִ��;1,��ǰ���һ��������;2,�ں��һ��������','','','','',1.00,36.00,null,null,null);
  COMMIT;
 END IF; 
END;
/
