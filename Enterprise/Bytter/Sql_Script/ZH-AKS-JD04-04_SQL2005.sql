--�޸���:�����
--�޸�ʱ��:2012-12-28
--�޸�����:ZH-AKS-JD04-04 �½������վ�����˵�

--��Ӳ˵�
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='�����վ����' and sys_code='fqs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '�����վ����', 'fqs', (select  max(res_code)  from bt_sys_res  where res_name='�������ݱ���' and sys_code='fqs'), '/aqs/dayAverageAccBal.do', '0', '0', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO