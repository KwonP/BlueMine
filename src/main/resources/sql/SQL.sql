
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
    DEPNum
    ,DEPNameEN
    ,DEPNAMEKR
    ,typeAlias
)VALUES(
    DP_SEQ.nextval
    ,#{depNameEn}
    ,#{depNameKr}
    ,#{typeAlias}
);
--부서 조회
SELECT 
	depNum
	,depNameEn
	,depNameKr
	,typeAlias
FROM CP_DEPARTMENT
--특정 부서만 조회
SELECT
    depNameEn
    ,depNameKr
    ,typeAlias
FROM
    CP_DEPARTMENT
WHERE
    depNum=#{depNum}
--부서 삭제
DELETE
FROM CP_DEPARTMENT
WHERE
	depNum=#{depNum}
--직함 추가
INSERT INTO CP_POSITION(
    PositionNum
    ,POSITIONNAME
)VALUES(
	posi_seq.nextval
    ,#{positionName}
);
--직급 조회
SELECT 
	positionNum
	,positionName
FROM CP_POSITION
Order By positionNum

--프로젝트 추가
<selectKey resultType="int" keyProperty="prj_Num" order="BEFORE">
SELECT
	PL_SEQ.NEXTVAL
FROM 
	dual
</selectKey>
INSERT INTO PRJLIST
(
    PRJ_NUM
    ,PRJ_NAME
    ,PLANNER
    ,ACCESS_CONTROL
    <if test="background != null">
    ,BACKGROUND
    </if>
)VALUES(
    #{prj_Num}
    ,#{prj_Name}
    ,#{planner}
    ,#{access_Control}
    <if test="background != null">
    ,#{background}
    </if>
)

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
)VALUES(
    TL_SEQ.NEXTVAL
    ,#{gp_Num}
    ,#{writer}
    ,#{w_Date}
    ,#{tl_Content}
);

--타임라인내의 파일처리
INSERT INTO FILEINFO(
    TL_NUM,
    ORIGINALFILE,
    SAVEFILE
)VALUES(
    #{tl_Num}
    ,#{originalFile}
    ,#{saveFile}
);
--타임라인 내 파일 호출
select
    tl_Num
    ,originalFile
    ,saveFile
from
    FILEINFO
Where
    tl_Num=#{tl_Num}
order by
    saveFile
--프로젝트 그룹스케줄 추가
<selectKey resultType="int" keyProperty="gs_Num" order="BEFORE">
SELECT
	GS_SEQ.NEXTVAL
FROM 
	dual
</selectKey>
INSERT INTO GP_WORK(
    GS_NUM
    ,GS_NAME
    ,GP_NUM
    ,GS_CONTENT
    ,DIRECTOR
    ,START_DATE
    ,DEADLINE
    ,GP_PRI
    <if test="PROGRESS != null">
    ,PROGRESS
    </if>
)VALUES(
    #{gs_Num}
    ,#{gs_Name}
    ,#{gp_Num}
    ,#{gs_Content}
    ,#{direcotor}
    ,#{start_Date}
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
)VALUES(
    PS_SEQ.NEXTVAL
    ,#{PS_NAME}
    ,#{PS_CONTENT}
    ,#{MEMBERID}
    ,#{START_DATE}
    ,#{DEADLINE}
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
--체크리스트 조회
SELECT
    CL_NUM
    ,CL_NAME
    ,MEMBERID
    ,CK_CONTENT
    ,LOOPS
FROM   
    CKLIST
WHERE
    memberId=#{memberId}
--개인 스케줄 호출
Select
    ps_Name
    ,ps_Content
    ,memberId
    ,start_Date
    ,deadLine
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

select p.prj_name,d.*,mp.MEMBERID

From pj_group e

join gp_work d
on e.GP_NUM=d.GP_NUM

join MATCH_GP_WORK j
on d.GS_NUM=j.GS_NUM

join prjlist p
on p.PRJ_NUM=e.prj_num

join matchPrj mp
on mp.MEMBERID=j.USERID;
