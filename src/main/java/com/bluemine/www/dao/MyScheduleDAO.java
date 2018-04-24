package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluemine.www.interfaces.MyScheduleMapper;
import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.CK_Show;
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
	public ArrayList<CK_Show> showCKList(String userId) {
		return session.getMapper(MyScheduleMapper.class).showCKList(userId);
	}

	@Override
	public int checkLoop(int loopNum) {
		return session.getMapper(MyScheduleMapper.class).checkLoop(loopNum);
	}

	@Override
	public int uncheckLoop(int loopNum) {
		return session.getMapper(MyScheduleMapper.class).uncheckLoop(loopNum);
	}

	@Override
	public int resetLoop(int cl_Num) {
		return session.getMapper(MyScheduleMapper.class).resetLoop(cl_Num);
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

	@Override
	public ArrayList<PS_Work> getWorkList(String userId) {
		return session.getMapper(MyScheduleMapper.class).getWorkList(userId);
	}

	@Override
	public PS_Work getWork(int ps_Num) {
		return session.getMapper(MyScheduleMapper.class).getWork(ps_Num);
	}


}
