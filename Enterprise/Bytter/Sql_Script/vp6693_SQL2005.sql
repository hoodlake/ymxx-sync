--修改日期：20121025
--修改人：祁继鸿
--修改内容：新建工资用途表
--参数设置：
create table bt_used_pay_account (
       user_code     varchar(20)  ,--操作用户
       corp_id       NUMERIC(10)  ,    --单位ID
       pay_type      VARCHAR(2) ,    --付款方式
       payer_acc     VARCHAR(30),    --付款账号     
       CONSTRAINT   PK_bt_used_pay_account  PRIMARY   KEY   (user_code,corp_id,pay_type)  -- 主键
);






