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

import com.cms.service.contents.contentsmanager.EventService;
import com.cms.service.master.MenuService;
import com.cms.dto.contents.contentsmanage.Event;
import com.cms.dto.master.Admin;


/**
 * 
 * @ClassName EventController
 * @description  이벤트관리 컨트롤러
 * @author 김재형
 * @since 2020. 11. 10.
 */
@Controller
@RequestMapping(value="/contents/contentsmanage/event")
public class EventController{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private EventService eventService;
	@Autowired private MenuService menuService;
	
	
	/**
	 * @name list
	 * @description 이벤트 관리 뷰 페이지   
	 * @param req
	 * @author 김재형
	 * @since 2020.11.10.
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
	 * @since 2020. 11. 11.
	 */
	@RequestMapping(value="/listAjax.do", method = RequestMethod.POST)
	public @ResponseBody List<Event> listAjax() {
		return eventService.getList();
	}
	
	/**
	 * 
	 * @name write 
	 * @description 이벤트 등록 뷰 호출
	 * @param model
	 * @author KimJaehyung
	 * @since 2020. 11. 12.
	 */
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public void write(Model model) {
		
	}
	
	
	/**
	 * 
	 * @name writeProc
	 * @description 이벤트 등록
	 * @param branch
	 * @param multipartReq
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 11. 12.
	 */
	@RequestMapping(value="/write-proc.do", method = RequestMethod.POST)
	public String writeProc(@ModelAttribute Event event, MultipartRequest multipartReq) {
		eventService.setEvent(event, multipartReq);
		return "redirect:list.do";
	}

	/**
	 * 
	 * @name modify
	 * @description 이벤트 수정 뷰
	 * @param idx
	 * @param model
	 * @author KimJaehyung
	 * @since 2020. 11. 16.
	 */
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public void modify(@RequestParam(value="docID") int docID, Model model) {
		
		model.addAttribute("data", eventService.getEvent(docID));
		//model.addAttribute("bcodeList", commonService.getBCodeSelectBox());
		//model.addAttribute("menuList", menuService.getAllMenuList());
	}
	
	
	/**
	 * 
	 * @name modifyProc
	 * @description 이벤트 수정
	 * @param event
	 * @param req
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 11. 16.
	 */
	@RequestMapping(value="/modify-proc.do", method = RequestMethod.POST)
	public String modifyProc(@ModelAttribute Event event, MultipartRequest multipartReq) {
		eventService.modifyEvent(event, multipartReq);
		return "redirect:list.do";
	}
	
	/**
	 * 
	 * @name removeProc
	 * @description  이벤트 삭제
	 * @param docID, model
	 * @return
	 * @author 김재형
	 * @since 2020. 11. 17.
	 */
	@RequestMapping(value="/remove.do", method = RequestMethod.GET)
	public String removeProc(@RequestParam(value="docID") int docID, Model model) {
		eventService.removeEvent(docID);	
		return "redirect:list.do";
	}
	
	
	
	
}