--�޸��� ���
--�޸�ʱ�� 2012-08-06
--�޸����� ����yph_ab_receive���Ʊ��Ӧ�ղ˵�
--�޸�ԭ�� һƷ��жһ�Ʊ����
create table yph_ab_receive
(
       state varchar(4000),--��������
       dept_code varchar(240),--��Ʊ��λ/��Ʊ����
       code varchar(150),--Ʊ�ݺ���
       money number(15,2),--Ʊ����
       issue_date varchar(10),--��Ʊ����
       maturity_date varchar(10),--��Ʊ����
       acceptor varchar(720),--������/���������ƣ��ж��ˣ�
       payer varchar(150),--��Ʊ��
       pre_hand varchar(360),--ǰ��
       receiver varchar(4000),--�տ���ȫ�ƣ����֣�
       enter_date varchar(10),--��Ʊ����
       poundage number(15,2),--������
       ball varchar(150),--��֤��
       resume varchar(2000),--ժҪ
       oper_date varchar(4000),--��������
       bank_acc varchar(100),--����/�����˻�
       bank_acc_num varchar(30),--����/�����˺�
       bank varchar(720),--����/���ֿ�����
       xie_meeting varchar(1),--�Ƿ���
       create_date varchar(19),--��������
       last_update_date varchar(19),--���һ�θ�������
       primary key(code,state)
);

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), 'Ʊ��Ӧ��', 'exchange', RES_CODE, '/dataExchange/yphAbReceiveAction.do?method=queryList', '0', '0', '0', '0', 1, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '���ݹ���';


alter table ab_emit add Data_source char(3);
alter table ab_emit add Update_date date;
