--修改人：胡双
--修改日期：2013-1-5
--修改内容：该脚本是更新脚本。由于1104报表公式解析更改，不再需要[]，
--所以执行该脚本，将公式中的[]去掉，
UPDATE RPT1104_REPORT_CSS
   SET CELL_FORMULA = REGEXP_REPLACE(CELL_FORMULA, '\[*' || '\]*', '')
 WHERE CELL_FORMULA IS NOT NULL;
COMMIT;

--修改人：胡双
--修改日期：2013-1-15
--修改内容：初始化报表公式表
DELETE RPT1104_REPORT_FORMULA;
COMMIT;

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   '自定义SQL',
   '自定SQL:在公式列自己写需要执行的sql查询语句，并且此sql只能返回一个值，不能返回结果集或多个值。</br>
示例:SELECT BALANCE FROM SUBJECT_BALANCE WHERE SUBJECT_CODE=''2010''</br>
注:自定sql的查询语句必须以括起，且参数需要自己填上');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETBHJE（获取保函金额求和汇总）',
   'GETBHJE(币种,保函类型):<br>获取根据保函管理表按币种为对应币、保函类别为对应保函和开立日期为本报告期间的金额求和汇总
<br>参数1:需要获取的保函金额所对应的币种<br>
参数2:需要获取的保函金额所对应的保函类型<br>
示例:GETBHJE(01,A8888)<br>获取币别为RMB且保函类型为A8888的对应报表日期的保函金额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETXYZJE（获取信用证开证金额）',
   'GETXYZJE(币种):<br>获取根据信用证开证按币种为对应币和开证日期为本报告期间的开证金额求和汇总<br>
参数1:需要获取的信用证开证金额所对应的币种<br>
示例:GETXYZJE(01)<br>获取币种为RMB且开证日期为本报告期间的开证金额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETCCYE（获取拆出余额）',
   'GETCCYE(剩余期限区间,逾期天数):<br>获取根据剩余期限、逾期天数以及报表日期得到拆出余额求和汇总<br>
参数1:需要获取的拆借余额所对应的拆借剩余期限区间(次日:0-2, 2-7日:2-7 ,91-1年:91-365 ,1年以上:365)<br>
参数2:需要获取的拆借余额所对应的拆借逾期天数<br>
示例:GETCJYE(0-2,3)<br获取拆借剩余期限为次日且拆借逾期天数未3天的当前报表日期的拆出余额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETCKYE（获取存款余额）',
   'GETCKYE(前十家中第几家的数据,取报表界面对应第几项的值,存款类型,单位代码):<br>获取存款余额【在存款余额表中按客户对对应存款类型的存款余额求和汇总】<br>根据最大家次和报表项取值
参数1:获取需要的存款信息中前十家中对应第几家的数据<br>
参数2:获取报表对应列中第几项的值（如：第一项获取用户名，第二项获取用户单位代码对应报表表格）<br>
参数3:获取需要存款信息对应的存款类型<br>
参数4:获取需要存款信息对应的单位代码<br>
示例:GETCKYE(2,2,A888,2010)<br>获取前10家中第二家并取界面第二项的值(单位代码),存款类型为A888,单位代码为2010的对应报表日期的存款余额<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETTYCRQK（获取拆入余额）',
   'GETTYCRQK(前十家中第几家的数据,取报表界面对应第几项的值):<br>获取拆入余额【来源于同业拆入情况表的拆入余额】根据最大家次、报表项、报表日期取值<br>
参数1:获取需要的拆入余额前十家中对应第几家的数据<br>
参数2:获取报表对应列中第几项的值（如：第一项获取用户名，第二项获取用户单位代码对应报表表格）<br>
示例:GETTYCRQK(3,1)<br>获取前10家中第三家并取界面第一项的值(单位名称),对应报表日期的拆入余额<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDKYEBYTYPE（根据上年期末和本年期末贷款类型得到贷款余额）',
   'GETDKYEBYTYPE(上年期末贷款类型,本年期末贷款类型)<br>根据上年期末和本年期末贷款类型获取贷款余额
