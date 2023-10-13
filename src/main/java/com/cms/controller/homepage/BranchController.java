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
import org.springframework.web.multipart.MultipartRequest;

import com.cms.dto.homepage.Branch;
import com.cms.dto.master.Admin;
import com.cms.service.homepage.BranchService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName BranchController
 * @description 병의원관리
 * @author JB
 * @since 2020. 10. 15.
 */
@Controller
@RequestMapping(value="/homepage/branch")
public class BranchController {

	@Autowired private BranchService branchService;
	@Autowired private MenuService menuService;
	
	/**
	 * 
	 * @name list
	 * @description 병의원관리 리스트 뷰
	 * @param req
	 * @author JB
	 * @since 2020. 10. 15.
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
	 * @description 데이터테이블 리스트 ajax
	 * @return
	 * @author JB
	 * @since 2020. 10. 15.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Branch> listAjax() {
		return branchService.getBranchList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 병의원 등록 뷰
	 * @author JB
	 * @since 2020. 10. 15.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write() {
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description 병의원 데이터 등록
	 * @param branch
	 * @param multipartReq
	 * @return
	 * @author JB
	 * @since 2020. 10. 23.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Branch branch, MultipartRequest multipartReq) {
		branchService.setBranch(branch, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description 병의원 수정 뷰
	 * @param idx
	 * @param model
	 * @author JB
	 * @since 2020. 10. 16.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", branchService.getBranch(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description 병의원 데이터 수정
	 * @param branch
	 * @param multipartReq
	 * @return
	 * @author JB
	 * @since 2020. 10. 23.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Branch branch, MultipartRequest multipartReq) {
		branchService.modifyBranch(branch, multipartReq);
		return "redirect:list.do";
	}
}
