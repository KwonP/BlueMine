package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.HorseHead;

public interface HorseHeadMapper {

	//말머리 추가
	public int addHorseHead(HorseHead hoHead);
	//전체말머리 가져오기
	public ArrayList<HorseHead> getAll();
	//한종류의 말머리 가져오기
	public ArrayList<HorseHead> getOneType(int tagType);
}
