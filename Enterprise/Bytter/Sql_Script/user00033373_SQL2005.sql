--�޸���:��³�
--�޸�ʱ��:2012-10-11
create trigger TRI_LOANSEND_status
    ON cms_loan_deferred
    FOR UPDATE 
--------------------------------------------------------
-- SYSTEM:  �����ʽ����ϵͳ
-- SUBSYS:  �Ŵ�ģ��
-- DESCRIPTION: ������չ��csȷ��֮����Ĵ���ű��״̬
-- AUTHOR:  lidecheng
-- CREATE DATE:  20111011
-- EDIT HISTORY:
-- 20101029 HUANGCH ����˵��
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