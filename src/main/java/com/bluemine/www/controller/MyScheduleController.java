package com.bluemine.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/mySchedule")
public class MyScheduleController {

	@RequestMapping(value="/main")
	public String scheduleMain(){
		return "mySchedule/main";
	}
}