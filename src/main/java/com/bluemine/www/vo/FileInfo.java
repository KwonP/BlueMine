package com.bluemine.www.vo;

public class FileInfo {
	private int prj_Num;//파일이 올라간 게시글 번호
	private String originalFile;//파일 이름
	private String saveFile;//파일 저장경로
	public FileInfo(int prj_Num, String originalFile, String saveFile) {
		super();
		this.prj_Num = prj_Num;
		this.originalFile = originalFile;
		this.saveFile = saveFile;
	}
	public FileInfo() {
		super();
	}
	public int getPrj_Num() {
		return prj_Num;
	}
	public void setPrj_Num(int prj_Num) {
		this.prj_Num = prj_Num;
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
		return "FileInfo [prj_Num=" + prj_Num + ", originalFile=" + originalFile + ", saveFile=" + saveFile + "]";
	}
	
	
}
