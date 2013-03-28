--修改日期：2012.12.7
--修改人：李程
--修改内容：本脚本将系统原有的国际结算用途代码为空值的数据更新为系统默认的自增长的用途代码。
--修改原因：user00035913广州建筑-信贷管理用途维护问题。

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