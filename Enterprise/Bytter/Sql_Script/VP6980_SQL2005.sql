-- �޸����ڣ�2013-01-14
-- �޸��ˣ�����
--�޸����ݣ�VP6980 һƷ�� ���߸�������ת������
--���Ӳ˵� ���߸�������ת��
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '���߸�������ת��', 'exchange', RES_CODE, '/dataExchange/erpPayInfo.do?method=showDeliver&sys_flag=offLine', '0', '1', '0', '0', 1, '���߸�������ת��', '', '', '', '', '', null, null, null, null, null, 2, '' from bt_sys_res where sys_code = 'exchange' and RES_NAME = '���ݹ���' ;


--�������ݽ����Ƿ��������˺����ݲ���
insert into bt_param
       (CODE,
       SYS_CODE,
       NAME,
       PARAM_VALUE1,
       PARAM_VALUE2,
       PARAM_VALUE3,
       PARAM_TYPE,
       RMK,
       REVERSE1,
       REVERSE2,
       REVERSE3,
       REVERSE4,
       REVERSE5,
       REVERSE6,
       REVERSE7,
       REVERSE8,
       REVERSE9,
       REVERSE10) values (
       'dataProcessOffLine','nis','���ݽ����Ƿ��������˻�����','0',null,null,0,'���ݽ����Ƿ��������˻�����,Ĭ��0','0,������;1,����',null,null,null,null,1,null,null,null,null);

go
