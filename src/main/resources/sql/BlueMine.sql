DROP TABLE CKLIST;
DROP TABLE PS_WORK;
DROP TABLE GP_WORK;
DROP TABLE FILEINFO;
DROP TABLE TIMELINE;
DROP TABLE PJ_GROUP;
DROP TABLE HORSEHEAD;
DROP TABLE MATCHPRJ;
DROP TABLE PRJLIST;
DROP TABLE CP_POSITION;
DROP TABLE USERINFO;
DROP TABLE CP_DEPARTMENT;
DROP SEQUENCE CL_SEQ;
DROP SEQUENCE PS_SEQ;
DROP SEQUENCE GS_SEQ;
DROP SEQUENCE TL_SEQ;
DROP SEQUENCE GP_SEQ;
DROP SEQUENCE PL_SEQ;
DROP SEQUENCE HH_SEQ;
DROP SEQUENCE UI_SEQ;
DROP SEQUENCE DP_SEQ;
DROP SEQUENCE POSI_SEQ;
DROP SEQUENCE LOOP_SEQ;
--USE USERINFO
CREATE SEQUENCE UI_SEQ 
START WITH 0000001
MAXVALUE 0999999
INCREMENT BY 1
NOCACHE
NOCYCLE;
--USE PERSONAL_SCHEDULE
CREATE SEQUENCE POSI_SEQ 
START WITH 011
MAXVALUE 999
INCREMENT BY 1
NOCACHE
NOCYCLE;
--USE DEPARTMENT
CREATE SEQUENCE DP_SEQ 
START WITH 016
MAXVALUE 999
INCREMENT BY 1
NOCACHE
NOCYCLE;
--USE PRJLIST
CREATE SEQUENCE PL_SEQ 
START WITH 1000000
MAXVALUE 1999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE GROUP
CREATE SEQUENCE GP_SEQ 
START WITH 2000000
MAXVALUE 2999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE TIMELINE
CREATE SEQUENCE TL_SEQ 
START WITH 3000000
MAXVALUE 3999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE GROUP_SCHEDULE
CREATE SEQUENCE GS_SEQ 
START WITH 4000000
MAXVALUE 4999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE PERSONAL_SCHEDULE
CREATE SEQUENCE PS_SEQ 
START WITH 5000000
MAXVALUE 5999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE CKLIST
CREATE SEQUENCE CL_SEQ 
START WITH 6000000
MAXVALUE 6999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE HORSEHEAD
CREATE SEQUENCE HH_SEQ 
START WITH 7000000
MAXVALUE 7999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE loop
CREATE SEQUENCE LOOP_SEQ 
START WITH 0000001
MAXVALUE 0999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE TABLE CP_DEPARTMENT
(
  DEPNUM NUMBER(4) PRIMARY KEY
  ,DEPNAMEEN VARCHAR2(30)
  ,DEPNAMEKR varchar2(30)
  ,typeAlias VARCHAR2(20)
);

CREATE TABLE CP_POSITION
(
  POSITIONNUM NUMBER(4) PRIMARY KEY
  ,POSITIONNAME VARCHAR2(30) UNIQUE
);


CREATE TABLE USERINFO 
(
  USERID VARCHAR2(20) PRIMARY KEY
, Email VARCHAR2(30) NOT NULL
, Name VARCHAR2(20) NOT NULL
, PASSWORD VARCHAR2(20) NOT NULL
, DEPARTMENT varchar2(30) NOT NULL
, POSITION VARCHAR2(30) NOT NULL
, ORIGINALFILE VARCHAR2(30)
, SAVEFILE VARCHAR2(100)
, CHATLIST VARCHAR2(100)

);


CREATE TABLE PRJLIST
(
  PRJ_NUM NUMBER(7) PRIMARY KEY
  ,PRJ_NAME VARCHAR2(30)
  ,PLANNER VARCHAR2(30)
  ,ACCESS_CONTROL NUMBER(1)
  ,INVITE_CODE VARCHAR2(20) NOT NULL UNIQUE
  ,BACKGROUND VARCHAR2(500)
  ,CONSTRAINT CK_PL_AC CHECK(ACCESS_CONTROL IN(0,1))
);

CREATE TABLE MATCHPRJ
(
  MEMBERID VARCHAR2(20)NOT NULL
  ,PRJ_NUM NUMBER(7)NOT NULL
  ,CONSTRAINT FK_PRJN FOREIGN KEY(PRJ_NUM) REFERENCES PRJLIST(PRJ_NUM)
  ON DELETE CASCADE
  ,CONSTRAINT FK_MEI FOREIGN KEY(MEMBERID) REFERENCES USERINFO(USERID) 
  ON DELETE CASCADE
);

CREATE TABLE HORSEHEAD
(
  TAGNUM NUMBER(7) PRIMARY KEY
  ,TAGTITLE VARCHAR2(30)NOT NULL
  ,TAGTYPE VARCHAR2(30)NOT NULL
);

