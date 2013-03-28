--修改日期：2012.11.22
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(考核利润调整)
set IDENTITY_INSERT tb_generator on;
DECLARE
  @VN_COUNT    INT,@VN_COUNT1    INT,@VN_COUNT2    INT;
BEGIN
--新增系统模块－资金管理中心
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys
   WHERE sys_code='mec';
  IF @VN_COUNT < 1
    BEGIN
       INSERT INTO BT_SYS (SYS_CODE, SYS_NAME, SYS_APP, FIRST_PAGE, VALID_SIGN, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', '资金管理中心', null, 'mec', '1', '资金管理中心', null, null, null, null, null, null, null, null, null, null);
    END;

-- 新增资金管理中心操作权限_录入权限
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_OPERATION  
   WHERE SYS_CODE = 'mec' AND OP_TYPE = 1;
  IF @VN_COUNT1 < 1
    BEGIN
       INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 1, '录入', null, null, null, null, null, null, null, null, null, null, null);
    END;

-- 新增资金管理中心操作权限_查询权限
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_OPERATION  
   WHERE SYS_CODE = 'mec' AND OP_TYPE = 2;
  IF @VN_COUNT1 < 1
    BEGIN
       INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 2, '查询', null, null, null, null, null, null, null, null, null, null, null);
    END;

-- 资金管理中心--考核调整(二级菜单)
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_RES
   WHERE SYS_CODE = 'mec' and res_name='考核调整';
  IF @VN_COUNT1 < 1
    BEGIN
     insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_type,status,res_order,res_level) 
	  select (select max(RES_CODE)+1 from bt_sys_res),'考核调整','mec','0','0','0',4,2;
    END;

-- 三级菜单（基础设置--考核利率）
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_RES
   WHERE res_name='考核利率' and sys_code='mec';
  IF @VN_COUNT1 < 1
    BEGIN
     insert into bt_sys_res (res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order,res_level)
