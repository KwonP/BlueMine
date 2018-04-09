package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.PJ_Group;

public interface groupMapper {

	//그룹추가
	public int addGroup(PJ_Group group);
	//그룹 업데이트
	public int updateGroup(PJ_Group group);
	//그룹 조회
	public ArrayList<PJ_Group> getGpList(int prj_Num);
}
