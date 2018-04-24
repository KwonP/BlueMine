package com.bluemine.www.vo;

//회원들의 프로젝트 담당현황을 알기위한 VO
public class MatchPRJ {
	private String memberId;//회원ID
	private int prj_Num;//프로젝트 번호
	
	public MatchPRJ() {
		super();
	}
	public MatchPRJ(String memberId, int prj_Num) {
		super();
		this.memberId = memberId;
		this.prj_Num = prj_Num;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPrjNum() {
		return prj_Num;
	}
	public void setPrjNum(int prj_Num) {
		this.prj_Num = prj_Num;
	}
	@Override
	public String toString() {
		return "MatchPRJ [memberId=" + memberId + ", prj_Num=" + prj_Num + "]";
	}
	
	
}