<br>
参数1:需要获取的贷款余额所对应的上年期末的贷款类型<br>
参数2:需要获取的贷款余额所对应的本年期末的贷款类型<br>
示例:GETDKYEBYTYPE(A801,A802)<br>获取上年期末贷款类型为A801假定为正常类贷款,本年期末为A802假定为次级类贷款的贷款余额求和汇总');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETJGZB（获取监管指标定义信息）',
   'GETJGZB(报表编码,取该报表中某cell编码项对应的值):<br>获取监管指标定义信息<br>
参数1:需要获取的获取监管指标定义信息所对应的报表编码<br>
参数2:需要获取的获取监管指标定义信息所对应的报表的cell编码<br>
示例:GETJGZB(G01,D6)<br>获取报表编码为G01内的cell为D6项的值<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETCKMXJE（获取存款明细金额）',
   'GETCKMXJE(存款期限区间):<br>获取存款明细金额【存款明细表中存款期限大于?个月小于等于?个月的对应报表日期存款金额求和汇总】<br>
参数1:获取存款金额对应的存款期限区间(0 活期 1 三个月以内 2 三个月至六个月 3 六个月至一年 4 一年至两年 6 两年至三年 7 三年至五年 8 五年以上)<br>
示例:GETCKMXJE(1)<br>获取存款期限在三个月以内的对应报表日期的存款金额<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDQCKJE（获取定期存款金额）',
   'GETDQCKJE(存款剩余期限区间):<br>获取定期存款金额【来源于定期存款表按到期日与报告期末日期进行比较等于对应剩余期限的存款金额求和汇总】<br>
参数1:需要获取的定期存款金额所对应的定期存款金额剩余期限区间(次日:0-2, 2-7日:2-7 ,91-1年:91-365 ,1年以上:365)<br>
示例:GETDQCKJE(365)<br>获取定期存款金额剩余期限在1年以上且为对应报表日期的定期存款金额<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETMAXSXYE（获取最高授信余额）',
   'GETMAXSXYE(单位代码, 授信类型):<br>获取最高授信余额信息<br>
参数1:需要获取的最高授信余额所对应的单位代码<br>
参数2:需要获取的最高授信余额类型信息<br>
示例:GETMAXSXYE(2010,AB001)<br>获取单位代码为2010、授信类型为AB001对应报表日期的最高授信余额;<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETCRYE（获取拆入余额）',
   'GETCRYE(剩余期限区间,逾期天数):<br>获取根据剩余期限、逾期天数以及报表日期得到拆入余额求和汇总<br>
参数1:需要获取的拆借余额所对应的拆借剩余期限区间(次日:0-2, 2-7日:2-7 ,91-1年:91-365 ,1年以上:365)<br>
参数2:需要获取的拆借余额所对应的拆借逾期天数<br>
示例:GETCJYE(0-2,3)<br>获取拆借剩余期限为次日且拆入逾期天数未3天的当前报表日期的拆入余额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETZJTZYE（获取债券投资余额）',
   'GETZJTZYE(币别):<br>获取债券投资余额信息<br>
参数1:获取需要的债券投资余额信息对应的币别<br>
示例:GETZJTZYE(01)<br>获取币种为RMB对应的债券投资余额信息求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETSXYE（获取授信余额）',
   'GETSXYE(单位代码, 授信类型):<br>获取授信余额信息<br>
参数1:需要获取的授信余额所对应的单位代码<br>
参数2:需要获取的授信余额类型信息<br>
示例:GETSXYE(2010,AB001)<br>获取单位代码为2010、授信类型为AB001对应报表日期的授信余额;<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETTOPSXYE（获取最大前十家授信余额信息）',
   'GETTOPSXYE(前十家中第几家的授信余额信息,第几项的值):<br>获取前十家授信余额信息中的第几家信息并对应获取报表第几项的值<br>
参数1:需要获取的前十家中第几家的授信余额信息<br>
参数2:获取报表对应列中第几项的值（如:第一项获取用户名，第二项获取用户单位代码对应报表表格）<br>
示例:GETTOPSXYE(1,1)<br>获取前十家中第一家对应报表第一项的授信信息<br>
注:非填写项,可直接用,隔开不填写信息<br>');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDYZJ（获取抵押作价）',
   'GETDYZJ(单位代码,抵质押类型,币种):<br>获取抵质押情况表的抵押作价<br>
