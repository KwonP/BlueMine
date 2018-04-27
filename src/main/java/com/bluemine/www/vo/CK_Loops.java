package com.bluemine.www.vo;

public class CK_Loops {
	private int loopNum;
	private int loopDay;
	private int loop_State;
	private int cl_Num;
	
	// 생성자
	public CK_Loops(){};
	public CK_Loops(int loopDay,int loop_State){
		this.loopDay = loopDay;
		this.loop_State = loop_State;
	}
	public CK_Loops(int loopNum,int loopDay,int loop_State,int cl_Num){
		this.loopNum = loopNum;
		this.loopDay = loopDay;
		this.loop_State = loop_State;
		this.cl_Num = cl_Num;
	}
	
	// Getter & Setter
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
	
	@Override
	public String toString() {
		return "Ck_Loops [loopNum=" + loopNum + ", loopDay=" + loopDay + ", loop_State=" + loop_State + ", cl_Num="
				+ cl_Num + "]";
	}
	
}
