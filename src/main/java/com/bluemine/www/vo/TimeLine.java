package com.bluemine.www.vo;

public class TimeLine {
	private int tl_Num;//게시글 번호
	private int gp_Num;//그룹(일감)번호
	private String writer;//작성자
	private String w_Date;//작성일
	private String tl_Content;//내용
	private int tagNum;//말머리
	public TimeLine(int tl_Num, int gp_Num, String writer, String w_Date, String tl_Content, int tagNum) {
		super();
		this.tl_Num = tl_Num;
		this.gp_Num = gp_Num;
		this.writer = writer;
		this.w_Date = w_Date;
		this.tl_Content = tl_Content;
		this.tagNum = tagNum;
	}
	public int getTl_Num() {
		return tl_Num;
	}
	public void setTl_Num(int tl_Num) {
		this.tl_Num = tl_Num;
	}
	public int getGp_Num() {
		return gp_Num;
	}
	public void setGp_Num(int gp_Num) {
		this.gp_Num = gp_Num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getW_Date() {
		return w_Date;
	}
	public void setW_Date(String w_Date) {
		this.w_Date = w_Date;
	}
	public String getTl_Content() {
		return tl_Content;
	}
	public void setTl_Content(String tl_Content) {
		this.tl_Content = tl_Content;
	}
	public int gettagNum() {
		return tagNum;
	}
	public void settagNum(int tagNum) {
		this.tagNum = tagNum;
	}
	@Override
	public String toString() {
		return "TimeLine [tl_Num=" + tl_Num + ", gp_Num=" + gp_Num + ", writer=" + writer + ", w_Date=" + w_Date
				+ ", tl_Content=" + tl_Content + ", tagNum=" + tagNum + "]";
	}
	
	
}
