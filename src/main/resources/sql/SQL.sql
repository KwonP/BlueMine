
--회원추가 초기 생성시에는 채팅목록 존재X
INSERT INTO USERINFO(
    USERID
    , Email
    , Name
    , PASSWORD
    , DEPARTMENT
    , POSITION
    <if test="ORIGINALFILE != null AND SAVEFILE != null">
    , ORIGINALFILE
    , SAVEFILE
     </if>
)VALUES(
    CONCAT(#{id},UI_SEQ.nextval)
    , #{eamil}
    , #{name}
    , #{password}
    , #{department}
    , #{position}
    <if test="originalFile != null AND svaeFile != null">
    , #{originalFile}
    , #{svaeFile}
    </if>
);

--부서 추가
INSERT INTO CP_DEPARTMENT
(
    DEPNameEN
    ,DEPNAMEKR
    ,typeAlias
)VALUES(
    #{depNameEn}
    ,#{depNameKr}
    ,#{typeAlias}
);

--직함 추가
INSERT INTO CP_POSITION(
    POSITIONNAME
)VALUES(
    #{positionName}
);

--태그 추가
INSERT INTO HORSEHEAD(
    TAGNUM
    ,TAGTITLE
    ,TAGTYPE
)VALUES(
    HH_SEQ.NEXTVAL
    ,#{tagTitle}
    ,#{tagType}
);

--프로젝트 추가
INSERT INTO PRJLIST
(
    PRJ_NUM
    ,PRJ_NAME
    ,PLANNER
    ,ACCESS_CONTROL
    ,INVITECODE
)VALUES(
    PL_SEQ.NEXTVAL
    ,#{prj_Name}
    ,#{planner}
    ,#{access_Control}
    ,#{inviteCode}
);

--회원의 프로젝트 참여현황 추가
INSERT INTO MATCHPRJ(
    MEMBERID
    ,PRJ_NUM
)VALUES(
    #{memberId}
    ,#{prj_Num}
);

--프로젝트내 그룹(일감)추가
INSERT INTO PJ_GROUP(
    GP_NUM
    ,PRJ_NUM
    ,GP_NAME
)VALUES(
    GP_SEQ.NEXTVAL
    ,#{prj_Num}
    ,#{gp_Name}
);

--그룹내에 타임라인 추가
INSERT INTO TIMELINE(
    TL_NUM
    ,GP_NUM
    ,WRITER
    ,W_DATE
    ,TL_CONTENT
    <if test="tagTitle != null">
    ,TAGTITLE
    </if>
)VALUES(
    TL_SEQ.NEXTVAL
    ,#{gp_Num}
    ,#{writer}
    ,#{w_Date}
    ,#{tl_Content}
    <if test="tagTitle != null">
    ,#{tagTitle}
    </if>
);

--타임라인내의 파일처리
INSERT INTO FILEINFO(
    TL_NUM,
    ORIGINALFILE,
    SAVEFILE
)VALUES(
    #{tl_Num}
    ,#{originalFile}
    ,#{svaeFile}
);

--프로젝트 그룹스케줄 추가
INSERT INTO GP_WORK(
    GS_NUM
    ,GS_NAME
    ,GP_NUM
    ,GS_CONTENT
    ,DIRECTOR
    ,START_DATE
    ,DEADLINE
    <if test="RSTART_DATE != null">
    ,RSTART_DATE
    </if>
    <if test="RDEADLINE != null">
    ,RDEADLINE
    </if>
    ,GP_PRI
    <if test="PROGRESS != null">
    ,PROGRESS
    </if>
)VALUES(
    GS_SEQ.NEXTVAL
    ,#{gs_Name}
    ,#{gp_Num}
    ,#{gs_Content}
    ,#{direcotor}
    ,#{start_Date}
    ,#{deadLine}
    <if test="rStart_Date != null">
    ,#{rStart_Date}
    </if>
    <if test="rDeadLine != null">
    ,#{rDeadLine}
    </if>
    ,#{gp_Pri}
    <if test="PROGRESS != null">
    ,#{progress}
    </if>
);

--개인 스케줄 추가
INSERT INTO PS_WORK(
    PS_NUM
    ,PS_NAME
    ,PS_CONTENT
    ,MEMBERID
    ,START_DATE
    ,DEADLINE
    <if test='rStart_Date != null'>
    ,RSTART_DATE
    </if>
    <if test='rDeadLine != null'>
    ,RDEADLINE
    </if>
)VALUES(
    PS_SEQ.NEXTVAL
    ,#{PS_NAME}
    ,#{PS_CONTENT}
    ,#{MEMBERID}
    ,#{START_DATE}
    ,#{DEADLINE}
    <if test='rStart_Date != null'>
    ,#{rStart_Date}
    </if>
    <if test='rDeadLine != null'>
    ,#{rDeadLine}
    </if>
);

--체크리스트 생성
INSERT INTO CKLIST(
    CL_NUM
    ,CL_NAME
    ,MEMBERID
    ,CK_CONTENT
    ,LOOPS
)VALUES(
    CL_SEQ.NEXTVAL
    ,#{cl_Name}
    ,#{memberId}
    ,#{ck_content}
    ,#{loops}
);

--부서 관리 테이블에서 부서 가져오기
SELECT depNameEn,depNameKr, typeAlias
FROM CP_DEPARTMENT

--직급 관리 테이블에서 직급 가져오기
SELECT POSITIONNAME
FROM CP_POSITION

--개인 스케줄 호출
Select
    ps_Name
    ,ps_Content
    ,memberId
    ,start_Date
    ,deadLine
    <if test='rStart_Date != null'>
    ,rStart_Date
    </if>
    <if test='rDeadLine != null'>
    ,rDeadLine
    </if>
FROM
    PS_WORK
Where
    memberId = #{memberId}

--프로젝트 리스트 호출
Select
    prj_Num
    ,prj_Name
    ,planner
    ,access_Control
    ,inviteCode
FROM
    PRJLIST as pl
    ,(
        select prj_Num
          from USERINFO as ui
          ,MATCHPRJ as pj
         where 
            ui.USERID =#{USERID}
            AND
            pj.USERID = ui.USERID
    ) as re
Where
    pl.prj_Num = re.prj_Num

--그룹 내 스케줄 호출
select 
    gs_Num
    ,gs_Name
    ,gp_Num
    ,direcotor
    ,start_Date
    ,deadLine
    ,rStart_Date
    ,rDeadLine
    ,gp_Pri
    ,progress
    ,gs_Content
from 
    GP_WORK as gw
    ,(
        select gp_Num
          from
            PJ_GROUP
         where
            prj_Num=#{prj_Num}
    )as re
where
    gw.gp_Num=re.gp_Num
--정렬이 필요할시
--중요도 오름차순
--order by gp_Pri
--중요도 내림차순
--order by gp_Pri desc
--스케줄 번호 오름차순
--order by gs_Num
--스케불 번호 내림차순
--order by gs_Num desc
--진행도 오름차순
--order by progress
--진행도 내림차순
--order by progress desc
--시작일 오름차순
--order by startDate
--시작일 내림차순
--order by startDate desc
--종료일 오름차
--order by deadLine
--종료일 내림차
--order by deadLine desc


--그룹(일감)내 타임라인 호출
select
    tl_Num
    ,gp_Num
    ,writer
    ,w_Date
    ,tl_Content
    ,tagTitle
from TIMELINE
where
    gp_Num=#{gp_Num}
order by w_Date

--타임라인 내 파일 호출
select
    tl_Num
    ,originalFile
    ,svaeFile
from
    FILEINFO
Where
    tl_Num=#{tl_Num}
order by
    svaeFile