package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.CK_Loops;
import com.bluemine.www.vo.CK_Show;
import com.bluemine.www.vo.PS_Work;

public interface MyScheduleMapper {
	
	// 체크리스트 만들기(CKList)
	public int createCKList(CKList cklist);
	// 체크리스트 만들기(CK_Loops)
	public int createLoops(CK_Loops loops);
	// 체크리스트 가져오기
	public ArrayList<CKList> getCKList(String id);
	// 체크리스트 보여주기(요일에 따라)
	public ArrayList<CK_Show> showCKList(String userId);
	// 체크리스트 하나 가져오기(수정용)
	public ArrayList<CK_Show> getOneList(int cl_Num);
	// 체크리스트 요일별 완료
	public int checkLoop(int loopNum);
	// 체크리스트 요일별 완료 취소
	public int uncheckLoop(int loopNum);
	// 체크리스트 완료 초기화
	public int resetLoop(int cl_Num);
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
	// 작업리스트 가져오기
	public ArrayList<PS_Work> getWorkList(String userId);
	// 작업 가져오기
	public PS_Work getWork(int ps_Num);
}
