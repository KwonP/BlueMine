package com.bluemine.www.vo;

public class PRJList {
	private int prj_Num;//프로젝트 번호
	private String prj_Name;//프로젝트 이름
	private String planner;//기획자
	private int access_Control;//0 혹은 1만 들어오며 0=private 1=public
	private String background;//배경 색 ex)#ffffff
	
	
	public PRJList(int prj_Num, String prj_Name, String planner, int access_Control, 
			String background) {
		super();
		this.prj_Num = prj_Num;
		this.prj_Name = prj_Name;
		this.planner = planner;
		this.access_Control = access_Control;
		this.background = background;
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
	public int getAccess_Control() {
		return access_Control;
	}
	public void setAccess_Control(int access_Control) {
		this.access_Control = access_Control;
	}
	public int getPrj_Num() {
		return prj_Num;
	}
	
	public void setPrj_Num(int prj_Num) {
		this.prj_Num = prj_Num;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
	@Override
	public String toString() {
		return "PRJList [prj_Num=" + prj_Num + ", prj_Name=" + prj_Name + ", planner=" + planner + ", access_Control="
				+ access_Control + ", background=" + background + "]";
	}

	
	
}
