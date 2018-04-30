package com.bluemine.www.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bluemine.www.dao.TaskDAO;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;

/**
 * 일감 콘트롤러
 * 
 */

@Controller
@RequestMapping(value="/task")
public class TaskController {
	
	@Inject
	TaskDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

	/**
	 * 일감 페이지 이동
	 */
	@RequestMapping (value="/taskMain", method=RequestMethod.GET)
	public String move(Model model,HttpSession session) {
		int prjNum = (int)session.getAttribute("prjNum");
		PJ_Group pj_group = dao.selectGroup(prjNum);
		ArrayList<GP_Work> gp_work_list = dao.printTask(pj_group.getGp_Num());

		model.addAttribute("sectionName",gp_work_list.get(0).getGs_Name());
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
	public String insertTask(GP_Work gp_work, HttpSession session) {
		System.out.println("들어옴.");
		System.out.println(gp_work);
		/*String gs_Name, String gs_Content, String start_Date, String deadLine, int gp_Pri, int progress, String taskCategory , int gp_Num, */
		/*GP_Work gp_work = new GP_Work();
		gp_work.setDeadLine(deadLine);
		gp_work.setGp_Num(gp_Num);
		gp_work.setGp_Pri(gp_Pri);
		gp_work.setGs_Content(gs_Content);
		gp_work.setGs_Name(gs_Name);
		gp_work.setTaskCategory(taskCategory);
		gp_work.setStart_Date(start_Date);
		gp_work.setProgress(progress);*/
		
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
}