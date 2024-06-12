DROP SEQUENCE SCEHDULE_SEQ;

DROP SEQUENCE USER_SEQ;

DROP SEQUENCE MSG_SEQ;
DROP SEQUENCE RECP_SEQ;
DROP SEQUENCE MSG_ATTACH_SEQ;

DROP SEQUENCE CATEGORY_SEQ;
DROP SEQUENCE FACILITY_MANAGE_SEQ;
DROP SEQUENCE FACILITY_RESERVE_SEQ;
DROP SEQUENCE ROOM_MANAGE_SEQ;
DROP SEQUENCE ROOM_RESERVE_SEQ;

DROP SEQUENCE APP_ATTACH_SEQ;
DROP SEQUENCE DOC_TEMP_SEQ;
DROP SEQUENCE APP_LINE_SEQ;
DROP SEQUENCE APP_DOC_SEQ;

CREATE SEQUENCE SCEHDULE_SEQ NOCACHE;

CREATE SEQUENCE USER_SEQ NOCACHE;

CREATE SEQUENCE MSG_SEQ NOCACHE;
CREATE SEQUENCE RECP_SEQ NOCACHE;
CREATE SEQUENCE MSG_ATTACH_SEQ NOCACHE;

CREATE SEQUENCE ROOM_RESERVE_SEQ NOCACHE;
CREATE SEQUENCE ROOM_MANAGE_SEQ NOCACHE;
CREATE SEQUENCE FACILITY_RESERVE_SEQ NOCACHE;
CREATE SEQUENCE FACILITY_MANAGE_SEQ NOCACHE;
CREATE SEQUENCE CATEGORY_SEQ NOCACHE;

CREATE SEQUENCE APP_DOC_SEQ NOCACHE;
CREATE SEQUENCE APP_LINE_SEQ NOCACHE;
CREATE SEQUENCE DOC_TEMP_SEQ NOCACHE;
CREATE SEQUENCE APP_ATTACH_SEQ NOCACHE;

DROP TABLE DEPARTMENT_T;
DROP TABLE COMMON_CODE_M_T;
DROP TABLE COMMON_CODE_T;
DROP TABLE USER_T;

DROP TABLE EXPT_RESULTS_T;
DROP TABLE RESULTS_T;
DROP TABLE SCHEDULE_T;

DROP TABLE MSG_ATTACH_T;
DROP TABLE RECP_T;
DROP TABLE MSG_T;

DROP TABLE CATEGORY_T;
DROP TABLE FACILITY_MANAGE_T;
DROP TABLE FACILITY_RESERVE_T;
DROP TABLE ATTENDEE_T;
DROP TABLE ROOM_MANAGE_T;
DROP TABLE ROOM_RESERVE_T;

DROP TABLE DOC_T;
DROP TABLE REFERENCE_T;
DROP TABLE APP_ATTACH_T;
DROP TABLE DOC_TEMP_T;
DROP TABLE APP_LINE_T;
DROP TABLE APPROVAL_T;
DROP TABLE APP_DOC_T;

CREATE TABLE SCHEDULE_T(
SCHEDULE_ID NUMBER NOT NULL,
EMP_ID     VARCHAR2(20 BYTE)   NOT NULL,
START_DT    VARCHAR2(20 BYTE)   NOT NULL,
END_DT      VARCHAR2(20 BYTE)   NOT NULL,
TITLE       VARCHAR2(100 BYTE)  NOT NULL,
CONTENTS    VARCHAR2(1000 BYTE)     NULL,
DOC_STATE   NUMBER              NOT NULL,
CONSTRAINT PK_SCHEDULE PRIMARY KEY (EMP_ID)
);

CREATE TABLE RESULTS_T(
YEAR             NUMBER       NOT NULL,
MONTH            NUMBER       NOT NULL,
BRANCH_ID        NUMBER       NOT NULL,
TOTAL_RESULTS    NUMBER       NOT NULL,
PROFIT           NUMBER       NOT NULL,
EMPTY_OFFICE     NUMBER       NOT NULL,
TOTAL_OFFICE     NUMBER       NOT NULL,
CONSTRAINT PK_RESULTS PRIMARY KEY(YEAR, MONTH, BRANCH_ID)
);

