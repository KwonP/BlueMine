package com.bluemine.www.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

private static final Logger logger = LoggerFactory.getLogger("LoginInterceptor.class");

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("loginInterceptor 실행");
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		String getUrl = request.getServletPath();
		String test = request.getRequestURI();
		
		//test
		String what = request.getContextPath();
		System.out.println(what);
		//
		
		// 로그인한 아이디가 없을 때
		if (loginId == null) {		
			logger.debug(getUrl);
			try {
				//System.out.println("파라미터 있잖아");
				Enumeration<String> params = request.getParameterNames();
				if (params.hasMoreElements()) {
					//System.out.println("파라미터2");
					String param = params.nextElement();
					//파라미터의 값 받아오기 (힘드니까 파라미터 값 2개이상 주지 말 것..)
					String paramValue = request.getParameter(param);
					System.out.println(param+"="+paramValue);
					String urlNvalue = request.getContextPath()+"?action="+getUrl
							+"?"+param+"="+paramValue;
					response.sendRedirect(urlNvalue);
					return false;
				}
			} catch (Exception e) {
				//e.printStackTrace();
				System.out.println("파라미터 없음");
			}
			// 그리고 받는 파라미터가 있는지 확인, 있으면 파라미터와 값 모두 넘겨주어야 함
			// 만약에 받는 파라미터가 없으면 기본 login과 action값만 보내주기
						// getContextPath() : 자신의 
			String url = request.getContextPath();
/* original:String url = request.getContextPath() + "/member/loginMain?action="+getUrl;*/
			response.sendRedirect(url); 
			return false;
		}
		// loginId가 null이면 login 창으로 보낸다.
		return super.preHandle(request, response, handler);
	}
}

