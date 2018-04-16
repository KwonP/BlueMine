package com.bluemine.www.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bluemine.www.interfaces.UserInfoMapper;
import com.bluemine.www.vo.CKList;
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
	public int leave(String password) {
		return session.getMapper(UserInfoMapper.class).leave(password);
	}

	@Override
	public int addPsWork(PS_Work work) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<PS_Work> getPsWList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addCkList(CKList cl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCkList(CKList cl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delCkList(CKList cl) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<CKList> getCKList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
