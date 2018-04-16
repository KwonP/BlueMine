package com.bluemine.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.bluemine.www.interfaces.groupMapper;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;

//개인,그룹스케줄 및 체크리스트 관리
public class GroupDAO implements groupMapper {
	@Inject
	SqlSession session;

	//그룹생성
	@Override
	public int addGroup(PJ_Group group) {
		int result=0;
		result=session.getMapper(groupMapper.class).addGroup(group);
		return result;
	}
	//그룹수정
	@Override
	public int updateGroup(PJ_Group group) {
		int result=0;
		result=session.getMapper(groupMapper.class).updateGroup(group);
		return result;
	}
	//그룹리스트 가져오기
	@Override
	public ArrayList<PJ_Group> getGpList(int prj_Num) {
		ArrayList<PJ_Group> list=new ArrayList<>();
		list=session.getMapper(groupMapper.class).getGpList(prj_Num);
		return list;
	}
	// 그룹 스케줄 생성
	@Override
	public int insertGP_Work(GP_Work gpw) {
		int result = session.getMapper(groupMapper.class).insertGP_Work(gpw);
		return result;
	}

	// 그룹 스케줄 수정
	@Override
	public int updateGP_Work(GP_Work qpw) {
		int result = session.getMapper(groupMapper.class).updateGP_Work(qpw);
		return result;
	}

	// 그룹 스케줄 삭제
	@Override
	public int deleteGP_Work(GP_Work gpw) {
		int result = session.getMapper(groupMapper.class).deleteGP_Work(gpw);
		return result;
	}

	// 그룹 스케줄 목록
	// ex)디폴트 {'gs_Num':gs_Num, 'sort':null} 진행도순 {'gs_Num':gs_Num, 'sort':'progress'}
	@Override
	public ArrayList<GP_Work> getListGP_Work(HashMap<String, Object> map) {
		ArrayList<GP_Work> list = session.getMapper(groupMapper.class).getListGP_Work(map);
		return list;
	}

	

	
}
