

--ָ������ָ����Դ�ֶ�
-- Add/modify columns 
alter table BIS_EXC add VOUCHER_FROM number(2,0);
-- Add comments to the columns 
comment on column BIS_EXC.VOUCHER_FROM
  is '1���������²�
2��������ͷ�����
3���������ϻ�
4�����������
5�������Ը���
6�������Թ�̨�ֹ�����';


-- Add/modify columns 
--��Ӵ��״̬�ֶ�
alter table NIS_BILLHEAD add REFUSE_STATUS number;
--���ָ���״̬�ֶ�
alter table NIS_BILLHEAD add VOUCHER_STAT char(1);
-- Add comments to the columns 
comment on column NIS_BILLHEAD.REFUSE_STATUS
  is '1-���˴��
2-�������
3-ָ����';
comment on column NIS_BILLHEAD.VOUCHER_STAT
  is '���ֶ�Ϊ����ָ��״̬
���׳ɹ�  0
�ȴ����  1
���д���ʧ��  2
׼������ 3
�����ѽ��� 4
�ո������ݲ�ȫ 5
�ȴ��������� 6
ָ����Ч 7
�Ѵ�ӡ֧Ʊ 8
�ӿڴ���ʧ�� 9
����ͨ�� p
������ w
�������  R
��¼��� B';