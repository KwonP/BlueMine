package com.bluemine.www.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.Console;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.MatchPRJ;
import com.bluemine.www.vo.PJ_Group;
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
		logger.info("타임라인 : 리스트 가져오는 메소드 실행1");
		ArrayList<TimeLine> list = new ArrayList<>();
		ArrayList<UserInfo> uList = new ArrayList<>();
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		if (navi.getCurrentPage() != page) {
			return null;
		}
		logger.info("타임라인 : 리스트 가져오는 메소드 실행2");
		RowBounds rd = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		logger.info("타임라인 : 리스트 가져오는 메소드 실행3");
		list = tlDAO.getTimeLineList(rd);
		logger.info("list : " + list);
		Calendar cal = Calendar.getInstance();
		int nowTime = (int) (cal.getTimeInMillis() / 1000);
		for (int i = 0; i < list.size(); i++) { 
			
			//private면 보여주지 않는다.
			logger.info("Tl_Content : "+list.get(i).getTl_Content());
			if(list.get(i).getTl_Content().equals("0")) {
				list.remove(i);
				i--;
				continue;
				
			}
			String content = list.get(i).getTl_Content();
			
			String [] splitArray = content.split("///"); 
			Object[] obj = new Object[3];
			
			if(!splitArray[0].equals("del_Tl")) {
				PRJList prj = tlDAO.getProjectInfo(list.get(i).getPrj_Num());
			logger.info("::프로젝트 정보::"+prj.toString());
			int projectNum = prj.getPrj_Num();
			String prj_Name = prj.getPrj_Name();
			String names = "担当者 : "+prj.getPlanner();
			
			uList = tlDAO.getUserList(projectNum);
			//영상촬영을 위한 주석처리
			/*for (int j = 0; j < uList.size(); j++) {
				if (j == 0) {
					names += uList.get(j).getName();
				} else {
					names += ", " + uList.get(j).getName();
				}
			}*/
			
			obj[0] = projectNum; // 프로젝트 번호
			obj[1] = prj_Name; // 프로젝트 이름
			obj[2] = names; // 프로젝트의 참여한 인원들
			}else {
				obj[0] = list.get(i).getPrj_Num(); // 프로젝트 번호
				obj[1] = splitArray[1]; // 프로젝트 이름
				obj[2] = "修正されました。"; // 프로젝트의 참여한 인원들
			}
			
			list.get(i).setTl_Content((String) obj[1] + "///" + (String) obj[2]+"///"+splitArray[0]+"///"+obj[0]);
			
			
			// 작성(수정)시간과 현재 시간계산
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
				
					
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.info(e.toString());
			}
		}
		logger.info(list.toString());
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
	public String updateTL(MatchPRJ mr) {

		tlDAO.updateTimeLine(mr);
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
	public ArrayList<TriggerInfo> checkNotifications(String loginId, HttpSession session) throws InterruptedException {
		while (true) {

			ArrayList<TriggerInfo> list = new ArrayList<>();
			list = tlDAO.getTriggerInfo();
			String info0 = "/";	//프로젝트 이름 넣을 곳
			String info1="/";	//그룹 이름 넣을 곳
			int info2=0;	//프로젝트 번호 넣을 곳
			Calendar cal = Calendar.getInstance();
			int nowTime = (int) (cal.getTimeInMillis() / 1000);
			if(list == null || list.size() == 0){
				return null;
			}
			if (list != null && list.size() > 0) {
				for (int i = list.size()-1; i >=0 ; i--) {
					boolean check = true;
					
					if(list.get(i).getInfo_Type().equals("gp_Work")) {
						
						HashMap<String,String> map = new HashMap<>();
						map.put("id", loginId);
						map.put("gs_Num", list.get(i).getInfo_Num()+"");
						HashMap<String,String> mapInfo=tlDAO.getGSInfo(map);
						if(mapInfo!=null) {
						Iterator<String> iterator = mapInfo.keySet().iterator();
			
						while (iterator.hasNext()) { 
							String key = (String)iterator.next(); 
							logger.info("key="+key+" / value="+mapInfo.get(key)); 
						}
						}
						
						while(true) {

						PJ_Group pg = tlDAO.getPJ_Group_Gp_Num(list.get(i).getInfo_Num());
						if(pg==null)break;
						PRJList prj = tlDAO.getProjectInfo(pg.getPrj_Num());
						if(prj==null)break;
						ArrayList<UserInfo> uList = tlDAO.getUserList(prj.getPrj_Num());
						if(uList==null)break;
						for(int j=0;j<uList.size();j++) {
							
							if(loginId.equals(uList.get(j).getUserId())) {
								info0=prj.getPrj_Name();
								info1=pg.getGp_Name();
								info2=prj.getPrj_Num();
								check=false;
								break;
							}
						}
						break;
						}
						
						
					}
					if(check) {
						list.remove(list.get(i));
						continue;
					}
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					try {	
						
						String result = "";
						Date date = df.parse(list.get(i).getUpdate_Date());
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
							result = list.get(i).getUpdate_Date();
						}
						list.get(i).setUpdate_Date(list.get(i).getUpdate_Date() + "!@#" + result+"!@#"+info0+"!@#"+info1+"!@#"+info2);
						logger.info("정보들 : "+list.get(i).getUpdate_Date());
						tlDAO.deleteTriggerInfo(list.get(i).getTrigger_Num());
						
						
					} catch (Exception e) {
						logger.info(e.toString());
					}
			
					
				}
				if(session.getAttribute("nList")==null) {
					session.setAttribute("nList", list);
				}else {
				ArrayList <TriggerInfo> nList = (ArrayList<TriggerInfo>) session.getAttribute("nList");
				for(int l=list.size()-1;l>=0;l--) {
					nList.add(0, list.get(l));
				}
				for(int l=nList.size()-1;l>=10;l--) {
					nList.remove(l);
				}
				session.setAttribute("nList", nList);
				}
				logger.info(list.toString());
				session.setAttribute("loginId", loginId);
				
				
				return list;
			}
			Thread.sleep(500);
		}

	}
	@ResponseBody
	@RequestMapping(value = "dateinfo", method = RequestMethod.GET)
	public TriggerInfo dateInfo(String t){
		TriggerInfo tri = new TriggerInfo();
		logger.info("=========="+t);
			String [] array = t.split("!@#");
			logger.info("========== array[0]"+array[0] + "!@#array[1]" + array[1]+"!@#array[2]"+array[2]+"!@#array[3]"+array[3]+"!@#array[4]"+array[4]);
			Calendar cal = Calendar.getInstance();
			int nowTime = (int) (cal.getTimeInMillis() / 1000);
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {	
				
				String result = "";
				Date date = df.parse(array[0]);
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
					result = array[0];
				}
				tri.setUpdate_Date(array[0] + "!@#" + result+"!@#"+array[2]+"!@#"+array[3]+"!@#"+array[4]);
				
			
				
				
			} catch (Exception e) {
				logger.info(e.toString());
			}
		return tri;
		
	}
}
