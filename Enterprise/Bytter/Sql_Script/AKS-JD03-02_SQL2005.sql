--�޸����ڣ�20120908
--�޸��ˣ���̺�
--�޸����ݣ��жһ�Ʊ���������и���������������������
--�������ã������������гжһ�Ʊ���ʽ
insert into fc_voucher_type (VOUCHER_TYPE, VOUCHER_NAME, SYS_VOUCHER_CODE, CASH_TRANSFER_SIGN, RMK, VALID_SIGN, IS_ELECTRON_PAY)
values ('49', '�жһ�Ʊ', '49', 'T', '', '1', '1');
go

--�޸����ڣ�20120908
--�޸��ˣ���̺�
--�޸����ݣ��жһ�Ʊ���������и���������������������
--�������ã������������гжһ�Ʊ���ʽ
insert into bt_paytype (SYS_VOUCHER_CODE, SYS_VOUCHER_NAME, RMK, VALID_SIGN, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('49', '�жһ�Ʊ', '', '1', '', '', '', '', '', null, null, null, null, null);
go

--�޸����ڣ�20120908
--�޸��ˣ���̺�
--�޸����ݣ��жһ�Ʊ���������и���������������������
--�������ã������������гжһ�Ʊ���ʽ
insert into bt_payment_param (ID, VOUCHER_TYPE, ISACCOUNT)
select (select max(id)+1 from bt_payment_param), '49', '0';
go

--�޸����ڣ�20120915
--�޸��ˣ���̺�
--�޸����ݣ��жһ�Ʊ���������и���������������������
--�������ã������������и��Ʊ�ݺ����ֶ�
alter table nis_billhead add billNumber varchar(100);
go

