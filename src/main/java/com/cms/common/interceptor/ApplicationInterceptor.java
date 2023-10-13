package com.cms.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ApplicationInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger = LogManager.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// controller 호출 전
		//logger.error("test log4j2");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userSession");
		
		if (obj == null) {
			response.sendRedirect("/login.do");
			//logger.error("session is null 2");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// controller 호출 후 
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 모든작업이 완료 된 후
	}

}
