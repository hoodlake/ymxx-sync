-- Add/modify columns 
alter table CMS_PL_DEFERRED add expiry_handle_type varchar2(5);

-- Add/modify columns 
alter table CMS_PL_DEFERRED add financ_plans varchar2(100);


DECLARE
  V_COUNT NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_param
    WHERE CODE = 'is_financing';
    IF V_COUNT = 0 THEN
      insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('is_financing', 'cms', 'չ���Ƿ�����ʼƻ�', '0', null, null, '0', 'VALUE = 0����VALUE = 1����', '0,��;1,��', null, null, null, null, 1.00, null, null, null, null);
    END IF;
END;
/