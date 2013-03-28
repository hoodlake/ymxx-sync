--修改日期：2013-02-21
--修改人：费滔
--修改内容：代发工资离线操作
--修改原因：VP7682
declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '代发工资离线处理' and sys_code = 'nis'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '代发工资离线处理', 'nis', (select res_code from bt_sys_res  where res_name = '代发工资' and sys_code = 'nis' ), '/netbank/allWageOnLineList.jsp', '0', '1', '0', '0', 7, '代发工资离线处理', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
commit;

alter  table nis_wage add is_Online char(1) default '0';
comment on column  nis_wage.is_Online is '是否离线操作，1是，0不是，2已操作';


commit;