CREATE TABLE PJ_GROUP
(
  GP_NUM NUMBER(7) PRIMARY KEY
  ,GP_NAME VARCHAR2(30) NOT NULL
  ,PRJ_NUM NUMBER(7) NOT NULL
  ,CONSTRAINT FK_GP_PRJN FOREIGN KEY(PRJ_NUM) REFERENCES PRJLIST(PRJ_NUM)
  ON DELETE CASCADE
);

CREATE TABLE TIMELINE
(
  TL_NUM NUMBER(7) PRIMARY KEY
  ,GP_NUM NUMBER(7) NOT NULL
  ,WRITER VARCHAR2(20) NOT NULL
  ,W_DATE TIMESTAMP DEFAULT(SYSDATE)
  ,TL_CONTENT VARCHAR2(500) NOT NULL
  ,TAGNUM NUMBER(7)
  ,CONSTRAINT FK_TL_GN FOREIGN KEY(GP_NUM) REFERENCES PJ_GROUP(GP_NUM)
  ON DELETE CASCADE
  ,CONSTRAINT FK_TL_WR FOREIGN KEY(WRITER) REFERENCES USERINFO(USERID)
  ON DELETE SET NULL
  ,CONSTRAINT FK_TL_TT FOREIGN KEY(TAGNUM) REFERENCES HORSEHEAD(TAGNUM)
  ON DELETE CASCADE
);

CREATE TABLE FILEINFO
(
  TL_NUM NUMBER(7)
  ,ORIGINALFILE VARCHAR2(100) NOT NULL
  ,SAVEFILE VARCHAR2(300) PRIMARY KEY
  ,CONSTRAINT FK_FI_TN FOREIGN KEY(TL_NUM) REFERENCES TIMELINE(TL_NUM)
  ON DELETE CASCADE
);

CREATE TABLE GP_WORK
(
  GS_NUM NUMBER(7) PRIMARY KEY
  ,GS_NAME VARCHAR2(30) NOT NULL
  ,GP_NUM NUMBER(7) NOT NULL
  ,GS_CONTENT VARCHAR2(500)
  ,DIRECTOR VARCHAR2(30)
  ,START_DATE DATE DEFAULT(SYSDATE)
  ,DEADLINE DATE NOT NULL
  ,GP_PRI NUMBER(1) NOT NULL
  ,PROGRESS NUMBER(3) DEFAULT(0)
  ,CONSTRAINT FK_GW_GN FOREIGN KEY(GP_NUM)
   REFERENCES PJ_GROUP(GP_NUM)
   ON DELETE CASCADE
  ,CONSTRAINT CK_GW_PG CHECK(PROGRESS IN (0,1))
  ,CONSTRAINT CK_GW_PP CHECK(GP_PRI BETWEEN 0 AND 4)
);

CREATE TABLE PS_WORK
(
  PS_NUM NUMBER(7) PRIMARY KEY
  ,PS_NAME VARCHAR2(30) NOT NULL
  ,PS_CONTENT VARCHAR2(500)
  ,MEMBERID VARCHAR2(30)
  ,START_DATE DATE DEFAULT(SYSDATE)
  ,DEADLINE DATE NOT NULL
  ,PS_PRI NUMBER(1) NOT NULL
  ,PROGRESS NUMBER(3) DEFAULT(0)
  ,CONSTRAINT FK_PW_ID FOREIGN KEY(MEMBERID) 
   REFERENCES USERINFO(USERID)
   ON DELETE SET NULL
  ,CONSTRAINT CK_PW_PG CHECK(PROGRESS IN (0,1))
  ,CONSTRAINT CK_PW_PP CHECK(PS_PRI BETWEEN 0 AND 4)
);

CREATE TABLE CKLIST
(
 CL_NUM NUMBER(7) PRIMARY KEY
 ,CL_NAME VARCHAR2(30) NOT NULL
 ,MEMBERID VARCHAR2(30) NOT NULL
 ,CK_CONTENT VARCHAR2(300) NOT NULL
 ,CK_STATE VARCHAR2(10) DEFAULT('F')
 ,LOOPS varchar2(10)
 ,CONSTRAINT FK_CK_ID FOREIGN KEY(MEMBERID)
  REFERENCES USERINFO(USERID)
  ON DELETE CASCADE
 ,CONSTRAINT CK_CL_CS CHECK(CK_STATE IN('T','F'))
);

CREATE TABLE LOOPS(
LOOP_SEQ NUMBER(7) PRIMARY KEY
,LOOP_NUM NUMBER() NOT NULL
,CL_NUM NUMBER(7)
,CONSTRAINT FK_LP_CN FOREIGN KEY(CL_NUM)
REFERENCES CKLIST(CL_NUM) ON DELETE CASCADE
,
);