--�޸��ˣ��ｭ��
--�޸����ڣ�2012-09-14
--�޸�����: ���������ʺţ������У��к�
--�޸�ԭ��:����_AKS-JD03-07
-- BANK_ACC:�����ʺţ�BANK_NAME:�����У�BANK_CODE:�к�
alter table ab_emit add(
      BANK_ACC VARCHAR2(30),
      BANK_NAME VARCHAR2(140),
      BANK_CODE CHAR(4)
   );