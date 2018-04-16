package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.MatchPRJ;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.PRJList;

public interface ProjectMapper {

	//프로젝트 생성
	public int makePrj(PRJList list);
	
	//프로젝트 수정,배경도 포함
	public int updatePrj(PRJList list);
	
	//프로젝트 삭제
	public int deletePrj(PRJList list);
	
	//프로젝트 목록(참여중인 프로젝트) 생성된 순
	public ArrayList<PRJList> getPrjList();
	
	//프로젝트 목록(접근 권한 public)
	public ArrayList<PRJList> getPPrjList();
	
	//회원, 프로젝트 관계 세팅
	public int setRelation(MatchPRJ mp);
	
	
}
