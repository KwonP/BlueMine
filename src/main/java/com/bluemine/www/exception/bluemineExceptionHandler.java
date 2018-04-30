package com.bluemine.www.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// 오류 페이지 처리
@ControllerAdvice
public class bluemineExceptionHandler {
/**
 * 모든 종류의 예외 처리
 * @return JSP파일경로
*/	
	
	@ExceptionHandler(Exception.class)
	public String errorHandler(){
		return "/error";
	}
}
