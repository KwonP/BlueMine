package com.bluemine.www.vo;

public class HorseHead {
	private int tagNum;//태그 번호
	private String tagTitle;//태그
	private String tagType;//태그 타입 ex)공지사항 1,스케줄관련 2
	
	public HorseHead(String tagTitle, String tagType) {
		super();
		this.tagTitle = tagTitle;
		this.tagType = tagType;
	}
	
	public HorseHead() {
		super();
	}

	public int getTagNum() {
		return tagNum;
	}

	public void setTagNum(int tagNum) {
		this.tagNum = tagNum;
	}

	public String getTagTitle() {
		return tagTitle;
	}

	public void setTagTitle(String tagTitle) {
		this.tagTitle = tagTitle;
	}

	public String getTagType() {
		return tagType;
	}

	public void setTagType(String tagType) {
		this.tagType = tagType;
	}

	@Override
	public String toString() {
		return "HorseHead [tagNum=" + tagNum + ", tagTitle=" + tagTitle + ", tagType=" + tagType + "]";
	}
	
	
}
