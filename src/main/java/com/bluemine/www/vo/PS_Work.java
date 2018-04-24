package com.bluemine.www.vo;

public class PS_Work {
	private int ps_Num;//개인 스케줄 번호
	private String ps_Name;//스케줄 이름
	private String ps_Content;//내용
	private String memberId;//회원ID
	private String startDate;//시작일
	private String deadLine;//마감일
	private int ps_Pri;	// 중요도
	private int progress;	//진행상황
	
	public PS_Work(int ps_Num, String ps_Name, String ps_Content, String memberId, String startDate, String deadLine,
			int ps_Pri, int progress) {
		super();
		this.ps_Num = ps_Num;
		this.ps_Name = ps_Name;
		this.ps_Content = ps_Content;
		this.memberId = memberId;
		this.startDate = startDate;
		this.deadLine = deadLine;
		this.ps_Pri = ps_Pri;
		this.progress = progress;
	}
	
	public PS_Work(String ps_Name, String ps_Content,String memberId,String startDate,String deadLine,int ps_Pri){
		this.ps_Name = ps_Name;
		this.ps_Content = ps_Content;
		this.startDate = startDate;
		this.deadLine = deadLine;
		this.ps_Pri = ps_Pri;
	}
	
	public PS_Work() {
		super();
	}

	public int getPs_Num() {
		return ps_Num;
	}
	public void setPs_Num(int ps_Num) {
		this.ps_Num = ps_Num;
	}
	public String getPs_Name() {
		return ps_Name;
	}
	public void setPs_Name(String ps_Name) {
		this.ps_Name = ps_Name;
	}
	public String getPs_Content() {
		return ps_Content;
	}
	public void setPs_Content(String ps_Content) {
		this.ps_Content = ps_Content;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}
	public int getPs_Pri() {
		return ps_Pri;
	}
	public void setPs_Pri(int ps_Pri) {
		this.ps_Pri = ps_Pri;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	@Override
	public String toString() {
		return "PS_Work [ps_Num=" + ps_Num + ", ps_Name=" + ps_Name + ", ps_Content=" + ps_Content + ", memberId="
				+ memberId + ", startDate=" + startDate + ", deadLine=" + deadLine + ", ps_Pri=" + ps_Pri
				+ ", progress=" + progress + "]";
	}
	
	
	
	
}
