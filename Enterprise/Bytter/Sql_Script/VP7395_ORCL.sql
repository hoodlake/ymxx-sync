create or replace view view_bis_acc_his_dtl_buget as
select dtl.serial_id serial_id,
        dtl.trans_time trans_time,      --交易日期
       corp.id corp_id,                --单位Id
       corp.corp_name corp_name,       --单位名称
       dtl.acc_name acc_name,        --收款人
       dtl.bank_acc bank_acc,          --收款账号
       dtl.bank_name bank_name,        --收款开户行
       currency.cur_name cur,          --币别
       currency.cur_code cur_code,
       dtl.amt amt,                    --金额
       dtl.opp_acc_no opp_acc_no,      --付款账号
       dtl.opp_acc_name opp_acc_name,  --付款账户名称
       dtl.opp_acc_bank opp_acc_bank,  --付款开户行
       dtl.abs abs,                    --用途
       dtl.cd_sign cd_sign,            --收支属性
        dtl.nz_stauts nz_stauts,  --流转状态
        dtl.bill_status,                  --单据状态
        dtl.subject_code,                 --匹配企业科目
        dtl.subject_name,                 --匹配企业科目
        dtl.business_type,                 --业务类型
        dtl.cost_center_code,                 --成本中心
        dtl.postscript,                       --用途
        dtl.data_sources_code,                --数据来源
        dtl.SUPER_SUBJECT_CODE,
        fi.name budget_code_name, --匹配预算名称
        dtl.budget_code budget_code_dtl,
        fi.name budget_name, --匹配预算名称
        dtl.budget_code budget_code,
        dtl.vendor_num vendor_num,--供应商编码
        dtl.is_blend is_blend,
        dtl.unique_confirm unique_confirm
  from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code =  dtl.budget_code
        ,v_acc_list acc, bt_corp corp,bt_currency currency
  where dtl.bank_acc = acc.BANK_ACC
     AND
    acc.CORP_CODE = corp.corp_code
    AND 
    acc.CUR = currency.cur_code
  UNION
    select dtl.serial_id serial_id,
        dtl.trans_time trans_time,      --交易日期
       corp.id corp_id,                --单位Id
       corp.corp_name corp_name,       --单位名称
       dtl.acc_name acc_name,        --收款人
       dtl.bank_acc bank_acc,          --收款账号
       dtl.bank_name bank_name,        --收款开户行
       currency.cur_name cur,          --币别
       currency.cur_code cur_code,
       dtl.amt amt,                    --金额
       dtl.opp_acc_no opp_acc_no,      --付款账号
       dtl.opp_acc_name opp_acc_name,  --付款账户名称
       dtl.opp_acc_bank opp_acc_bank,  --付款开户行
       dtl.abs abs,                    --用途
       dtl.cd_sign cd_sign,            --收支属性
        dtl.nz_stauts nz_stauts,  --流转状态
        dtl.bill_status,                  --单据状态
        dtl.subject_code,                 --匹配企业科目
        dtl.subject_name,                 --匹配企业科目
        dtl.business_type,                 --业务类型
        dtl.cost_center_code,                 --成本中心
        dtl.postscript,                       --用途
        dtl.data_sources_code,                --数据来源
        dtl.SUPER_SUBJECT_CODE,
        fi.name budget_code_name, --匹配预算名称
        dtl.budget_code budget_code_dtl,
        fi.name budget_name, --匹配预算名称
        dtl.budget_code budget_code,
        dtl.vendor_num vendor_num,--供应商编码
        dtl.is_blend is_blend,
        dtl.unique_confirm unique_confirm
  from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code =  dtl.budget_code
   ,bt_bankacc_app app, bt_corp corp,bt_currency currency 
  where dtl.bank_acc = app.BANKACC
     AND
    app.CORP_CODE = corp.corp_code
    AND
    app.cur = currency.cur_code
    ;
/