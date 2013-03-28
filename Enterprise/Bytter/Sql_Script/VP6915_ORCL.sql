-- 修改日期：20121210
-- 修改人：梁铭利
--修改内容：放款分成短期和中长期

declare 
 max_id_cs20121210 number;
 begin
    select count(*) into max_id_cs20121210 from fc_subject_sort where SYS_SUBJECT_CODE='1038';
    if max_id_cs20121210=0 then

        insert into fc_subject_sort (SYS_SUBJECT_CODE, SYS_SUBJECT_NAME, IF_UNIQUE, RMK)
        values ('1038', '应收利息-中长期放款', '1', '资产类');

        insert into fc_subject_sort (SYS_SUBJECT_CODE, SYS_SUBJECT_NAME, IF_UNIQUE, RMK)
        values ('5015', '利息收入-中长期放款', '1', '损益类');
        commit;
    end if;
end;
/