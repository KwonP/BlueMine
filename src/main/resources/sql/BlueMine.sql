--DROP TABLE
DROP TABLE CK_LOOPS;
DROP TABLE CKLIST;
DROP TABLE PS_WORK;
DROP TABLE MATCH_GP_WORK;
DROP TABLE GP_WORK;
DROP TABLE FILEINFO;
DROP TABLE TIMELINE;
DROP TABLE PJ_GROUP;
DROP TABLE MATCHPRJ;
DROP TABLE PRJLIST;
DROP TABLE USERINFO;
DROP TABLE CP_POSITION;
DROP TABLE CP_DEPARTMENT;
DROP TABLE triggerinfo;


--DROP SEQUENCE
DROP SEQUENCE CL_SEQ;
DROP SEQUENCE PS_SEQ;
DROP SEQUENCE GS_SEQ;
DROP SEQUENCE TL_SEQ;
DROP SEQUENCE GP_SEQ;
DROP SEQUENCE PL_SEQ;
DROP SEQUENCE UI_SEQ;
DROP SEQUENCE DP_SEQ;
DROP SEQUENCE POSI_SEQ;
DROP SEQUENCE LOOP_SEQ;
DROP SEQUENCE trigger_seq;


--DROP TRIGGER
DROP TRIGGER project_tg;
DROP TRIGGER gp_work_tg;
DROP TRIGGER insert_timeline_tg;
DROP TRIGGER delete_timeline_tg


--USE USERINFO
CREATE SEQUENCE UI_SEQ 
START WITH 0000001
MAXVALUE 0999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USER POSITION
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

--USE LOOPS
CREATE SEQUENCE LOOP_SEQ 
START WITH 0000001
MAXVALUE 0999999
INCREMENT BY 1
NOCACHE
NOCYCLE;

--USE Trigger
CREATE SEQUENCE trigger_seq;

--부서 테이블
CREATE TABLE CP_DEPARTMENT
(
  DEPNUM NUMBER(4) PRIMARY KEY --부서번호 (주키)
  ,DEPNAMEKR varchar2(30)
  ,typeAlias VARCHAR2(20)
);
--직함 테이블
CREATE TABLE CP_POSITION
(
  POSITIONNUM NUMBER(4) PRIMARY KEY
  ,POSITIONNAME VARCHAR2(30) UNIQUE
);

--알림용 테이블
CREATE table triggerinfo(
trigger_num number PRIMARY KEY,--트리거 번호(알림번호) (주키)
info_type varchar2(200) not null,--알림 종류
info_num number not null,--알림의 고유번호
info_content varchar2(200),--알림 내용
update_date date DEFAULT sysdate,--발생일
command_check varchar2(200)--알림내용(동작체크용)
loginOk number default 0 --로그인 확인용
);

--유저 정보
CREATE TABLE USERINFO 
(
  USERID VARCHAR2(20) PRIMARY KEY --아이디 (주키)
, Email VARCHAR2(30) NOT NULL --이메일
, Name VARCHAR2(20) NOT NULL --이름
, PASSWORD VARCHAR2(20) NOT NULL --비밀번호
, DEPARTMENT varchar2(30) NOT NULL --부서
, POSITION VARCHAR2(30) NOT NULL --직함
, ORIGINALFILE VARCHAR2(30) --프로필사진 이름
, SAVEFILE VARCHAR2(100) --프로필사진 경로
, loginok
);

--개인스케줄
CREATE TABLE PS_WORK
( 
  PS_NUM NUMBER(7) PRIMARY KEY --개인스케줄 번호(주키)
  ,PS_NAME VARCHAR2(30) NOT NULL --개인스케줄 이름
  ,PS_CONTENT VARCHAR2(500) --개인스케줄 내용
  ,MEMBERID VARCHAR2(30) --유저 ID (외래키)
  ,STARTDATE DATE DEFAULT(SYSDATE) --시작일
  ,DEADLINE DATE NOT NULL --마감일
  ,PS_PRI NUMBER(1) NOT NULL --중요도
  ,PROGRESS NUMBER(1) DEFAULT(0) --진행도
  ,CONSTRAINT FK_PW_ID FOREIGN KEY(MEMBERID) --외래키 설정 UserInfo의 memberId를 참조
   REFERENCES USERINFO(USERID)
   ON DELETE CASCADE
  ,CONSTRAINT CK_PW_PP CHECK(PS_PRI BETWEEN 0 AND 4) --체크 중요도는 0~4
);

