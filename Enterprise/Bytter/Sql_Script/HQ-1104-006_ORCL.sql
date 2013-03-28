--修改人：胡双
--修改日期：2013-2-4
--修改内容：贷款明细采集表[中间表]添加字段
ALTER TABLE RPT1104_LOANS_DETAIL ADD LOAN_TYPE CHAR(2);
ALTER TABLE RPT1104_LOANS_DETAIL ADD ENTERPRISE_SCALE CHAR(4);
ALTER TABLE RPT1104_LOANS_DETAIL ADD INDUSTRY_CODE VARCHAR2(8);

COMMENT ON COLUMN RPT1104_LOANS_DETAIL.LOAN_TYPE IS '贷款方式';
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.ENTERPRISE_SCALE IS '企业规模代码';
COMMENT ON COLUMN RPT1104_LOANS_DETAIL.INDUSTRY_CODE IS '人行标准化行业代码';

--添加担保方式字段
ALTER TABLE RPT1104_INDEX_VALUE_DTL ADD LOAN_TYPE CHAR(2);
COMMENT ON COLUMN RPT1104_INDEX_VALUE_DTL.LOAN_TYPE IS '担保方式';
--添加网点编码
ALTER TABLE RPT1104_SUBJECT_BALANCE ADD NET_CODE CHAR(4);

--更新公式说明
UPDATE RPT1104_REPORT_FORMULA
   SET HELP = 'GETDKZLWJFL(五级代码,币种,网点代码,行业代码,企业规模,担保方式,逾期期限):<br>
获取贷款质量五级分类信息贷款余额<br>
参数1：需要获取的贷款质量五级分类贷款余额所对应的项目类别(正常类,关注类,次级类....)<br>
参数2：需要获取的贷款质量五级分类贷款余额所对应的币种<br>
参数3：需要获取的贷款质量五级分类贷款余额所对应的网点代码<br>
参数4：需要获取的贷款质量五级分类贷款余额所对应的行业代码(可选)<br>
参数5：需要获取的贷款质量五级分类贷款余额所对应的企业规模代码(可选)<br>
参数6：需要获取的贷款质量五级分类贷款余额所对应的担保方式(可选)<br>
参数7：需要获取的贷款质量五级分类贷款余额所对应的逾期期限(可选)<br>
示例1：GETDKZLWJFL(1001,01,1000,A,CS01,01,2)<br>
注:非填写项,可直接用,隔开不填写信息'
 WHERE FORMULA_NAME LIKE 'GETDKZLWJFL（%';
--更新公式说明
UPDATE RPT1104_REPORT_FORMULA
   SET FORMULA_NAME = 'GETTYCRQK（获取最大前十家拆入余额）',
       HELP         = 'GETTYCRQK(前十家中第几家的数据,取报表界面对应第几项的值):<br>获取最大前十家拆入余额【来源于同业拆入情况表的拆入余额】根据最大家次、报表项、报表日期取值<br>
参数1:获取需要的拆入余额前十家中对应第几家的数据<br>
参数2:获取报表对应列中第几项的值（如：第一项获取用户名，第二项获取用户单位代码对应报表表格）<br>
示例:GETTYCRQK(3,1) 获取前10家中第三家并取界面第一项的值(单位名称),对应报表日期的拆入余额<br>
注:非填写项,可直接用,隔开不填写信息'
 WHERE FORMULA_NAME LIKE 'GETTYCRQK（%';
COMMIT;
