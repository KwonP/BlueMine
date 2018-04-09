package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.CP_Department;

public interface departmentMapper {

	//부서추가
	public int addDep(CP_Department dep);
	//부서 조회
	public ArrayList<CP_Department> getDepList();
	//부서 삭제
	public int delDep(CP_Department dep);
}
