package com.bluemine.www.vo;

public class CP_Department {
	private String depName;
	private String initial;
	public CP_Department(String depName, String initial) {
		super();
		this.depName = depName;
		this.initial = initial;
	}
	public CP_Department() {
		super();
	}
	public String getdepName() {
		return depName;
	}
	public void setdepName(String depName) {
		depName = depName;
	}
	public String getInitial() {
		return initial;
	}
	public void setInitial(String initial) {
		this.initial = initial;
	}
	
	
}
