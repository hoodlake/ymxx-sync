--�޸�ʱ��2012-12-05
--�޸��� ���販
--�޸�����  ����֤�Ǽ�  ���� ʵ�����͵��ֶΣ��Լ�ϵͳ����

--����֤�ǼǱ�������ʵ�����͡��ֶ�
alter table lc_enrol add PRACTICE_TYPE varchar2(30);
--����֤�ǼǱ�������ʵ����λ���ֶ�
alter table lc_enrol add PAYMENT_CORP varchar2(200);
--����֤�ǼǱ��������ͻ��ѿ�Ʊ���ֶ�
alter table lc_enrol add REMIT NUMBER(18,2);
--����֤�ǼǱ��������ͻ�Ӧ����ֶ�
alter table lc_enrol add REPAYMENT NUMBER(18,2);
--����֤�ǼǱ��������Ӽ������ֶ�
alter table lc_enrol add INCREASE_PROFIT NUMBER(18,2);
--����֤�ǼǱ���������ȡ����ѡ��ֶ�
alter table lc_enrol add SERVICE_CHARGE NUMBER(18,2);



DECLARE
VN_COUNT   number(10,2);
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
   WHERE sys_code='lcs' and code='practice_type';
   IF VN_COUNT = 0 THEN
   insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
   values ('practice_type','lcs','ʵ������',null,null,null,0,'ʵ������','˵�������ʵ��������Ӣ�ķֺŷָ�',null,null,null,null,0,10,null,null,null);
   commit;
 END IF;
END;
/