select (select max(RES_CODE)+1 from bt_sys_res),'考核利率','mec',(select res_code from bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckRate.do','1','0',1,3;
    END;

-- 三级菜单（基础设置--考核规则）
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_RES
   WHERE res_name='考核规则' and sys_code='mec';
  IF @VN_COUNT1 < 1
    BEGIN
     insert into bt_sys_res (res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order,res_level)
select (select max(RES_CODE)+1 from bt_sys_res),'考核规则','mec',(select res_code from bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckRule.do','1','0',2,3;
    END;

-- 三级菜单（考核计算--考核计算）
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_RES
   WHERE res_name='考核计算' and sys_code='mec';
  IF @VN_COUNT1 < 1
    BEGIN
     insert into bt_sys_res (res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order,res_level)
select (select max(RES_CODE)+1 from bt_sys_res),'考核计算','mec',(select res_code from bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckDtl.do','1','0',3,3;
    END;

-- 三级菜单（考核计算--考核汇总）
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_RES
   WHERE res_name='考核汇总' and sys_code='mec' and res_type='1';
  IF @VN_COUNT1 < 1
    BEGIN
     insert into bt_sys_res (res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order,res_level)
select (select max(RES_CODE)+1 from bt_sys_res),'考核汇总','mec',(select res_code from bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckCollect.do','1','0',4,3;
    END;

-- 三级菜单（考核计算--考核查询）
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_RES
   WHERE res_name='考核查询' and sys_code='mec';
  IF @VN_COUNT1 < 1
    BEGIN
     insert into bt_sys_res (res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order,res_level)
select (select max(RES_CODE)+1 from bt_sys_res),'考核查询','mec',(select res_code from bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckSearch.do','1','0',5,3;
    END;

--操作序列表tb_genertor(考核汇总序列)
  SELECT @VN_COUNT1 = COUNT(*)
    FROM tb_generator
   WHERE gen_name='CMS_CHECK_COLLECT_ID';
  IF @VN_COUNT1 < 1
    BEGIN
     INSERT INTO tb_generator(ID,gen_name,gen_value)
select (SELECT MAX(ID)+1 from tb_generator),'CMS_CHECK_COLLECT_ID',1;
    END;

--操作序列表tb_genertor(考核规则序列)
  SELECT @VN_COUNT1 = COUNT(*)
    FROM tb_generator
   WHERE gen_name='CMS_CHECK_RULE_ID';
  IF @VN_COUNT1 < 1
    BEGIN
     INSERT INTO tb_generator(ID,gen_name,gen_value)
select (SELECT MAX(ID)+1 from tb_generator),'CMS_CHECK_RULE_ID',1;
    END;

--操作序列表tb_genertor(考核计算序列)
  SELECT @VN_COUNT1 = COUNT(*)
    FROM tb_generator
   WHERE gen_name='CMS_CHECK_DTL_ID';
  IF @VN_COUNT1 < 1
    BEGIN
     INSERT INTO tb_generator(ID,gen_name,gen_value)
select (SELECT MAX(ID)+1 from tb_generator),'CMS_CHECK_DTL_ID',1;
    END;
END
GO
--考核调整表结构脚本
    --查看现有系统是否有CMS_CHECK_RATE表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('CMS_CHECK_RATE')
                  AND   TYPE = 'U')
create table CMS_CHECK_RATE(
  CORP_ID    NUMERIC(10) not null primary key,
  CHECK_RATE NUMERIC(9,6) not null
)

GO

--查看现有系统是否有CMS_CHECK_RULE表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('CMS_CHECK_RULE')
                  AND   TYPE = 'U')
create table CMS_CHECK_RULE(
  ID            NUMERIC(10) not null primary key,
  OUT_CORP_ID   VARCHAR(100) not null,
  IN_CORP_ID    VARCHAR(100) not null,
  OUT_RULE_CODE VARCHAR(100),
  OUT_RULE_SQL  VARCHAR(200),
  OUT_RULE_NAME VARCHAR(200),
  IN_RULE_CODE  VARCHAR(100),
  IN_RULE_SQL   VARCHAR(200),
  IN_RULE_NAME  VARCHAR(200)
)
GO

--查看现有系统是否有CMS_CHECK_DTL表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('CMS_CHECK_DTL')
                  AND   TYPE = 'U')
create table CMS_CHECK_DTL(
  ID          NUMERIC(10) not null primary key,
  BILL_CODE   VARCHAR(20) not null,
  CHECK_DATE  DATETIME not null,
  OUT_CORP_ID NUMERIC(10) not null,
  IN_CORP_ID  NUMERIC(10) not null,
  MONEY       NUMERIC(15,2) not null,
  RATE        NUMERIC(8,6),
  CHECK_RATE  NUMERIC(8,6),
  OUT_INCOME  NUMERIC(15,2) not null,
  IN_INCOME   NUMERIC(15,2) not null,
  PRS_CODE    VARCHAR(20) not null
)
GO

--查看现有系统是否有CMS_CHECK_COLLECT表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('CMS_CHECK_COLLECT')
                  AND   TYPE = 'U')
create table CMS_CHECK_COLLECT
(
  ID              NUMERIC(10) not null primary key,
  BILL_CODE       VARCHAR(20) not null,
  CHECK_DATE      DATETIME not null,
  OUT_CORP_ID     NUMERIC(10) not null,
  INCREASE_INCOME NUMERIC(15,2) not null,
  DECREASE_INCOME NUMERIC(15,2) not null
)
GO
--考核计算视图
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='V_CMS_CHECK_DTL_TEMP')
DROP VIEW V_CMS_CHECK_DTL_TEMP
GO
CREATE VIEW V_CMS_CHECK_DTL_TEMP AS 
select c1.corp_name as out_corp_name,
       c2.corp_name as in_corp_name,
       b.precative_id,  --贷出单位ID 3
       b.loan_opp, --贷入单位代码  5
       a.money, --贷款金额
       a.rate, --贷款利率
       a.term,--期限
       c.check_rate, --考核利率,
		a.bill_code,--委贷发方编号
       (select out_rule_sql + (select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type') from CMS_CHECK_RULE where OUT_RULE_SQL is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp)) out_rule, --贷出规则
       (select in_rule_sql + (select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type')  from CMS_CHECK_RULE where IN_RULE_SQL is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp))  in_rule,  --贷入规则
       a.send_date,
       a.deadline_date
  from cms_precative_loan_send a, cms_precative_loan_info b,cms_check_rate c,bt_corp c1,bt_corp c2
 where a.father_code = b.bill_code
   and c.corp_id=b.precative_id
   and b.precative_id=c1.id
   and b.loan_opp = c2.id
GO


