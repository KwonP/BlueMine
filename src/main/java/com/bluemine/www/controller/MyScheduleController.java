package com.bluemine.www.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bluemine.www.dao.MyScheduleDAO;
import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.PS_Work;

@Controller
@RequestMapping(value="/mySchedule")
public class MyScheduleController {

	@Inject
	MyScheduleDAO myDao;
	
	@RequestMapping(value="/main")
	public String scheduleMain(HttpSession session){
		String userId = (String)session.getAttribute("loginId");
		ArrayList<PS_Work> workList = myDao.getWorkList(userId);
		session.setAttribute("workList", workList);
		System.out.println(workList);
		return "mySchedule/main";
	}
	
	@RequestMapping(value="/checkList")
	public String checkList(HttpSession session){
		return "mySchedule/checkList";
	}
	
	@RequestMapping(value="/createWork",method=RequestMethod.POST)
	public String createWork(PS_Work psWork,HttpSession session){
		String memberId = (String)session.getAttribute("loginId");
		psWork.setMemberId(memberId);
		myDao.createWork(psWork);
		return "redirect:./main";
	}
}