--修改日期：20121228
--修改人：高枫
--修改内容：是否启用借贷关联
--参数设置：
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='brrowProvide_Like' AND SYS_CODE='cms';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_PARAM (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_TYPE, RMK, REVERSE1, REVERSE6,REVERSE7) 
   VALUES ('brrowProvide_Like', 'cms', '启用借贷关联', '0', '0', 'VALUE = 0，否，VALUE = 1，是', '0,否;1,是', 1,
   (select max(b.reverse7)+1 from bt_param b where b.sys_code = 'cms'));
  COMMIT;
 END IF; 
END;
/

------- add Column 向借款发放表中插入借款发放记录中插入占用汇总金额字段
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_PROVIDE_LOAN_SEND' AND COLUMN_NAME = 'OCCUPYMONEY';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE cms_provide_loan_send ADD occupyMoney NUMBER(15,2) default 0.00';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--创建借贷关联表
DECLARE
  tb NUMBER;
BEGIN
  SELECT COUNT(*) INTO tb FROM tabs WHERE table_name = 'CMS_PROVIDE_LINK';
  IF tb <> 0 THEN
    EXECUTE IMMEDIATE 'drop table CMS_PROVIDE_LINK';
    EXECUTE IMMEDIATE 'create table CMS_PROVIDE_LINK(
                          id                       VARCHAR2(50) PRIMARY KEY,
                          bill_code                VARCHAR2(13) not null,  --借款编码
                          father_code              VARCHAR2(13),           --借款编码父账号
                          acc_code                 VARCHAR2(50),           --借款账号
                          lastmoney2               NUMBER(15,2),           --剩余金额
                          send_date                DATE,                   --借款开始日
                          deadline_date            DATE,                   --借款结束日
                          float_way                VARCHAR2(15),           --浮动方式
                          REFERENCE_RATE_TYPE      VARCHAR2(50),           --基准利率类型         
                          REPAY_CYCLE              VARCHAR2(50),           --贷款周期
                          POINTS_PROPORTION_TEXT   NUMBER(15,2),            --浮动比列
                          occupyMoney              NUMBER(15,2),           --占用金额
                          releaseMoney             NUMBER(15,2),           --释放金额
                          RATE_ENTRIES_EFFECT_DATE DATE,                   --利率调整生效日
                          PL_RATE                  NUMBER(8,6),             --利率
                          occupyStart_date         DATE,  --占用开始日期
                          occupyEnd_date           DATE,  --占用结束日期
                          status                   NUMBER,         --操作状态

                          lbill_code VARCHAR2(13) not null, --贷款编号
                          lfather_code VARCHAR2(13), --贷款编码父账号
                          lacc_code  VARCHAR2(50), --贷款账号
                          sendMoney NUMBER(15,2),  --本次发放金额
                          LOAN_SEND_OUT_DATE  DATE,--贷款开始日期
                          repay_date DATE          --贷款结束日期
                       )';
  ELSE
    EXECUTE IMMEDIATE 'create table CMS_PROVIDE_LINK(
                          id                       VARCHAR2(50) PRIMARY KEY,
                          bill_code                VARCHAR2(13) not null,  --借款编码
						  father_code              VARCHAR2(13),           --借款编码父账号
                          acc_code                 VARCHAR2(50),           --借款账号
                          lastmoney2               NUMBER(15,2),           --剩余金额
                          send_date                DATE,                   --借款开始日
                          deadline_date            DATE,                   --借款结束日
                          float_way                VARCHAR2(15),           --浮动方式
                          REFERENCE_RATE_TYPE      VARCHAR2(50),           --基准利率类型         
                          REPAY_CYCLE              VARCHAR2(50),           --贷款周期
                          POINTS_PROPORTION_TEXT   NUMBER(15,2),            --浮动比列
                          occupyMoney              NUMBER(15,2),           --占用金额
                          releaseMoney             NUMBER(15,2),           --释放金额
                          RATE_ENTRIES_EFFECT_DATE DATE,                   --利率调整生效日
                          PL_RATE                  NUMBER(8,6),             --利率
                          occupyStart_date         DATE,  --占用开始日期
                          occupyEnd_date           DATE,  --占用结束日期
                          status                   NUMBER,         --操作状态

                          lbill_code VARCHAR2(13) not null， --贷款编号
                          lfather_code VARCHAR2(13), --贷款编码父账号
                          lacc_code  VARCHAR2(50), --贷款账号
                          sendMoney NUMBER(15,2),  --本次发放金额
                          LOAN_SEND_OUT_DATE  DATE,--贷款开始日期
                          repay_date DATE          --贷款结束日期
                       )';
  END IF;
