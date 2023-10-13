package com.cms.controller.contents.academy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.contents.academy.Education;
import com.cms.dto.master.Admin;
import com.cms.service.contents.academy.EducationService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName EducationController
 * @description
 * @author JB
 * @since 2021. 9. 2.
 */
@Controller
@RequestMapping(value="/contents/academy")
public class EducationController {

	@Autowired private MenuService menuService;
	@Autowired private EducationService educationService;
	
	/**
	 * 
	 * @name onlineList
	 * @description 온라인 교육과정
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 2.
	 */
	@RequestMapping(value="/online/list.do", method = RequestMethod.GET)
	public void onlineList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		
		//return "contents/academy/online/list";
	}
	
	/**
	 * 
	 * @name onlineListAjax
	 * @description 온라인 교육과정 리스트
	 * @return
	 * @author JB
	 * @since 2021. 9. 2.
	 */
	@RequestMapping(value="/online/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Education> onlineListAjax() {
		return educationService.getOnlineList();
	}
	
	/**
	 * 
	 * @name onlineWrite
	 * @description 온라인교육과정 작성 뷰
	 * @author JB
	 * @since 2021. 9. 3.
	 */
	@RequestMapping(value="/online/write.do", method = RequestMethod.GET)
	public void onlineWrite() {
	}
	
	/**
	 * 
	 * @name onlineWriteProc
	 * @description 온라인교육과정 등록
	 * @param param
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 3.
	 */
	@RequestMapping(value="/online/write-proc.do", method = RequestMethod.POST)
	public String onlineWriteProc(@ModelAttribute Education param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setRegUser(admin.getId());
		educationService.setOnline(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name onlineModify
	 * @description 온라인 교육과정 수정 뷰
	 * @param idx
	 * @author JB
	 * @since 2021. 9. 6.
	 */
	@RequestMapping(value="/online/modify.do", method = RequestMethod.GET)
	public void onlineModify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", educationService.getOnlineOne(idx));
	}
	
	/**
	 * 
	 * @name onlineModifyProc
	 * @description 온라인교육과정 수정
	 * @param param
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 7.
	 */
	@RequestMapping(value="/online/modify-proc.do", method = RequestMethod.POST)
	public String onlineModifyProc(@ModelAttribute Education param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setModUser(admin.getId());
		educationService.modifyOnlineOne(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name onlineRemove
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 9. 7.
	 */
	@RequestMapping(value="/online/remove.do", method = RequestMethod.POST)
	public String onlineRemove(@ModelAttribute Education param) {
		educationService.removeEducation(param.getIdx());
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name offlineList
	 * @description 오프라인 교육과정
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 2.
	 */
	@RequestMapping(value="/offline/list.do", method = RequestMethod.GET)
	public void offlineList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name offlineAjax
	 * @description 오프라인 교육과정 리스트
	 * @return
	 * @author JB
	 * @since 2021. 9. 2.
	 */
	@RequestMapping(value="offline/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Education> offlineAjax() {
		return educationService.getOfflineList();
	}
	
	/**
	 * 
	 * @name offlineWrite
	 * @description 오프라인 교육과정 작성 뷰
	 * @author JB
	 * @since 2021. 9. 3.
	 */
	@RequestMapping(value="offline/write.do", method = RequestMethod.GET)
	public void offlineWrite() {
		
	}
	
	/**
	 * 
	 * @name offlineWrite
	 * @description 오프라인 교육과정 작성
	 * @param param
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 3.
	 */
	@RequestMapping(value="offline/write-proc.do", method = RequestMethod.POST)
	public String offlineWriteProc(@ModelAttribute Education param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setRegUser(admin.getId());
		educationService.setOffline(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name offlineModify
	 * @description 오프라인 교육과정 수정 뷰
	 * @param idx
	 * @author JB
	 * @since 2021. 9. 6.
	 */
	@RequestMapping(value="offline/modify.do", method = RequestMethod.GET)
	public void offlineModify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", educationService.getOfflineOne(idx));
	}
	
	/**
	 * 
	 * @name offlineModifyProc
	 * @description 오프라인 교육과정 수정
	 * @param param
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 7.
	 */
	@RequestMapping(value="offline/modify-proc.do", method = RequestMethod.POST)
	public String offlineModifyProc(@ModelAttribute Education param, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setModUser(admin.getId());
		educationService.modifyOfflineOne(param);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name offlineRemove
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 9. 7.
	 */
	@RequestMapping(value="offline/remove.do", method = RequestMethod.POST)
	public String offlineRemove(@ModelAttribute Education param) {
		educationService.removeEducation(param.getIdx());
		return "redirect:list.do";
	}
}