CREATE TABLE EXPT_RESULTS_T(
YEAR             NUMBER       NOT NULL,
MONTH            NUMBER       NOT NULL,
BRANCH_ID        NUMBER       NOT NULL,
TOTAL_RESULTS    NUMBER       NOT NULL,
PROFIT           NUMBER       NOT NULL,
EMPTY_OFFICE     NUMBER       NOT NULL,
CONSTRAINT PK_EXPT_RESULTS PRIMARY KEY(YEAR, MONTH, BRANCH_ID)
);

CREATE TABLE USER_T (
EMP_ID     VARCHAR2(20)      NOT NULL,
PASSWORD   VARCHAR2(100)     NOT NULL,
NAME       VARCHAR2(20)      NULL,
STATUS     NUMBER            NOT NULL,
GENDER_ID  NUMBER            NULL,
DEP_ID     VARCHAR2(100)     NULL,
POS_ID     VARCHAR2(100)     NULL,
JOIN_DT    DATE              NULL,
LEAVE_DT   DATE              NULL
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

CREATE TABLE MSG_T (
MSG_ID     NUMBER            NOT NULL,
SENDER     VARCHAR2(20 BYTE)            NOT NULL,
TITLE      VARCHAR2(500 BYTE)           NOT NULL,
CONTENTS   VARCHAR2(3500 BYTE),
SEND_DT    DATE                         NOT NULL,
STATE      NUMBER     DEFAULT 0         NOT NULL,
IS_ME  NUMBER     DEFAULT 0         NOT NULL,
IS_DELETE  NUMBER     DEFAULT 0         NOT NULL,
CHK_IMPT   NUMBER     DEFAULT 0         NOT NULL,
CONSTRAINT PK_MSG PRIMARY KEY(MSG_ID)
);

CREATE TABLE RECP_T (
RECP_ID    NUMBER         NOT NULL,
MSG_ID     VARCHAR2(20 BYTE)            NOT NULL,
RECIPIENT  VARCHAR2(20 BYTE)            NOT NULL,
READ_DT    DATE,
STATE      NUMBER     DEFAULT 0         NOT NULL,
IS_DELETE  NUMBER     DEFAULT 0         NOT NULL,
CHK_IMPT   NUMBER     DEFAULT 0         NOT NULL,
CONSTRAINT PK_RECP PRIMARY KEY(RECP_ID)
);

CREATE TABLE MSG_ATTACH_T (
ATTACH_ID     NUMBER   NOT NULL,
MSG_ID        VARCHAR2(20 BYTE)   NOT NULL,
UPLOAD_PATH   VARCHAR2(500 BYTE)  NOT NULL,
FILESYS_NAME  VARCHAR2(150 BYTE)   NOT NULL,
ORIGINAL_NAME VARCHAR2(80 BYTE)   NOT NULL,
CONSTRAINT PK_MSG_ATTACH PRIMARY KEY(ATTACH_ID)
);

CREATE TABLE ROOM_RESERVE_T (
RESERVE_ID          NUMBER              NOT NULL,
AVAIL_START_DT      VARCHAR2(100 BYTE)  NOT NULL,
AVAIL_END_DT        VARCHAR2(100 BYTE)  NOT NULL,
RESERVE_CONTENTS    VARCHAR2(500 BYTE)  NOT NULL,
UPD_DT              VARCHAR2(100 BYTE)  NOT NULL,
UPD_ID              VARCHAR2(100 BYTE)  NOT NULL,
RESERVE_USER              VARCHAR2(32)        NOT NULL,
ROOM_ID             NUMBER              NOT NULL,
CONSTRAINT PK_ROOM_RESERVE PRIMARY KEY(RESERVE_ID)
);

CREATE TABLE ROOM_MANAGE_T (
ROOM_ID         NUMBER              NOT NULL,
START_DT        VARCHAR2(100 BYTE)  NOT NULL,
END_DT          VARCHAR2(100 BYTE)  NOT NULL,
ROOM_NAME       VARCHAR2(50 BYTE)   NOT NULL,
ROOM_STATE      number    DEFAULT 0 NOT NULL,
ATTENDEE_NO     NUMBER              NOT NULL,
MON             VARCHAR2(2)         DEFAULT 'Y'  NOT NULL,
TUE             VARCHAR2(2)         DEFAULT 'Y'  NOT NULL,
WED             VARCHAR2(2)         DEFAULT 'Y'  NOT NULL,
THU             VARCHAR2(2)         DEFAULT 'Y'  NOT NULL,
FRI             VARCHAR2(2)         DEFAULT 'Y'  NOT NULL,
SAT             VARCHAR2(2)         DEFAULT 'N'  NOT NULL,
SUN             VARCHAR2(2)         DEFAULT 'N'  NOT NULL,
CONSTRAINT PK_ROOM_MANAGE PRIMARY KEY(ROOM_ID)
);

CREATE TABLE ATTENDEE_T (
attendee         VARCHAR2(32)  NOT NULL,
RESERVE_ID      NUMBER       NOT NULL
);

CREATE TABLE FACILITY_RESERVE_T (
RENT_ID         NUMBER                  NOT NULL,
START_DT        VARCHAR2(100 BYTE)      NOT NULL,
END_DT          VARCHAR2(100 BYTE)      NOT NULL,
UPD_DT          VARCHAR2(100 BYTE)      NOT NULL,
UPD_ID          VARCHAR2(100 BYTE)      NOT NULL,
RENT_STATE      number          default 0   NOT NULL,
FACILITY_ID     NUMBER                  NOT NULL,
RENT_USER       VARCHAR2(32)             NOT NULL,
CONSTRAINT PK_FACILITY_RENT PRIMARY KEY(RENT_ID)
);

CREATE TABLE FACILITY_MANAGE_T (
FACILITY_ID     NUMBER                  NOT NULL,
MODEL_NAME      VARCHAR2(200 BYTE)      NOT NULL,
BUY_DT          VARCHAR2(100 BYTE)      NOT NULL,
CAT_CODE        VARCHAR2(8 BYTE)        NOT NULL,
FACILITY_STATE  NUMBER        DEFAULT 0 NOT NULL,
RENT_TERM       NUMBER        DEFAULT 0 NOT NULL,
CONSTRAINT PK_FACILITY_MANAGE PRIMARY KEY(FACILITY_ID)
);

CREATE TABLE CATEGORY_T (
CAT_CODE        VARCHAR2(8 BYTE)        NOT NULL,
PCAT_CODE       VARCHAR2(40 BYTE)       NULL,
CAT_NAME        VARCHAR2(100 BYTE)      NOT NULL,
CAT_TYPE        VARCHAR2(2 BYTE)        NOT NULL,
CONSTRAINT PK_CATEGORY_T PRIMARY KEY(CAT_CODE)
);

CREATE TABLE APP_DOC_T (
DOC_ID        NUMBER NOT NULL,
EMP_ID       NUMBER NOT NULL,
TITLE         VARCHAR2(200 BYTE),
CONTENTS     VARCHAR2(3000 BYTE),
DOC_TEMP_CODE NUMBER,
WRITE_DT      DATE,
UPDATE_DT     DATE,
DEP_ID        NUMBER,
DOC_STATE     VARCHAR2(2 BYTE) DEFAULT '0' NOT NULL,
URGENT        VARCHAR2(2 BYTE) DEFAULT '0' NOT NULL,
CONSTRAINT PK_APP_DOC PRIMARY KEY (DOC_ID)
);

CREATE TABLE APPROVAL_T (
APP_ID      NUMBER                        NOT NULL,
DOC_ID      NUMBER                        NOT NULL,
APP_STATE   VARCHAR2(2 BYTE) DEFAULT '0' NOT NULL,
EMP_ID     NUMBER                        NOT NULL,
SUBMIT_DT   DATE,
APP_DT      DATE,
APP_DOC_ID  VARCHAR2(100 BYTE),
REJECT     VARCHAR2(100 BYTE),
LINE_ORDER  VARCHAR2(100 BYTE),
CONSTRAINT PK_APPROVAL PRIMARY KEY (APP_ID)
);

CREATE TABLE APP_LINE_T (
LINE_ID        NUMBER              NOT NULL,
LINE_TYPE      VARCHAR2(100 BYTE),
EMP_ID         NUMBER              NOT NULL,
LINE_FAV_ORDER VARCHAR2(100 BYTE) NOT NULL,
REGISTER      VARCHAR2(100 BYTE),
REGISTER_DT    DATE,
UPDATER        VARCHAR2(100 BYTE),
UPDATE_DT      DATE,
CONSTRAINT PK_APP_LINE PRIMARY KEY(LINE_ID)
);

CREATE TABLE DOC_TEMP_T (
DOC_TEMP_CODE NUMBER NOT NULL,
DOC_TEMP_NAME VARCHAR2(100 BYTE),
CONTENTS     VARCHAR2(3000 BYTE),
CONSTRAINT   PK_DOC_TEMP PRIMARY KEY(DOC_TEMP_CODE)
);

CREATE TABLE APP_ATTACH_T (
    ATTACH_NO        NUMBER NOT NULL,    -- 파일번호
    ATTACH_ID        VARCHAR2(100 BYTE), -- 파일명
    ORIGINALFILENAME VARCHAR2(100 BYTE), -- 파일원본이름
    FILESYSTEM_NAME  VARCHAR2(100 BYTE), -- 파일시스템명
    UPLOAD_PATH      VARCHAR2(200 BYTE), -- 파일경로
    DOC_ID           NUMBER,              -- 문서번호
    CONSTRAINT PK_APP_ATTACH PRIMARY KEY(ATTACH_NO)
);

CREATE TABLE REFERENCE_T (
DOC_ID  NUMBER NOT NULL,
REF_TYPE CHAR(2 BYTE),
EMP_ID NUMBER,
DEPT_ID NUMBER,
CONSTRAINT PK_REFERENCE PRIMARY KEY(DOC_ID)
);

CREATE TABLE DOC_T (
DOC_ID NUMBER NOT NULL,
ITEM_NAME VARCHAR2(100 BYTE),
ITEM_STANDARD VARCHAR2(100 BYTE),
ITEM_QUAN VARCHAR2(100 BYTE),
ITEM_COST NUMBER,
AMOUNT NUMBER,
REMARKS VARCHAR2(100 BYTE),
OTHER  VARCHAR2(200 BYTE),
CONSTRAINT PK_DOC PRIMARY KEY(DOC_ID)
);

INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester1', '1111', '안성기', 1, 0, 1, '001', TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester2', '1111', '신해철', 1, 0, 1, '002', TO_DATE('2023-02-01', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester3', '1111', '신혜선', 1, 1, 1, '003', TO_DATE('2023-03-01', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester4', '1111', '구혜선', 1, 1, 1, '004', TO_DATE('2023-04-01', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('testser', '1111', '박소담', 1, 1, 1, '005', TO_DATE('2023-05-01', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester6', '1111', '조준영', 1, 0, 2, '001', TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester7', '1111', '남민우', 1, 0, 2, '003', TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester8', '1111', '박화평', 1, 0, 2, '002', TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester9', '1111', '전지현', 1, 1, 2, '001', TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester10', '1111', '김지은', 1, 1, 2, '004', TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester11', '1111', '주윤발', 1, 0, '3', '003', TO_DATE('2020-01-01', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester12', '1111', '고길동', 1, 0, '3', '002', TO_DATE('2022-03-05', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester13', '1111', '나무늬', 1, 1, '3', '003', TO_DATE('2024-02-07', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester14', '1111', '양희은', 1, 1, '3', '001', TO_DATE('2021-11-18', 'YYYY-MM-DD'), NULL);
INSERT INTO USER_T (EMP_ID, PASSWORD, NAME, STATUS, GENDER_ID, DEP_ID, POS_ID, JOIN_DT, LEAVE_DT)
VALUES ('tester15', '1111', '신성우', 1, 0, '3', '002', TO_DATE('2023-07-16', 'YYYY-MM-DD'), NULL);
