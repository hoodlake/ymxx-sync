--�޸����ڣ�2012-11-20
--�޸��ˣ��ܱ�
--�޸����ݣ��к���¼�������ɱ�ʶ,�����˻���ϸ��ֹʱ��ά���˵���
--�޸�ԭ��ZY-ZH-02,���˻������������ֶ�isComplete�ж����������Ƿ��Ѿ������������,��Ӵ��ֶκ����ǰ�����ݵ�isCompleteֵ����Ϊ1��1Ϊ��ɡ�


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BIS_ACC_HIS_BAL' AND COLUMN_NAME = 'ISCOMPLETE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BIS_ACC_HIS_BAL ADD ISCOMPLETE CHAR(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--update bis_acc_his_bal set isComplete='1';
commit;


DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '�˻���ϸ��ֹʱ��ά��' and sys_code = 'bankacc' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values (( select max(res_code)+1 from bt_sys_res ) , '�˻���ϸ��ֹʱ��ά��', 'bankacc', ( select min(res_code) from bt_sys_res r where r.res_name = '¼����ϸ' and r.sys_code = 'bankacc'  ), '/bankacc/bankAccEndList.do?method=getBankAccEndList', '0', '1', '0', '0', 4, ' ', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
END;
/
commit;


DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
   WHERE code = 'isAccManImpAbs' and sys_code = 'fcs' and (name = '�Ƿ��˻���������ϸժҪ' or name='�˻���������ϸժҪ�Ƿ����');
   IF VN_COUNT = 0 THEN
      insert into bt_param  (code,sys_code,name,param_value1,param_value2,param_value3,param_type,rmk,reverse1,reverse2,reverse3,reverse4,reverse5,reverse6,reverse7,reverse8,reverse9,reverse10)
	  values('isAccManImpAbs','fcs','�Ƿ��˻���������ϸժҪ','0',null,null,0,'�˻���������ϸժҪ�Ƿ����.1��;0��','1,��;0,��;',null,null,null,null,1.00,48.00,null,null,null);
   END IF;   
END;
/
commit;


update bt_param  set name='�˻���������ϸժҪ�Ƿ����' where code = 'isAccManImpAbs' and sys_code = 'fcs' and name = '�Ƿ��˻���������ϸժҪ';

update bt_sys_res set RES_URL='/bankacc/bankAccEndList.do?method=getBankAccEndList' WHERE res_name = '�˻���ϸ��ֹʱ��ά��' and sys_code = 'bankacc' and res_level = 2;
commit;
