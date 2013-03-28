--修改人:李德成
--修改时间:2012-10-11
create or replace trigger TRI_LOANSEND_status
    after UPDATE
    ON cms_loan_deferred
    FOR EACH ROW
--------------------------------------------------------
-- SYSTEM:  拜特资金管理系统
-- SUBSYS:  信贷模块
-- DESCRIPTION: 当贷款展期cs确认之后更改贷款发放表的状态
-- AUTHOR:  lidecheng
-- CREATE DATE:  20111011
-- EDIT HISTORY:
-- 20101029 HUANGCH 功能说明
--------------------------------------------------------
declare
  -- local variables here
begin
  if :new.status =102 then
     update loan_send_out_info 
        set status = 104 
      where bill_code = :new.li_code;
  end if;
  
end TRI_LOANSEND_status ;
/