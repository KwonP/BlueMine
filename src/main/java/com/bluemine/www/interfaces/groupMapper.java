package com.bluemine.www.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;

public interface GroupMapper {

	//그룹추가
	public int addGroup(PJ_Group group);
	//그룹 업데이트
	public int updateGroup(PJ_Group group);
	//그룹 조회
	public ArrayList<PJ_Group> getGpList(int prj_Num);
	// 그룹 스케줄 생성
	public int insertGP_Work(GP_Work gpw);
	// 그룹 스케줄 수정
	public int updateGP_Work(GP_Work gpw);
	// 그룹 스케줄 삭제
	public int deleteGP_Work(GP_Work gpw);
	// 그룹 스케줄 목록
	// ex)디폴트 {'gs_Num':gs_Num, 'sort':null} 진행도순 {'gs_Num':gs_Num,
	// 'sort':'progress'}
	public ArrayList<GP_Work> getListGP_Work(HashMap<String, Object> map);
}
