package com.bluemine.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/project")
public class ProjectController {
	
	@RequestMapping(value="/sendNum")
	public String projectPage(int prj_Num,HttpSession session){
		session.setAttribute("prjNum", prj_Num);
		System.out.println(prj_Num);
		return "redirect:/project/timeline";
	}
	@RequestMapping(value="/timeline")
	public String projectPage(HttpSession session){
		return "project/timeline";
	}
	@RequestMapping(value="/datadownload")
	public String datadownload(HttpSession session){
		return "project/datadownload";
	}
}
