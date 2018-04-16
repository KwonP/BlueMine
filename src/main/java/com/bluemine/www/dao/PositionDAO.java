package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.bluemine.www.interfaces.PositionMapper;
import com.bluemine.www.vo.CP_Department;
import com.bluemine.www.vo.CP_Position;

public class PositionDAO implements PositionMapper{

	@Inject
	SqlSession session;
	
	//직급추가
	@Override
	public int addPosition(CP_Position posi) {
		int result=0;
		result=session.getMapper(PositionMapper.class).addPosition(posi);
		return result;
	}

	//직함명 조회
	@Override
	public ArrayList<CP_Position> getPosiList() {
		ArrayList<CP_Position> list=new ArrayList<>();
		list=session.getMapper(PositionMapper.class).getPosiList();
		return list;
	}

	//직함 삭제
	@Override
	public int deletePosition(CP_Position posi) {
		int result=0;
		result=session.getMapper(PositionMapper.class).deletePosition(posi);
		return result;
	}

	//부서추가
	@Override
	public int addDep(CP_Department dep) {
		int result=0;
		result=session.getMapper(PositionMapper.class).addDep(dep);
		return result;
	}

	//부서 조회
	@Override
	public ArrayList<CP_Department> getDepList() {
		ArrayList<CP_Department> list=new ArrayList<>();
		list=session.getMapper(PositionMapper.class).getDepList();
		return list;
	}

	//부서 삭제
	@Override
	public int delDep(CP_Department dep) {
		int result=0;
		result=session.getMapper(PositionMapper.class).delDep(dep);
		return result;
	}
	
		
}
