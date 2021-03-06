--修改人:李德成
--修改时间:2012-10-11
create trigger TRI_LOANSEND_status
    ON cms_loan_deferred
    FOR UPDATE 
--------------------------------------------------------
-- SYSTEM:  拜特资金管理系统
-- SUBSYS:  信贷模块
-- DESCRIPTION: 当贷款展期cs确认之后更改贷款发放表的状态
-- AUTHOR:  lidecheng
-- CREATE DATE:  20111011
-- EDIT HISTORY:
-- 20101029 HUANGCH 功能说明
--------------------------------------------------------
as
  -- local variables here
begin
	DECLARE @status int
    DECLARE @li_code VARCHAR(20)
  SELECT @status=status,@li_code=li_code FROM INSERTED
  if @status =102 
  BEGIN
     update loan_send_out_info 
        set status = 104 
      where bill_code = @li_code;
  end
end 