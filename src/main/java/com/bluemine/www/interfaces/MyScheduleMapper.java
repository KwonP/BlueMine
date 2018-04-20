package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.PS_Work;

public interface MyScheduleMapper {
	
	// 체크리스트 가져오기
	public ArrayList<CKList> getCKList(String id);
	// 체크리스트 루프 수정 (요일체크, 혹은 초기화를 위해)
	public int updateLoops(int cl_num);
	// 체크리스트 수정(이름,내용,요일까지)
	public int updateCKList(CKList ckList);
	// 체크리스트 삭제
	public int deleteCKList(int cl_num);
	// work 만들기
	public int createWork(PS_Work work);
	// 작업수정
	public int updateWork(PS_Work work);
	// 작업 삭제
	public int deleteWork(int ps_Num);
	// 작업 완료
	public int finishWork(int ps_Num);
}
