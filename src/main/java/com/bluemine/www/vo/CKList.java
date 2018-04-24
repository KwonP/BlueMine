package com.bluemine.www.vo;

public class CKList {
	private int cl_Num;//체크리스트 번호
	private String cl_Name;//체크리스트 이름
	private String memberId;//해당 회원 ID
	
	public CKList() {
		super();
	}
	public CKList(int cl_Num, String cl_Name, String memberId) {
		super();
		this.cl_Num = cl_Num;
		this.cl_Name = cl_Name;
		this.memberId = memberId;
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
		return "CKList [cl_Num=" + cl_Num + ", cl_Name=" + cl_Name + ", memberId=" + memberId + ", ck_Content=";
	}
	
}
