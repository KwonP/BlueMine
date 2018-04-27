package com.bluemine.www.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.vo.UserInfo;

@Controller
@RequestMapping(value="/inside")
public class ChatController {
	
	@Autowired
	UserInfoDAO uDao;
	
	@RequestMapping(value="broadcast", method = RequestMethod.GET)
	public String broadcast(HttpSession session, ArrayList<UserInfo> loginUserList){
		String getId = (String)session.getAttribute("loginId");
		System.out.println(getId);
		UserInfo ui = uDao.getInfo(getId);
		session.setAttribute("loginName", ui.getName());
		System.out.println("채팅 이름: "+ui.getName());
		
		System.out.println(ui);
		loginUserList = uDao.selectLoginUsers(getId);
		System.out.println("리스트: \n" + loginUserList);
		session.setAttribute("loginUserList",loginUserList);
		return "inside/broadcast";
	}
}
