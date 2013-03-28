--修改内容:新增系统模块－资金管理中心
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS  WHERE SYS_CODE = 'mec';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS (SYS_CODE, SYS_NAME, SYS_APP, FIRST_PAGE, VALID_SIGN, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', '资金管理中心', null, 'mec', '1', '资金管理中心', null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--修改内容:新增资金管理中心操作权限_录入权限
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 1;
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 1, '录入', null, null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--修改内容:新增资金管理中心操作权限_查询权限
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 2;
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 2, '查询', null, null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--修改内容:资金管理中心--考核调整(二级菜单)
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec'and res_name='考核调整';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'考核调整','mec','0','0','0',4);
  END IF;
  COMMIT; 
END;
/

--修改内容:资金管理中心--考核调整(二级菜单)--考核利率（三级菜单）
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='考核利率';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'考核利率','mec',(select res_code from 
bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckRate.do','1','0',1);
  END IF;
  COMMIT; 
END;
/

--修改内容:资金管理中心--考核调整(二级菜单)--考核规则（三级菜单）
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='考核规则';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'考核规则','mec',(select res_code from 
bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckRule.do','1','0',2);
  END IF;
  COMMIT; 
END;
/

--修改内容:资金管理中心--考核调整(二级菜单)--考核计算（三级菜单）
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='考核计算';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'考核计算','mec',(select res_code from 
bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckDtl.do','1','0',3);
  END IF;
  COMMIT; 
END;
/

--修改内容:资金管理中心--考核调整(二级菜单)--考核汇总（三级菜单）
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='考核汇总';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'考核汇总','mec',(select res_code from 
bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckCollect.do','1','0',4);
  END IF;
  COMMIT; 
END;
/

--修改内容:资金管理中心--考核调整(二级菜单)--考核查询（三级菜单）
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='考核查询';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'考核查询','mec',(select res_code from 
bt_sys_res where res_name='考核调整' and sys_code='mec'),'/cms/cmsCheckSearch.do','1','0',5);
  END IF;
  COMMIT; 
END;
/

--修改内容:操作序列表tb_genertor(考核汇总序列)
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM tb_generator WHERE gen_name='CMS_CHECK_COLLECT_ID';
  IF VN_COUNT < 1 THEN
  INSERT INTO tb_generator(ID,gen_name,gen_value) VALUES((SELECT MAX(ID) FROM 

tb_generator)+1 ,'CMS_CHECK_COLLECT_ID',1);

  END IF;
  COMMIT; 
END;
/

--修改内容:操作序列表tb_genertor(考核规则序列)
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM tb_generator WHERE gen_name='CMS_CHECK_RULE_ID';
  IF VN_COUNT < 1 THEN
  INSERT INTO tb_generator(ID,gen_name,gen_value) VALUES((SELECT MAX(ID) FROM 

tb_generator)+1 ,'CMS_CHECK_RULE_ID',1);

  END IF;
  COMMIT; 
END;
/

--修改内容:操作序列表tb_genertor(考核计算序列)
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM tb_generator WHERE gen_name='CMS_CHECK_DTL_ID';
  IF VN_COUNT < 1 THEN
  INSERT INTO tb_generator(ID,gen_name,gen_value) VALUES((SELECT MAX(ID) FROM 

tb_generator)+1 ,'CMS_CHECK_DTL_ID',1);

  END IF;
  COMMIT; 
END;
/

--修改内容:查看现有系统是否有CMS_CHECK_RATE
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_RATE';
  IF VN_COUNT < 1 THEN
  VC_STR := 'create table CMS_CHECK_RATE(
  CORP_ID    NUMBER(10) not null,
  CHECK_RATE NUMBER(8,6) not null,
     constraint PK_CMS_CHECK_RATE primary key (CORP_ID))';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/

--修改内容:查看现有系统是否有CMS_CHECK_RULE
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_RULE';
  IF VN_COUNT < 1 THEN
  VC_STR := 'create table CMS_CHECK_RULE(
  ID            NUMBER(10) not null,
  OUT_CORP_ID   VARCHAR2(100) not null,
  IN_CORP_ID    VARCHAR2(100) not null,
  OUT_RULE_CODE VARCHAR2(100),
  OUT_RULE_SQL  VARCHAR2(200),
  OUT_RULE_NAME VARCHAR2(200),
  IN_RULE_CODE  VARCHAR2(100),
  IN_RULE_SQL   VARCHAR2(200),
  IN_RULE_NAME  VARCHAR2(200),
  constraint PK_CMS_CHECK_RULE primary key (ID)
  )';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/


--修改内容:查看现有系统是否有CMS_CHECK_DTL
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_DTL';
  IF VN_COUNT < 1 THEN
  VC_STR := 'create table CMS_CHECK_DTL(
  ID          NUMBER(10) not null,
  BILL_CODE   VARCHAR2(20) not null,
  CHECK_DATE  DATE not null,
  OUT_CORP_ID NUMBER(10) not null,
  IN_CORP_ID  NUMBER(10) not null,
  MONEY       NUMBER(15,2) not null,
  RATE        NUMBER(8,6),
  CHECK_RATE  NUMBER(8,6),
  OUT_INCOME  NUMBER(15,2) not null,
  IN_INCOME   NUMBER(15,2) not null,
  PRS_CODE    VARCHAR2(20) not null,
  constraint PK_CMS_CHECK_DTL primary key (ID)
  )';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/

--修改内容:查看现有系统是否有CMS_CHECK_COLLECT
--修改人:吴结兵
--修改时间:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_COLLECT';
  IF VN_COUNT < 1 THEN
   VC_STR := 'create table CMS_CHECK_COLLECT
(
  ID              NUMBER(10) not null,
  BILL_CODE       VARCHAR2(20) not null,
  CHECK_DATE      DATE not null,
  OUT_CORP_ID     NUMBER(10) not null,
  INCREASE_INCOME NUMBER(15,2) not null,
  DECREASE_INCOME NUMBER(15,2) not null,
          constraint PK_CMS_CHECK_COLLECT primary key (ID)
  )';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/


--考核计算视图
create or replace view v_cms_check_dtl_temp as
select c1.corp_name as out_corp_name,
       c2.corp_name as in_corp_name,
       b.precative_id,  --贷出单位ID 3
       b.loan_opp, --贷入单位代码  5
       a.money, --贷款金额
       a.rate, --贷款利率
       a.term,--期限
       c.check_rate, --考核利率,
		a.bill_code,--委贷发方编号
        (select out_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type') from CMS_CHECK_RULE where OUT_RULE_SQL is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp)) out_rule, --贷出规则
       (select in_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type')  from CMS_CHECK_RULE where IN_RULE_SQL is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp))  in_rule,  --贷入规则
       a.send_date,
       a.deadline_date
  from cms_precative_loan_send a, cms_precative_loan_info b,cms_check_rate c,bt_corp c1,bt_corp c2
 where a.father_code = b.bill_code
   and c.corp_id=b.precative_id
   and b.precative_id=c1.id
   and b.loan_opp = c2.id
/   
alter table cms_check_rate modify check_rate number(9,6);
