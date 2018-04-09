package com.bluemine.www.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import com.bluemine.www.vo.GP_Work;

public interface GP_WorkMapper {

	// 그룹 스케줄 생성
	public int insertGP_Work(GP_Work gpw);

	// 그룹 스케줄 수정
	public int updateGP_Work(GP_Work qpw);

	// 그룹 스케줄 삭제
	public int deleteGP_Work(GP_Work gpw);

	// 그룹 스케줄 목록
	// ex)디폴트 {'gs_Num':gs_Num, 'sort':null} 진행도순 {'gs_Num':gs_Num,
	// 'sort':'progress'}
	public ArrayList<GP_Work> getListGP_Work(HashMap<String, Object> map);
}
