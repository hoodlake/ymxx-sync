-- Add/modify columns 
alter table CMS_PL_DEFERRED add expiry_handle_type varchar(5);

-- Add/modify columns 
alter table CMS_PL_DEFERRED add financ_plans varchar(100);


declare
@VN_COUNT decimal

begin 
select @VN_COUNT = count(*) from bt_param where CODE = 'is_financing';
if (@VN_COUNT = 0 ) 
begin  
   insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
      select 'is_financing', 'cms', '展期是否挂融资计划', '0', null, null, '0', 'VALUE = 0，否，VALUE = 1，是', '0,否;1,是', null, null, null, null, 1.00, null, null, null, null
end;
end;

go 
