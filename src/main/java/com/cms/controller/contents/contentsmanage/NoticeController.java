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

import com.cms.service.common.CommonService;
import com.cms.service.contents.contentsmanager.NoticeService;
import com.cms.service.master.MenuService;
import com.cms.dto.contents.contentsmanage.Notice;
import com.cms.dto.master.Admin;


/**
 * 
 * @ClassName NoticeController
 * @description  공지사항 관리 컨트롤러
 * @author 김재형
 * @since 2020. 11. 02.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/notice")
public class NoticeController{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private NoticeService noticeService;
	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	
	
	/**
	 * @name list
	 * @description 공지사항 관리 뷰 페이지  
	 * @param req
	 * @author 김재형
	 * @since 2020.11.02.
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
	 * @since 2020. 11. 02.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Notice> listAjax() {
		return noticeService.getList();
	}
	
	
	
	/**
	 * 
	 * @name write
	 * @description 공지사항 등록 뷰
	 * @param model
	 * @author 김재형
	 * @since 2020. 11. 03.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
//		model.addAttribute("menuList", menuService.getAllMenuList());
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	

	/**
	 * 
	 * @name writeProc
	 * @description  공지사항 등록
	 * @param notice, req
	 * @return
	 * @author 김재형
	 * @since 2020. 11. 04.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Notice notice, HttpServletRequest req) {
		noticeService.setNotice(notice);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name removeProc
	 * @description  공지사항 삭제
	 * @param idx, model
	 * @return
	 * @author 김재형
	 * @since 2020. 11. 09.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.GET)
	public String removeProc(@RequestParam(value="idx") int idx, Model model) {
		noticeService.removeNotice(idx);	
		return "redirect:list.do";
	}
	
	
	/**
	 * 
	 * @name modify
	 * @description 공지사항 수정 뷰
	 * @param idx
	 * @param model
	 * @author 김재형
	 * @since 2020. 11. 05.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		
		model.addAttribute("data", noticeService.getNotice(idx));
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
//		model.addAttribute("menuList", menuService.getAllMenuList());
	}
	
	
	/**
	 * 
	 * @name modifyProc
	 * @description  공지사항 수정
	 * @param notice, req
	 * @return
	 * @author 김재형
	 * @since 2020. 10. 28.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Notice notice, HttpServletRequest req) {
		noticeService.modifyNotice(notice);	
		return "redirect:list.do";
	}
	
}