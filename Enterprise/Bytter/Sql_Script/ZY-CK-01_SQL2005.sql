--�޸����ڣ�2012-11-21
--�޸��ˣ�¬����
--�޸����ݣ���ӹ�������Ϣ�����ֶ�
--�޸�ԭ��ZY-CK-01


--��ƹ�������Ϣ�����������ʡ��ֶ�
alter table FC_FINANCING_BILLINFO add INTEREST_RATE numeric(8,6);
--��ƹ�������Ϣ�����������š��ֶ�
alter table FC_FINANCING_BILLINFO add BILL_CODE VARCHAR(20);
--��ƹ�������Ϣ�����������ʡ��ֶΣ���¼���õ������ʣ�
alter table FC_FINANCING_BILLINFO add BL_INTEREST_RATE numeric(8,6);
--��ƹ�������Ϣ���������Ƿ�¼���ֶΣ�0����(Ĭ��)  1���ǣ�
alter table FC_FINANCING_BILLINFO add IS_BL CHAR(1) default 0 ;
--��ƹ�������Ϣ����������Ϣ���ֶΣ���¼���õ������ʣ�
alter table FC_FINANCING_BILLINFO add BL_INTEREST numeric(14,2);


--�����˵�����ҳ >> ��ƹ���>> ������� >> ����ת���ڲ�¼
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '����ת���ڲ�¼', 'cho', RES_CODE, '/chowmatistic/bankBillInfo.do?method=makeupBillInfo&busType=10', '0', '1', '0', '0', 0, '����ת���ڲ�¼', '', '', '', '', '', null, null, null, null, null, 2, '' from bt_sys_res where sys_code = 'cho' and RES_NAME = '������ƹ���';

--�����˵�����ҳ >> ��ƹ���>> ������� >> ����ת֪ͨ��¼
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '����ת֪ͨ��¼', 'cho', RES_CODE, '/chowmatistic/bankBillInfo.do?method=makeupBillInfo&busType=12', '0', '1', '0', '0', 2, '����ת֪ͨ��¼', '', '', '', '', '', null, null, null, null, null, 2, '' from bt_sys_res where sys_code = 'cho' and RES_NAME = '������ƹ���';

go
