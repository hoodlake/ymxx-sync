--�޸����ڣ�2012.12.07
--�޸��ˣ��ܱ�
--�޸����ݣ��Զ��������
--�޸�ԭ��������Ҫ
--���ӱ��ֶ�

update bt_param  set reverse1='0,��;1,��(�������ֹ����ɵ����);2,��(�����ֹ����ɵ����)'   where code ='autoBuildHisBal' and sys_code = 'adm' and name = '�Զ����������˻���ʷ���';
go

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BIS_ACC_HIS_BAL') AND NAME='ISAUTOMATICBAL')  
ALTER TABLE BIS_ACC_HIS_BAL ADD ISAUTOMATICBAL char(1); 
GO


IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('Bis_Acc_His_Dtl') AND NAME='ISAUTOMATICDTL')  
ALTER TABLE Bis_Acc_His_Dtl ADD ISAUTOMATICDTL char(1); 
GO



declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '���������˻���ʷ���' and sys_code = 'bankacc';
if (@VN_COUNT = 0 ) 
begin  
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select ( select max(res_code)+1 from bt_sys_res ) , '���������˻���ʷ���', 'bankacc', ( select min(res_code) from bt_sys_res r where r.res_name = '¼�����' and r.sys_code = 'bankacc'  ), '/bankacc/automaticBal.jsp', '0', '1', '0', '0', 10, ' ', '', '', '', '', '', null, null, null, null, null, 2, '' ;

end;
end;

go 

update Bis_Acc_His_Dtl set ISAUTOMATICDTL='1';

go

--����������������bif_code
update bis_acc_his_bal set bis_acc_his_bal.bif_code = (select b.bif_code from bt_bank b where b.bank_code = bis_acc_his_bal.bif_code )

where bis_acc_his_bal.bif_code  in (select aa.bif_code from bis_acc_his_bal aa , bt_bank ab where aa.bif_code = ab.bank_code );

go
