package com.cms.controller.contents.contentsmanage;

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
import org.springframework.web.multipart.MultipartRequest;

import com.cms.dto.common.BZBoard;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.contentsmanager.MRIService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName MRIController
 * @description  MRI후기 관리  컨트롤러
 * @author 김재형
 * @since 2020. 11. 19.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/mri")
public class MRIController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MRIService mriService;
	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	
	/**
	 * @name list
	 * @description  MRI후기 관리 뷰
	 * @param req
	 * @author 김재형
	 * @since 2020.11.19.
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
	 * @author 김재형
	 * @since 2020. 11. 19.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<BZBoard> listAjax() {
		return mriService.getList();
	}
	
	
	
	/**
	 * 
	 * @name write
	 * @description mri 등록 뷰 호출
	 * @param model
	 * @author KimJaehyung
	 * @since 2021. 1. 28.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
	//	model.addAttribute("menuList", menuService.getAllMenuList());
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	

	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param bzBoard
	 * @param multipartReq
	 * @return
	 * @author KimJaehyung
	 * @since 2021. 2. 2.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute BZBoard bzBoard, MultipartRequest multipartReq, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		bzBoard.setStrName(admin.getName());

		bzBoard.setStrID(admin.getId());

		mriService.setMri(bzBoard, multipartReq);
		return "redirect:list.do";
	}
	
	
	
	/**
	 * 
	 * @name write
	 * @description mri 등록 뷰 호출
	 * @param model
	 * @author KimJaehyung
	 * @since 2021. 1. 28.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		model.addAttribute("data", mriService.getMri(idx));
	}
	
	

	/**
	 * 
	 * @name modifyProc
	 * @description
	 * @param event
	 * @param multipartReq
	 * @return
	 * @author KimJaehyung
	 * @since 2021. 3. 16.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute BZBoard bzBoard, MultipartRequest multipartReq) {
		mriService.modifyMri(bzBoard, multipartReq);
		return "redirect:list.do";
	}
	

	@RequestMapping(value="/remove.do", method = RequestMethod.GET)
	public String removeProc(@RequestParam(value="idx") int idx, Model model) {
		mriService.removeMri(idx);	
		return "redirect:list.do";
	}
	
}
