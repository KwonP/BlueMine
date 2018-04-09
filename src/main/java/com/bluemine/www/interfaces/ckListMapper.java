package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.CKList;

public interface ckListMapper {

	//체크리스트 추가
	public int addCkList(CKList cl);
	//체크리스트 수정
	public int updateCkList(CKList cl);
	//체크리스트 삭제
	public int delCkList(CKList cl);
	//체크리스트 조회
	public ArrayList<CKList> getCKList(String memberId);
	
}
