package com.bluemine.www.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.vo.UserInfo;


@Controller
public class MainPageController {

	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);

	// 메인페이지로 이동
		@RequestMapping("/goToMain")
		public String goToMail(){
			return "inside/mainPage";
	}
		
	@Inject
	UserInfoDAO uDao;
	// 프로필 사진 파일경로
	private final String PF_UPLOAD_PATH = "/spring/springws/BlueMine/profileImg";
	// 프로필 사진 띄워주기
	@RequestMapping(value="/showProfile",method=RequestMethod.GET)
	public String showProfile(HttpSession session,HttpServletResponse resp){
		// 1.아이디를 통해서 파일정보 불러오기
		String pf_id = (String)session.getAttribute("loginId");
		if (pf_id == null) {
			return "redirect:./";
		}
		UserInfo getInfo = uDao.getInfo(pf_id);
		
		// 2.저장된 파일명 & 실제 파일명 가져오기
		String saveFile =  getInfo.getSaveFile();
		String originalFile = getInfo.getOriginalFile();
		
		// 3.response의 header를 수정
		
		try {
			resp.setHeader("Content-Disposition", "attachment;filename=" +
							 URLEncoder.encode(originalFile,"UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 4. 파일을 끌어오기
		String fullpath = PF_UPLOAD_PATH + "/" + saveFile;
		if (getInfo.getSaveFile() == null) {
			fullpath = PF_UPLOAD_PATH + "/null.png";
		}
		
		// 5.스트림을 가지고 와서 파일 전송
		// 파일읽기
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		
		try {
			fis = new FileInputStream(fullpath);
			sos = resp.getOutputStream();
			FileCopyUtils.copy(fis, sos);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try{
					fis.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (sos != null) {
				try{
					sos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
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
