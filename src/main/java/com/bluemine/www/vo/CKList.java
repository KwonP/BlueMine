package com.bluemine.www.vo;

public class CKList {
	private int cl_Num;//체크리스트 번호
	private String cl_Name;//체크리스트 이름
	private String memberId;//해당 회원 ID
	private String ck_Content;//내용
	private String ck_State;//상태
	private int loops;//반복횟수 최소값 0
	
	
	public CKList() {
		super();
	}
	public CKList(int cl_Num, String cl_Name, String memberId, String ck_Content, String ck_State, int loops) {
		super();
		this.cl_Num = cl_Num;
		this.cl_Name = cl_Name;
		this.memberId = memberId;
		this.ck_Content = ck_Content;
		this.ck_State = ck_State;
		this.loops = loops;
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
	public String getCk_Content() {
		return ck_Content;
	}
	public void setCk_Content(String ck_Content) {
		this.ck_Content = ck_Content;
	}
	public String getCk_State() {
		return ck_State;
	}
	public void setCk_State(String ck_State) {
		this.ck_State = ck_State;
	}
	public int getLoops() {
		return loops;
	}
	public void setLoops(int loops) {
		this.loops = loops;
	}
	@Override
	public String toString() {
		return "CKList [cl_Num=" + cl_Num + ", cl_Name=" + cl_Name + ", memberId=" + memberId + ", ck_Content="
				+ ck_Content + ", ck_State=" + ck_State + ", loops=" + loops + "]";
	}
	
	
}
