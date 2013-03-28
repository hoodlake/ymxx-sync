--修改日期：20120822
--修改人：祁继鸿
--修改内容：XD-JD03-021 系统功能-贷款通知打印
--修改内容：修改到期提醒查询
--参数设置：
update bt_sys_res
   set res_url = '/cms/AllMatureQuery.jsp'
 where res_name = '到期提醒查询'
   and sys_code = 'cms';

--修改日期：20120822
--修改人：祁继鸿
--修改内容：增加催款通知打印设置菜单
--参数设置：
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
   RES_LEVEL,
   RES_ROLE)
values
  ((select max(res_code) + 1 from bt_sys_res),
   '催款通知打印设置',
   'cms',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'cms'
       AND RES_NAME = '查询'),
   '/cms/dunningNotices.jsp',
   '0',
   '0',
   '0',
   '0',
   13,
   '催款通知打印设置',
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
   2,
   '');

--修改日期：20120822
--修改人：祁继鸿
--修改内容：催款通知打印设置内容保存表
--参数设置：
create table cms_dunningNotices (
       noticeType      varchar2(12)       not null,  --催款类型
       noticeTitle     varchar2(100)              ,--催款标题
       noticeContent   varchar2(500)             ,--催款内容
       noticeFoot      varchar2(100)             ,--催款结尾
       rmk             varchar2(100)             ,--备注
        constraint PK_cms_dunningNotices primary key (noticeType)
);

--修改日期：20120822
--修改人：祁继鸿
--修改内容：初始化催款通知打印设置内容保存表数据
--参数设置：
insert into cms_dunningNotices
  (noticeType, noticeTitle, noticeContent, noticeFoot, rmk)
values
  ('unexpired',
   '还款通知',
   '          你单位于#dkrq#所借的#dkbb# #jkje#元 (合同号：#htbh#; 账号：#dkzh#; 利率：#dkll#  )，将于#dkzqdqr#到期，现有#whje# 元尚末归还，现提请你司按时归还本金和利息，否则将依据相关规定处理',
   '',
   '未到期催款通知');
insert into cms_dunningNotices
  (noticeType, noticeTitle, noticeContent, noticeFoot, rmk)
values
  ('overdue',
   '逾期调剂金催收通知',
   '          你单位于#dkrq#所借的#dkbb# #jkje#元 (合同号：#htbh#; 账号：#dkzh#; 利率：#dkll#  )，将于#dkzqdqr#到期，现有#whje# 元尚末归还，现提请你司按时归还本金和利息，否则将依据相关规定处理',
   '',
   '已逾期催款通知');

--修改日期：20120822
--修改人：祁继鸿
--修改内容：初工作台弹出消息
--参数设置：
insert into sys_subscribe_rules (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (18, 'cms', '18', '企业贷款/借款到期提醒', 10, '企业贷款/借款到期提醒', '您有${count}笔企业贷款/借款到期！', '', '', '2', '1', to_date('08-03-2010', 'dd-mm-yyyy'), null);
commit;