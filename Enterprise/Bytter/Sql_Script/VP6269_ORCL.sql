--�޸���:���¾�
--�޸�ʱ��:2012-08-17
--�޸�����:�ʽ�����Ƿ����ʽ��²�������ָ�� Ĭ�ϲ����ɸ���ָ��
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('allocation_createbisexc', 'fcs', '�Ƿ����ʽ��²�������ָ��','0', null, null, null, '�ʽ�������ɸ���ָ�����ɲ����������²�,��ͷ�������������', '1,��;0,��', '', '', '', '', 1.00,32.00, null, null, null);
---�޸��ʽ��������
---add by puyj 2012-09-03 16:35:57
update bt_param p set p.sys_code = 'nis',
p.reverse1 = '0,��;1,�ȼ��˺󸶿�;2,�ȸ�������',
p.param_value1 = (
  select case p2.param_value1  when  '0' then '1'
                               when  '1' then '0'
         end 
  from bt_param p2  where p2.code = 'allocation_instructions'
)
where p.code = 'allocation_instructions';

delete from bt_param p where p.code = 'allocation_createbisexc' and p.sys_code = 'fcs';
commit;
