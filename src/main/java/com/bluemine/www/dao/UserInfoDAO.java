package com.bluemine.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluemine.www.interfaces.UserInfoMapper;
import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.CP_Department;
import com.bluemine.www.vo.CP_Position;
import com.bluemine.www.vo.PS_Work;
import com.bluemine.www.vo.UserInfo;

@Repository
public class UserInfoDAO implements UserInfoMapper{

	@Inject
	SqlSession session;
	
	@Override
	public int join(UserInfo user) {
		return session.getMapper(UserInfoMapper.class).join(user);
	}

	@Override
	public String emailCheck(String email) {
		return session.getMapper(UserInfoMapper.class).emailCheck(email);
	}

	@Override
	public String findPw(String email) {
		return session.getMapper(UserInfoMapper.class).findPw(email);
	}

	@Override
	public UserInfo getInfo(String userId) {
		return session.getMapper(UserInfoMapper.class).getInfo(userId);
	}

	@Override
	public UserInfo getProfile(String userId) {
		return session.getMapper(UserInfoMapper.class).getProfile(userId);
	}

	@Override
	public int updateUser(UserInfo user) {
		return session.getMapper(UserInfoMapper.class).updateUser(user);
	}

	@Override
	public int updateProfile(UserInfo user) {
		return session.getMapper(UserInfoMapper.class).updateProfile(user);
	}

	@Override
	public String login(UserInfo user) {
		return session.getMapper(UserInfoMapper.class).login(user);
	}

	@Override
	public int leave(UserInfo user) {
		return session.getMapper(UserInfoMapper.class).leave(user);
	}

	@Override
	public int addPsWork(PS_Work work) {
		int result=0;
		result=session.getMapper(UserInfoMapper.class).addPsWork(work);
		return result;
	}

	@Override
	public ArrayList<PS_Work> getPsWList(String memberId) {
		ArrayList<PS_Work> list=new ArrayList<>();
		list=session.getMapper(UserInfoMapper.class).getPsWList(memberId);
		return list;
	}

	@Override
	public int addCkList(CKList cl) {
		int result=0;
		result=session.getMapper(UserInfoMapper.class).addCkList(cl);
		return result;
	}

	@Override
	public int updateCkList(CKList cl) {
		int result=0;
		result=session.getMapper(UserInfoMapper.class).updateCkList(cl);
		return result;
	}

	@Override
	public int delCkList(CKList cl) {
		int result=0;
		result=session.getMapper(UserInfoMapper.class).delCkList(cl);
		return result;
	}

	@Override
	public ArrayList<CKList> getCKList(String memberId) {
		ArrayList<CKList> list=new ArrayList<>();
		list=session.getMapper(UserInfoMapper.class).getCKList(memberId);
		return list;
	}

	@Override
	public ArrayList<CP_Department> getDepartmentList() {
		return session.getMapper(UserInfoMapper.class).getDepartmentList();
	}

	@Override
	public ArrayList<CP_Position> getPositionList() {
		return session.getMapper(UserInfoMapper.class).getPositionList();
	}

	@Override
	public void loginCheck(String id) {
		session.getMapper(UserInfoMapper.class).loginCheck(id);
	}

	@Override
	public void logOut(String id) {
		session.getMapper(UserInfoMapper.class).logOut(id);
	}

	@Override
	public ArrayList<UserInfo> selectLoginUsers(String userId) {
		return session.getMapper(UserInfoMapper.class).selectLoginUsers(userId);
	}
	//ajax자동완성 기능을 위한 목록 부르기
	@Override
	public ArrayList<UserInfo> getUser(HashMap<String, String> map) {
		ArrayList<UserInfo> list = new ArrayList<>();
		list = session.getMapper(UserInfoMapper.class).getUser(map);
		return list;
	}
	
	//사진 가져와서 세션에 넣기
	@Override
	public String getPic(String loginId) {
		String result;
		result=session.getMapper(UserInfoMapper.class).getPic(loginId);
		return result;
	}

}
