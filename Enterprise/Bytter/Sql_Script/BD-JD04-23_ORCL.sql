--�޸����ڣ�20121122
--�޸��ˣ���̺�
--�޸����ݣ������Ƿ��ȸ������˲���
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='payment_isAccount' AND SYS_CODE='nis';
  IF VN_COUNT < 1 THEN
   insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('payment_isAccount', 'nis', '�Ƿ��ȸ�������', '0', null, null, '0', '�Ƿ��ȸ�������,0��;1��', '1,��;0,��;', '', '', '', '', 1.00, 46.00, null, null, null);
  COMMIT;
 END IF; 
END;
/

--�޸����ڣ�20121122
--�޸��ˣ���̺�
--�޸����ݣ������Ƿ��Զ����˲���
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='isAutoAccount' AND SYS_CODE='nis';
  IF VN_COUNT < 1 THEN
   insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('isAutoAccount', 'nis', '�Ƿ��Զ�����', '0', null, null, '0', '�Ƿ��Զ�����,0��;1��', '1,��;0,��;', '', '', '', '', 1.00, 47.00, null, null, null);
  COMMIT;
 END IF; 
END;
/

--�޸����ڣ�20121122
--�޸��ˣ���̺�
--�޸����ݣ����Ӹ���ִ�в˵�
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE FATHER_CODE=15 AND SYS_CODE='nis' and RES_NAME='����ִ��';
  IF VN_COUNT < 1 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '����ִ��', 'nis', 15, '/netbank/allCorpMakeupBill.jsp', '0', '1', '0', '0', 10, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  COMMIT;
 END IF; 
END;
/

--�޸����ڣ�20121122
--�޸��ˣ���̺�
--�޸����ݣ����Ӹ�����Ƿ�¼�ֶ�
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='NIS_BILLHEAD' AND COLUMN_NAME='IS_MAKEUP';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table nis_billhead add is_makeup varchar2(1)';
  COMMIT;
 END IF; 
END;
/
