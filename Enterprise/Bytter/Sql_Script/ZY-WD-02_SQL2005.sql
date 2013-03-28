--修改日期：2012.11.8
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(委托贷款申请)

DECLARE
  @VN_COUNT    INT,@VN_COUNT1    INT,@VN_COUNT2    INT;
BEGIN
--增加委托贷款申请业务流程
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_approve_business
   WHERE business_code='cms_H1';
  IF @VN_COUNT < 1
    BEGIN
       insert into bt_approve_business (business_code,business_name,business_level,sys_code,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	  values('cms_H1','委托贷款申请','A,B,C','cms','cms_precative_loan_app','money','next_checker','app_id','../cms/ApplyCmsApprove.jsp','com.bettersoft.cms.form.ApplyPreLoanForm');
    END;
 -- 委托贷款申请
  SELECT @VN_COUNT1 = COUNT(*)
    FROM BT_SYS_RES
   WHERE RES_URL='/cms/ApplyPreLoan_add.jsp';
  IF @VN_COUNT1 < 1
    BEGIN
     insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	  select max(res_code)+1, '委托贷款申请', 'cms', 305, '/cms/ApplyPreLoan_add.jsp', '0', '0', '0', '0', 8, null, null, null, null, null, null, null, null, null, null, null, 2, null from bt_sys_res;
    END;
END;
GO

--委托贷款申请表结构脚本
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('CMS_PRECATIVE_LOAN_APP')
                  AND   TYPE = 'U')
create table CMS_PRECATIVE_LOAN_APP  (
   APP_ID               NUMERIC(10)                          not null primary key,
   APP_CODE             VARCHAR(20),
   PRECATIVE_ID         NUMERIC(10)                      not null,
   CORP_ID              NUMERIC(10)                      not null,
   PRIORITY_LEVEL       NUMERIC,
   CURRENCY             CHAR(2)                         not null,
   TERM                 NUMERIC                          not null,
   MONEY                NUMERIC(15,2)                    not null,
   HYPOTHEC_CODE        CHAR(2)                         not null,
   CONTRACT_PREIOD      NUMERIC(10),
   HYPOTHEC_EXPLAIN     VARCHAR(200),
   END_DATE             DATETIME                            not null,
   START_DATE           DATETIME                            not null,
   OP                   VARCHAR(8)                     not null,
   NEXT_CHECKER         VARCHAR(150),
   APPROVES             VARCHAR(200),
   STATUS               int                          not null,
   ENTER_DATE           DATETIME                            not null,
   RMK                  VARCHAR(400)
)
GO

--委托贷款申请附件表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('cms_precative_upload_file')
                  AND   TYPE = 'U')
create table cms_precative_upload_file(
        ID          NUMERIC(10) not null primary key,
        FILE_PATH   VARCHAR(511),
        FILE_NAME   VARCHAR(200),
        FILE_DESC   VARCHAR(511),
        TARGET_TABLE_NAME   VARCHAR(100),
        TARGET_ID   VARCHAR(100),
        CREATE_DATE DATETIME,
        CREATE_USER VARCHAR(20)
)
GO