package com.bluemine.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timeline")
public class TimeLineController {
	
	@RequestMapping("/main")
	public String goTimeLine() {
		return "TimeLine";
	}
	
}