参数1:需要获取的抵押作价所对应的单位代码<br>
参数2:需要获取的抵押作价所对应的抵质押类型(10抵押，11质押)<br>
参数3:需要获取的抵押作价所对应的币种<br>
示例:GETDYZJ(2010,10,01)<br>获取单位代码为2010,抵押类型为10,对应币种为RMB,日期为相应报表日期的抵押作价;<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDYZJ1（获取抵质押情况表的抵押作价）',
   'GETDYZJ1(抵质押物类型,币种,账龄年份区间):<br>根据日期和账龄以及抵质押类型获取抵质押情况表的抵押作价
<br>参数1:需要获取的抵押作价所对应的抵质押物类型<br>
参数2:需要获取的抵押作价所对应的币种<br>
参数3:需要获取的抵押作价所对应的账龄年份区间(一年以内:0-1 ,一年以上到两年:1-2,两年以上到三年:2-3,三年以上:3)<br>
示例:GETDYZJ1(A818,01,0-1)<br>获取抵押物类型为A818，币种为RMB，抵债资产账龄在一年以内的质押作价<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDKZLWJFL（获取贷款质量五级分类信息贷款余额）',
   'GETDKZLWJFL(项目类别,币种,网点代码,行业,贷款期限):<br>获取贷款质量五级分类信息贷款余额
<br>参数1:需要获取的贷款质量五级分类贷款余额所对应的项目类别(正常类,关注类,次级类....)<br>
参数2: 需要获取的贷款质量五级分类贷款余额所对应的币种<br>
参数3: 需要获取的贷款质量五级分类贷款余额所对应的网点代码<br>
参数4: 需要获取的贷款质量五级分类贷款余额所对应的行业代码<br>
参数5: 需要获取的贷款质量五级分类贷款余额所对应的贷款期限<br>
示例1:GETDKZLWJFL(1003031,01,2010,113,5)<br>获取项目类别为1003031，对应币种为RMB,单位代码为2010、行业代码为113且贷款期限为5天的贷款余额<br>
示例2:GETDKZLWJFL(1003031,01,2010,,)<br>获取项目类别为1003031，对应币种为RMB,单位代码为2010、不限定行业代码和贷款期限的贷款余额<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDKYQBJ（获取逾期金额（本金））',
   'GETDKYQBJ(币种):<br>获取逾期金额（本金）【来源于贷款质量五级分类明细表的对本年的逾期金额（本金）求和汇总】<br>
参数1:需要获取的获取逾期金额所对应的币种<br>
示例:GETDKYQBJ(01,)<br>获取币种为RMB以及对应报表日期的逾期金额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDKZLWJFLBYYUQI（获取愈期天数超过90天的贷款余额求和汇总）',
   'GETDKZLWJFLBYYUQI(币种):<br>获取贷款质量五级分类明细表按愈期天数超过90天的逾期情况和币种为相应币别的对贷款余额求和汇总<br>
参数1:需要获取的获取逾期金额所对应的币种<br>
示例:GETDKZLWJFLBYYUQI(01)<br>获取币种为RMB以及对应报表日期并且愈期天数超过90天的逾期情况的贷款余额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETJTSSZBJE（获取贷款质量五级分类损失准备金额汇总）',
   'GETJTSSZBJE(币种,项目类别,损失准备类型):<br>获取贷款质量五级分类明细表按对应的损失准备类型和对应贷款的项目类别求损失准备金额汇总<br>
参数1:需要获取的损失准备金额所对应的币种<br>
参数2:需要获取的损失准备金额所对应的项目类别(正常类,关注类,次级类....)<br>
参数3:需要获取的损失准备金额所对应损失准备类型<br>
示例:GETJTSSZBJE(01,1003031,A00305)<br>获取币种为RMB,项目类别为1003031,损失准备类型为A00305的损失准备汇总金额<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDKZLWJFLBYTOP（获取前十家贷款质量五级分类明细贷款信息）',
   'GETDKZLWJFLBYTOP(前十家中第几家的数据,第几项的值,项目类别,计提损失准备类型):<br>获取前十家贷款质量五级分类明细按第几家取第几项数据以及对应的损失准备类型和对应贷款的项目类别的贷款信息<br>
