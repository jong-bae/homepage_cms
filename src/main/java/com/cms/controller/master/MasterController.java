package com.cms.controller.master;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @ClassName MasterController
 * @description 마스터
 * @author JB
 * @since 2020. 9. 22.
 */

@Controller
@RequestMapping(value="/master")
public class MasterController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/*
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		
		logger.warn(admin.getId());
		return "/";
	}*/
}
