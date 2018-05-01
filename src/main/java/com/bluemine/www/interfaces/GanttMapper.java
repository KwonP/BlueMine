package com.bluemine.www.interfaces;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

/**
 * 간트 차트 관련 Mybatis 사용 메서드
 */
public interface GanttMapper {

	//세션가져오기
	ArrayList<PJ_Group> selectAllPjgroup(int prj_Num);

	//Task가져오기
	ArrayList<GP_Work> selectAllGpwork(PJ_Group pj_group);

	//그룹이름가져오기
	String selectGroupName(GP_Work gp_Work);
	
	/*//자료 저장
	public int insertFile(FileInfo file);

	//파일 가져오기
	public ArrayList<FileInfo> selectPrjFiles(int prjNum);

	//오리지날 파일을 이용해서 파일 리스트 가져오기
	public ArrayList<FileInfo> listFiles(String originalfile);*/
	
}
