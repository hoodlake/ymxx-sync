-- �޸����ڣ�2012-11-06
-- �޸��ˣ�����
-- �޸�ԭ��VP7028 Ԥ���Ŀһ����Ŀ�Ľ���ʱ���޸�
-- �޸����ݣ�Ԥ���Ŀһ����Ŀ�Ľ���ʱ���޸�

update FBS_ITEM set  END_VALID_DATE=to_date('2022-12-31','yyyy-MM-dd')  Where Levels=1;
commit;
