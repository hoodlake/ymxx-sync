--修改日期：20121127
--修改人：高枫
--修改内容：GJ-RZ-06_ 系统功能-融资保证金缴费通知
--修改内容：系统菜单 增加 融资保证金缴费通知
--参数设置：
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='融资保证金缴费通知' AND t1.father_code=t2.res_code AND t2.res_name='贷款管理';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, 
   REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '融资保证金缴费通知', 'cms', RES_CODE, '/cms/outFinancRecordQueryLoad.jsp', '0', '1', '0', '0', 
   (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), 
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '贷款管理' AND T3.SYS_CODE = 'cms';
  END IF;
  COMMIT; 
END;
/

CREATE TABLE OUTFINANCRECORD(
   FINANCID VARCHAR2(32) NOT NULL,   --融资通知id
   FINANCODE  VARCHAR2(16),  --融资通知code
   CORP_ID VARCHAR2(10),   --融资申请单位
   END_DATE DATE,          --截止日期
   OUTFINANCMONEY NUMBER(15,2), 
   MARGINRATE NUMBER(9,6), --保证金比率
   PAYOUTFINANCMONEY NUMBER(15,2),--应缴保证金
   COUNTPAYOUTFINANCMONEY NUMBER(15,2), --累计已缴的保证金
   THISPAYOUTFINANCMONEY NUMBER(15,2),  --本次应应缴保证金
   PAYDATE DATE,  --缴费时间
   STATE INT,     --缴费记录状态
   REMARK   VARCHAR2(300),   --附言
   APPROVES      VARCHAR2(200), --操作人
   UPDATEUSER    VARCHAR2(200), --修改人
   NEXTCHECKER   VARCHAR2(200),  --确认人
   VOUCHERNO   VARCHAR2(20),     --凭证号
   CONSTRAINT PK_OUTFINANCRECORD PRIMARY KEY (FINANCID)
);




