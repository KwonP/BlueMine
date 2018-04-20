package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluemine.www.interfaces.MyScheduleMapper;
import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.PS_Work;

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

	@Override
	public int createWork(PS_Work work) {
		return session.getMapper(MyScheduleMapper.class).createWork(work);
	}

	@Override
	public int updateWork(PS_Work work) {
		return session.getMapper(MyScheduleMapper.class).updateWork(work);
	}

	@Override
	public int deleteWork(int ps_Num) {
		return session.getMapper(MyScheduleMapper.class).deleteWork(ps_Num);
	}

	@Override
	public int finishWork(int ps_Num) {
		return session.getMapper(MyScheduleMapper.class).finishWork(ps_Num);
	}

}
