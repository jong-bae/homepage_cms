package com.cms.controller.homepage;

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

import com.cms.dto.homepage.TreatmentTime;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.homepage.TreatmentTimeService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName TreatmentTimeController
 * @description 진료시간 관리 컨트롤러
 * @author KimJaehyung
 * @since 2020. 12. 3.
 */
@Controller
@RequestMapping(value="/homepage/treatmenttime")
public class TreatmentTimeController {
	
	
	@Autowired private MenuService menuService;
	@Autowired private TreatmentTimeService treatmenttimeService;
	@Autowired private CommonService commonService;
	
	/**
	 * 
	 * @name list
	 * @description 진료시간 관리 리스트 뷰
	 * @param req
	 * @author KimJaehyung
	 * @since 2020. 12. 03.
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
		
	}
	
	
	
	/**
	 * 
	 * @name listAjax
	 * @description 진료시간일정 조회
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 03.
	 */
	@RequestMapping(value="/listAjax_tab1.do", method = RequestMethod.POST)
	public @ResponseBody List<TreatmentTime> listAjax1() {
		return treatmenttimeService.getList();
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description 진료시간일정 예외처리 조회
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 17.
	 */
	@RequestMapping(value="/listAjax_tab2.do", method = RequestMethod.POST)
	public @ResponseBody List<TreatmentTime> listAjax2() {
		return treatmenttimeService.getExceptionList();
	}
	
	
	
	/**
	 * 
	 * @name writeTreatmentTime
	 * @description 
	 * @param model
	 * @author KimJaehyung
	 * @since 2020. 12. 10.
	 */
	@RequestMapping(value="/write_treatmenttime.do", method = RequestMethod.GET)
	public void writeTreatmentTime(Model model) {
//		model.addAttribute("menuList", menuService.getAllMenuList());
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	
	
	/**
	 * 
	 * @name writeTreatmentTime
	 * @description 
	 * @param model
	 * @author KimJaehyung
	 * @since 2020. 12. 10.
	 */
	@RequestMapping(value="/write_exception.do", method = RequestMethod.GET)
	public void writeException(Model model) {
//		model.addAttribute("menuList", menuService.getAllMenuList());
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param treatmenttime
	 * @param req
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 15.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public @ResponseBody String writeProc(@ModelAttribute TreatmentTime treatmenttime, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		treatmenttime.setLastUpdateAdmin(user.getId());
		
		int result = treatmenttimeService.setTreatmentTime(treatmenttime);
		
		return Integer.toString(result);
	}
	
	

	/**
	 * 
	 * @name writeExceptionProc
	 * @description
	 * @param treatmenttime
	 * @param req
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 17.
	 */
	@RequestMapping(value="/write-exception-proc.do", method = RequestMethod.POST)
	public String writeExceptionProc(@ModelAttribute TreatmentTime treatmenttime, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		treatmenttime.setLastUpdateAdmin(user.getId());
		treatmenttimeService.setTreatmentTimeException(treatmenttime);
		return "redirect:list.do";
	}
	
	

	/**
	 * 
	 * @name modify
	 * @description
	 * @param idx
	 * @param model
	 * @author KimJaehyung
	 * @since 2020. 12. 16.
	 */
	@RequestMapping(value="/modify_treatmenttime.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("data", treatmenttimeService.getTreatmentTime(idx));
	}

	

	
	@RequestMapping(value="/modify_exception.do", method = RequestMethod.GET)
	public void modifyException(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("data", treatmenttimeService.getTreatmentTimeException(idx));
	}

	
	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param treatmenttime
	 * @param req
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 16.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public @ResponseBody String modifyProc(@ModelAttribute TreatmentTime treatmenttime, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		treatmenttime.setLastUpdateAdmin(user.getId());
		
		int result = treatmenttimeService.modifyTreatmentTime(treatmenttime);
		
		return Integer.toString(result);
	}
	
	
	
	/**
	 * 
	 * @name modifyExceptionProc
	 * @description
	 * @param treatmenttime
	 * @param req
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 18.
	 */
	@RequestMapping(value="/modify-exception-proc.do", method = RequestMethod.POST)
	public String modifyExceptionProc(@ModelAttribute TreatmentTime treatmenttime, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		treatmenttime.setLastUpdateAdmin(user.getId());
		treatmenttimeService.modifyTreatmentTimeException(treatmenttime);
		return "redirect:list.do";
	}
	
	

	/**
	 * 
	 * @name removeProc
	 * @description
	 * @param idx
	 * @param model
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 12. 18.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.GET)
	public String removeProc(@RequestParam(value="idx") int idx, Model model) {
		treatmenttimeService.removeTreatmentTimeException(idx);
		return "redirect:list.do";
	}
	
	
	
	
}
