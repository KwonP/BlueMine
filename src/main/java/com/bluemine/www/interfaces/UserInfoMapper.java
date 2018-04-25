package com.bluemine.www.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.CP_Department;
import com.bluemine.www.vo.CP_Position;
import com.bluemine.www.vo.PS_Work;
import com.bluemine.www.vo.UserInfo;

public interface UserInfoMapper {
	
		// 가입
		public int join(UserInfo user);
		// 이메일 중복체크
		public String emailCheck(String email);
		// 회원정보 불러오기 (id&pw찾기)
		public String findPw(String email);
		// 회원정보 불러오기 (회원정보 수정)
		public UserInfo getInfo(String userId);
		// 프로필사진 불러오기 (프로필 사진 수정)
		public UserInfo getProfile(String userId);
		// 회원 정보 수정
		public int updateUser(UserInfo user);
		// 프로필 사진 수정
		public int updateProfile(UserInfo user);
		// 로그인
		public String login(UserInfo user);
		// 탈퇴
		public int leave(String password);
		//개인 스케줄 추가
		public int addPsWork(PS_Work work);
		//개인 스케줄 조회(시작일순)
		public ArrayList<PS_Work> getPsWList(String memberId);
		//체크리스트 추가
		public int addCkList(CKList cl);
		//체크리스트 수정
		public int updateCkList(CKList cl);
		//체크리스트 삭제
		public int delCkList(CKList cl);
		//체크리스트 조회
		public ArrayList<CKList> getCKList(String memberId);
		// 부서명 불러오기
		public ArrayList<CP_Department> getDepartmentList();
		// 직급 불러오기
		public ArrayList<CP_Position> getPositionList();
		//ajax자동완성 기능을 위한 목록 부르기
		public ArrayList<UserInfo> getUser(HashMap<String, String> map);
}
