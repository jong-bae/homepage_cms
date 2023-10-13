package com.cms.controller.homepage;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.dto.homepage.MainpageBanner;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.homepage.MainpageTopService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName MainpageController
 * @description
 * @author JB
 * @since 2020. 11. 17.
 */
@Controller
@RequestMapping("/homepage/main")
public class MainpageTopController {
	
	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	@Autowired private MainpageTopService mainpageService;

	/**
	 * 
	 * @name list
	 * @description 메인관리 PC/M 분기 리스트
	 * @param param
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 11. 17.
	 */
	@RequestMapping(value="/{param}/list.do", method = RequestMethod.GET)
	public String list(@PathVariable String param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		
		if(param.equals("pc")) {
			admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
			session.setAttribute("userSession", admin);
			return "homepage/main/pc/list";
		} else if(param.equals("mobile")) {
			admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
			session.setAttribute("userSession", admin);
			return "homepage/main/mobile/list";
		} else {
			return null;
		}
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description 메인관리리스트 PC/M 자동 분기
	 * @param param
	 * @return
	 * @author JB
	 * @since 2020. 11. 17.
	 */
	@RequestMapping(value="/{param}/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<MainpageBanner> listAjax(@PathVariable String param) {
		if(param.equals("pc")) {
			return null;
		} else {
			return mainpageService.getMainpageList();
		}
	}
	
	/**
	 * 
	 * @name write
	 * @description 메인관리 등록 뷰
	 * @param param
	 * @param model
	 * @author JB
	 * @since 2020. 11. 18.
	 */
	@RequestMapping(value="/{param}/write.do", method = RequestMethod.GET)
	public void write(@PathVariable String param, Model model) {
		// 나중에 PC/M 분기 처리 해야할 수도
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 메인관리 등록처리
	 * @param param
	 * @param banner
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 11. 18.
	 */
	@RequestMapping(value="/{param}/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@PathVariable String param, @ModelAttribute MainpageBanner banner,
							MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		banner.setRegID(user.getId());
		mainpageService.setMainpageTopMobile(banner, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 메인관리 수정 뷰
	 * @param param
	 * @param idx
	 * @param model
	 * @return
	 * @author JB
	 * @since 2020. 11. 26.
	 */
	@RequestMapping(value="/{param}/modify.do", method = RequestMethod.GET)
	public String modify(@PathVariable String param, @RequestParam(value="idx") int idx,
							Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("data", mainpageService.getMainpage_mobile(idx));
		return "homepage/main/mobile/modify";
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 수정처리
	 * @param param
	 * @param banner
	 * @param req
	 * @param multipartReq
	 * @return
	 * @author JB
	 * @since 2020. 12. 21.
	 */
	@RequestMapping(value="/{param}/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@PathVariable String param, @ModelAttribute MainpageBanner banner,
								HttpServletRequest req, MultipartRequest multipartReq) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		banner.setModID(user.getId());
		mainpageService.modifyMainpageBanner_mobile(banner, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name deleteProc
	 * @description 삭제처리
	 * @param banner
	 * @return
	 * @author JB
	 * @since 2020. 12. 21.
	 */
	@RequestMapping(value="/{param}/remove.do", method = RequestMethod.POST)
	public String deleteProc(@ModelAttribute MainpageBanner banner) {
		mainpageService.removeMainpageBanner_mobile(banner.getIdx());
		return "redirect:list.do";
	}
}
