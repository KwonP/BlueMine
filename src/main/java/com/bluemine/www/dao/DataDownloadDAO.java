package com.bluemine.www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluemine.www.HomeController;
import com.bluemine.www.interfaces.DataDownloadMapper;
import com.bluemine.www.interfaces.TimeLineMapper;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

/**
 * 자료실 관련 DAO
 */
@Repository
public class DataDownloadDAO implements DataDownloadMapper{
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 파일 저장
	 * @param FileInfo에 저장
	 */
	public int insertFile(FileInfo file) {
		DataDownloadMapper mapper = sqlSession.getMapper(DataDownloadMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertFile(file);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 파일 불러오기
	 * @param 해당 프로젝트 번호에 있는 모든 파일
	 */
	public  ArrayList<FileInfo> selectPrjFiles(int prj_Num) {
		DataDownloadMapper mapper = sqlSession.getMapper(DataDownloadMapper.class);
		ArrayList<FileInfo> filelist = mapper.selectPrjFiles(prj_Num);
		return filelist;
	}

	/**
	 * 파일 불러오기
	 * @param 오리지날 파일에 따른 모든 파일 가져오기
	 */
	public ArrayList<FileInfo> listFiles(String originalfile) {
		DataDownloadMapper mapper = sqlSession.getMapper(DataDownloadMapper.class);
		ArrayList<FileInfo> filelist = mapper.listFiles(originalfile);
		return filelist;
	}	
}