--체크리스트
CREATE TABLE CKLIST
(
 CL_NUM NUMBER(7) PRIMARY KEY --체크리스트 번호 (주키)
 ,CL_NAME VARCHAR2(30) NOT NULL --체크리스트 이름
 ,MEMBERID VARCHAR2(30) NOT NULL --유저 ID (외래키)
 ,CONSTRAINT FK_CK_ID FOREIGN KEY(MEMBERID) --외래키 설정 UserInfo의 memberId를 참조
  REFERENCES USERINFO(USERID)
  ON DELETE CASCADE
);

--체크리스트 반복상태 테이블
CREATE TABLE CK_LOOPS(	
  LOOPNUM NUMBER(7,0) PRIMARY KEY --반복생태 번호(주키)
  ,LOOPDAY NUMBER(7,0) NOT NULL --반복할 요일
  ,LOOP_STATE NUMBER(1) DEFAULT(0) NOT NULL --상태
  ,CL_NUM NUMBER(7,0) NOT NULL --체크리스트 번호(외래키)
  ,CONSTRAINT FK_LP_CN FOREIGN KEY(CL_NUM) --외래키 설정 CKLIST의 CL_NUM참조
  REFERENCES CKLIST(CL_NUM) ON DELETE CASCADE
);


--프로젝트 테이블
CREATE TABLE PRJLIST
(
  PRJ_NUM NUMBER(7) PRIMARY KEY --프로젝트 번호 (주키)
  ,PRJ_NAME VARCHAR2(30) --프로젝트 이름
  ,PLANNER VARCHAR2(30) --기획자
  ,ACCESS_CONTROL NUMBER(1) --접근권한 0or1 0: 1:
  ,BACKGROUND VARCHAR2(500) --배경색 설정
  ,CONSTRAINT CK_PL_AC CHECK(ACCESS_CONTROL IN(0,1))
);

--프로젝트와 유저 관계도 테이블
CREATE TABLE MATCHPRJ
(
  MEMBERID VARCHAR2(20)NOT NULL --유저 ID(외래키)
  ,PRJ_NUM NUMBER(7)NOT NULL --프로젝트 번호(외래키)
  ,CONSTRAINT FK_PRJN FOREIGN KEY(PRJ_NUM) --외래키 설정 PRJLIST의 PRJ_Num 참조
  REFERENCES PRJLIST(PRJ_NUM)
  ON DELETE CASCADE
  ,CONSTRAINT FK_MEI FOREIGN KEY(MEMBERID) --외래키 설정 UserInfo의 UserID 참조
  REFERENCES USERINFO(USERID) 
  ON DELETE CASCADE
);

--그룹 테이블
CREATE TABLE PJ_GROUP
(
  GP_NUM NUMBER(7) PRIMARY KEY --그룹 번호 (주키)
  ,GP_NAME VARCHAR2(30) NOT NULL -- 그룹 이름
  ,PRJ_NUM NUMBER(7) NOT NULL --프로젝트 번호(외래키)
  ,CONSTRAINT FK_GP_PRJN FOREIGN KEY(PRJ_NUM) --외래키 설정 PrjList의 PRJ_Num 참조
  REFERENCES PRJLIST(PRJ_NUM)
  ON DELETE CASCADE
);

--타임라인 테이블
CREATE TABLE TIMELINE
(
  TL_NUM NUMBER(7) PRIMARY KEY --타임라인 번호 주키
  ,PRJ_Num NUMBER(7) NOT NULL --프로젝트 번호(외래키)
  ,WRITER VARCHAR2(20) NOT NULL --작성자(외래키)
  ,W_DATE TIMESTAMP DEFAULT(SYSDATE) --작성일
  ,TL_CONTENT VARCHAR2(500) NOT NULL --타임라인 내용
  ,CONSTRAINT FK_TL_GN FOREIGN KEY(PRJ_Num) REFERENCES PRJLIST(PRJ_Num) --외래키 설정 PRJLIST의 PRJ_Num 참조
  ON DELETE CASCADE
  ,CONSTRAINT FK_TL_WR FOREIGN KEY(WRITER) REFERENCES USERINFO(USERID) --외래키 설정 UserInfo의 UserID 참조
  ON DELETE SET NULL
);

