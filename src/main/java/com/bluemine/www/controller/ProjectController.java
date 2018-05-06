package com.bluemine.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bluemine.www.dao.TimeLineDAO;
import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.vo.PRJList;

@Controller
@RequestMapping(value="/project")
public class ProjectController {
	
	@Autowired
	UserInfoDAO uDao;
	@Autowired
	TimeLineDAO tlDAO;
	
	@RequestMapping(value="/sendNum")
	public String projectPage(int prj_Num,HttpSession session){
		// 채팅 페이지 로그아웃
		String getId = (String)session.getAttribute("loginId");
		uDao.logOut(getId);
		PRJList prj = tlDAO.getProjectInfo(prj_Num);
		session.setAttribute("prjName", prj.getPrj_Name());
		session.setAttribute("prjNum", prj_Num);
		System.out.println(prj_Num);
		return "redirect:/project/timeline";
	}
	@RequestMapping(value="/timeline")
	public String projectPage(HttpSession session){
		// 채팅 페이지 로그아웃
		String getId = (String)session.getAttribute("loginId");
		uDao.logOut(getId);
		
		return "project/timeline";
	}
	@RequestMapping(value="/datadownload")
	public String datadownload(HttpSession session){
		// 채팅 페이지 로그아웃
		String getId = (String)session.getAttribute("loginId");
		uDao.logOut(getId);
		
		return "project/datadownload";
	}
}
