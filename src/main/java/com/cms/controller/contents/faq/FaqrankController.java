package com.cms.controller.contents.faq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.common.ResponseCode;
import com.cms.dto.contents.faq.Faq;
import com.cms.dto.master.Admin;
import com.cms.service.contents.faq.FaqrankService;
import com.cms.service.master.MenuService;

@Controller
@RequestMapping(value="/contents/faq/rank")
public class FaqrankController {

	@Autowired private MenuService menuService;
	@Autowired private FaqrankService faqRankService;
	
	
//	@RequestMapping(value="list.do", method = RequestMethod.GET)
//	public void list(HttpServletRequest req, Model model) {
//		HttpSession session = req.getSession();
//		Admin admin = (Admin) session.getAttribute("userSession");
//		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
//		session.setAttribute("userSession", admin);
//		model.addAttribute("data", faqRankService.getFaqList());
//	}
	
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void faqList(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		//model.addAttribute("bcodeList", commonService.getBranchList());
	}
	
	@RequestMapping(value="listrankAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Faq> faqList(@RequestBody Faq param) {
		return faqRankService.getFaqList(param.getCategory());
	}
		
	
	@RequestMapping(value="saveList.do", method = RequestMethod.POST)
	public @ResponseBody ResponseCode saveList(@RequestBody Map<String, Object> param) {
		return faqRankService.setOrder(param);
	}
}
