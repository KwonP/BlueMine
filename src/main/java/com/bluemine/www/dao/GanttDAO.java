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
import com.bluemine.www.interfaces.GanttMapper;
import com.bluemine.www.interfaces.TimeLineMapper;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

/**
 * 간트차트 관련 DAO
 */
@Repository
public class GanttDAO implements GanttMapper{
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 이 프로젝트의 모든 세션을 가져오기
	 * @param 프로젝트 넘버
	 */
	public ArrayList<PJ_Group> selectAllPjgroup(int prj_Num) {
		GanttMapper mapper = sqlSession.getMapper(GanttMapper.class);
		ArrayList<PJ_Group> list = mapper.selectAllPjgroup(prj_Num);
		return list;
	}
	
	/**
	 * 이 세션의 모든 세션을 가져오기
	 * @param 해당 세션
	 */
	public ArrayList<GP_Work> selectAllGpwork(PJ_Group pj_group) {
		GanttMapper mapper = sqlSession.getMapper(GanttMapper.class);
		ArrayList<GP_Work> list = mapper.selectAllGpwork(pj_group);
		return list;
	}	
}