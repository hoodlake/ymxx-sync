--�޸����ڣ�2012-11-21
--�޸��ˣ�¬����
--�޸����ݣ���Ӵ�����������Ӧ�ֶκͲ˵�
--�޸�ԭ��ZY-CK-01

--��ӹ�������Ϣ�����ֶ�
--��ƹ�������Ϣ�����������ʡ��ֶ�
alter table FC_FINANCING_BILLINFO add INTEREST_RATE NUMBER(8,6);
--��ƹ�������Ϣ�����������š��ֶ�
alter table FC_FINANCING_BILLINFO add BILL_CODE VARCHAR2(20);
--��ƹ�������Ϣ�����������ʡ��ֶΣ���¼���õ������ʣ�
alter table FC_FINANCING_BILLINFO add BL_INTEREST_RATE NUMBER(8,6);
--��ƹ�������Ϣ���������Ƿ�¼���ֶΣ�0����(Ĭ��)  1���ǣ�
alter table FC_FINANCING_BILLINFO add IS_BL char(1) default 0 ;
--��ƹ�������Ϣ����������Ϣ���ֶΣ���¼���õ������ʣ�
alter table FC_FINANCING_BILLINFO add BL_INTEREST NUMBER(14,2);

--���ע��
comment on column FC_FINANCING_BILLINFO.INTEREST_RATE is
'����';
comment on column FC_FINANCING_BILLINFO.BILL_CODE is
'����';
comment on column FC_FINANCING_BILLINFO.BL_INTEREST_RATE is
'��¼����';
comment on column FC_FINANCING_BILLINFO.IS_BL is
'�Ƿ�¼ 0,��Ĭ�ϣ� 1,��';
comment on column FC_FINANCING_BILLINFO.BL_INTEREST is
'��¼��Ϣ';
comment on column FC_FINANCING_BILLINFO.STATUS is
'״̬';
comment on column FC_FINANCING_BILLINFO.BUS_TYPE is
'ҵ������';


--�����˵�����ҳ >> ��ƹ���>> ������� >> ����ת���ڲ�¼
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '����ת���ڲ�¼', 'cho', (select RES_CODE from bt_sys_res where sys_code = 'cho' and RES_NAME = '������ƹ���'), '/chowmatistic/bankBillInfo.do?method=makeupBillInfo'||chr(38)||'busType=10', '0', '1', '0', '0', 0, '����ת���ڲ�¼', '', '', '', '', '', null, null, null, null, null, 2, '');

--�����˵�����ҳ >> ��ƹ���>> ������� >> ����ת֪ͨ��¼
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '����ת֪ͨ��¼', 'cho', (select RES_CODE from bt_sys_res where sys_code = 'cho' and RES_NAME = '������ƹ���'), '/chowmatistic/bankBillInfo.do?method=makeupBillInfo'||chr(38)||'busType=12', '0', '1', '0', '0', 2, '����ת֪ͨ��¼', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;