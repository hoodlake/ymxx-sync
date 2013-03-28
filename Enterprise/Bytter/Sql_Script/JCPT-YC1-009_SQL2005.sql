--�޸����ڣ�2012.11.09
--�޸��ˣ���֮��
--�޸����ݣ���󸶿�����ά��
--�޸�ԭ����󸶿�����ά��
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_MAX_PAY_DATE')
                  AND   TYPE = 'U')
CREATE TABLE BT_MAX_PAY_DATE(
       ID                 decimal(10) PRIMARY KEY ,
       ENTER_DATE         DATETIME,
       BUSINESS_TYPE_NAME VARCHAR(40),
       CORP_CODE          VARCHAR(40),
       PAY_MONTH          VARCHAR(200),
       MAX_PAY_DAY        decimal(2),
       RMK                VARCHAR(400),
       VALID_SIGN         VARCHAR(2)
)  
GO

--�޸��ˣ�����
--�޸����ڣ�2012-11-07
--�޸�����: ����erp_pay_info ��fbs_item���м��
--�޸�ԭ��:�ײ���Ԥ����������
--ҵ������   
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='V_BUSINESS_INFO')
DROP VIEW V_BUSINESS_INFO
GO
CREATE VIEW V_BUSINESS_INFO as 
SELECT e.bytter_id as item_code ,e.erp_id as businesstype ,e.erp_name  as businessName from erp_basic_data e where e.data_type='FBS_ITEM' and e.erp_sys_name='budget' ;
GO

--�޸����ڣ�2012.11.09
--�޸��ˣ���֮��
--�޸����ݣ���󸶿�����ά��
--�޸�ԭ����󸶿�����ά��
declare 
   @exist_num  decimal(2) ;
    begin 
      select @exist_num = count(*)  from  bt_sys_res where res_name = '��󸶿�����ά��' and sys_code = 'adm'  ; 
      if(@exist_num < 1) 
        begin  
             insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
             select (select max(res_code)+1 from bt_sys_res ), '��󸶿�����ά��', 'adm', (select res_code from bt_sys_res  where res_name = '��������ά��' and sys_code = 'adm' ), '/admin/createBtMaxPayDate.jsp', '0', '1', '0', '0', 11, '��󸶿�����ά��', '', '', '', '', '', null, null, null, null, null, 2, '';

        end ;
    end ;
go

--�޸��ˣ�����
--�޸����ڣ�2012-11-07
--�޸�����: �ײŽڼ��ո���ִ��ϵͳ��������
--�޸�ԭ��:�ײŽڼ��ո���ִ��ϵͳ��������   
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_PARAM
   WHERE CODE='festivalPay' AND SYS_CODE='nis';
  IF @VN_COUNT < 1
    BEGIN
    INSERT INTO BT_PARAM (CODE,SYS_CODE,NAME,PARAM_VALUE1,PARAM_VALUE2,PARAM_VALUE3,PARAM_TYPE,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10)
    VALUES ('festivalPay','nis','�ڼ��ո���ִ��','0',null,null,'','�ڼ��ո���ִ��,Ĭ�Ͻڼ���ִ��','0,�ڼ���ִ��;1,��ǰ���һ��������;2,�ں��һ��������','','','','',1.00,36.00,null,null,null);

  END;
END;
GO    