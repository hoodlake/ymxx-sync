-- �޸����ڣ�20120904
-- �޸��ˣ�������
--�޸����ݣ��л����̲���˾CS�Զ��²�ʱУ���ϵ�Ľ�����

ALTER TABLE BT_BANK_ACC ADD APPROP_COUNTER_ACC VARCHAR2(50);

--�޸���:���¾�
--�޸�ʱ��:2012-09-10
--�޸�����:�Զ��²��Ƿ��ж��ڲ��˺����
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('autodownall_validate', 'nis', '�Զ��²��Ƿ��ж��ڲ��˺����','0', null, null, null, '', '0,��;1,��', '�Զ��²��Ƿ��ж��ڲ��˺����', '', '', '', 1.00,33.00, null, null, null);

commit;



