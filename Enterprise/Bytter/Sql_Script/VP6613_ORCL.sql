--�޸��ˣ���˫
--�޸�ʱ�䣺2012-10-30
--�޸����ݣ�1104��������ϵͳ����

DECLARE
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETZHYE%';
  IF VN_COUNT < 1 THEN
    INSERT INTO RPT1104_REPORT_FORMULA
    VALUES
      ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
       'GETZHYE����ȡ�˻���',
       '��ȡָ���˻����µ������ƻ�ȡ��Ŀ������ֻ�������û���Ҫָ����������˻�,��ʽ����ʾ����[GETZHYE(1000011020000001,01)]��');
  END IF;
  COMMIT;
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETKMRJYE%';
  IF VN_COUNT < 1 THEN
    INSERT INTO RPT1104_REPORT_FORMULA
    VALUES
      ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
       'GETKMRJYE����ȡ��Ŀ�վ���',
       '��ȡָ����Ŀ���վ���ȡ��Ŀ�ӵ���1������βÿ��Ŀ�Ŀ���֮�ͳ��Ե��µ�����������ʽ����ʾ����[GETKMRJYE(1001,01)]��');
  END IF;
  COMMIT;
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETHYKMYE%';
  IF VN_COUNT < 1 THEN
    INSERT INTO RPT1104_REPORT_FORMULA
    VALUES
      ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
       'GETHYKMYE����ȡ��ҵ��Ŀ��',
       '��ȡָ����ҵ�Ϳ�Ŀ�������˻������֮�ͣ���ʽ����ʾ��: [GETHYKMYE(fina, 1120,01)]������finaΪ��ҵ����1120Ϊ��Ŀ����01Ϊ�ұ���롣��ʾ��Ϊȡ��ҵΪ��(fina)����ҵ����ĿΪ��1120��ҵ����������˻����֮�͡���Ϊÿ���˻�����Ӧ�п�����λ����ÿ��������λ����Ӧ��һ����ҵ���ù�ʽ�ǿ���ȡ�����ġ�');
  END IF;
  COMMIT;
END;
/