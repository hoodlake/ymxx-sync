
--  新增参数：票据质押是否关联抵质押物  
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('BIRIM','ads','票据质押是否关联抵质押物管理',0,0,'0 不关联;1 关联','0,不关联;1,关联',1)
go 
--库存票据增加抵质押物编号 
ALTER TABLE ab_receive ADD MORPLE_CODE VARCHAR(50) 
go 
--自开票据表增加抵质押物编号和担保方式编号
ALTER TABLE ab_emit ADD  MORPLE_CODE VARCHAR(50) 
go 

ALTER TABLE ab_emit ADD  GUA_TYPE VARCHAR(2) 

go 