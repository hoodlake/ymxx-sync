--�޸��� ���
--�޸�ʱ�� 2012-11-27
--�޸����� �����ʽ��������ͬ������ѯ�赥�ͽ�����

create table ERP_FUND_RECTIFY
(
  ID            int not null,
  CUSTOMER_CODE VARCHAR(100),
  CUSTOMER_NAME VARCHAR(100),
  CORP_CODE     VARCHAR(100),
  AMT           decimal(15,2),
  COM_CODE      VARCHAR(100),
  BANK_CODE     VARCHAR(100),
  BANK_ACC      VARCHAR(100),
  BUDAT         datetime,
  BYTTER_CORP_CODE VARCHAR(100)
);


declare 
@exist_num  decimal(2) ;
begin 
select @exist_num = count(*)  from  bt_sys_res where res_name = '�ʽ��������ͬ������ѯ' and sys_code = 'nis'  ; 
if(@exist_num < 1) 
begin  
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code)+1 from bt_sys_res ), '�ʽ��������ͬ������ѯ', 'nis', (select res_code from bt_sys_res  where res_name = '�տ�' and sys_code = 'nis' and father_code='0'), '/dataExchange/capitalRectifyDataSynAction.do?method=initData', '0', '1', '0', '0', 4, '�ʽ��������ͬ������ѯ', '', '', '', '', '', null, null, null, null, null, 2, '' 
commit 
end 
end 

go

