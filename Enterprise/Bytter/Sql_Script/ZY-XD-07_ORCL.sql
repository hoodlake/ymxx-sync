--�޸����ڣ�2012.12.05
--�޸��ˣ�����
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����(����Ѻ��Ǽǽű��޸�)
--��������
alter table GUA_MORTGAGE_INFO add (AREA_CORP_NAME varchar2(50));
--������������
alter table GUA_MORTGAGE_INFO add (coorperation_bank_name varchar2(100));
--���н�ɫ
alter table GUA_MORTGAGE_INFO add (bank_role varchar2(100));
--�Ƿ�ռ����������
alter table GUA_MORTGAGE_INFO add (occupy_bank_credit char(1));
--ҵ���������--ʡ
alter table GUA_MORTGAGE_INFO add (province varchar2(50));
--ҵ���������--��
alter table GUA_MORTGAGE_INFO add (city varchar2(50));
--�ȼ�
alter table GUA_MORTGAGE_INFO add (level_code varchar2(50));
--���
alter table GUA_MORTGAGE_INFO add (specification varchar2(100));
--��Ѻ����ֵ��ͻ�ʵ��ռ�õ����Ŷ�ȱ�����ϵ
alter table GUA_MORTGAGE_INFO add (occupy_credit_relation varchar2(50));
--��Ѻ��ܺ�ͬ�пͻ�������Լ�������Ŷ���ܶ�
alter table GUA_MORTGAGE_INFO add (occupy_credit_money number(9,2));
--�ͻ���ռ�õ��������Ŷ�Ȱٷֱ�
alter table GUA_MORTGAGE_INFO add (occupy_credit_proportion number(8,6));
--���Ѽ���
alter table GUA_MORTGAGE_INFO add (alert_level char(1));



comment on column GUA_MORTGAGE_INFO.COORPERATION_BANK_NAME
  is '������������';
comment on column GUA_MORTGAGE_INFO.BANK_ROLE
  is '���н�ɫ';
comment on column GUA_MORTGAGE_INFO.OCCUPY_BANK_CREDIT
  is '�Ƿ�ռ����������:1���ǣ�0����';
comment on column GUA_MORTGAGE_INFO.PROVINCE
  is 'ҵ���������--ʡ';
comment on column GUA_MORTGAGE_INFO.CITY
  is 'ҵ���������--��';
comment on column GUA_MORTGAGE_INFO.SPECIFICATION
  is '���';
comment on column GUA_MORTGAGE_INFO.OCCUPY_CREDIT_RELATION
  is '��Ѻ����ֵ��ͻ�ʵ��ռ�õ����Ŷ�ȱ�����ϵ';
comment on column GUA_MORTGAGE_INFO.OCCUPY_CREDIT_MONEY
  is '��Ѻ��ܺ�ͬ�пͻ�������Լ�������Ŷ���ܶ�';
comment on column GUA_MORTGAGE_INFO.OCCUPY_CREDIT_PROPORTION
  is '�ͻ���ռ�õ��������Ŷ�Ȱٷֱ�';
comment on column GUA_MORTGAGE_INFO.ALERT_LEVEL
  is '���Ѽ���1��һ�㣻2������';
comment on column GUA_MORTGAGE_INFO.LEVEL_CODE
  is '�ȼ�';
comment on column GUA_MORTGAGE_INFO.AREA_CORP_NAME
  is '��������';

/