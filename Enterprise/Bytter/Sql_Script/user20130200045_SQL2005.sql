--�޸��ˣ���³� 
--�޸����ڣ�2012-12-03
--�޸����ݣ��������������н����𡱵Ķ��������Ӣ�ķֺŸ���
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from BT_PARAM  where CODE = 'special_bank_loan_type' and sys_code = 'cms';
  IF @VN_COUNT >= 1
  BEGIN
   update BT_PARAM set REVERSE1='˵����ά�����Ի������𣬶���������м���Ӣ�ķֺŸ���' where CODE = 'special_bank_loan_type' and sys_code = 'cms';
  END;
END;
GO