package com.bluemine.www.interfaces;

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
}
