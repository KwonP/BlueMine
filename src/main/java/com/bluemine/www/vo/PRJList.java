package com.bluemine.www.vo;

public class PRJList {
	private int prj_Num;
	private String prj_Name;
	private String planner;
	private String access_Control;
	private String inviteCode;
	public PRJList(String prj_Name, String planner, String access_Control, String inviteCode) {
		super();
		this.prj_Name = prj_Name;
		this.planner = planner;
		this.access_Control = access_Control;
		this.inviteCode = inviteCode;
	}
	public PRJList() {
		super();
	}
	public String getPrj_Name() {
		return prj_Name;
	}
	public void setPrj_Name(String prj_Name) {
		this.prj_Name = prj_Name;
	}
	public String getPlanner() {
		return planner;
	}
	public void setPlanner(String planner) {
		this.planner = planner;
	}
	public String getAccess_Control() {
		return access_Control;
	}
	public void setAccess_Control(String access_Control) {
		this.access_Control = access_Control;
	}
	public String getInviteCode() {
		return inviteCode;
	}
	public void setInviteCode(String inviteCode) {
		this.inviteCode = inviteCode;
	}
	public int getPrj_Num() {
		return prj_Num;
	}
	
	public void setPrj_Num(int prj_Num) {
		this.prj_Num = prj_Num;
	}
	@Override
	public String toString() {
		return "PRJList [prj_Num=" + prj_Num + ", prj_Name=" + prj_Name + ", planner=" + planner + ", access_Control="
				+ access_Control + ", inviteCode=" + inviteCode + "]";
	}
	
	
	
}
