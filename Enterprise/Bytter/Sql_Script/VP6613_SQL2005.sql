--�޸��ˣ���˫
--�޸�ʱ�䣺2012-10-30
--�޸����ݣ�1104��������ϵͳ����

DECLARE
  @VN_COUNT INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETZHYE%';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO RPT1104_REPORT_FORMULA(FORMULA_NAME,HELP)
	  VALUES
	  ('GETZHYE����ȡ�˻���',
	  '��ȡָ���˻����µ������ƻ�ȡ��Ŀ������ֻ�������û���Ҫָ����������˻�,��ʽ����ʾ����[GETZHYE(1000011020000001,01)]��');
    END;
  SELECT @VN_COUNT = COUNT(*)
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETKMRJYE%';
  IF @VN_COUNT < 1
    BEGIN
       INSERT INTO RPT1104_REPORT_FORMULA(FORMULA_NAME,HELP)
    VALUES
      ('GETKMRJYE����ȡ��Ŀ�վ���',
       '��ȡָ����Ŀ���վ���ȡ��Ŀ�ӵ���1������βÿ��Ŀ�Ŀ���֮�ͳ��Ե��µ�����������ʽ����ʾ����[GETKMRJYE(1001,01)]��');
    END;
SELECT @VN_COUNT = COUNT(*)
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETHYKMYE%';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO RPT1104_REPORT_FORMULA(FORMULA_NAME,HELP)
    VALUES
      ('GETHYKMYE����ȡ��ҵ��Ŀ��',
       '��ȡָ����ҵ�Ϳ�Ŀ�������˻������֮�ͣ���ʽ����ʾ��: [GETHYKMYE(fina, 1120,01)]������finaΪ��ҵ����1120Ϊ��Ŀ����01Ϊ�ұ���롣��ʾ��Ϊȡ��ҵΪ��(fina)����ҵ����ĿΪ��1120��ҵ����������˻����֮�͡���Ϊÿ���˻�����Ӧ�п�����λ����ÿ��������λ����Ӧ��һ����ҵ���ù�ʽ�ǿ���ȡ�����ġ�');
    END;
END;
GO
