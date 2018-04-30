package com.bluemine.www.vo;

public class MatchGP_Work {

	private int gs_Num; //그룹 스케줄 번호
	private String userId; //담당자 ID
	
	public MatchGP_Work(int gs_Num, String userId) {
		super();
		this.gs_Num = gs_Num;
		this.userId = userId;
	}
	public MatchGP_Work() {
		super();
	}
	public int getGs_Num() {
		return gs_Num;
	}
	public void setGs_Num(int gs_Num) {
		this.gs_Num = gs_Num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Match_GP_Work [gs_Num=" + gs_Num + ", userId=" + userId + "]";
	}
	
	
}
