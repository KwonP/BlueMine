package com.bluemine.www.vo;

public class UserInfo {
	private String userId;//사용자ID
	private String email;//이메일
	private String name;//이름
	private String password;//비밀번호
	private String department;//부서
	private String position;//직함
	private String originalFile;//프로필사진 이름
	private String saveFile;//프로필 사진 경로
	
	public UserInfo(String userId, String email, String name, String password, String department, String position) {
		super();
		this.userId = userId;
		this.email = email;
		this.name = name;
		this.password = password;
		this.department = department;
		this.position = position;
	}
	
	// 로그인을 위한 생성자
	public UserInfo(String email,String password){
		this.email = email;
		this.password = password;
	}
	
	public UserInfo() {
		super();
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getOriginalFile() {
		return originalFile;
	}
	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}
	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}

	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", email=" + email + ", name=" + name + ", password=" + password
				+ ", department=" + department + ", position=" + position + ", originalFile=" + originalFile
				+ ", saveFile=" + saveFile + "]";
	}
	
	
}
