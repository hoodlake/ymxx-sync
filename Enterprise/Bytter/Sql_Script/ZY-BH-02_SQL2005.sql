--�޸����ڣ�2012.11.27
--�޸��ˣ�����
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����(���������Ԥ��)

--ZY-XD-06������Ϣ��ѯ�˵�
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param
   WHERE CODE='gua_budget_sel' AND SYS_CODE = 'grt';
  IF @VN_COUNT < 1
    BEGIN
      insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
values ('gua_budget_sel','grt','��������ʱĬ��ѡ���Ԥ���Ŀ',null,null,null,0,'��������ʱĬ��ѡ���Ԥ���Ŀ','˵�����粻������Ĭ��Ϊ����Ԥ��',null,null,null,null,0,8,null,null,null);
    END;
END;
GO