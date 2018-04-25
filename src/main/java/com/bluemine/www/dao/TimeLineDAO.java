package com.bluemine.www.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bluemine.www.HomeController;
import com.bluemine.www.interfaces.TimeLineMapper;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

@Repository
public class TimeLineDAO implements TimeLineMapper{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	SqlSession session;
	
	//타임 라인 글 추가
	@Override
	public int insertTimeLine(TimeLine t) {
		int result = session.getMapper(TimeLineMapper.class).insertTimeLine(t);
		return result;
	}
	//타임 라인 글목록 가져오기(그룹 번호로)
	@Override
	public ArrayList<TimeLine> getTimeLineList(RowBounds rb) {
		
		ArrayList<TimeLine> list = session.getMapper(TimeLineMapper.class).getTimeLineList(rb);
		logger.info("select Time Line Count : "+list.size());
		return list;
	}
	//타임 라인 글 삭제(게시글 번호로)
	@Override
	public int deleteTimeLine(int tl_Num) {
		int result = session.getMapper(TimeLineMapper.class).deleteTimeLine(tl_Num);
		return result;
	}
	//타임 라인 글 수정
	@Override
	public int updateTimeLine(TimeLine t) {
		int result = session.getMapper(TimeLineMapper.class).updateTimeLine(t);
		return result;
	}
	//파일 업로드
	@Override
	public int addFile(FileInfo file) {
		int result = session.getMapper(TimeLineMapper.class).addFile(file);
		return result;
	}
	//파일리스트
	@Override
	public ArrayList<FileInfo> getFileList(int tl_Num) {
		ArrayList<FileInfo> list=new ArrayList<>();
		list=session.getMapper(TimeLineMapper.class).getFileList(tl_Num);
		return list;
	}
	//전체  타임라인 갯수(프로젝트 번호로)
	@Override
	public int getTotal() {
		
		int total = session.getMapper(TimeLineMapper.class).getTotal();
		return total;
	}
	//프로젝트에 참가중인 인원 가져오기
	@Override
	public ArrayList<UserInfo> getUserList(int prj_Num) {
		logger.info("회원 정보 로딩 prj_Num : "+prj_Num);
		ArrayList <UserInfo> list = session.getMapper(TimeLineMapper.class).getUserList(prj_Num);
		return list;
	}
	//프로젝트 정보 가져오기
	@Override
	public ArrayList<PRJList> getProjectInfo(int prj_Num) {
		ArrayList<PRJList> prj = new ArrayList<>();
		prj = session.getMapper(TimeLineMapper.class).getProjectInfo(prj_Num);
		return prj;
	}
	@Override
	public ArrayList<TriggerInfo> getTriggerInfo() {
		ArrayList<TriggerInfo> list = session.getMapper(TimeLineMapper.class).getTriggerInfo();
		return list;
	}
	@Override
	public int deleteTriggerInfo(int trigger_Num) {
		int result = session.getMapper(TimeLineMapper.class).deleteTriggerInfo(trigger_Num);
		logger.info("트리거 번호:"+trigger_Num+"결과 : "+result);
		return result;
	}
	//gs_Num으로 매칭되는 프로젝트 가져오기
	@Override
	public PRJList getProject(int gs_Num) {
		PRJList prj = session.getMapper(TimeLineMapper.class).getProject(gs_Num);
		return prj;
	}

}
