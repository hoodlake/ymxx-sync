--修改人：胡双
--修改时间：2012-10-30
--修改内容：1104报表增加系统函数

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
       'GETZHYE（获取账户余额）',
       '获取指定账户的月底余额，类似获取科目余额函数，只是这里用户需要指定到具体的账户,公式定义示例：[GETZHYE(1000011020000001,01)]。');
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
       'GETKMRJYE（获取科目日均余额）',
       '获取指定科目的日均余额，取科目从当月1号至月尾每天的科目余额之和除以当月的总天数，公式定义示例：[GETKMRJYE(1001,01)]。');
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
       'GETHYKMYE（获取行业科目余额）',
       '获取指定行业和科目的所有账户的余额之和，公式定义示例: [GETHYKMYE(fina, 1120,01)]，其中fina为行业代码1120为科目代码01为币别代码。该示例为取行业为”(fina)金融业”科目为”1120企业贷款”的所有账户余额之和。因为每个账户都对应有开户单位，而每个开户单位都对应到一个行业，该公式是可以取到数的。');
  END IF;
  COMMIT;
END;
/