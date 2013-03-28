
--新增参数：票据质押是否关联抵质押物
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('BIRIM','ads','票据质押是否关联抵质押物管理',0,0,'0 不关联;1 关联','0,不关联;1,关联',1);
commit;

--库存票据增加“抵质押物编号”
ALTER TABLE ab_receive ADD  MORPLE_CODE VARCHAR2(50) ;

commit;

--自开票据表增加“抵质押物编号”和“担保方式编号”
ALTER TABLE ab_emit ADD MORPLE_CODE VARCHAR2(50) ;
  
commit; 

  
ALTER TABLE ab_emit ADD GUA_TYPE VARCHAR2(2) ;
  
commit; 
