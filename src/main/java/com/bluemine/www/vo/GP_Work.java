package com.bluemine.www.vo;

public class GP_Work {
	private int gs_Num;
	private String gs_Name;
	private int gp_Num;
	private String gs_Content;
	private String director;
	private String start_Date;
	private String deadLine;
	private String rStart_Date;
	private String rDeadLine;
	private int gp_Pri;
	private int progress;
	
	public GP_Work(int gs_Num, String gs_Name, int gp_Num, String gs_Content, String director, String start_Date,
			String deadLine, String rStart_Date, String rDeadLine, int gp_Pri, int progress) {
		super();
		this.gs_Num = gs_Num;
		this.gs_Name = gs_Name;
		this.gp_Num = gp_Num;
		this.gs_Content = gs_Content;
		this.director = director;
		this.start_Date = start_Date;
		this.deadLine = deadLine;
		this.rStart_Date = rStart_Date;
		this.rDeadLine = rDeadLine;
		this.gp_Pri = gp_Pri;
		this.progress = progress;
	}
	public GP_Work() {
		super();
	}
	public int getGs_Num() {
		return gs_Num;
	}
	public void setGs_Num(int gs_Num) {
		this.gs_Num = gs_Num;
	}
	public String getGs_Name() {
		return gs_Name;
	}
	public void setGs_Name(String gs_Name) {
		this.gs_Name = gs_Name;
	}
	public int getGp_Num() {
		return gp_Num;
	}
	public void setGp_Num(int gp_Num) {
		this.gp_Num = gp_Num;
	}
	public String getGs_Content() {
		return gs_Content;
	}
	public void setGs_Content(String gs_Content) {
		this.gs_Content = gs_Content;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
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
	public int getGp_Pri() {
		return gp_Pri;
	}
	public void setGp_Pri(int gp_Pri) {
		this.gp_Pri = gp_Pri;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	@Override
	public String toString() {
		return "GP_Work [gs_Num=" + gs_Num + ", gs_Name=" + gs_Name + ", gp_Num=" + gp_Num + ", gs_Content="
				+ gs_Content + ", director=" + director + ", start_Date=" + start_Date + ", deadLine=" + deadLine
				+ ", rStart_Date=" + rStart_Date + ", rDeadLine=" + rDeadLine + ", gp_Pri=" + gp_Pri + ", progress="
				+ progress + "]";
	}
	
	
}
