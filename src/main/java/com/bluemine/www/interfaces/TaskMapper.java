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
	
}