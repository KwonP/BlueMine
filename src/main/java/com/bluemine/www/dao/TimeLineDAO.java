package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.bluemine.www.interfaces.TimeLineMapper;
import com.bluemine.www.vo.TimeLine;

public class TimeLineDAO implements TimeLineMapper{

	@Inject
	SqlSession session;
	
	//타임 라인 글 추가
	@Override
	public int insertTimeLine(TimeLine t) {
		int result = session.getMapper(TimeLineMapper.class).insertTimeLine(t);
		return result;
	}
	//타임 라인 글목록 가져오기(그룹 번호로)
	@Override
	public ArrayList<TimeLine> getTimeLineList(int gp_Num) {
		ArrayList<TimeLine> list = session.getMapper(TimeLineMapper.class).getTimeLineList(gp_Num);
		return list;
	}
	//타임 라인 글 삭제(게시글 번호로)
	@Override
	public int deleteTimeLine(int tl_Num) {
		int result = session.getMapper(TimeLineMapper.class).deleteTimeLine(tl_Num);
		return result;
	}
	//타임 라인 글 수정
	@Override
	public int updateTimeLine(TimeLine t) {
		int result = session.getMapper(TimeLineMapper.class).updateTimeLine(t);
		return result;
	}

}
