-- �޸����ڣ�2012.10.17
-- �޸��ˣ�����
-- �޸�ԭ�������ͻ���������
-- �޸����ݣ������˿��

alter table bis_acc_his_dtl add blend CHAR(1) default '0'; 
comment on column bt_net_chalk.blend is '�Ƿ񹴶ұ�ʶ';

 
alter table bis_acc_his_dtl add blend_info VARCHAR(200);  
comment on column bt_net_chalk.blend_info is '�˿��ԭ��'; 
