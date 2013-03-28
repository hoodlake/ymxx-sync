--修改时间2012-12-14
--修改人 杨茂球
--修改内容  外部融资台账查询

-- Create table
CREATE OR REPLACE view VW_CMS_OUT_FINANC
AS
   SELECT b.corp_code,                                               -- //公司代码
          b.corp_name,                                                --//公司名称
          b.net_code,                                               --//所属网点代码
          a.financ_type,                                             -- //融资类型
          a.bank_type,                                                --银行类别代码
          c.type_name,                                               -- 银行类别名称
          a.deal_bank,                                                --办理银行代码
          d.bank_name,                                               --办理银行名称,
          a.bill_code,                                                  --申请编码
          a.warrant_type,                                               --担保类别
          a.warrant_category,                                           --担保方式
          a.warrant_money,                                            --申请担保金额
          a.status,                                                       --状态
          DECODE (a.status, 110, 1, -1) clean,                             --核销
          a.fa_type_datestart,                                        --//开始日期
          a.fa_type_dateend,                                            --到期日期
          a.project_rmk,                                                --项目内容
          a.fa_type_code,                                               --单据编码
          a.fa_type_money,                                                --金额
          a.cur_code,                                                     --币别
          a.corp_id,                                                    -- 公司ID
          F.CORP_NAME as warrant_name, --担保单位
          h.cur_name -- 币别名
     FROM cms_out_financ a,
          bt_corp b,
          bt_bank_type c,
          bt_bank d,
          bt_corp f,
          bt_currency h
    WHERE     a.corp_id = b.id
          AND a.bank_Type = c.bank_type
          AND a.deal_Bank = d.BANK_CODE
          and b.net_code = F.CORP_CODE
          and a.cur_code = h.cur_code 
          AND a.APPLY_FA_TYPE = 1;