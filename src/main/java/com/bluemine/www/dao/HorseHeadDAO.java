package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluemine.www.interfaces.horseHeadMapper;
import com.bluemine.www.vo.HorseHead;

@Repository
public class HorseHeadDAO implements horseHeadMapper{

	@Inject
	SqlSession session;
	
	//말머리 추가
	@Override
	public int addHorseHead(HorseHead hoHead) {
		int result=0;
		result = session.getMapper(horseHeadMapper.class).addHorseHead(hoHead);
		return result;
	}

	//전체말머리 가져오기
	@Override
	public ArrayList<HorseHead> getAll() {
		ArrayList<HorseHead> list = new ArrayList<>();
		list = session.getMapper(horseHeadMapper.class).getAll();
		return list;
	}

	//한종류의 말머리 가져오기
	@Override
	public ArrayList<HorseHead> getOneType(int tagType) {
		ArrayList<HorseHead> list = new ArrayList<>();
		list = session.getMapper(horseHeadMapper.class).getOneType(tagType);
		return list;
	}

}
