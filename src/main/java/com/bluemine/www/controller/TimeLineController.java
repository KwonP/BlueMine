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
import com.bluemine.www.vo.TriggerInfo;
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
	public ArrayList<TimeLine> getTimeLineList( int page, Model model) {
		logger.info("타임라인 : 리스트 가져오는 메소드 실행");
		
		int total = tlDAO.getTotal();

		ArrayList<TimeLine> list = new ArrayList<>();
		ArrayList<UserInfo> uList = new ArrayList<>();
		

		
		logger.info(uList.toString());
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		if (navi.getCurrentPage() != page) {
			return null;
		}
		logger.info("total : " + total);
		RowBounds rd = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		list = tlDAO.getTimeLineList(rd);

		Calendar cal = Calendar.getInstance();
		int nowTime = (int) (cal.getTimeInMillis() / 1000);
		for (int i = 0; i < list.size(); i++) { // 작성(수정)시간과 현재 시간계산
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				
					PRJList prj = tlDAO.getProject(list.get(i).getPrj_Num());
					int projectNum = prj.getPrj_Num();
					String prj_Name = prj.getPrj_Name();
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
					if ((int) obj[0] == list.get(i).getPrj_Num()) {
						list.get(i).setTl_Content((String) obj[1] + "///" + (String) obj[2]);
					}
				
				
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

	// 알림 가져오기
	@ResponseBody
	@RequestMapping(value = "checknotifications", method = RequestMethod.GET)
	public ArrayList<TriggerInfo> checkNotifications(String userId) throws InterruptedException {
		while (true) {

			ArrayList<TriggerInfo> list = new ArrayList<>();
			list = tlDAO.getTriggerInfo();
			
			
			logger.info(list.toString());
			if (list != null || list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					/*boolean check = true;
					if(list.get(i).getInfo_Type().equals("gp_Work")) {
						PRJList prj = tlDAO.getProject(list.get(i).getInfo_Num());
						ArrayList<UserInfo> uList = tlDAO.getUserList(prj.getPrj_Num());
						for(int j=0;j<uList.size();j++) {
							if(userId.equals(uList.get(j).getUserId())) {
								logger.info(list.get(i).toString());
								check=false;
							}
						}
						
					}else if(list.get(i).getInfo_Type().equals("prjList")) {
						ArrayList<UserInfo> uList = tlDAO.getUserList(list.get(i).getInfo_Num());
						for(int j=0;j<uList.size();j++) {
							if(userId.equals(uList.get(j).getUserId())) {
								logger.info(list.get(i).toString());
								check=false;
							}
						}
					}
					if(check) {
						list.remove(list.get(i));
					}*/
			
					logger.info(i + "반복");
					// tlDAO.deleteTriggerInfo(list.get(i).getTrigger_Num());
				}
				logger.info(list.toString());
				return list;
			}
			Thread.sleep(500);
		}

	}
}
