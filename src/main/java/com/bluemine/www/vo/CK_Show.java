package com.bluemine.www.vo;

public class CK_Show{
	private int loopNum;	//loop시퀀스
	private int loopDay;	// 요일별 반복
	private int loop_State;	// 완료 여부
	private int cl_Num;	//체크리스트 번호
	private String cl_Name;//체크리스트 이름
	private String memberId;//해당 회원 ID
	
	public CK_Show(){}
	public CK_Show(int loopNum,int loopDay,int loop_State,int cl_Num, String cl_Name,String memberId){
		this.loopNum = loopNum;
		this.loopDay = loopDay;
		this.loop_State = loop_State;
		this.cl_Num = cl_Num;
		this.cl_Name = cl_Name;
		this.memberId = memberId;
	}
	
	public int getLoopNum() {
		return loopNum;
	}
	public void setLoopNum(int loopNum) {
		this.loopNum = loopNum;
	}
	public int getLoopDay() {
		return loopDay;
	}
	public void setLoopDay(int loopDay) {
		this.loopDay = loopDay;
	}
	public int getLoop_State() {
		return loop_State;
	}
	public void setLoop_State(int loop_State) {
		this.loop_State = loop_State;
	}
	public int getCl_Num() {
		return cl_Num;
	}
	public void setCl_Num(int cl_Num) {
		this.cl_Num = cl_Num;
	}
	public String getCl_Name() {
		return cl_Name;
	}
	public void setCl_Name(String cl_Name) {
		this.cl_Name = cl_Name;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "CK_Show [loopNum=" + loopNum + ", loopDay=" + loopDay + ", loop_State=" + loop_State + ", cl_Num="
				+ cl_Num + ", cl_Name=" + cl_Name + ", memberId=" + memberId + "]";
	}
	
	
}
