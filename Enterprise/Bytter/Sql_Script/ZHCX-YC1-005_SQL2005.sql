--�޸����ڣ�2012.11.14
--�޸��ˣ��ܱ�
--�޸����ݣ��ʽ�ͷ��Ԥ�������ߣ�
--�޸�ԭ���ʽ�ͷ��Ԥ�������ߣ�

declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '�ʽ�ͷ��Ԥ�������ߣ�' and sys_code = 'fqs';
if (@VN_COUNT = 0 ) 
begin  
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select ( select max(res_code)+1 from bt_sys_res ) , '�ʽ�ͷ��Ԥ�������ߣ�', 'fqs', ( select min(res_code) from bt_sys_res r where r.res_name = '�ʽ�Ԥ��' and r.sys_code = 'fqs'  ), '/allocation/fundAllocation.do?method=toQueryReport', '0', '1', '0', '0', 1, ' ', '', '', '', '', '', null, null, null, null, null, 2, '' ;

end;
end;

go 