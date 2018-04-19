package com.bluemine.www.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.util.FileService;
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
	public String join(String email,String name,String password,String department,String position, String alias,HttpSession session){
		String result = null;
		String userId = alias;
		UserInfo join = new UserInfo(userId, email, name, password, department, position);
		if (uDao.join(join) == 1) {
			result = "ok";
		}
		String getId = uDao.login(join);
		session.setAttribute("loginId", getId);
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
	public String prifilePage(HttpSession session){
		String getId = (String)session.getAttribute("loginId");
		System.out.println(getId);
		UserInfo update_user = uDao.getInfo(getId);
		session.setAttribute("updateUser", update_user);
		System.out.println(update_user);
		return "inside/profilePage";
	}
	
	// 프로필 사진 파일경로
	private final String PF_UPLOAD_PATH = "/spring/springws/BlueMine/profileImg";

	// 프로필 사진 수정
	@ResponseBody
	@RequestMapping("/pfUpload")
	public String pfUpload(HttpSession session,MultipartHttpServletRequest request){
		UserInfo update_pf = (UserInfo)session.getAttribute("updateUser");
		System.out.println(update_pf.getOriginalFile());
		System.out.println(update_pf.getSaveFile());
		System.out.println(update_pf);
		Iterator<String> itr = request.getFileNames();
		String fullpath = "";
		if (itr.hasNext()) {
			MultipartFile mpf = request.getFile(itr.next());
			System.out.println(request.getServletContext().getRealPath(PF_UPLOAD_PATH));
			try{
				System.out.println("file length : " + mpf.getBytes().length);
				System.out.println("file name : " + mpf.getOriginalFilename());
				if (!mpf.isEmpty()) {
					
					String deleteFile = update_pf.getSaveFile();
					fullpath = PF_UPLOAD_PATH + "/" + deleteFile;
					System.out.println("fullpath : " + fullpath);
					System.out.println(FileService.deleteFile(fullpath));
					
					String saveFile = FileService.saveFile(mpf, PF_UPLOAD_PATH);
					String originalFile = mpf.getOriginalFilename();
					update_pf.setSaveFile(saveFile);
					update_pf.setOriginalFile(originalFile);
					System.out.println("iDDDDD : " +update_pf.getUserId());
					uDao.updateProfile(update_pf);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return fullpath;
		} else {
			fullpath = PF_UPLOAD_PATH + "/null.png";
			System.out.println("fullpath : "+ fullpath);
			return fullpath;
		}
	}
			
			@ResponseBody
			@RequestMapping(value="/updateUser", method=RequestMethod.POST)
			public String updateUser(UserInfo updateUser){
				String result = null;
				System.out.println("똑바로 가져오나"+updateUser);
				if (uDao.updateUser(updateUser)==1) {
					result = "ok";
				}
				return result;
			}	
}