package com.cms.controller.homepage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cms.dto.homepage.MainpageKeyword;
import com.cms.dto.master.Admin;
import com.cms.service.homepage.MainpageTvService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName MainpageTvController
 * @description 영상영역 탭 컨트롤러
 * @author JB
 * @since 2020. 12. 2.
 */
@Controller
@RequestMapping(value="/homepage/main/tv")
public class MainpageTvController {
	
	@Autowired private MenuService menuService;
	@Autowired private MainpageTvService mainpageTvService;

	/**
	 * 
	 * @name list
	 * @description 갱신 뷰 화면
	 * @param req
	 * @author JB
	 * @since 2020. 12. 2.
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String list(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		
		model.addAttribute("interestList", mainpageTvService.getInterestList());
		model.addAttribute("interestKeyword", mainpageTvService.getInterestKeyword());
		
		return "homepage/main/tv/view";
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description  갱신 프로세스
	 * @param keyword
	 * @return
	 * @author JB
	 * @since 2020. 12. 3.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute MainpageKeyword keyword, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		keyword.setModId(admin.getId());
		
		mainpageTvService.modifyInterestKeyword(keyword);
		
		return "redirect:list.do";
	}
}
