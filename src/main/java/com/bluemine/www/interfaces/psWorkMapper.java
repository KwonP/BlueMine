package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.PS_Work;

public interface psWorkMapper {
	
	//개인 스케줄 추가
	public int addPsWork(PS_Work work);
	//개인 스케줄 조회(시작일순)
	public ArrayList<PS_Work> getPsWList(String memberId);
	
}
