package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.CP_Department;
import com.bluemine.www.vo.CP_Position;

public interface PositionMapper {
	
	//직급추가
	public int addPosition(CP_Position posi);
	//직함명 조회
	public ArrayList<CP_Position> getPosiList();
	//직함 삭제
	public int deletePosition(CP_Position posi);
	//부서추가
	public int addDep(CP_Department dep);
	//부서 조회
	public ArrayList<CP_Department> getDepList();
	//부서 삭제
	public int delDep(CP_Department dep);
}
