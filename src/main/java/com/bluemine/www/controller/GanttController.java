package com.bluemine.www.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.bluemine.www.dao.GanttDAO;
import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.util.FileService;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;

/**
 * 간트차트 컨트롤러
 * 
 */
@Controller
@RequestMapping("/gantt")
public class GanttController {
	
	private static final Logger logger = LoggerFactory.getLogger(GanttController.class);
	
	@Autowired
	GanttDAO dao;		//간트차트
	
	@Autowired
	UserInfoDAO uDao;
	/**
	 * Gantt 차트 페이지로 이동
	 */
	@RequestMapping (value="chart", method=RequestMethod.GET)
	public String chart(HttpSession session, Model model) {
		// 채팅 페이지 로그아웃
		String getId = (String)session.getAttribute("loginId");
		uDao.logOut(getId);
		
		int prj_Num = (int) session.getAttribute("prjNum");
		
		ArrayList<PJ_Group> list = dao.selectAllPjgroup(prj_Num); // 해당 프로젝트의 모든 세션 가져오기
		ArrayList<String> onComList = new ArrayList<>(); // ongoing 인가 completed인가
		ArrayList<GP_Work> allGpworkList = new ArrayList<>(); // 모든 GP_Work
		ArrayList<String> gsnameList = new ArrayList<>(); // gsname
		ArrayList<String> startdateList = new ArrayList<>(); // startdate
		ArrayList<String> deadlineList = new ArrayList<>(); // deadline
		ArrayList<String> groupList = new ArrayList<>(); // 각 작업들의 그룹이름
		for (PJ_Group pj_group : list) { // 해당세션들의 작업들을 가지고 퍼센티지를 계산.
			allGpworkList = dao.selectAllGpwork(pj_group);
			for (GP_Work gp_Work : allGpworkList) {
				String temp = dao.selectGroupName(gp_Work);
				groupList.add(temp);
				System.out.println(gp_Work);
				if(gp_Work.getProgress() == 1) {
					onComList.add("Completed");
				} else {
					onComList.add("Ongoing");
				}
				gsnameList.add(gp_Work.getGs_Name());
				switch(gp_Work.getStart_Date().substring(5, 7)) {
					case "01":
					case "02":
					case "03":
					case "04":
					case "05":
					case "06":
					case "07":
					case "08":
					case "09":
						String str = gp_Work.getStart_Date().substring(0,4) + ", " + gp_Work.getStart_Date().substring(6,7) + ", " + gp_Work.getStart_Date().substring(8,10);
						startdateList.add(str);
						break;
					default:
						String str2 = gp_Work.getStart_Date().substring(0,4) + ", " + gp_Work.getStart_Date().substring(5,7) + ", " + gp_Work.getStart_Date().substring(8,10);
						startdateList.add(str2);
						break;
				}				
				
				switch(gp_Work.getDeadLine().substring(5, 7)) {
					case "01":
					case "02":
					case "03":
					case "04":
					case "05":
					case "06":
					case "07":
					case "08":
					case "09":
						String str = gp_Work.getDeadLine().substring(0,4) + ", " + gp_Work.getDeadLine().substring(6,7) + ", " + gp_Work.getDeadLine().substring(8,10);
						deadlineList.add(str);
						break;
					default:
						String str2 = gp_Work.getDeadLine().substring(0,4) + ", " + gp_Work.getDeadLine().substring(5,7) + ", " + gp_Work.getDeadLine().substring(8,10);
						deadlineList.add(str2);
						break;
				}			
				
			}
		}
		
		model.addAttribute("startdateList", startdateList); // 날짜 형식 맞춘 String 리스트
		model.addAttribute("deadlineList", deadlineList); // 날짜 형식 맞춘 String 리스트
		model.addAttribute("groupList",groupList); // 각 작업들의 그룹이름
		model.addAttribute("onComList",onComList); // 모든 작업들의 진행상황
		model.addAttribute("allGpworkList",allGpworkList); // 모든 작업들
		model.addAttribute("gsnameList",gsnameList); // 모든 작업들의 작업이름
			
		return "project/gantt";
	}
}