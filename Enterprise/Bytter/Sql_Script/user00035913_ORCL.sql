--�޸����ڣ�2012.12.7
--�޸��ˣ����
--�޸����ݣ����ű���ϵͳԭ�еĹ��ʽ�����;����Ϊ��ֵ�����ݸ���ΪϵͳĬ�ϵ�����������;���롣
--�޸�ԭ��user00035913���ݽ���-�Ŵ�������;ά�����⡣

DECLARE
  LC_COUNT     NUMBER;
BEGIN
select COUNT(*) 
  INTO LC_COUNT
  from lc_purpose 
 where purpose_code is null;
IF LC_COUNT > 0 THEN
  LOOP
      Exit When(LC_COUNT=0);
      update LC_purpose set purpose_code = (select gen_value from tb_generator where gen_name='BT_PURPOSE_ID') 
      where id = (select min(id) from lc_purpose where purpose_code is null);
      update tb_generator set gen_value=(
           select gen_value+1 from tb_generator where gen_name='BT_PURPOSE_ID'
       ) where gen_name='BT_PURPOSE_ID';
      LC_COUNT:=LC_COUNT-1;
  END LOOP;
END IF;
END;
/
COMMIT;