--�޸����ڣ�2013-02-27
--�޸��ˣ��ܱ�
--�޸����ݣ������˵�
--�޸�ԭ���л����̡���BD-JD04-109�վ�����

--�����˵����ҳ>>�ۺϲ�ѯϵͳ>>�ڲ��˺Ų�ѯ>>��Ŀ�˻��վ����

declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '��Ŀ�˻��վ����' and sys_code = 'fqs';
if (@VN_COUNT = 0 ) 
begin  
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select ( select max(res_code)+1 from bt_sys_res ) , '��Ŀ�˻��վ����', 'fqs', ( select min(res_code) from bt_sys_res r where r.res_name = '�ڲ��˺Ų�ѯ' and r.sys_code = 'fqs'  ), '/monitor/balance/query_avg.jsp', '0', '1', '0', '0', 3, ' ', '', '', '', '', '', null, null, null, null, null, 2, '' ;

end;
end;

go 

