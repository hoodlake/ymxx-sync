--�޸��� ���
--�޸�ʱ�� 2012-11-29
--�޸����� ����ERP����ʱ��
ALTER TABLE bis_exc ADD(erp_send_date varchar(300));
comment on column BIS_EXC.ERP_SEND_DATE
  is 'erp����ʱ��';

--�����û�����ϵͳ����
ALTER TABLE bt_user ADD(external_sys_pk varchar(100));
comment on column BT_USER.EXTERNAL_SYS_PK
  is '�ⲿϵͳ���������̶����ã�';

--�����˻�����ϵͳ����
ALTER TABLE bt_bank_acc ADD(external_sys_pk varchar(100));
comment on column bt_bank_acc.EXTERNAL_SYS_PK
  is '�ⲿϵͳ���������̶����ã�';

--������ʷ��ϸ��ϵͳ����
ALTER TABLE bis_acc_his_dtl ADD(external_sys_pk varchar(100));
comment on column bis_acc_his_dtl.EXTERNAL_SYS_PK
  is '�ⲿϵͳ���������̶����ã�';

  --������ʷ��ϸ���κ��ֶ�
  ALTER TABLE bis_acc_his_dtl add(batchId varchar(100));
  comment on column bis_acc_his_dtl.batchId
  is '���κţ����̶����ã�';

--���ӵ�����ϸ��ϵͳ����
ALTER TABLE bis_acc_dtl ADD(external_sys_pk varchar(100));
comment on column bis_acc_dtl.EXTERNAL_SYS_PK
  is '�ⲿϵͳ���������̶����ã�';

--����Ԥ���Ŀ��ϵͳ����
ALTER TABLE fbs_item ADD(external_sys_pk varchar(100));
comment on column fbs_item.EXTERNAL_SYS_PK
  is '�ⲿϵͳ���������̶����ã�';

--����Ԥ���ϵ��
create table fbs_relation
(
       external_sys_pk varchar(100) primary key,
       cw_id varchar(100),
       bt_id varchar(100)
);
comment on column FBS_RELATION.EXTERNAL_SYS_PK
  is 'ϵͳ���루��ϵͳ������';
comment on column FBS_RELATION.CW_ID
  is 'NCҵ��Ԥ��ָ��';
comment on column FBS_RELATION.BT_ID
  is '�ʽ����Ԥ��ָ��';





  --��ʼ����չ�ֶ����Ա�ĵ�λ��bt_user��չ�ֶΣ�reverse11
insert into BT_Ext_Field_Property (Id,ext_Table_Code,ext_Field_Code,component_Label,default_Value,ext_Type,ext_Values,is_Required,is_Readonly,view_Sort,is_Enabled)
values ((select gen_value+1 from tb_generator where gen_name='BT_EXT_FIELD_PROPERTY_ID'), 'BT_USER', 'external_sys_pk', '��ϵͳ����', null, '1', null, 1, 0, '01', 1);
--ͬ���������ӱ������ֵ
update tb_generator set gen_value= gen_value+1 where gen_name='BT_EXT_FIELD_PROPERTY_ID';
commit;


--�Ƿ�ʹ�ð�������ӿ� ��bt_bank_acc �� �ֶ��� Ϊ is_bankerp(0Ϊ������1Ϊ�߼��ϵͳ)
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='BT_BANK_ACC' AND COLUMN_NAME='IS_BANKERP';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table bt_bank_acc add is_bankerp varchar2(1) default 1';
  COMMIT;
 END IF; 
END;
/

--�����ʽ������Ҫ���͵����ϵͳ��������ͼ
create or replace view v_fjzh_bis_exc as
select
bis.voucher_no,--Ʊ�ݺ���(�ڲ�ת��ID)
bis.user_name,--������
bis.req_date,--�ڲ�ת������ʱ��(����ʱ��)
bis.amt,--�����ת�˽�
bis.corp_id,--������λ���
bis.payer_bank_name,--��������У�ת���У�
bis.payer_acc_no,--����˺�(ת���˻����˺�)
bis.payer_acc_name,--�������(ת���˻�����)
opp_bt.corp_code,--�շ���λ����(�տλ����)
bis.payee_bank,--�շ�������(ת����)
bis.payee_acc_no,--�շ��˺�(ת���˻����˺�)
bis.payee_name,--�շ�����(ת���˻�����)
bis.abs,--ժҪ(��;)
bis.postscript --����(��ע)
from bis_exc bis
inner join bt_bank_acc bt on bis.payer_acc_no= bt.bank_acc 
left join bt_bank_acc opp_bt on bis.payee_acc_no=opp_bt.bank_acc 
where  bis.voucher_stat='3' and bt.is_bankerp='1';

--�����������н�����ϸ��������Ҫ���͵����ϵͳ��������ͼ
create or replace view v_erp_bis_query_cmd_bankacc as
select 
bis.serial_id,
bis.bank_acc,
bis.bif_code,
bis.start_time,
bis.end_time
from bis_query_cmd bis,bt_bank_acc bt 
where bis.trans_id in('900020','900030') and bis.bank_acc=bt.bank_acc and bt.is_bankerp='1' and bis.finish_sign='3';

--�����˶��ѯ��Ҫ���͵����ϵͳ��������ͼ
create or replace view v_erp_bis_query_cmd_bal as
select 
bis.serial_id,
bis.trans_id,
bis.bank_acc,
bis.bif_code,
bis.start_time,
bis.end_time
from bis_query_cmd bis,bt_bank_acc bt 
where bis.trans_id in('900010','900040') and bis.bank_acc=bt.bank_acc and bt.is_bankerp='1' and bis.finish_sign='3';