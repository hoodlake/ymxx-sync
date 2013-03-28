--修改日期：2012.11.9
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(委托贷款申请)
DECLARE
  VN_COUNT    NUMBER;
  VN_COUNT1    NUMBER;
  VN_COUNT2    NUMBER;
  VC_STR VARCHAR2(2000);
  VC_STR1 VARCHAR2(2000);
  
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT1
    FROM bt_approve_business
   WHERE business_code='cms_H1';
  IF VN_COUNT1 < 1 THEN
    insert into bt_approve_business (business_code,business_name,business_level,sys_code,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
    values('cms_H1','委托贷款申请','A,B,C','cms','cms_precative_loan_app','money','next_checker','app_id','../cms/ApplyCmsApprove.jsp','com.bettersoft.cms.form.ApplyPreLoanForm');
  END IF; 
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE RES_URL='/cms/ApplyPreLoan_add.jsp';
   
  IF VN_COUNT < 1 THEN
    insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) from bt_sys_res)+1, '委托贷款申请', 'cms', 305, '/cms/ApplyPreLoan_add.jsp', '0', '0', '0', '0', 8, null, null, null, null, null, null, null, null, null, null, null, 2, null);
  END IF;
--委托贷款申请表结构脚本
    --查看现有系统是否有TEST1表
    SELECT COUNT(*)
      INTO VN_COUNT
      FROM USER_TABLES
     WHERE TABLE_NAME = 'CMS_PRECATIVE_LOAN_APP';
    --如果没有则新增表，如果有就不处理
    IF VN_COUNT < 1 THEN
      VC_STR := 'create table CMS_PRECATIVE_LOAN_APP  (
     APP_ID               NUMBER                          not null,
     APP_CODE             VARCHAR2(20),
     PRECATIVE_ID         NUMBER(10)                      not null,
     CORP_ID              NUMBER(10)                      not null,
     PRIORITY_LEVEL       NUMBER,
     CURRENCY             CHAR(2)                         not null,
     TERM                 NUMBER                          not null,
     MONEY                NUMBER(15,2)                    not null,
     HYPOTHEC_CODE        CHAR(2)                         not null,
     CONTRACT_PREIOD      NUMBER(10),
     HYPOTHEC_EXPLAIN     VARCHAR2(200),
     END_DATE             DATE                            not null,
     START_DATE           DATE                            not null,
     OP                   VARCHAR2(8)                     not null,
     NEXT_CHECKER         VARCHAR2(150),
     APPROVES             VARCHAR2(200),
     STATUS               NUMBER                          not null,
     ENTER_DATE           DATE                            not null,
     RMK                  VARCHAR2(400),
     constraint PK_CMS_PRECATIVE_LOAN_APP primary key (APP_ID))';
      EXECUTE IMMEDIATE VC_STR;
    END IF;
    --查看现有系统是否有TEST1表
    SELECT COUNT(*)
      INTO VN_COUNT
      FROM USER_TABLES 
     WHERE TABLE_NAME = 'cms_precative_upload_file';
    --如果没有则新增表，如果有就不处理
    IF VN_COUNT < 1 THEN
      VC_STR1 := 'create table cms_precative_upload_file(
          ID          NUMBER(10) not null,
          FILE_PATH   VARCHAR2(511),
          FILE_NAME   VARCHAR2(200),
          FILE_DESC   VARCHAR2(511),
          TARGET_TABLE_NAME   VARCHAR2(100),
          TARGET_ID   VARCHAR2(100),
          CREATE_DATE DATE,
          CREATE_USER VARCHAR2(20),
          constraint pk_cms_precative_upload_file primary key (ID)
  )';
      EXECUTE IMMEDIATE VC_STR1;
    END IF;
END;
/
