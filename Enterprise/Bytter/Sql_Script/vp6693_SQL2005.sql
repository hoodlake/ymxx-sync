--�޸����ڣ�20121025
--�޸��ˣ���̺�
--�޸����ݣ��½�������;��
--�������ã�
create table bt_used_pay_account (
       user_code     varchar(20)  ,--�����û�
       corp_id       NUMERIC(10)  ,    --��λID
       pay_type      VARCHAR(2) ,    --���ʽ
       payer_acc     VARCHAR(30),    --�����˺�     
       CONSTRAINT   PK_bt_used_pay_account  PRIMARY   KEY   (user_code,corp_id,pay_type)  -- ����
);






