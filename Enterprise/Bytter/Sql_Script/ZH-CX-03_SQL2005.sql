--���ڣ�2012-12-13
--�����ˣ���ӯ
--�������ݣ������˻���֧�����˵�

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*) FROM bt_sys_res WHERE FATHER_CODE=459 AND SYS_CODE='fqs' and RES_NAME='�����˻���֧�����';
  IF @VN_COUNT < 1 
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
  select (select max(res_code) + 1 from bt_sys_res), '�����˻���֧�����', 'fqs', 459, '/aqs/queryBankRecPay.jsp', '0', '1', '0', '0', 36,'�����˻���֧�����', '', '', '', '', '', null, null, null, null, null, 2;

END;
go
