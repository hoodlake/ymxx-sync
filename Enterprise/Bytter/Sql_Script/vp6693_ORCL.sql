--�޸����ڣ�20121025
--�޸��ˣ���̺�
--�޸����ݣ��½�������;��
--�������ã�
create table bt_used_pay_account (
       user_code     varchar2(20)  ,--�����û�
       corp_id       NUMBER(10)  ,    --��λID
       pay_type      VARCHAR2(2) ,    --���ʽ
       payer_acc     VARCHAR2(30),    --�����˺�     
       CONSTRAINT   PK_bt_used_pay_account  PRIMARY   KEY   (user_code,corp_id,pay_type)  -- ����
);
comment on table bt_used_pay_account is
'�������и���Ĭ���˺ű�';
commit;






