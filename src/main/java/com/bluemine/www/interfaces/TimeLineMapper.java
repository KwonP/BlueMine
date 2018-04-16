package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.TimeLine;

public interface TimeLineMapper {
	
//타임 라인 글 추가	
public int insertTimeLine(TimeLine t);
//타임 라인 목록 가져오기(그룹 번호로)
public ArrayList<TimeLine> getTimeLineList(int gp_Num);
//타임 라인 글 삭제(게시글 번호로)
public int deleteTimeLine(int tl_Num);
//타임 라인 글 수정
public int updateTimeLine(TimeLine t);
//파일 업로드
public int addFile(FileInfo file);
//파일 목록
public ArrayList<FileInfo> getFileList(int tl_Num);
}
