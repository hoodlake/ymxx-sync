--修改日期：2012.9.6
--修改人：李鹏飞
--修改内容：XD-JD03-007  增加创建贷款管理的子菜单的脚本
--修改原因：新增加菜单，以前没有
--新增加贷款发放菜单 
--INSERT INTO BT_SYS_RES
--(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
--SELECT (SELECT MAX(RES_CODE) + 1 from BT_SYS_RES),'贷款发放','cms',RES_CODE,'/cms/MakeLoanPreview.jsp?view_type=10','0','0','0','0',2,2,''
--FROM BT_SYS_RES
--WHERE RES_NAME = '贷款管理' AND SYS_CODE='cms';
--COMMIT;




--浮动方式
alter table LOAN_SEND_OUT_INFO add FLOAT_WAY VARCHAR2(15);

--利率调整生效日期
alter table LOAN_SEND_OUT_INFO add RATE_ENTRIES_EFFECT_DATE DATE;

--计息方式
alter table LOAN_SEND_OUT_INFO add INTEREST_WAY VARCHAR2(15);


--基准利率类型
alter table LOAN_SEND_OUT_INFO add REFERENCE_RATE_TYPE VARCHAR2(50);

--贷款周期
alter table LOAN_SEND_OUT_INFO add REPAY_CYCLE VARCHAR2(50);

--下拉框选择点数或者比例
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_SELECT VARCHAR2(50);

--输入框维护贷款合同规定的点数或浮动比例
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_TEXT VARCHAR2(50);
-- 录入日期
alter table LOAN_SEND_OUT_INFO add (LOAN_ENTERING_DATE DATE);


COMMIT;
