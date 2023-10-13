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

import com.cms.dto.contents.contentsmanage.PersonalInfo;
import com.cms.dto.master.Admin;
import com.cms.service.common.CommonService;
import com.cms.service.contents.contentsmanager.PersonalInfoService;
import com.cms.service.master.MenuService;

/**
 * 
 * @ClassName PersonalInfoController
 * @description  개인정보처리 방침 목록 컨트롤러
 * @author 김재형
 * @since 2020. 10. 26.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/personalinfo")
public class PersonalInfoController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private PersonalInfoService personalInfoService;
	@Autowired private MenuService menuService;
	@Autowired private CommonService commonService;
	
	
	/**
	 * @name list
	 * @description 개인정보처리 방침 리스트 
	 * @param req
	 * @author 김재형
	 * @since 2020.10.26
	 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public void list(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Admin admin = (Admin) session.getAttribute("userSession");
		admin.setMenuList(menuService.getCurrentMenu(req.getRequestURI(), admin)); //추후 메뉴 버그 수정되면 /contents/personalinfo 로 수정 필요
		session.setAttribute("userSession", admin);
		
	}
	
	
	
	/**
	 * 
	 * @name listAjax
	 * @description dataTable list ajax load
	 * @return
	 * @author 김재형
	 * @since 2020. 10. 26.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<PersonalInfo> listAjax() {
		return personalInfoService.getList();
	}
	
	/**
	 * 
	 * @name write
	 * @description 개인정보 처리 방침 등록 뷰
	 * @param model
	 * @author 김재형
	 * @since 2020. 10. 27.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
//		model.addAttribute("menuList", menuService.getAllMenuList());
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
	}
	
	
	/**
	 * 
	 * @name writeProc
	 * @description  개인정보 처리 방침 등록
	 * @param personalinfo, req
	 * @return
	 * @author 김재형
	 * @since 2020. 10. 28.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute PersonalInfo personalinfo, HttpServletRequest req) {
		personalInfoService.setPersonalInfo(personalinfo);
		return "redirect:list.do";
	}
	
	
	/**
	 * 
	 * @name modify
	 * @description 개인정보 처리 방침 수정 뷰
	 * @param idx
	 * @param model
	 * @author 김재형
	 * @since 2020. 10. 28.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="idx") int idx, Model model) {
		
		model.addAttribute("data", personalInfoService.getPersonalInfo(idx));
		model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
//		model.addAttribute("menuList", menuService.getAllMenuList());
	}
	
	
	
	/**
	 * 
	 * @name modifyProc
	 * @description  개인정보 처리 방침 수정
	 * @param personalinfo, req
	 * @return
	 * @author 김재형
	 * @since 2020. 10. 28.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute PersonalInfo personalinfo, HttpServletRequest req) {
		personalInfoService.modifyPersonalInfo(personalinfo);	
		return "redirect:list.do";
	}
	
	
	
	/**
	 * 
	 * @name removeProc
	 * @description  개인정보 처리 방침 삭제
	 * @param idx, model
	 * @return
	 * @author 김재형
	 * @since 2020. 11. 02.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.GET)
	public String removeProc(@RequestParam(value="idx") int idx, Model model) {
		personalInfoService.removePersonalInfo(idx);	
		return "redirect:list.do";
	}
	
}
