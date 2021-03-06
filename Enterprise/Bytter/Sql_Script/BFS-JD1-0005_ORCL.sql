--修改日期：2012-12-18
--修改人：卢燕南
--修改内容：手机短信开启相关菜单
--修改原因：BFS-JD1-0005

--新增菜单：首页 >> 基础平台 >> 手机短信平台基础数据维护
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '手机短信平台基础数据维护', 'adm', 0, '', '0', '1', '0', '0', 1, '手机短信平台基础数据维护', '', '', '', '', '', null, null, null, null, null, 1, '');

--新增菜单：首页 >> 基础平台 >> 手机短信平台基础数据维护>> 开启短信
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '开启短信', 'adm', (select RES_CODE from bt_sys_res where sys_code = 'adm' and RES_NAME = '手机短信平台基础数据维护'), '/admin/mesOpenAction.do?method=queryMesOpen', '0', '1', '0', '0', 10, '开启短信', '', '', '', '', '', null, null, null, null, null, 2, '');


--修改日期：2012-12-19
--修改人：卢燕南
--修改内容：添加短信开启信息表
--修改原因：BFS-JD1-0005
create table BT_MESSAGE_OPEN  (
   ID                   NUMBER                          not null,
   USER_CODE            CHAR(4),
   USER_NAME            VARCHAR2(80),
   PHONE_NUMBER         VARCHAR2(20),
   IS_ENABLE            NUMBER(2),
   OPEN_DATE            DATE,
   OPEN_TYPE            VARCHAR2(32),
   OPEN_NAME            VARCHAR2(64),
   NOTICE_CONTENT       VARCHAR2(512),
   NOTICE_TYPE          VARCHAR2(64),
   TARGET_BUSINESS      VARCHAR2(512),
   constraint PK_BT_MESSAGE_OPEN primary key (ID)
);

comment on table BT_MESSAGE_OPEN is
'短信开启信息表';

commit;