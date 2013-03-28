--修改人:胡双
--修改日期：2012-12-13
--修改内容：1104报表公式定义，最大长度从400改成1000

ALTER TABLE rpt1104_report_css alter column cell_formula VARCHAR(1000);

--修改人:胡双
--修改日期：2012-12-14
--修改内容：1104报表增加贷款明细表[中间表]
CREATE TABLE RPT1104_LOANS_DETAIL(
 ID int NOT NULL,
 CORP_CODE VARCHAR(20),
 CORP_NAME VARCHAR(100),
 CUR_CODE CHAR(2),
 AMOUNT NUMERIC(20,2),
 PERIOD int, 
 RPT_DATE DATETIME,
CONSTRAINT PK_RPT1104_LOANS_DETAIL PRIMARY KEY(ID));


--修改人：胡双
--修改日期：2012-12-15
--修改内容：1104报表增加GETDKMXJE函数，获取贷款明细金额

DECLARE
  @VN_COUNT INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*)
    FROM RPT1104_REPORT_FORMULA
   WHERE FORMULA_NAME LIKE 'GETDKMXJE%';
  IF @VN_COUNT < 1 
  begin
     INSERT INTO RPT1104_REPORT_FORMULA(FORMULA_NAME,HELP)
    VALUES(
       'GETDKMXJE（获取贷款明细金额）',
       'GETDKMXJE (期限类型,币别):<br>获取贷款明细金额【贷款款明细表中贷款（票据贴现期限）期限大于?个月小于等于?个月的对应报表日期贷款（贴现）金额求和汇总】
       <br>参数1:获取贷款金额对应的贷款期限区间(-1 逾期、0 活期、1 三个月以内、2 三个月至六个月、3 六个月至一年、4 一年至两年、6 两年至三年、7 三年至五年、8 五年以上)<br>
       参数2：活期贷款币别编码；<br>示例：[GETDKMXJE(1,01)]<br>获取贷款期限在三个月以内且为人民币的对应报表日期的贷款金额。<br>');
  END;
END;