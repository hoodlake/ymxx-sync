
-- �޸����ڣ�20130227
-- �޸��ˣ�������
--�޸����ݣ��޸��ֶγ���

alter table bis_exc modify payer_city varchar2(30);
alter table fc_counter_exc modify payer_city varchar2(30);
alter table bis_exc_input modify payer_city varchar2(30);
alter table bis_exc modify payee_city varchar2(30);
alter table fc_counter_exc modify payee_city varchar2(30);
alter table bis_exc_input modify payee_city varchar2(30);
