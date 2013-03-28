--�޸����ڣ�2012.12.07
--�޸��ˣ��ܱ�
--�޸����ݣ��Զ��������
--�޸�ԭ��������Ҫ
--���ӱ��ֶ�

update bt_param  set reverse1='0,��;1,��(�������ֹ����ɵ����);2,��(�����ֹ����ɵ����)'   where code ='autoBuildHisBal' and sys_code = 'adm' and name = '�Զ����������˻���ʷ���';

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BIS_ACC_HIS_BAL' AND COLUMN_NAME = 'ISAUTOMATICBAL';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BIS_ACC_HIS_BAL ADD ISAUTOMATICBAL CHAR(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column BIS_ACC_HIS_BAL.ISAUTOMATICBAL is 'Ϊ1��ʱ�����Զ�������Ϊ�յ�ʱ�����ֶ�����';

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'Bis_Acc_His_Dtl' AND COLUMN_NAME = 'ISAUTOMATICDTL';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE Bis_Acc_His_Dtl ADD ISAUTOMATICDTL CHAR(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column Bis_Acc_His_Dtl.ISAUTOMATICDTL is 'Ϊ1��ʱ���Ǵ���ϸ��¼Ϊ�Զ�������Ϊ�յ�ʱ�����ֶ��������';

DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '���������˻���ʷ���' and sys_code = 'bankacc' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values (( select max(res_code)+1 from bt_sys_res ) , '���������˻���ʷ���', 'bankacc', ( select min(res_code) from bt_sys_res r where r.res_name = '¼�����' and r.sys_code = 'bankacc'  ), '/bankacc/automaticBal.jsp', '0', '1', '0', '0', 10, ' ', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
END;
/
commit;

update Bis_Acc_His_Dtl set ISAUTOMATICDTL='1';
comment on column Bis_Acc_His_Dtl.ISAUTOMATICDTL is 'Ĭ�ϰ����е���ϸ����Ϊ�Զ�����';

commit;

--����������������bif_code
update bis_acc_his_bal a
   set bif_code = (select b.bif_code from bt_bank b where b.bank_code = a.bif_code )
 where a.bif_code  in
 (select aa.bif_code from bis_acc_his_bal aa , bt_bank ab where aa.bif_code = ab.bank_code );
  
 commit;