参数1:需要获取的贷款信息中前十家中对应第几家的数据<br>
参数2:需要获取的贷款信息对应报表第几项的值<br>
参数3:需要获取的贷款信息对应的项目类别(正常类,关注类,次级类....)<br>
参数4:需要获取的贷款信息对应的计提损失准备类型<br>
示例:GETDKZLWJFLBYTOP(1,1,1003031,A00305)<br>获取对应前十家中第1家对应报表第一项(单位名称)，项目类别代码为1003031以及计提损失准备类型为A00305对应报表日期的贷款信息数据<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETKMYE（获取科目余额）',
   'GETKMYE(科目代码,币种,年份标示):<br>获取当前科目所对应的科目余额<br>
参数1:需要获取的科目余额所对应的科目代码<br>
参数2:需要获取的科目余额所对应的币种<br>
参数3:需要获取的科目余额所对应的年份标示 -12标示日期减12个月即为上一年,12标示加12个月,即为下一年科目余额<br>
示例:GETKMYE(80080001,01,-12)<br>获取科目代码为80080001对应币种为RMB的上年期末的科目余额信息<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDKYE（获取贷款余额）',
   'GETDKYE(币种,剩余期限区间,逾期天数):<br>获取对应币种、报表日期以及贷款剩余期限区间的贷款余额求和汇总<br>
参数1:需要获取的贷款余额所对应的币种<br>
参数2:需要获取的贷款余额所对应的贷款剩余期限区间(次日:0-2, 2-7日:2-7 ,91-1年:91-365 ,1年以上:365)<br>
参数3:需要获取的贷款余额所对应的逾期天数
示例GETDKYE(01,0-2,) 获取币种为RMB且贷款剩余区间在次日的贷款余额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETCDHP（获取承兑汇票汇总金额）',
   'GETCDHP(币种):<br>获取根据承兑汇票信息按币种为对应币和开出日期为本报告期间的金额求和汇总<br>
参数1:需要获取的承兑汇票金额所对应的币种<br>
示例:GETCDHP(01)<br>获取币种为RMB以及对应汇票开出日期为报表日期的汇票金额求和汇总<br>
注:非填写项,可直接用,隔开不填写信息');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETZHYE（获取账户余额）',
   'GETZHYE(账号,币种):<br>获取指定账户的月底余额，类似获取科目余额函数，只是这里用户需要指定到具体的账户<br>
参数1:用户账号<br>
参数2:币别号<br>
示例：GETZHYE(1000011020000001,01)');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETKMRJYE（获取科目日均余额）',
   'GETKMRJYE(科目,币种):<br>获取指定科目的日均余额，取科目从当月1号至月尾每天的科目余额之和除以当月的总天数<br>
参数1:科目<br>
参数2:币别号<br>
示例：GETKMRJYE(1001,01)');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETHYKMYE（获取行业科目余额）',
   'GETHYKMYE(行业,科目,币种):<br>获取指定行业和科目的所有账户的余额之和
参数1:行业号<br>
参数2:科目号<br>
示例: GETHYKMYE(fina, 1120,01)<br>
其中fina为行业代码1120为科目代码01为币别代码<br>
该示例为取行业为”(fina)金融业”科目为”1120企业贷款”的所有账户余额之和');

INSERT INTO RPT1104_REPORT_FORMULA
  (ID, FORMULA_NAME, HELP)
VALUES
  ((SELECT MAX(ID + 1) FROM RPT1104_REPORT_FORMULA),
   'GETDKMXJE（获取贷款明细金额）',
   'GETDKMXJE(期限类型,币种):<br>获取贷款明细金额【贷款款明细表中贷款（票据贴现期限）期限大于?个月小于等于?个月的对应报表日期贷款（贴现）金额求和汇总】<br>
参数1:获取贷款金额对应的贷款期限区间(-1 逾期、0 活期、1 三个月以内、2 三个月至六个月、3 六个月至一年、4 一年至两年、6 两年至三年、7 三年至五年、8 五年以上)<br>
参数2:币别号<br>
示例：GETDKMXJE(1,01)<br>获取贷款期限在三个月以内且为人民币的对应报表日期的贷款金额。<br>');

COMMIT;