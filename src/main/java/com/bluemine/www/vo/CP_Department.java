package com.bluemine.www.vo;

public class CP_Department {
	private String depName;//부서 이름
	private String typeAlias;//부서 약자
	public CP_Department(String depName, String typeAlias) {
		super();
		this.depName = depName;
		this.typeAlias = typeAlias;
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
	public String gettypeAlias() {
		return typeAlias;
	}
	public void settypeAlias(String typeAlias) {
		this.typeAlias = typeAlias;
	}
	
	
}
