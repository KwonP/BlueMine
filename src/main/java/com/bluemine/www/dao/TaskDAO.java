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
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

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
	 * 파일 저장
	 * @param FileInfo에 저장
	 */
	/*public int insertFile(FileInfo file) {
		DataDownloadMapper mapper = sqlSession.getMapper(DataDownloadMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertFile(file);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/	
}