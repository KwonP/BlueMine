package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluemine.www.interfaces.ProjectMapper;
import com.bluemine.www.vo.PRJList;

@Repository
public class ProjectDAO{
	
	@Inject
	SqlSession session;
	
	//프로젝트 생성
	public int makePrj(PRJList list) {
		int result=0;
		result=session.getMapper(ProjectMapper.class).makePrj(list);
		return result;
	}
	//프로젝트 수정,배경도 포함
	public int updatePrj(PRJList list) {
		int result=0;
		result=session.getMapper(ProjectMapper.class).updatePrj(list);
		return result;
	}
	//프로젝트 삭제
	public int deletePrj(PRJList list) {
		int result=0;
		result=session.getMapper(ProjectMapper.class).deletePrj(list);
		return result;
	}
	//프로젝트 목록(참여중인 프로젝트) 생성된 순
	public ArrayList<PRJList> getPrjList(String userId) {
		ArrayList<PRJList> list=new ArrayList<>();
		list=session.getMapper(ProjectMapper.class).getPrjList(userId);
		return list;
	}
	//프로젝트 목록(접근 권한 public)
	public ArrayList<PRJList> getPPrjList() {
		ArrayList<PRJList> list=new ArrayList<>();
		list=session.getMapper(ProjectMapper.class).getPPrjList();
		return list;
	}
	
}
