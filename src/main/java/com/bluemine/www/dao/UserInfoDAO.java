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

}
