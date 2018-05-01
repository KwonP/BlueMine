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
import com.bluemine.www.interfaces.TaskMapper;
import com.bluemine.www.interfaces.TimeLineMapper;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.MatchGP_Work;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;
import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;

/**
 * 일감 관련 DAO
 */
@Repository
public class TaskDAO implements TaskMapper{
	@Autowired
	SqlSession sqlSession;

	/**
	 * select 그룹
	 * @param prjNum을 이용해서 해당 그룹 가져오기
	 */
	public PJ_Group selectGroup(int prjNum) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		PJ_Group pj_group = new PJ_Group(); 
		try {
			pj_group = mapper.selectGroup(prjNum);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return pj_group;
	}

	/**
	 * 일감 뿌려주기
	 * @param gp_Num을 이용해서 모든 일감 가져오기 
	 */
	public ArrayList<GP_Work> printTask(int gp_Num) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		ArrayList<GP_Work> pj_group_list = new ArrayList<>();
		try {
			pj_group_list = mapper.printTask(gp_Num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return pj_group_list;
	}

	/**
	 * 일감 추가하기
	 * @param gp_work 가져와서 넣어주기 
	 */
	public int insertTask(GP_Work gp_work) {
		
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		int result = 0;
		try {
			result = mapper.insertTask(gp_work);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 일감 추가하기
	 * @param gp_work 가져와서 넣어주기 
	 */
	public int updateProgress(GP_Work gp_work) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		int result = 0;
		try {
			result = mapper.updateProgress(gp_work);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 메모추가하기
	 * @param vv: 메모내용 , ab: 프로젝트번호 
	 */
	public int insertMemo(TimeLine timeline) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertMemo(timeline);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 아이디 
	 * @param 
	 */	
	public MatchGP_Work selectMatchgpWork(String getId) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		MatchGP_Work list = null;
		try {
			list = mapper.selectMatchgpWork(getId);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * 그룹의 모든 작업가져오기 
	 * @param gs_num
	 */	
	public ArrayList<GP_Work> selectGpwork(int gs_Num) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		ArrayList<GP_Work> gpwork = null;
		try {
			gpwork = mapper.selectGpwork(gs_Num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return gpwork;
	}

	/**
	 * 모든 타임라인 가져오기 
	 * @param prj_num
	 */	
	public ArrayList<TimeLine> selectTimeLine(int prj_Num) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		ArrayList<TimeLine> list = null;
		try {
			list = mapper.selectTimeLine(prj_Num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<PJ_Group> selectAllGroups(int prj_Num) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		ArrayList<PJ_Group> list = null;
		try {
			list = mapper.selectAllGroups(prj_Num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public  ArrayList<GP_Work> selectEachGpworks(int gp_Num) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		 ArrayList<GP_Work> gpwork = null;
		try {
			gpwork = mapper.selectEachGpworks(gp_Num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return gpwork;
	}

	public String selectPrjName(int prj_Num) {
		TaskMapper mapper = sqlSession.getMapper(TaskMapper.class);
		
		String gpwork = null;
		try {
			gpwork = mapper.selectPrjName(prj_Num);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return gpwork;
	}	
}