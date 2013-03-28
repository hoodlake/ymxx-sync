--修改日期：2012-11-20
--修改人：周兵
--修改内容：中海船录入余额完成标识,增加账户明细截止时间维护菜单。
--修改原因：ZY-ZH-02,在账户余额表中增加字段isComplete判断所在日期是否已经完成余额的生成,添加此字段后把以前的数据的isComplete值设置为1，1为完成。


IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE ID=OBJECT_ID('BIS_ACC_HIS_BAL') AND NAME='ISCOMPLETE')  
ALTER TABLE BIS_ACC_HIS_BAL ADD ISCOMPLETE char(1); 
GO

--update bis_acc_his_bal set isComplete='1'
--GO
 

declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '账户明细截止时间维护' and sys_code = 'bankacc';
if (@VN_COUNT = 0 ) 
begin  
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select ( select max(res_code)+1 from bt_sys_res ) , '账户明细截止时间维护', 'bankacc', ( select min(res_code) from bt_sys_res r where r.res_name = '录入明细' and r.sys_code = 'bankacc'  ), '/bankacc/SelectBankAccEnd.jsp', '0', '1', '0', '0', 4, ' ', '', '', '', '', '', null, null, null, null, null, 2, '' ;

end;
end;

go 



declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_param where code = 'isAccManImpAbs' and sys_code = 'fcs' and (name = '是否账户管理导入明细摘要' or name='账户管理导入明细摘要是否必填');
if (@VN_COUNT = 0 ) 
begin  
insert into bt_param  (code,sys_code,name,param_value1,param_value2,param_value3,param_type,rmk,reverse1,reverse2,reverse3,reverse4,reverse5,reverse6,reverse7,reverse8,reverse9,reverse10)
	  values('isAccManImpAbs','fcs','是否账户管理导入明细摘要','0',null,null,0,'账户管理导入明细摘要是否必填.1是;0否','1,是;0,否;',null,null,null,null,1.00,48.00,null,null,null);
end;
end;

go 


update bt_param  set name='账户管理导入明细摘要是否必填' where code = 'isAccManImpAbs' and sys_code = 'fcs' and name = '是否账户管理导入明细摘要';
update bt_sys_res set RES_URL='/bankacc/bankAccEndList.do?method=getBankAccEndList' WHERE res_name = '账户明细截止时间维护' and sys_code = 'bankacc' and res_level = 2;
go 
