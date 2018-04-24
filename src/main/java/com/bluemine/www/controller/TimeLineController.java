package com.bluemine.www.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bluemine.www.HomeController;
import com.bluemine.www.dao.ProjectDAO;
import com.bluemine.www.dao.TimeLineDAO;
import com.bluemine.www.util.PageNavigator;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.UserInfo;

@Controller
@RequestMapping("/project")
public class TimeLineController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	final int countPerPage = 10; // 페이지 당 글 수
	final int pagePerGroup = 5; // 페이지 이동 그룹 당 표시할 페이지 수
	@Inject
	TimeLineDAO tlDAO;
	@Inject
	ProjectDAO pjDAO;

	@RequestMapping("/xxx")
	public String xxx() {
		return "/project/timeline";
	}

	// 타임라인 리스트 가져오기
	@ResponseBody
	@RequestMapping("/gettimelinelist")
	public ArrayList<TimeLine> getTimeLineList(int prj_Num, int page, int tagNum, Model model) {
		logger.info("타임라인 : 리스트 가져오는 메소드 실행");
		logger.info("타임라인 : prj_Num :" + prj_Num + ", page :" + page);
		int total = tlDAO.getTotal(prj_Num);

		ArrayList<TimeLine> list = new ArrayList<>();
		ArrayList<UserInfo> uList = new ArrayList<>();
		ArrayList<PRJList> pList = new ArrayList<>();
		ArrayList<Object[]> objList = new ArrayList<>();
		pList = tlDAO.getProjectInfo();

		for (int i = 0; i < pList.size(); i++) {
			int projectNum = pList.get(i).getPrj_Num();
			String prj_Name = pList.get(i).getPrj_Name();
			String names = "참여인원 : ";
			uList = tlDAO.getUserList(projectNum);
			for (int j = 0; j < uList.size(); j++) {
				if (j == 0) {
					names += uList.get(j).getName();
				} else {
					names += ", " + uList.get(j).getName();
				}
			}
			Object[] obj = new Object[3];
			obj[0] = projectNum; // 프로젝트 번호
			obj[1] = prj_Name; // 프로젝트 이름
			obj[2] = names; // 프로젝트의 참여한 인원들
			objList.add(obj);
		}
		logger.info(uList.toString());
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		if (navi.getCurrentPage() != page) {
			return null;
		}
		logger.info("total : " + total);
		RowBounds rd = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		Map<String, Integer> map = new HashMap<>();
		if (prj_Num != 0) {
			map.put("prj_Num", prj_Num);
		}
		if (tagNum < 1) {
			tagNum = 0;
		}
		map.put("tagNum", tagNum);
		list = tlDAO.getTimeLineList(map, rd);

		Calendar cal = Calendar.getInstance();
		int nowTime = (int) (cal.getTimeInMillis() / 1000);
		for (int i = 0; i < list.size(); i++) { // 작성(수정)시간과 현재 시간계산
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				String result = "";
				Date date = df.parse(list.get(i).getW_Date());
				Calendar dCal = Calendar.getInstance();
				dCal.setTime(date);
				int writerTime = (int) (dCal.getTimeInMillis() / 1000);
				if (nowTime - writerTime < 60) {
					result = nowTime - writerTime + "Seconds Ago";
				} else if ((nowTime - writerTime) / 60 < 60) {
					result = (nowTime - writerTime) / 60 + "Minutes Ago";
				} else if ((nowTime - writerTime) / 3600 < 24) {
					result = (nowTime - writerTime) / 3600 + "Hours Ago";
				} else if ((nowTime - writerTime) / (3600 * 24) < 7) {
					result = (nowTime - writerTime) / (3600 * 24) + "Days Ago";
				} else {
					result = list.get(i).getW_Date();
				}
				list.get(i).setW_Date(list.get(i).getW_Date() + "<br>  " + result);
				for (int j = 0; j < objList.size(); j++) {
					Object[] obj = objList.get(j);
					if ((int) obj[0] == list.get(i).getPrj_Num()) {
						list.get(i).setTl_Content((String) obj[1] + "///" + (String) obj[2]);
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.info(e.getStackTrace().toString());
			}
		}

		return list;
	}

	@ResponseBody
	@RequestMapping("/getuserlist")
	public ArrayList<UserInfo> getUserList(int prj_Num) {
		logger.info("타임라인 : 그룹에 참가하고 있는 UserInfo가져오기");
		ArrayList<UserInfo> list = new ArrayList<>();
		list = tlDAO.getUserList(prj_Num);

		return list;
	}

	// 타임라인 추가
	@ResponseBody
	@RequestMapping(value = "addTimeLine", method = RequestMethod.GET)
	public String addTimeLine(TimeLine t) {
		if (t.getW_Date() == null) {
			t.setW_Date("sysdate");
		}
		tlDAO.insertTimeLine(t);
		return "추가 성공";
	}

	// 타임라인 수정
	@ResponseBody
	@RequestMapping(value = "updatetl", method = RequestMethod.GET)
	public String updateTL(TimeLine t) {

		tlDAO.updateTimeLine(t);
		return "수정 성공";
	}

	// 타임라인 삭제
	@ResponseBody
	@RequestMapping(value = "deletetimeline", method = RequestMethod.GET)
	public String deleteTimeLine(int tl_Num) {

		tlDAO.deleteTimeLine(tl_Num);
		return "삭제 성공";
	}

}
