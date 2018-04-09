package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.FileInfo;

public interface fileInfoMapper {
	
	//파일 업로드
	public int addFile(FileInfo file);
	//파일 목록
	public ArrayList<FileInfo> getFileList(int tl_Num);
}
