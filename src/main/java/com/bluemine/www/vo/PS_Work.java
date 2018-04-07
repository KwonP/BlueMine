package com.bluemine.www.vo;

public class PS_Work {
	private int ps_Num;//개인 스케줄 번호
	private String ps_Name;//스케줄 이름
	private String ps_Content;//내용
	private String memberId;//회원ID
	private String start_Date;//시작일
	private String deadLine;//마감일
	private String rStart_Date;//실제시작일
	private String rDeadLine;//실제마감일
	private int ps_Pri;
	private int progress;
	public PS_Work(int ps_Num, String ps_Name, String ps_Content, String memberId, String start_Date, String deadLine,
			String rStart_Date, String rDeadLine, int ps_Pri, int progress) {
		super();
		this.ps_Num = ps_Num;
		this.ps_Name = ps_Name;
		this.ps_Content = ps_Content;
		this.memberId = memberId;
		this.start_Date = start_Date;
		this.deadLine = deadLine;
		this.rStart_Date = rStart_Date;
		this.rDeadLine = rDeadLine;
		this.ps_Pri = ps_Pri;
		this.progress = progress;
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
	public String getStart_Date() {
		return start_Date;
	}
	public void setStart_Date(String start_Date) {
		this.start_Date = start_Date;
	}
	public String getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}
	public String getrStart_Date() {
		return rStart_Date;
	}
	public void setrStart_Date(String rStart_Date) {
		this.rStart_Date = rStart_Date;
	}
	public String getrDeadLine() {
		return rDeadLine;
	}
	public void setrDeadLine(String rDeadLine) {
		this.rDeadLine = rDeadLine;
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
				+ memberId + ", start_Date=" + start_Date + ", deadLine=" + deadLine + ", rStart_Date=" + rStart_Date
				+ ", rDeadLine=" + rDeadLine + ", ps_Pri=" + ps_Pri + ", progress=" + progress + "]";
	}
	
	
}
