--修改日期：2012-12-18
--修改人：卢燕南
--修改内容：手机短信相关菜单
--修改原因：BFS-JD1-0006

--新增菜单：首页 >> 基础平台 >> 手机短信平台基础数据维护>> 短信提醒消息设置
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '短信提醒消息设置', 'adm', (select RES_CODE from bt_sys_res where sys_code = 'adm' and RES_NAME = '手机短信平台基础数据维护'), '/admin/mesAction.do?method=queryMesRemindRules', '0', '1', '0', '0', 10, '短信提醒消息设置', '', '', '', '', '', null, null, null, null, null, 2, '');

--新增菜单：首页 >> 基础平台 >> 手机短信平台基础数据维护>> 短信发送规则设置
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '短信发送规则设置', 'adm', (select RES_CODE from bt_sys_res where sys_code = 'adm' and RES_NAME = '手机短信平台基础数据维护'), '/admin/mesAction.do?method=queryMesSendRules', '0', '1', '0', '0', 10, '短信发送规则设置', '', '', '', '', '', null, null, null, null, null, 2, '');

--新增菜单：首页 >> 短信平台 >> 手机短信发送消息跟踪
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '手机短信发送消息跟踪', 'sms', (select RES_CODE from bt_sys_res where sys_code = 'sms' and RES_NAME = '短信平台'), '/sms/mesTrackAction.do?method=listMesTrack', '', '0', '', '0', 5, '手机短信发送消息跟踪', '', '', '', '', '', null, null, null, null, null, 2, '');



--修改日期：2012-12-18
--修改人：卢燕南
--修改内容：添加系统规则
--修改原因：BFS-JD1-0006

--付款申请提醒
insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (20, 'sms', '20', '付款申请提醒', 10, '付款申请提醒', '您有一笔付款申请，付款帐号${payerAccount}收款帐号${payeeAccount}付款${money}元！', '', '', '2', '1', to_date('05-12-2012', 'dd-mm-yyyy'), null);

--付款成功提醒
insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (21, 'sms', '21', '付款成功提醒', 10, '付款成功提醒', '您有一笔银行交易成功！交易类型：${payType}  付款帐号：${payerAccount} 收款帐号：${payeeAccount} 金额：${money}元！', '', '', '2', '1', to_date('05-12-2012', 'dd-mm-yyyy'), null);

--银行账户余额
insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (22, 'sms', '22', '银行账户余额', 10, '银行账户余额', '账户${account}，开户行：${bankType}，当前余额：10000.00元！', '', '', '2', '1', to_date('05-12-2012', 'dd-mm-yyyy'), null);

commit;