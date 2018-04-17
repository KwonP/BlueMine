package com.bluemine.www.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.vo.UserInfo;

@Controller
public class UserInfoController {

	@Autowired
	UserInfoDAO uDao;
	
	@ResponseBody
	@RequestMapping(value = "/checkEmail",method = RequestMethod.POST)
	public String checkEmail(String email){
		String result = null;
		String available = uDao.emailCheck(email);
		if (available == null) {
			result = "available";
		}
		return result;
	}
	
	// 인증번호 이메일 보내기
	@Autowired
	private JavaMailSender mailSender;
	
	@ResponseBody
	@RequestMapping(value = "/sendCode",method = RequestMethod.POST)
	public String sendCode(String email)throws FileNotFoundException, URISyntaxException  {
		String code = Integer.toString((int) (Math.random() * 100000)) + 1;
		try {
			
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom("springsentmailKim@gmail.com");
			message.setTo(email);
			message.setSubject("[회원가입 완료를 위한 인증번호 안내]");
			String text = "회원가입을 위한 회원님의 인증번호는 ["+code+"]입니다.\n"
					+ "가입 화면에 활성화된 입력란에 입력해 주시면 가입이 완료됩니다."
					+ "감사합니다 :)";
			message.setText(text);
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	// 회원가입
	@ResponseBody
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(String email,String name,String password,String department,String position, String alias){
		String result = null;
		String userId = alias;
		UserInfo join = new UserInfo(userId, email, name, password, department, position);
		if (uDao.join(join) == 1) {
			result = "ok";
		}
		return result;
	}
	// 로그인
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String goToMain(String email,String password,HttpSession session){
		String result = null;
		UserInfo login = new UserInfo(email, password);
		String loginId = uDao.login(login);
		System.out.println(loginId);
		if (loginId != null) {
			session.setAttribute("loginId", loginId);
			result = "login";
		}
		return result;
	}
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:./";
	}
	//수정페이지로 이동
	@RequestMapping(value="/profilePage")
	public String prifilePage(){
		return "inside/profilePage";
	}
	
}