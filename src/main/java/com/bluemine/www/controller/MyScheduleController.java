package com.bluemine.www.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluemine.www.dao.MyScheduleDAO;
import com.bluemine.www.vo.CKList;
import com.bluemine.www.vo.CK_Loops;
import com.bluemine.www.vo.CK_Show;
import com.bluemine.www.vo.PS_Work;

@Controller
@RequestMapping(value="/mySchedule")
public class MyScheduleController {

	@Inject
	MyScheduleDAO myDao;
	
	@RequestMapping(value="/main")
	public String scheduleMain(HttpSession session){
		String userId = (String)session.getAttribute("loginId");
		ArrayList<PS_Work> workList = myDao.getWorkList(userId);
		session.setAttribute("workList", workList);
		System.out.println(workList);
		
		// 체크리스트 요일별로 보여주기 위한 리스트 가져오기
		ArrayList<CK_Show> cl_show = myDao.showCKList(userId);
		System.out.println(cl_show);
		session.setAttribute("CL_Show", cl_show);
		ArrayList<CKList> getCKList = myDao.getCKList(userId);
		System.out.println(getCKList);
		session.setAttribute("ckList", getCKList);
		return "mySchedule/main";
	}
	
	@RequestMapping(value="/checkList")
	public String checkList(HttpSession session){
		return "mySchedule/checkList";
	}
	
	@RequestMapping(value="/createWork",method=RequestMethod.POST)
	public String createWork(PS_Work psWork,HttpSession session){
		String memberId = (String)session.getAttribute("loginId");
		psWork.setMemberId(memberId);
		myDao.createWork(psWork);
		return "redirect:./main";
	}
	
	@RequestMapping(value="/updateWork",method=RequestMethod.POST)
	public String updateWork(PS_Work psWork,HttpSession session,int ps_Num){
		myDao.updateWork(psWork);
		return "redirect:./main";
	}
	
	@ResponseBody
	@RequestMapping(value="/getWork",method=RequestMethod.POST)
	public PS_Work getWork(int ps_Num){
		PS_Work getWork = myDao.getWork(ps_Num);
		return getWork;
	}
	
	@ResponseBody
	@RequestMapping(value="/delWork",method=RequestMethod.POST)
	public void delWork(int ps_Num){
		System.out.println(myDao.deleteWork(ps_Num));
	}
	
	@ResponseBody
	@RequestMapping(value="/endWork",method=RequestMethod.POST)
	public void endWork(int ps_Num){
		System.out.println(myDao.finishWork(ps_Num));
	}
	
	// 요일별 체크리스트 완료 
	@ResponseBody
	@RequestMapping(value="/checkLoop",method=RequestMethod.POST)
	public void checkLoop(int loopNum){
		System.out.println("완료 : "+myDao.checkLoop(loopNum));
	}
	// 요일별 체크리스트 완료 취소
	@ResponseBody
	@RequestMapping(value="/uncheckLoop",method=RequestMethod.POST)
	public void uncheckLoop(int loopNum){
		System.out.println("완료 : "+myDao.uncheckLoop(loopNum));
	}
	// 체크리스트 추가
	@ResponseBody
	@RequestMapping(value="/putCKList",method=RequestMethod.POST)
	public ArrayList<CKList> putCKList(String cl_Name,String loopDay,HttpSession session){
		CKList cklist = new CKList();
		String memberId = (String)session.getAttribute("loginId");
		cklist.setCl_Name(cl_Name);
		cklist.setMemberId(memberId);
		System.out.println(myDao.createCKList(cklist));
		int cl_Num = cklist.getCl_Num();
		System.out.println(cl_Num);
		CK_Loops loops = new CK_Loops();
		loops.setCl_Num(cl_Num);
		// 요일별로 넣어주기
		for(int i = 0; i < loopDay.length(); i++){
			char getloop = loopDay.charAt(i);
			int loop = getloop - 48;
			System.out.println(loop);
			loops.setLoopDay(loop);
			myDao.createLoops(loops);
		}
		String userId = (String)session.getAttribute("loginId");
		ArrayList<CKList> getCKList = myDao.getCKList(userId);
		session.setAttribute("ckList", getCKList);
		return getCKList;
	}
	
	// 체크리스트 삭제
	@ResponseBody
	@RequestMapping(value="/deleteList",method=RequestMethod.POST)
	public void deleteList(int cl_Num){
		myDao.deleteCKList(cl_Num);
	}
	// 체크리스트 하나 가져오기(수정용)
	@ResponseBody
	@RequestMapping(value="/getOneList",method=RequestMethod.POST)
	public ArrayList<CK_Show> getOneList(int cl_Num,HttpSession session){
		ArrayList<CK_Show> getOne = myDao.getOneList(cl_Num);
		System.out.println(getOne);
		return getOne;
	}
	
}