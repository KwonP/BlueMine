package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluemine.www.interfaces.MyScheduleMapper;
import com.bluemine.www.vo.CKList;

@Repository
public class MyScheduleDAO implements MyScheduleMapper{

	@Inject
	SqlSession session;
	
	@Override
	public ArrayList<CKList> getCKList(String id) {
		return session.getMapper(MyScheduleMapper.class).getCKList(id);
	}

	@Override
	public int updateLoops(int cl_num) {
		return session.getMapper(MyScheduleMapper.class).updateLoops(cl_num);
	}

	@Override
	public int updateCKList(CKList ckList) {
		return session.getMapper(MyScheduleMapper.class).updateCKList(ckList);
	}

	@Override
	public int deleteCKList(int cl_num) {
		return session.getMapper(MyScheduleMapper.class).deleteCKList(cl_num);
	}

}
