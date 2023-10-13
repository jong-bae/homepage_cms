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
import org.springframework.web.multipart.MultipartRequest;

import com.cms.dto.contents.academy.EducationFile;
import com.cms.dto.master.Admin;
import com.cms.service.contents.academy.LibraryService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName LibraryController
 * @description 영문 의학컬럼 및 기사
 * @author JB
 * @since 2021. 9. 7.
 */
@Controller
@RequestMapping(value="/contents/academy/library")
public class LibraryController {

	@Autowired private MenuService menuService;
	@Autowired private LibraryService libraryService;
	
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin));
		session.setAttribute("userSession", admin);
	}
	
	/**
	 * 
	 * @name listAjax
	 * @description
	 * @return
	 * @author JB
	 * @since 2021. 9. 7.
	 */
	@RequestMapping(value="listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<EducationFile> listAjax() {
		return libraryService.getLibraryList();
	}
	
	/**
	 * 
	 * @name write
	 * @descriptionjb4
	 * @author JB
	 * @since 2021. 9. 8.
	 */
	@RequestMapping(value="write.do", method = RequestMethod.GET)
	public void write() {
	}
	
	/**
	 * 
	 * @name writeProc
	 * @description
	 * @param param
	 * @param multipartReq
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 9.
	 */
	@RequestMapping(value="write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute EducationFile param, MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setRegUser(admin.getId());
		libraryService.setLibrary(param, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name modify
	 * @description
	 * @param idx
	 * @author JB
	 * @since 2021. 9. 13.
	 */
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		model.addAttribute("data", libraryService.getLibraryOne(idx));
	}
	
	/**
	 * 
	 * @name modifyProc
	 * @description
	 * @param param
	 * @param multipartReq
	 * @param req
	 * @return
	 * @author JB
	 * @since 2021. 9. 14.
	 */
	@RequestMapping(value="modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute EducationFile param, MultipartRequest multipartReq, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		param.setModUser(admin.getId());
		libraryService.modifyLibrary(param, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name remove
	 * @description
	 * @param param
	 * @return
	 * @author JB
	 * @since 2021. 9. 14.
	 */
	@RequestMapping(value="remove.do", method = RequestMethod.POST)
	public String remove(@ModelAttribute EducationFile param) {
		libraryService.removeLibrary(param.getIdx());
		return "redirect:list.do";
	}
}