--파일 관리 테이블
CREATE TABLE FILEINFO
(
  PRJ_NUM NUMBER(7) --프로젝트 번호(외래키)
  ,ORIGINALFILE VARCHAR2(100) NOT NULL --파일 이름
  ,SAVEFILE VARCHAR2(300) PRIMARY KEY --파일경로
  ,CONSTRAINT FK_FI_TN FOREIGN KEY(PRJ_NUM) REFERENCES PRJLIST(PRJ_NUM) --외래키 설정 PRJLIST의 PRJ_Num 참조
  ON DELETE CASCADE
);

--그룹 스케줄
CREATE TABLE GP_WORK
(
  GS_NUM NUMBER(7) PRIMARY KEY --스케줄 번호
  ,GS_NAME VARCHAR2(30) NOT NULL --스케줄 이름
  ,GP_NUM NUMBER(7) NOT NULL --그룹 번호(외래키)
  ,GS_CONTENT VARCHAR2(500) --스케줄 내용
  ,START_DATE DATE DEFAULT(SYSDATE) --시작일
  ,DEADLINE DATE NOT NULL --마감일
  ,GP_PRI NUMBER(1) NOT NULL --중요도
  ,PROGRESS NUMBER(3) DEFAULT(0) --진행도 0 or 1 
  ,CONSTRAINT FK_GW_GN FOREIGN KEY(GP_NUM) --외래키 설정 PJ_Group의 GP_Num 참조
   REFERENCES PJ_GROUP(GP_NUM)
   ON DELETE CASCADE
  ,CONSTRAINT CK_GW_PG CHECK(PROGRESS IN (0,1))
  ,CONSTRAINT CK_GW_PP CHECK(GP_PRI BETWEEN 0 AND 4)
);

--스케줄 담당자 테이블
CREATE TABLE MATCH_GP_WORK 
(
  GS_NUM NUMBER(7, 0) --스케줄 번호(외래키)
  ,USERID VARCHAR2(20) --담당자
  ,CONSTRAINT FK_MGW_GN FOREIGN KEY(GS_NUM) --외래키 설정 GP_WORK의 GS_Num 참조
   REFERENCES GP_WORK(GS_NUM)
   ON DELETE CASCADE
); 


--여기서부터는 트리거

--프로젝트 생성 알림용 트리거
create OR REPLACE trigger project_tg
 BEFORE
  INSERT OR UPDATE OR DELETE ON prjlist
  FOR EACH ROW
BEGIN
INSERT INTO TRIGGERINFO(
  trigger_num
  ,info_type
  ,info_num
  ,info_content
  ,update_date
  ,command_check
) values(
  trigger_seq.nextval
  ,'prjList'
  ,:new.prj_num
  ,:new.prj_name
  ,sysdate
  ,:old.prj_name
);
END;
     
     
--그룹스케줄 생성 알림용 트리거  
create or replace trigger gp_work_tg
BEFORE
  INSERT OR UPDATE OR DELETE ON gp_work
  FOR EACH ROW
BEGIN
INSERT INTO TRIGGERINFO(
  trigger_num
  ,info_type
  ,info_num
  ,info_content
  ,update_date
  ,command_check
) values (
  trigger_seq.nextval
  ,'gp_Work'
  ,:new.gs_num
  ,:new.gs_name
  ,sysdate
  ,:old.gs_name);
END;


--타임라인 생성시 알림
create or replace trigger insert_timeline_tg
BEFORE
  INSERT ON prjlist
  FOR EACH ROW
BEGIN
insert into timeline(
  prj_num
  ,tl_content
  ,tl_num
  ,w_date
  ,writer
)values(
  :new.prj_num
  ,:new.access_control
  ,tl_seq.nextval
  ,sysdate
  ,:new.planner
);
END;

--타임라인 삭제시 알림
create or replace trigger delete_timeline_tg
BEFORE
  DELETE ON prjlist
  FOR EACH ROW
BEGIN
insert into timeline(
  prj_num
  ,tl_content
  ,tl_num
  ,w_date
  ,writer
)values(
  :old.prj_num
  ,'del_tl'
  ,tl_seq.nextval
  ,sysdate
  ,:old.planner
);
END;