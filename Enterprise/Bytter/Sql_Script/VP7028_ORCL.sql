-- 修改日期：2012-11-06
-- 修改人：费滔
-- 修改原因：VP7028 预算科目一级科目的结束时间修改
-- 修改内容：预算科目一级科目的结束时间修改

update FBS_ITEM set  END_VALID_DATE=to_date('2022-12-31','yyyy-MM-dd')  Where Levels=1;
commit;