END;
/

--创建补录页面的借贷关联
CREATE OR REPLACE VIEW v_cms_provide_link as
select p2.bill_code,             --借款编号
               p2.contract_code, --借款合同编号
               p2.acc_code,
               p2.father_code,   --借款发放记录对应的父编号
               psmoney,          --本次借款发放金额
               bankname,         --银行
               (psmoney - lastMoney - occupymoney1) as lastmoney2, --剩余金额
               p2.send_date,                        --发放日期
               p2.deadline_date,                    --结束日期
               CASE p2.float_way                    --浮动方式
                    WHEN '01' THEN '固定利率'
                    WHEN '02' THEN '即时浮动'
                    WHEN '03' THEN '按月浮动'
                    WHEN '04' THEN '按季浮动'
                    WHEN '05' THEN '按半年浮动' 
                    WHEN '06' THEN '按年浮动'
                    end 
                    as float_way,
               --p2.float_way,
               (select t.basetypename from tb_base_rate t where t.base_rate_id = p2.reference_rate_type) as reference_rate_type, --基准利率类型
               (select tt.periodname from tb_credit_period tt where tt.credit_period_id = p2.repay_cycle) as repay_cycle,        --贷款周期
               p2.points_proportion_text,   --浮动比列
               p2.rate_entries_effect_date, --利率调整生效日
               p2.pl_rate,                   --利率
               p2.corp_id,
               p2.cur_code
          from (select ps.money as psmoney,
                       (select NVL(SUM(pr.repay_money), 0)
                          from cms_provide_loan_repay pr
                         where ps.bill_code = pr.send_code
                           and pr.status > = 11) as lastMoney,
                       NVL(ps.occupymoney,0) as occupymoney1,
                       ps.*,
                       (select bank_name from (select info.bill_code, b.bank_name
                        from cms_provide_loan_info info, bt_bank b
                         where info.bank_code = b.bank_code) where bill_code = ps.father_code) as bankname
                  from cms_provide_loan_send ps
                 where (ps.status >= 102 and ps.status < 110)) p2;

-------- add column 向贷款表中插入借款表的id
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_LOAN_INFO' AND COLUMN_NAME = 'PLOADCODE';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE cms_loan_info ADD PloadCode varchar2(13)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

 ------- add Column 借贷关联表中插入币别
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_PROVIDE_LINK' AND COLUMN_NAME = 'CUR_CODE';
  IF VN_COUNT < 1 THEN 
    VC_STR := ' ALTER TABLE CMS_PROVIDE_LINK ADD CUR_CODE CHAR(2)'; 
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

 --- add Column 向贷款发放表中插入币别
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS  
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'CUR_CODE';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE loan_send_out_info ADD CUR_CODE CHAR(2)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

 --- add Column 向贷款发放表中插入关联的借款发放记录code
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'PLOADCODE';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE loan_send_out_info ADD PLOADCODE varchar2(13)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

 ------- add Column 借贷关联表中插入单位id
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_PROVIDE_LINK' AND COLUMN_NAME = 'CORP_ID';
  IF VN_COUNT < 1 THEN 
    VC_STR := ' ALTER TABLE CMS_PROVIDE_LINK ADD CORP_ID NUMBER(10)'; 
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--修改人：高枫
--修改内容：系统功能-兼容待合同生成的历史借款数据（借贷关联）
--修改内容：系统菜单 兼容待合同生成的历史借款数据（借贷关联）
--参数设置：
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='借贷关联兼容历史数据' AND t1.father_code=t2.res_code AND t2.res_name='贷款管理';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, 
   REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '借贷关联兼容历史数据', 'cms', RES_CODE, '/cms/LoanSendOutHisLinkList.jsp', '0', '1', '0', '0', 
   (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), 
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '贷款管理' AND T3.SYS_CODE = 'cms';
  END IF;
  COMMIT; 
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS  
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'CLB_AGREEMENT_RATE';
  IF VN_COUNT > 0 THEN
    VC_STR := 'update loan_send_out_info info set info.clb_agreement_rate = 0.000000 where info.clb_agreement_rate is null';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS  
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'CLB_FIXED_RATE';
  IF VN_COUNT > 0 THEN
    VC_STR := 'update loan_send_out_info info set info.clb_fixed_rate = 0.000000 where info.clb_fixed_rate is null';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

commit;


