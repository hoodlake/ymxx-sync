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
                 where (ps.status >= 97 and ps.status < 110)) p2;

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

