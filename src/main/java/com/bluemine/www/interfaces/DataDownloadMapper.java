package com.bluemine.www.interfaces;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

/**
 * 자료실 관련 Mybatis 사용 메서드
 */
public interface DataDownloadMapper {
	//자료 저장
	public int insertFile(FileInfo file);

	//파일 가져오기
	public ArrayList<FileInfo> selectPrjFiles(int prjNum);

	//오리지날 파일을 이용해서 파일 리스트 가져오기
	public ArrayList<FileInfo> listFiles(String originalfile);
	
}
