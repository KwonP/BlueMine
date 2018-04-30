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
	
	/**
	 * Gantt 차트 페이지로 이동
	 */
	@RequestMapping (value="chart", method=RequestMethod.GET)
	public String chart(HttpSession session, Model model) {
		int prj_Num = (int) session.getAttribute("prjNum");
		
/*		페이지:

			왼쪽은 세션

			오른쪽은 바

			위쪽은 날짜

			바 : 

			작업이름 : 시작날짜 - 마감날짜
			날짜 계산 : 알아서 해주겠지
			퍼센티지 : ongoing? / completeness
			그룹 이름 : ~ 

			날짜가 문제네... 어떻게 바꾸지?;;

			색도 바꿔야하네..쩝..

			///////////////////////////////

			그... 일감(GP_Work)의 중요도의 value값을 숫자로 바꿔야함.(0~4)

			completeness

			ongoing*/
		ArrayList<PJ_Group> list = dao.selectAllPjgroup(prj_Num); // 해당 프로젝트의 모든 세션 가져오기
		ArrayList<String> onComList = new ArrayList<>(); // ongoing 인가 completed인가
		ArrayList<GP_Work> allGpworkList = new ArrayList<>(); // 모든 GP_Work
		ArrayList<String> gpnameList = new ArrayList<>(); // gpname
		for (PJ_Group pj_group : list) { // 해당세션들의 작업들을 가지고 퍼센티지를 계산.
			allGpworkList = dao.selectAllGpwork(pj_group);
			for (GP_Work gp_Work : allGpworkList) {
				if(gp_Work.getProgress() == 1) {
					onComList.add("Completed");
				} else {
					onComList.add("Ongoing");
				}
				gpnameList.add(pj_group.getGp_Name());
			}
		}
		for (GP_Work string : allGpworkList) {
			System.out.println(string.getStart_Date());
		}
		
		model.addAttribute("pjgroupList",list); // 프로젝트의 모든 그룹들
		model.addAttribute("onComList",onComList); // 모든 작업들의 진행상황
		model.addAttribute("allGpworkList",allGpworkList); // 모든 작업들
		model.addAttribute("gpnameList",gpnameList); // 모든 작업들의 작업이름
			
		return "project/gantt";
	}
}