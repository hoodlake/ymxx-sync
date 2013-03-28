--修改时间2012-12-14
--修改人 杨茂球
--修改内容  外部融资台账查询

-- Create table

CREATE OR REPLACE VW_CMS_OUT_FINANC
AS
   SELECT b.corp_code,                                           
          b.corp_name,                                               
          b.net_code,                                              
          a.financ_type,                                         
          a.bank_type,                                             
          c.type_name,                                          
          a.deal_bank,                                           
          d.bank_name,                                             
          a.bill_code,                                              
          a.warrant_type,                                          
          a.warrant_category,                                        
          a.warrant_money,                                           
          a.status,           
		  CASE a.statusn WHEN 110 THEN 4 ELSE -1 END	as clean,                        
          a.fa_type_datestart,                                     
          a.fa_type_dateend,                                      
          a.project_rmk,                                             
          a.fa_type_code,                                            
          a.fa_type_money,                                             
          a.cur_code,                                                 
          a.corp_id,                                               
          F.CORP_NAME as warrant_name, 
          h.cur_name 
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