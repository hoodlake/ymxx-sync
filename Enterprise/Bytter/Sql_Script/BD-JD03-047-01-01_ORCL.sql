-- �޸����ڣ�2012.10.17
-- �޸��ˣ�����
-- �޸�ԭ�������ͻ���������
-- �޸����ݣ������˿��

alter table bis_acc_his_dtl add blend CHAR(1) default '0'; 
comment on column bis_acc_his_dtl.blend is '�Ƿ񹴶ұ�ʶ';

 
alter table bis_acc_his_dtl add blend_info VARCHAR(200);  
comment on column bis_acc_his_dtl.blend_info is '�˿��ԭ��'; 
