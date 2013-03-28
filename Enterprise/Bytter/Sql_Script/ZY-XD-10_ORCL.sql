--修改内容:在委托贷款发放表增加字段
--修改人:张均锋
--修改时间:2012-12-10
alter table CMS_PRECATIVE_LOAN_SEND add DEFERRED_REPAY_DATE DATE;
comment on column CMS_PRECATIVE_LOAN_SEND.DEFERRED_REPAY_DATE is '展期后还款日期';

--修改内容:新增委托贷款展期申请表CMS_PRE_DEFERRED
--修改人:黄茜
--修改时间:2012-12-6
create table CMS_PRE_DEFERRED  (
   BILL_CODE            CHAR(13)                        not null,
   PLI_CODE             CHAR(13),
   CORP_ID              NUMBER(10),
   ENTER_DATE           DATE,
   MATURE_DATE          DATE,
   DEFERRED_LIMT        NUMBER,
   ACC_CODE             CHAR(16),
   DEFERRED_REPAY_DATE  DATE,
   EXPIRY_ACT_TYPE      VARCHAR2(10),
   DEFERRED_RATE        NUMBER(8,6),
   CONTRACT_CODE        VARCHAR2(50),
   FINANCING_PLAN_ID    VARCHAR2(100),
   RMK                  VARCHAR2(100),
   NEXT_CHECKER         VARCHAR2(150),
   APPROVES             VARCHAR2(200),
   STATUS               NUMBER,
   REPAIR_OP            VARCHAR2(8),
   OP                   VARCHAR2(8),
   REVERSE1             VARCHAR2(300),
   REVERSE2             VARCHAR2(300),
   REVERSE3             VARCHAR2(300),
   REVERSE4             VARCHAR2(300),
   REVERSE5             VARCHAR2(300),
   REVERSE6             NUMBER(15,2),
   REVERSE7             NUMBER(15,2),
   REVERSE8             NUMBER(15,2),
   REVERSE9             NUMBER(15,2),
   REVERSE10            NUMBER(15,2),
   constraint PK_CMS_PRE_DEFERRED primary key (BILL_CODE)
);
comment on table CMS_PRE_DEFERRED is '委托贷款展期申请表';
comment on column CMS_PRE_DEFERRED.BILL_CODE is '委托贷款展期申请流水号';
comment on column CMS_PRE_DEFERRED.PLI_CODE is '原始委托贷款流水号';
comment on column CMS_PRE_DEFERRED.CORP_ID is '单位ID';
comment on column CMS_PRE_DEFERRED.ENTER_DATE is '录入日期';
comment on column CMS_PRE_DEFERRED.MATURE_DATE is '委托贷款到期日';
comment on column CMS_PRE_DEFERRED.DEFERRED_LIMT is '展期期限';
comment on column CMS_PRE_DEFERRED.ACC_CODE is '结算中心贷款账号';
comment on column CMS_PRE_DEFERRED.DEFERRED_REPAY_DATE is '展期后还款日期';
comment on column CMS_PRE_DEFERRED.EXPIRY_ACT_TYPE is '两种：贷款展期、借新还旧';
comment on column CMS_PRE_DEFERRED.DEFERRED_RATE is '展期利率';
comment on column CMS_PRE_DEFERRED.CONTRACT_CODE is '展期合同号';
comment on column CMS_PRE_DEFERRED.FINANCING_PLAN_ID is '融资计划编号';
comment on column CMS_PRE_DEFERRED.RMK is '备注';
comment on column CMS_PRE_DEFERRED.NEXT_CHECKER is '下个审批人';
comment on column CMS_PRE_DEFERRED.APPROVES is '已审批人';
comment on column CMS_PRE_DEFERRED.STATUS is '状态';
comment on column CMS_PRE_DEFERRED.REPAIR_OP is '补录员';
comment on column CMS_PRE_DEFERRED.OP is '操作员';

