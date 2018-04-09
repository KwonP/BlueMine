package com.bluemine.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.bluemine.www.interfaces.GP_WorkMapper;
import com.bluemine.www.vo.GP_Work;

public class GP_WorkDAO implements GP_WorkMapper {
	@Inject
	SqlSession session;

	// 그룹 스케줄 생성
	@Override
	public int insertGP_Work(GP_Work gpw) {
		int result = session.getMapper(GP_WorkMapper.class).insertGP_Work(gpw);
		return result;
	}

	// 그룹 스케줄 수정
	@Override
	public int updateGP_Work(GP_Work qpw) {
		int result = session.getMapper(GP_WorkMapper.class).updateGP_Work(qpw);
		return result;
	}

	// 그룹 스케줄 삭제
	@Override
	public int deleteGP_Work(GP_Work gpw) {
		int result = session.getMapper(GP_WorkMapper.class).deleteGP_Work(gpw);
		return result;
	}

	// 그룹 스케줄 목록
	// ex)디폴트 {'gs_Num':gs_Num, 'sort':null} 진행도순 {'gs_Num':gs_Num, 'sort':'progress'}
	@Override
	public ArrayList<GP_Work> getListGP_Work(HashMap<String, Object> map) {
		ArrayList<GP_Work> list = session.getMapper(GP_WorkMapper.class).getListGP_Work(map);
		return list;
	}
}
