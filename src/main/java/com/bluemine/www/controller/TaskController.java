package com.bluemine.www.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bluemine.www.dao.TaskDAO;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.GP_Work;
import com.bluemine.www.vo.PJ_Group;

/**
 * 일감 콘트롤러
 * 
 */

@Controller
@RequestMapping(value="/task")
public class TaskController {
	
	@Inject
	TaskDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

	/**
	 * 일감 페이지 이동
	 */
	@RequestMapping (value="move", method=RequestMethod.GET)
	public String move(int prjNum, Model model) {
	
		PJ_Group pj_group = dao.selectGroup(prjNum);
		
		ArrayList<GP_Work> gp_work_list = dao.printTask(pj_group.getGp_Num());
		
		model.addAttribute("tasklist",gp_work_list);
		
		return "project/task";
	}
	
	
	
	/*@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.GET)
	public SRoom ??(GP_Work gp_work) {	
		logger.debug("전달된 값: " + sr);
		
		return sr;
	}*/
		
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/checkdate", method = RequestMethod.POST)
	public int checkdate(String inputdata) {
		Date d1 = new Date();
		Date d2 = new Date();
		Date d3 = new Date();
		// 날짜를 2018-01-29 포맷 해주는 클래스 선언
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 날짜 비교 메소드를 사용
		try {
			d1 = sdf.parse(inputdata);
			d2 = sdf.parse(sdf.format(d2));
			d3 = sdf.parse(sdf.format(d3));
			d3.setDate(d2.getDate() + 10);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int compare1 = d1.compareTo(d2);
		int compare2 = 0;
		// 예약하려는 날짜보다 현재 날짜가 크다면 -1
		// 예약하려는 날짜와 현재 날짜가 같다면 0
		// 예약하려는 날짜가 더 크다면 1을 리턴
	
		if(compare1 < 0) { // 오늘 이전 날짜 선택시
			return 0;
		} else if ( compare1 == 1) { // 오늘이후 부터 10일 까지
			compare2 = d1.compareTo(d3);
			if(compare2 <= 0) {
				return 1;				
			} else {
				return 0;
			}
		} else { // 오늘 날짜 선택
			return 1;
		}

	}
}