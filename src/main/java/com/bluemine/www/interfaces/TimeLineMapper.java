package com.bluemine.www.interfaces;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

public interface TimeLineMapper {
	
//타임 라인 글 추가	
public int insertTimeLine(TimeLine t);
//타임 라인 목록 가져오기(그룹 번호로)
public ArrayList<TimeLine> getTimeLineList(RowBounds rb);
//타임 라인 글 삭제(게시글 번호로)
public int deleteTimeLine(int tl_Num);
//타임 라인 글 수정
public int updateTimeLine(TimeLine t);
//파일 업로드
public int addFile(FileInfo file);
//파일 목록
public ArrayList<FileInfo> getFileList(int tl_Num);
//그룹별 타임라인 갯수
public int getTotal();
//프로젝트 참가인원 가져오기
public ArrayList<UserInfo> getUserList(int prj_Num);
//프로젝트 정보 가져오기
public PRJList getProjectInfo(int prj_Num);
//알림 정보 가져오기
public ArrayList<TriggerInfo> getTriggerInfo();
//알림 정보 삭제
public int deleteTriggerInfo(int trigger_Num);
//gp_Num으로 PJ_Group정보 가져오기
public PJ_Group getPJ_Group_Gp_Num(int gp_Num);
//gs_Num으로 GP_Work정보 가져오기
public GP_Work getGP_Work_Gs_Num(int gs_Num);

public HashMap<String, String> getGSInfo(HashMap<String, String> map);
}
