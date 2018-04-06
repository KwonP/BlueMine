package com.bluemine.www.vo;

public class PJ_Group {
	private int gp_Num;
	private int prj_Num;
	private String gp_Name;
	public PJ_Group(int gp_Num, int prj_Num, String gp_Name) {
		super();
		this.gp_Num = gp_Num;
		this.prj_Num = prj_Num;
		this.gp_Name = gp_Name;
	}
	public PJ_Group() {
		super();
	}
	public int getGp_Num() {
		return gp_Num;
	}
	public void setGp_Num(int gp_Num) {
		this.gp_Num = gp_Num;
	}
	public int getPrj_Num() {
		return prj_Num;
	}
	public void setPrj_Num(int prj_Num) {
		this.prj_Num = prj_Num;
	}
	public String getGp_Name() {
		return gp_Name;
	}
	public void setGp_Name(String gp_Name) {
		this.gp_Name = gp_Name;
	}
	@Override
	public String toString() {
		return "PJ_Group [gp_Num=" + gp_Num + ", prj_Num=" + prj_Num + ", gp_Name=" + gp_Name + "]";
	}
	
	
}
