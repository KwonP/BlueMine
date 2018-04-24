package com.bluemine.www.vo;

public class CP_Department {
	private int depNum;//부서 번호
	private String depNameEn;//부서 이름(영)
	private String depNameKr;//부서 이름(한)
	private String typeAlias;//부서 약자

	public CP_Department() {
		super();
	}

	public CP_Department(int depNum, String depNameEn, String depNameKr, String typeAlias) {
		super();
		this.depNum = depNum;
		this.depNameEn = depNameEn;
		this.depNameKr = depNameKr;
		this.typeAlias = typeAlias;
	}

	public int getDepNum() {
		return depNum;
	}

	public void setDepNum(int depNum) {
		this.depNum = depNum;
	}

	public String getDepNameEn() {
		return depNameEn;
	}

	public void setDepNameEn(String depNameEn) {
		this.depNameEn = depNameEn;
	}

	public String getDepNameKr() {
		return depNameKr;
	}

	public void setDepNameKr(String depNameKr) {
		this.depNameKr = depNameKr;
	}

	public String getTypeAlias() {
		return typeAlias;
	}

	public void setTypeAlias(String typeAlias) {
		this.typeAlias = typeAlias;
	}

	@Override
	public String toString() {
		return "depNum=" + depNum + ", depNameEn=" + depNameEn + ", depNameKr=" + depNameKr
				+ ", typeAlias=" + typeAlias + "]";
	}
	
	
	
	
}
