package com.bluemine.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/inside")
public class ChatController {
	@RequestMapping(value="broadcast", method = RequestMethod.GET)
	public String broadcast(){
		
		return "inside/broadcast";
	}
}
