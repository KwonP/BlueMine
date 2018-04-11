package com.bluemine.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainPageController {

	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);

	@RequestMapping(value="/about",method=RequestMethod.GET)
	public String about(){
		return "inside/about";
	}
	
	@RequestMapping(value="/contact",method=RequestMethod.GET)
	public String contact(){
		return "inside/contact";
	}
	
	@RequestMapping(value="/help",method=RequestMethod.GET)
	public String help(){
		return "inside/help";
	}
	
}
