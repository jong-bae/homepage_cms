package com.cms.controller.master;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.master.AdminService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName AdminController
 * @description 담당자관리 컨트롤러
 * @author JB
 * @since 2020. 9. 23.
 */
@Controller
@RequestMapping(value="/master/admin")
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private AdminService adminService;
	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	
	/**
	 * 
	 * @name list
	 * @description 담당자관리 리스트
	 * @param req
	 * @author JB
	 * @since 2020. 9. 24.
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description dataTable list ajax load
	 * @return
	 * @author JB
	 * @since 2020. 10. 6.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Admin> listAjax() {
		return adminService.getAdminList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 담당자 등록 뷰
	 * @param model
	 * @author JB
	 * @since 2020. 9. 29.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
		model.addAttribute("menuList", menuService.getAllMenuList());
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 담당자 등록 수행
	 * @param admin
	 * @return
	 * @author JB
	 * @since 2020. 10. 5.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Admin admin, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		admin.setRegId(user.getId());
		adminService.setAdmin(admin);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 담당자정보 수정 뷰
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2020. 10. 14.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", adminService.getCurrentAdmin(idx));
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("menuList", menuService.getAllMenuList());
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description  담당자 정보 수정
	 * @param admin
	 * @param req
	 * @return
	 * @author JB
	 * @since 2020. 10. 14.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Admin admin, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin user = (Admin) session.getAttribute("userSession");
		admin.setModId(user.getId());
		adminService.modifyAdmin(admin);
		return "redirect:list.do";
	}
}
