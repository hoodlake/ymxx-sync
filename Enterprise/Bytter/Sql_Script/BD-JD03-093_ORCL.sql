

-- �޸����ڣ�2012-10-26
-- �޸��ˣ����¾�
-- �޸�ԭ������Զ�ɨ������趨�˵�
-- �޸����ݣ�����Զ�ɨ������趨�˵�

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '�Զ�ɨ������趨', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='����ά��' and s2.sys_code = 'fwg' ), '/fundwarning/strategyAction.do?method=getWarningScan', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, '');


commit ;

-- �޸����ڣ�2012-10-31
-- �޸��ˣ����¾�
-- �޸�ԭ���޸��Զ�ɨ������趨�˵�,ɨ������Ե�λΪ��׼
-- �޸����ݣ��޸��Զ�ɨ������趨�˵�,ɨ������Ե�λΪ��׼
alter table bt_warning_scan add corp_code varchar2(4); 

update bt_sys_res r set r.res_url = '/fundwarning/btWarningScan_corp.jsp' where r.res_name = '�Զ�ɨ������趨' and r.sys_code =  'fwg';

delete from tb_generator g where g.gen_name = 'BT_WARNING_SCAN_ID'; 

insert into tb_generator (id,gen_name,gen_value)
values ((select max(id)+1 from tb_generator ),'BT_WARNING_SCAN_ID', (select max(id)+1 from bt_warning_scan) );


commit;

