-- 修改日期：2012.09.18
-- 修改人：费滔
-- 修改原因：新增客户需求，中烟
-- 修改内容：增加退款勾兑

insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE, 
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE, 
   LINK_TARGET,
   STATUS, 
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '退款勾兑',
         'nis',
         res_code,
         '/netbank/allCorpPreviewList.jsp',
         '0',
         '1',
         '0',
         '0',
         7,
         '退款勾兑',
         '',
         '',
         '',
         '',
         '',
         null,
         null,
         null,
         null,
         null,
         3
    from bt_sys_res
   where res_name = '收款'
     and sys_code = 'nis' 
     and res_level = '1';
    
 
alter table bis_acc_his_dtl add blend CHAR(1) default '0'; 
comment on column bt_net_chalk.blend is '是否勾兑标识';


alter table nis_billhead add blend CHAR(1)  default '0';
comment on column nis_billhead.blend is '是否勾兑标识';

alter table bis_acc_his_dtl add blend_info VARCHAR(200); 
comment on column bt_net_chalk.blend_info is '退款勾兑原因';

alter table nis_billhead add blend_info VARCHAR(200); 
comment on column nis_billhead.blend_info is '退款勾兑原因';
commit;


