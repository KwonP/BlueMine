package com.bluemine.www.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bluemine.www.HomeController;
import com.bluemine.www.dao.DataDownloadDAO;
import com.bluemine.www.dao.ProjectDAO;
import com.bluemine.www.dao.TimeLineDAO;
import com.bluemine.www.util.FileService;
import com.bluemine.www.util.PageNavigator;
import com.bluemine.www.vo.FileInfo;
import com.bluemine.www.vo.PRJList;
import com.bluemine.www.vo.TimeLine;
import com.bluemine.www.vo.TriggerInfo;
import com.bluemine.www.vo.UserInfo;

/**
 * 자료실 콘트롤러
 * 업로드
 */
@Controller
@RequestMapping("/data")
public class DataDownloadController {
	
	private static final Logger logger = LoggerFactory.getLogger(DataDownloadController.class);
	
	@Autowired
	DataDownloadDAO dao;		//자료 관련 데이터 처리 객체
	
	final String uploadPath = "/datafile";	//파일 업로드 경로
	
	/**
	 * 파일 업로드 하기
	 */
	@RequestMapping (value="/fileUpload", method=RequestMethod.POST)
	public String fileUpload(
			FileInfo file, 
			MultipartFile[] upload,
			HttpSession session, 
			Model model) {
		System.out.println(file);
		System.out.println(upload);
		//첨부파일이 있는 경우 지정된 경로에 저장
		if (upload.length != 0) {
			for(int i = 0; i < upload.length; i++) {
				FileInfo fileinfo = new FileInfo();
				String savedfile = FileService.saveFile(upload[i], uploadPath);
				fileinfo.setPrj_Num(file.getPrj_Num());
				fileinfo.setOriginalFile(upload[i].getOriginalFilename());
				fileinfo.setSaveFile(savedfile);
				dao.insertFile(fileinfo);
			}
		}
		
		int throwNum = file.getPrj_Num();
		return "redirect:filePrint?prjNum=" + throwNum;
	}
	
	/**
	 * 파일 출력하기
	 */
	@RequestMapping (value="filePrint", method=RequestMethod.GET)
	public String filePrint(int prjNum, HttpSession session, Model model) {
		
		ArrayList<FileInfo> tempList = dao.selectPrjFiles(prjNum);
		
		//파일 타입 추가
		ArrayList<FileInfo> imagelist = new ArrayList<>();
		ArrayList<FileInfo> textlist = new ArrayList<>();
		ArrayList<FileInfo> mp3list = new ArrayList<>();
	
		for (FileInfo fileInfo : tempList) {
			String str = fileInfo.getOriginalFile();
			String cut = str.substring(str.length()-3, str.length());
			//파일 타입 확인
			switch (cut) {
			case "png":
			case "jpg":
			case "gif":
				imagelist.add(fileInfo);
				break;
			case "txt":
				textlist.add(fileInfo);
				break;
			case "mp3":
				mp3list.add(fileInfo);
				break;
			}
		}		
		
		//파일별 리스트에 저장
		model.addAttribute("imagelist", imagelist);
		model.addAttribute("textlist", textlist);
		model.addAttribute("mp3list", mp3list);
		model.addAttribute("prjNum", prjNum);
		return "project/datadownload";
	}
	
	/**
	 * 파일 다운로드
	 * @param originalfile 파일을 다운하기 위함
	 */
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(String originalfile, Model model, HttpServletResponse response) {
		
		ArrayList<FileInfo> filelist = null;
		
		filelist = dao.listFiles(originalfile);
		
		for(int i = 0; i < filelist.size(); i++) {
			//원래의 파일명
			String originalfile2 = new String(filelist.get(i).getOriginalFile());
			try {
				response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile2, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			//저장된 파일 경로
			String fullPath = uploadPath + "/" + filelist.get(i).getSaveFile();
			
			//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
			FileInputStream filein = null;
			ServletOutputStream fileout = null;
			
			try {
				filein = new FileInputStream(fullPath);
				fileout = response.getOutputStream();
				
				//Spring의 파일 관련 유틸
				FileCopyUtils.copy(filein, fileout);
				
				filein.close();
				fileout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}	
}