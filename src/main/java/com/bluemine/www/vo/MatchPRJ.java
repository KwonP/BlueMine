package com.bluemine.www.vo;

public class MatchPRJ {
	private String memberId;
	private int prjNum;
	
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