--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期申请
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期申请' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期申请', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=apply', '0', '1', '0', '0', 10, '委托贷款展期申请', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期修改
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期修改' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期修改', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=edit', '0', '1', '0', '0', 11, '委托贷款展期修改', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期打回
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期打回' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期打回', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=reEdit', '0', '1', '0', '0', 12, '委托贷款展期打回', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期补录
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期补录' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期补录', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=correct', '0', '1', '0', '0', 13, '委托贷款展期补录', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--修改内容:审批业务  cms_C4 委托贷款展期
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_approve_business where business_code='cms_D4';
  IF VN_COUNT < 1 THEN
    insert into bt_approve_business (business_code,sys_code,business_name,business_level,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	select 'cms_D4','cms','委托贷款展期','A,B,C','CMS_PRE_DEFERRED','money','next_checker','bill_code','../cms/cmsPreDeferred_audit.jsp','com.byttersoft.cms.form.CmsPreDeferredForm'
	from dual;
  END IF;
  COMMIT; 
END;
/

--修改内容:委托贷款发放信息查看视图
--修改人:黄茜
--修改时间:2012-12-7
create or replace view v_cms_pre_loan_send_info as
select send.BILL_CODE            send_BILL_CODE,        --发放编号（主键）
       info.BILL_CODE            info_bill_code,        --委托贷款录入单号
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --委托人单位Id
       info.CURRENCY             info_CURRENCY,         --币别代码
       info.TERM                 info_TERM,             --贷款期限
       info.MONEY                info_MONEY,            --贷款金额
       info.ENTER_DATE           info_ENTER_DATE,       --贷款录入日期
       info.hypothec_code        info_hypothec_code,    --担保方式代码
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --发放编号（输入）
       send.MONEY                send_MONEY,            --发放金额
       send.SEND_DATE            send_SEND_DATE,        --发放日期
       send.STATUS               send_STATUS,           --发放状态
       cur.cur_name,                                    --币别名称
       temp.USEDMONEY,                                  --已发放金额
       corp.corp_name precative_corp_name,              --委托人名称
       typ.type_name                                    --担保方式名称
  from cms_precative_loan_send send
  left join cms_precative_loan_info info on  info.bill_code = send.father_code
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code = info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code;
/
 
--修改内容:新增委托贷款展期申请视图
--修改人:张均锋
--修改时间:2012-12-7
create or replace view V_PRECATIVE_LOAN_SEND_DEFERRED as
select * from (
      select app.BILL_CODE            app_bill_code,        --委托贷款录入单号
             app.PRECATIVE_ID         app_PRECATIVE_ID,     --委托人单位Id
             app.CORP_ID              app_CORP_ID,          --受托人单位id
             app.Loan_Opp             app_loan_Opp,         --借款人单位id（贷款对象）
             app.CURRENCY             app_CURRENCY,         --币别代码
             app.TERM                 app_TERM,             --贷款期限
             app.MONEY                app_MONEY,            --贷款金额
             app.ENTER_DATE           app_ENTER_DATE,       --贷款录入日期
             app.hypothec_code        app_hypothec_code,    --担保方式代码
             typ.type_name            app_hypothec_Name,    --担保方式名称
             send.corp_id             corp_id,         --单位
             send.BILL_CODE           BILL_CODE,       --发放编号（主键）
             send.CONTRACT_CODE       CONTRACT_CODE,   --发放编号（输入）
             send.MONEY               MONEY,           --发放金额
             send.SEND_DATE           SEND_DATE,       --发放日期
             send.STATUS              STATUS,          --发放状态
             send.DEADLINE_DATE       DEADLINE_DATE,    --到期日期
             send.ENTER_DATE,                            --录入日期
             send.term,                                  --期限
             nvl(repay.repay_money,0) repay_money        --已还金额
        from cms_precative_loan_send send
        --最多同时只能有一个发放记录在业务中
        join cms_precative_loan_info app on app.bill_code = send.father_code
        left join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=app.hypothec_code
        left join (select lr.pl_code, sum(lr.money) repay_money
                    from CMS_PRECATIVE_LOAN_REPAY lr where lr.status >= 102
                   group by lr.pl_code) repay on send.Bill_Code = repay.pl_code 
        where send.status in(102,103) --已记账
              and not exists (select plr.bill_code from CMS_PRECATIVE_LOAN_REPAY plr where plr.pl_code=send.bill_code and plr.status>=0 and plr.status<102) --不在还款中
              --展期还需要显示，不过虑
              --and not exists (select pd.bill_code from CMS_PRE_DEFERRED pd where send.bill_code=pd.pli_code and (pd.status > -2 and pd.status < 102)) --不在展期中
        ) sd
        --放款还没还完
        where sd.money > sd.repay_money; 
/
