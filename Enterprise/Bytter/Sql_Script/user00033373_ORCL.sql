--�޸���:��³�
--�޸�ʱ��:2012-10-11
create or replace trigger TRI_LOANSEND_status
    after UPDATE
    ON cms_loan_deferred
    FOR EACH ROW
--------------------------------------------------------
-- SYSTEM:  �����ʽ����ϵͳ
-- SUBSYS:  �Ŵ�ģ��
-- DESCRIPTION: ������չ��csȷ��֮����Ĵ���ű��״̬
-- AUTHOR:  lidecheng
-- CREATE DATE:  20111011
-- EDIT HISTORY:
-- 20101029 HUANGCH ����˵��
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