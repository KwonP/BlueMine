package com.bluemine.www.vo;

public class CP_Position {
	private int positionNum;//직함 번호
	private String positionName;//직함

	

	public CP_Position(int positionNum, String positionName) {
		super();
		this.positionNum = positionNum;
		this.positionName = positionName;
	}
	
	public int getPositionNum() {
		return positionNum;
	}

	public void setPositionNum(int positionNum) {
		this.positionNum = positionNum;
	}

	public CP_Position() {
		super();
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	
}
