package com.bluemine.www.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
	public String broadcast(HttpSession session, ArrayList<UserInfo> loginUserList, HttpServletRequest req){
		
		// 로그인 체크
		String getId = (String)session.getAttribute("loginId");
		uDao.loginCheck(getId);
		
		// 유저 이름, 프로필 사진 가져오고 싶당
		UserInfo ui = uDao.getInfo(getId);
		session.setAttribute("loginName", ui.getName());
		session.setAttribute("SaveFile", ui.getSaveFile());
		
		loginUserList = uDao.selectLoginUsers(getId);
		System.out.println("리스트: \n" + loginUserList);
		
		session.setAttribute("loginUserList",loginUserList);
		System.out.println("주소다: "+req.getRequestURL());

		return "inside/broadcast";
	}
}
