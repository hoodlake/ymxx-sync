--修改人：胡双
--修改时间：2012-12-19
--修改内容：增加字段
ALTER TABLE bis_acc_his_dtl ADD TRANS_TYPE VARCHAR2(10);
ALTER TABLE bis_acc_his_dtl ADD TRANS_STATUS CHAR(1);
ALTER TABLE bis_acc_his_dtl ADD RETURN_MSG VARCHAR2(100);

COMMENT ON COLUMN bis_acc_his_dtl.TRANS_TYPE IS '传输方式：SAP/OMS/NC';
COMMENT ON COLUMN bis_acc_his_dtl.TRANS_STATUS IS '传输状态：0成功，1失败';
COMMENT ON COLUMN bis_acc_his_dtl.RETURN_MSG IS '返回信息';

ALTER TABLE bis_acc_his_dtl_mergen ADD TRANS_TYPE VARCHAR2(10);
ALTER TABLE bis_acc_his_dtl_mergen ADD TRANS_STATUS CHAR(1);
ALTER TABLE bis_acc_his_dtl_mergen ADD RETURN_MSG VARCHAR2(100);

COMMENT ON COLUMN bis_acc_his_dtl_mergen.TRANS_TYPE IS '传输方式：SAP/OMS/NC';
COMMENT ON COLUMN bis_acc_his_dtl_mergen.TRANS_STATUS IS '传输状态：0成功，1失败';
COMMENT ON COLUMN bis_acc_his_dtl_mergen.RETURN_MSG IS '返回信息';

ALTER TABLE bis_acc_his_dtl_split ADD TRANS_TYPE VARCHAR2(10);
ALTER TABLE bis_acc_his_dtl_split ADD TRANS_STATUS CHAR(1);
ALTER TABLE bis_acc_his_dtl_split ADD RETURN_MSG VARCHAR2(100);

COMMENT ON COLUMN bis_acc_his_dtl_split.TRANS_TYPE IS '传输方式：SAP/OMS/NC';
COMMENT ON COLUMN bis_acc_his_dtl_split.TRANS_STATUS IS '传输状态：0成功，1失败';
COMMENT ON COLUMN bis_acc_his_dtl_split.RETURN_MSG IS '返回信息';

ALTER TABLE ab_operation ADD TRANS_TYPE VARCHAR2(10);
ALTER TABLE ab_operation ADD TRANS_STATUS CHAR(1);
ALTER TABLE ab_operation ADD RETURN_MSG VARCHAR2(100);

COMMENT ON COLUMN ab_operation.TRANS_TYPE IS '传输方式：SAP/OMS/NC';
COMMENT ON COLUMN ab_operation.TRANS_STATUS IS '传输状态：0成功，1失败';
COMMENT ON COLUMN ab_operation.RETURN_MSG IS '返回信息';

--增加“发送次数”列
alter table ab_operation add send_frequency number default 0;
alter table BIS_ACC_HIS_DTL_SPLIT add send_frequency number default 0;
alter table bis_acc_his_dtl_mergen add send_frequency number default 0;
alter table bis_acc_his_dtl add send_frequency number default 0;

COMMENT ON COLUMN ab_operation.send_frequency IS '发送次数';
COMMENT ON COLUMN BIS_ACC_HIS_DTL_SPLIT.send_frequency IS '发送次数';
COMMENT ON COLUMN bis_acc_his_dtl_mergen.send_frequency IS '发送次数';
COMMENT ON COLUMN bis_acc_his_dtl.send_frequency IS '发送次数';

--增加ERP凭证号
alter table BIS_ACC_HIS_DTL add ERP_VOUCHER_NO VARCHAR2(30);
alter table AB_OPERATION add ERP_VOUCHER_NO VARCHAR2(30);

comment on column BIS_ACC_HIS_DTL.ERP_VOUCHER_NO is 'erp凭证号';
comment on column AB_OPERATION.ERP_VOUCHER_NO is 'erp凭证号';

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
       dtl.unique_confirm unique_confirm,
       dtl.Trans_Status,            --传输状态：0成功，1失败
       dtl.Trans_Type,              --传输类型：SAP/OMS/NC
       dtl.Return_Msg,              --返回消息，传输成功时，返回消息可以为空
       dtl.send_frequency           --发送次数
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
       dtl.unique_confirm unique_confirm,
       dtl.Trans_Status,            --传输状态：0成功，1失败
       dtl.Trans_Type,              --传输类型：SAP/OMS/NC
       dtl.Return_Msg,              --返回消息，传输成功时，返回消息可以为空
       dtl.send_frequency           --发送次数
  from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code =  dtl.budget_code
   ,bt_bankacc_app app, bt_corp corp,bt_currency currency
  where dtl.bank_acc = app.BANKACC
     AND
    app.CORP_CODE = corp.corp_code
    AND
    app.cur = currency.cur_code;

