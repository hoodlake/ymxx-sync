--�޸����ڣ�2012.12.5
--�޸��ˣ����
--�޸����ݣ���;������Ϊ���Ŵ�������������ϵͳ��ʽ��Ҳ������ά�������ű���ϵͳԭ�е���;����Ϊ���Ŵ����������ݸ���ΪϵͳĬ�ϵ�����������;���롣
--�޸�ԭ��user00035746���ݽ���-�Ŵ�������;ά�����⡣

DECLARE
  VN_COUNT     NUMBER;
BEGIN
select COUNT(*) 
  INTO VN_COUNT
  from cms_pl_purpose 
 where purpose_code = '�Ŵ�����';
IF VN_COUNT > 0 THEN
  LOOP
      Exit When(VN_COUNT=0);
      update cms_pl_purpose set purpose_code = (select gen_value from tb_generator where gen_name='BT_PURPOSE_ID') 
      where id = (select min(id) from cms_pl_purpose where purpose_code = '�Ŵ�����');
      update tb_generator set gen_value=(
           select gen_value+1 from tb_generator where gen_name='BT_PURPOSE_ID'
       ) where gen_name='BT_PURPOSE_ID';
      VN_COUNT:=VN_COUNT-1;
  END LOOP;
END IF;
END;
/
COMMIT;