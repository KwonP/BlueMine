package com.bluemine.www.interfaces;

import java.util.ArrayList;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.MatchGP_Work;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.TimeLine;

/**
 * 일감 관련 Mybatis 사용 메서드
 */
public interface TaskMapper {

	//prjNum이 같은 pj_group 가져오기
	public PJ_Group selectGroup(int prjNum);

	//gp_Num이 같은  모든 Task 가져오기
	public ArrayList<GP_Work> printTask(int gp_Num);

	//gp_work의 데이터를 테이블에 모두 삽입
	public int insertTask(GP_Work gp_work);

	//progreess 상태 변경
	public int updateProgress(GP_Work gp_work);

	//메모 추가
	public int insertMemo(TimeLine timeline);

	//개인이 속한 모든 그룹 가져오기
	public MatchGP_Work selectMatchgpWork(String getId);

	//매칭된 모든 작업들 가져오기
	public ArrayList<GP_Work> selectGpwork(int gs_Num);

	//해당 프로젝트의 타임라인 가져오기 가져오기
	public ArrayList<TimeLine> selectTimeLine(int prj_Num);

	public ArrayList<PJ_Group> selectAllGroups(int prj_Num);

	public  ArrayList<GP_Work> selectEachGpworks(int gp_Num);

	public String selectPrjName(int prj_Num);
	
	
}