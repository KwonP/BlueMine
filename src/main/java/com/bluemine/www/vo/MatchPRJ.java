package com.bluemine.www.vo;

//회원들의 프로젝트 담당현황을 알기위한 VO
public class MatchPRJ {
	private String memberId;//회원ID
	private int prjNum;//프로젝트 번호
	
	public MatchPRJ() {
		super();
	}
	public MatchPRJ(String memberId, int prjNum) {
		super();
		this.memberId = memberId;
		this.prjNum = prjNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPrjNum() {
		return prjNum;
	}
	public void setPrjNum(int prjNum) {
		this.prjNum = prjNum;
	}
	@Override
	public String toString() {
		return "MatchPRJ [memberId=" + memberId + ", prjNum=" + prjNum + "]";
	}
	
	
}
