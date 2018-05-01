package com.bluemine.www.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluemine.www.dao.TaskDAO;
import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.TimeLine;

/**
 * 일감 콘트롤러
 * 
 */

@Controller
@RequestMapping(value="/task")
public class TaskController {
	
	@Inject
	TaskDAO dao;

	@Inject
	UserInfoDAO uDao;
	
	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

	/**
	 * 일감 페이지 이동
	 */
	@RequestMapping (value="/taskMain", method=RequestMethod.GET)
	public String move(Model model,HttpSession session) {
		// 채팅 페이지 로그아웃
		String getId = (String)session.getAttribute("loginId");
		uDao.logOut(getId);
		
		int prjNum = (int)session.getAttribute("prjNum");
		PJ_Group pj_group = dao.selectGroup(prjNum);
		ArrayList<GP_Work> gp_work_list = dao.printTask(pj_group.getGp_Num());
		if (gp_work_list.isEmpty()) {
			System.out.println("널이다");
		} else {
			model.addAttribute("sectionName",gp_work_list.get(0).getGs_Name());
		}
		System.out.println(gp_work_list.get(0).getGs_Name());
		model.addAttribute("tasklist",gp_work_list);
		model.addAttribute("pj_group",pj_group);
		model.addAttribute("prjNum",prjNum);
		return "project/task";
	}
	
	/**
	 * 일감 추가
	 */
	@ResponseBody
	@RequestMapping(value = "/insertTask", method = RequestMethod.POST)
	public String insertTask(String gs_Name
			, String gp_Num
			, String gs_Content // String
			, String start_Date // String
			, String deadLine // String
			, String gp_Pri // int
			, String taskCategory, HttpSession session) {
		GP_Work gp_work = new GP_Work();
		gp_work.setGs_Name(gs_Name);
		int num1 = Integer.parseInt(gp_Num);
		gp_work.setGp_Num(num1);
		gp_work.setGs_Content(gs_Content);
		gp_work.setStart_Date(start_Date);
		gp_work.setDeadLine(deadLine);
		int num2 = Integer.parseInt(gp_Pri);
		gp_work.setGp_Pri(num2);
		gp_work.setTaskCategory(taskCategory);

		int num = dao.insertTask(gp_work);
		
		String str = String.valueOf(num);
		
		return str;
	}
	
	/**
	 * 일감 진행도 변경
	 */
	@ResponseBody
	@RequestMapping(value = "/updateProgress", method = RequestMethod.POST)
	public String updateProgress(String gp_Num, String progress) {
		System.out.println(gp_Num);
		System.out.println(progress);
		GP_Work gp_work = new GP_Work();
		gp_work.setGp_Num(Integer.parseInt(gp_Num));
		gp_work.setProgress(Integer.parseInt(progress));
	
		int num = dao.updateProgress(gp_work);
		String str = String.valueOf(num);
		
		return str;
	}
	
	/**
	 * 메모 추가
	 */
	@ResponseBody
	@RequestMapping(value = "/insertMemo", method = RequestMethod.POST)
	public String insertMemo(String tl_Content, HttpSession session) {
		int prj_Num = (int)session.getAttribute("prjNum");
		String loginid = (String)session.getAttribute("loginId");
		
		TimeLine timeline = new TimeLine();
		
		timeline.setPrj_Num(prj_Num);
		timeline.setWriter(loginid);
		timeline.setTl_Content(tl_Content);

		int num = dao.insertMemo(timeline); // 해당 프로젝트에 해당 메모 넣기
		
		String str = String.valueOf(num);
		
		return str;
	}
}