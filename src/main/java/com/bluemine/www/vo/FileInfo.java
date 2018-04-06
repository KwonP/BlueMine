package com.bluemine.www.vo;

public class FileInfo {
	private int tl_Num;
	private String originalFile;
	private String saveFile;
	public FileInfo(int tl_Num, String originalFile, String saveFile) {
		super();
		this.tl_Num = tl_Num;
		this.originalFile = originalFile;
		this.saveFile = saveFile;
	}
	public FileInfo() {
		super();
	}
	public int getTl_Num() {
		return tl_Num;
	}
	public void setTl_Num(int tl_Num) {
		this.tl_Num = tl_Num;
	}
	public String getOriginalFile() {
		return originalFile;
	}
	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}
	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	@Override
	public String toString() {
		return "FileInfo [tl_Num=" + tl_Num + ", originalFile=" + originalFile + ", saveFile=" + saveFile + "]";
	}
	
	
}
