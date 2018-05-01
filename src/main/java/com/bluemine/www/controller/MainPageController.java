package com.bluemine.www.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bluemine.www.dao.GroupDAO;
import com.bluemine.www.dao.PositionDAO;
import com.bluemine.www.dao.ProjectDAO;
import com.bluemine.www.dao.UserInfoDAO;
import com.bluemine.www.vo.CP_Department;
import com.bluemine.www.vo.CP_Position;
import com.bluemine.www.vo.MatchPRJ;
import com.bluemine.www.vo.PJ_Group;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.UserInfo;


@Controller
public class MainPageController {

	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);

	@Inject
	ProjectDAO prjDao;
	@Inject
	PositionDAO posiDao;
	@Inject
	UserInfoDAO uDao;
	@Inject
	GroupDAO gDao;
	
	
	@RequestMapping("/goToMain")
	public String goToMail(HttpSession session){
		String getId = (String)session.getAttribute("loginId");
		// 채팅 페이지 로그아웃
		uDao.logOut(getId);
		UserInfo user = uDao.getInfo(getId);
		session.setAttribute("user", user);
		ArrayList<PRJList> getList = prjDao.getPrjList(getId);
		session.setAttribute("pro_list", getList);
		ArrayList<CP_Department> depList=uDao.getDepartmentList();
		for (int i = 0; i < depList.size(); i++) {
			//System.out.println(depList.get(i).toString());
		}
		session.setAttribute("dep_list", depList);
		ArrayList<CP_Position> posiList=uDao.getPositionList();
		for (int i = 0; i < posiList.size(); i++) {
			//System.out.println(posiList.get(i).toString());
		}
		session.setAttribute("posi_list", posiList);
		return "inside/mainPage";
	}
		
	
	// 프로필 사진 파일경로
	private final String PF_UPLOAD_PATH = "/profileImg";
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
			//e.printStackTrace();
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
			//e.printStackTrace();
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
	
	  // AutoComplete test
	   @ResponseBody
	   @RequestMapping(value="/getSort",method=RequestMethod.POST)
	   public ArrayList<UserInfo> getSort(String getDep,String getPo){
	      ArrayList<UserInfo> getVal = new ArrayList<>();
	      HashMap<String, String> putVal = new HashMap<>();
	      if (getDep.length()>=1) {
	    	  putVal.put("department", getDep);
	      }
	      if (getPo.length()>=1) {
	    	  putVal.put("position", getPo);
	      }
	      getVal = uDao.getUser(putVal);
	      for (int i = 0; i < getVal.size(); i++) {
	    	  logger.debug(getVal.get(i).toString());
		}
	      
	      return getVal;
	   }
	@ResponseBody
	@RequestMapping(value="/makePrj",method=RequestMethod.POST)
	public String makePrj(String ps_name,String planner,int access_Control){
		logger.debug("프로젝트 생성");
		PRJList prj=new PRJList();
		logger.debug(ps_name);
		logger.debug(planner);
		logger.debug(access_Control+"");
		prj.setPrj_Name(ps_name);
		prj.setPlanner(planner);
		prj.setAccess_Control(access_Control);
		logger.debug(prj.toString());
		prjDao.makePrj(prj);
		logger.debug(prj.toString());
		return prj.getPrj_Num()+"";
	}
	@ResponseBody
	@RequestMapping(value="/setRelation",method=RequestMethod.POST)
	public int makePrj(int prj_Num, String userId){
		int result = 0;
		logger.debug("관계 설정");
		logger.debug("Prj_Num"+prj_Num);
		MatchPRJ mp = new MatchPRJ();
		mp.setMemberId(userId);
		mp.setPrjNum(prj_Num);
		result=prjDao.setRelation(mp);
		logger.debug("관계 설정 완료");
		return mp.getPrjNum();
	}
	
	@ResponseBody
	@RequestMapping(value="/makeGroup",method=RequestMethod.POST)
	public int makeGroup(int prj_Num, String gp_Name){
		int result = 0;
		logger.debug("그룹 생성");
		PJ_Group group = new PJ_Group();
		group.setPrj_Num(prj_Num);
		group.setGp_Name(gp_Name);
		gDao.addGroup(group);
		return group.getGp_Num();
	}
}
