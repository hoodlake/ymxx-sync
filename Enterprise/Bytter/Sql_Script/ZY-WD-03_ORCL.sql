--�޸����ڣ�2012.11.15
--�޸��ˣ�����
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����(ZY-WD-03-01)
--�Ƿ����а���
alter table cms_precative_loan_info add is_bank char(1) default '0';
--ί�����뵥��
alter table cms_precative_loan_info add app_code varchar2(20);
--���д���
alter table cms_precative_loan_info add bank_code char(4);
--������ͬ����
alter table cms_precative_loan_info add gua_hypothec_code varchar2(50);
--���ʽ
alter table cms_precative_loan_info add repay_type varchar2(30);
--��Ϣ��ʽ
alter table cms_precative_loan_info add interest_way varchar2(15);
--����ŷ�ʽ
alter table cms_precative_loan_info add loan_send_out_type varchar2(1);
--��������Ź���
alter table cms_precative_loan_info add skip_loan_send_out varchar2(1);
--������ʽ
alter table cms_precative_loan_info add float_way varchar2(15);
--���ʵ�����Ч����
alter table cms_precative_loan_info add rate_entries_effect_date date;
--��������
alter table cms_precative_loan_info add reference_rate_type varchar2(50);
--��������
alter table cms_precative_loan_info add repay_cycle varchar2(50);
--����ѡ����������
alter table cms_precative_loan_info add points_proportion_select varchar2(50);
--�����ά�������ͬ�涨�ĵ��������
alter table cms_precative_loan_info add points_proportion_text varchar2(50);

commit;