create or replace view view_bis_acc_his_dtl_s_m_o as
select to_char(split.id) id,
       split.serial_id serial_id,
       split.nz_status nz_stauts,  --流转状态
       split.trans_time trans_time,      --交易日期
       split.corp_id  corp_id,                --单位Id
       split.corp_name corp_name,       --单位名称
       split.acc_name acc_name,          --收款人
       split.bank_acc bank_acc,          --收款账号
       split.bank_name bank_name,        --收款开户行
       split.cur_code cur_code,          --币别编码
       split.cur cur,          --币别名称
       split.amt amt,                    --金额
       split.opp_acc_no opp_acc_no,      --付款账号
       split.opp_acc_name opp_acc_name,  --付款账户名称
       split.opp_acc_bank opp_acc_bank,  --付款开户行
       split.abs abs,                    --用途
       split.cd_sign cd_sign,            --收支属性
       split.budget_code budget_code,--匹配预算科目
       split.budget_name budget_name, --匹配预算名称
       split.subject_code subject_code,--匹配企业科目
       split.subject_name subject_name, --匹配企业科目
       split.business_type,              --业务类型
       split.cost_center_code,              --成本中心
       split.postscript,              --用途
       split.data_sources_code,                       --数据来源
       split.SUPER_SUBJECT_CODE,       --上级会计科目
       split.is_bl is_bl,             --是否勾兑  0 不是   1 是
       split.vendor_num vendor_num,
       '2' as IS_SPLIT_MERGN_ONE,
       split.Trans_Status,            --传输状态：0成功，1失败
       split.Trans_Type,              --传输类型：SAP/OMS/NC
       split.Return_Msg,              --返回消息，传输成功时，返回消息可以为空
       split.send_frequency           --发送次数
  from bis_acc_his_dtl_split split
union all
select to_char(mergen.id) id,
       '' as serial_id,
       mergen.nz_status nz_stauts,  --流转状态
       mergen.trans_time trans_time,      --交易日期
       mergen.corp_id  corp_id,                --单位Id
       mergen.corp_name corp_name,       --单位名称
       mergen.acc_name acc_name,          --收款人
       mergen.bank_acc bank_acc,          --收款账号
       mergen.bank_name bank_name,        --收款开户行
       mergen.cur_code cur_code,          --币别编码
       mergen.cur cur,          --币别
       mergen.amt amt,                    --金额
       mergen.opp_acc_no opp_acc_no,      --付款账号
       mergen.opp_acc_name opp_acc_name,  --付款账户名称
       mergen.opp_acc_bank opp_acc_bank,  --付款开户行
       mergen.abs abs,                    --用途
       mergen.cd_sign cd_sign,            --收支属性
       mergen.budget_code budget_code,--匹配预算科目
       mergen.budget_name budget_name, --匹配预算名称
       mergen.subject_code subject_code,--匹配企业科目
       mergen.subject_name subject_name, --匹配企业科目
       mergen.business_type,              --业务类型
       mergen.cost_center_code,              --成本中心
       mergen.postscript,              --用途
       mergen.data_sources_code,                       --数据来源
       mergen.SUPER_SUBJECT_CODE,
       '' as is_bl,
       mergen.vendor_num vendor_num,
       '3' as IS_SPLIT_MERGN_ONE,
       mergen.Trans_Status,            --传输状态：0成功，1失败
       mergen.Trans_Type,              --传输类型：SAP/OMS/NC
       mergen.Return_Msg,              --返回消息，传输成功时，返回消息可以为空
       mergen.send_frequency           --发送次数
  from bis_acc_his_dtl_mergen mergen
  union all
select one.serial_id id,
       one.serial_id serial_id,
       one.nz_stauts nz_stauts,  --流转状态
       one.trans_time trans_time,      --交易日期
       to_char(one.corp_id)  corp_id,                --单位Id
       one.corp_name corp_name,       --单位名称
       one.acc_name acc_name,          --收款人
       one.bank_acc bank_acc,          --收款账号
       one.bank_name bank_name,        --收款开户行
       one.cur_code cur_code,          --币别编码
       one.cur cur,          --币别
       one.amt amt,                    --金额
       one.opp_acc_no opp_acc_no,      --付款账号
       one.opp_acc_name opp_acc_name,  --付款账户名称
       one.opp_acc_bank opp_acc_bank,  --付款开户行
       one.abs abs,                    --用途
       one.cd_sign cd_sign,            --收支属性
       one.budget_code budget_code,--匹配预算科目
       one.budget_name budget_name, --匹配预算名称
       one.subject_code subject_code,--匹配企业科目
       one.subject_name subject_name, --匹配企业科目
       one.business_type,              --业务类型
       one.cost_center_code,              --成本中心
       one.postscript,              --用途
       one.data_sources_code,                       --数据来源
       one.SUPER_SUBJECT_CODE,
       one.is_blend is_bl,
       one.vendor_num vendor_num,
       '4' as IS_SPLIT_MERGN_ONE,
       one.Trans_Status,            --传输状态：0成功，1失败
       one.Trans_Type,              --传输类型：SAP/OMS/NC
       one.Return_Msg,              --返回消息，传输成功时，返回消息可以为空
       one.send_frequency           --发送次数
  from view_bis_acc_his_dtl_buget one
  where one.bill_status = '0'
  and ('0' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis'))
      or ('1' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis') and unique_confirm='1');


