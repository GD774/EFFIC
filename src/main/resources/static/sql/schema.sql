DROP SEQUENCE USER_SEQ;

CREATE SEQUENCE USER_SEQ NOCACHE;

DROP TABLE DEPARTMENT_T;
DROP TABLE COMMON_CODE_M_T;
DROP TABLE COMMON_CODE_T;
DROP TABLE USER_T;

CREATE TABLE USER_T (
  EMP_ID     VARCHAR2(20)      NOT NULL,
  PASSWORD   VARCHAR2(100)     NOT NULL,
  NAME       VARCHAR2(20)      NULL,
  STATUS     NUMBER            NOT NULL,
  PROFILE    VARCHAR2(100)     NULL,
  GENDER_ID  NUMBER            NULL,
  PHONE      VARCHAR2(20)      NULL,
  EMAIL      VARCHAR2(20)      NULL,
  DEP_ID     VARCHAR2(100)     NULL,
  POS_ID     VARCHAR2(100)     NULL,
  RES_ID     VARCHAR2(100)     NULL,
  JOIN_DT    DATE              NULL,
  LEAVE_DT   DATE              NULL,
  SIGN_IMG   VARCHAR2(100)     NULL,
  SIGN_STAMP VARCHAR2(100)     NULL
);

CREATE TABLE COMMON_CODE_M_T (
  CODE_GUBUN        VARCHAR2(100)      NOT NULL,
  CODE_GUBUN_NAME   VARCHAR2(100)      NULL
);

CREATE TABLE COMMON_CODE_T (
  CODE_GUBUN        VARCHAR2(100)      NOT NULL,
  CODE_VAL          VARCHAR2(100)      NOT NULL,
  CODE_NAME         VARCHAR2(100)      NULL
);

CREATE TABLE DEPARTMENT_T (
  CODE       VARCHAR2(100)     NOT NULL,
  NAME       VARCHAR2(100)     NULL,
  PARENT     VARCHAR2(100)     NULL,
  DEP_LEVEL      NUMBER            NULL
);

				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				