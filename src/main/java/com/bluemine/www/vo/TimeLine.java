package com.bluemine.www.vo;

import java.io.Serializable;

public class TimeLine implements Serializable {
	private int tl_Num;// 게시글 번호
	private int prj_Num;// 그룹(일감)번호
	private String writer;// 작성자
	private String w_Date;// 작성일
	private String tl_Content;// 내용
	private int tagNum;// 말머리

	public TimeLine() {
		super();
	}

	public TimeLine(int tl_Num, int prj_Num, String writer, String w_Date, String tl_Content, int tagNum) {
		super();
		this.tl_Num = tl_Num;
		this.prj_Num = prj_Num;
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

	public int getPrj_Num() {
		return prj_Num;
	}

	public void setPrj_Num(int prj_Num) {
		this.prj_Num = prj_Num;
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

	public int getTagNum() {
		return tagNum;
	}

	public void setTagNum(int tagNum) {
		this.tagNum = tagNum;
	}

	@Override
	public String toString() {
		return "TimeLine [tl_Num=" + tl_Num + ", prj_Num=" + prj_Num + ", writer=" + writer + ", w_Date=" + w_Date
				+ ", tl_Content=" + tl_Content + ", tagNum=" + tagNum + "]";
	}

}
